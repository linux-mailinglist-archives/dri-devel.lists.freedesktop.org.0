Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D0896AA4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F4A11293E;
	Wed,  3 Apr 2024 09:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Tk6VZmvM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2O350bE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB111292D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:21 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FA705CAA2;
 Wed,  3 Apr 2024 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OnqrMzvkLH/qCgCDcEUb7ThwRFrS03cFa+XKkDV0Kk=;
 b=Tk6VZmvMclpTkQrzlMPy7G8ht/NfEACR+3VtS+7kG2ff4T2VkAS9NTbA/QdNMg2QpnzRiX
 SO89Fcsd3SQGUC8SmE9a1isYbiyB+mRuMXOei+rGmruYuK7wGCvIppUWOWsZIHGlo6xnW6
 XmPjY5eauyLJMr128iyuvXAG9d5fP90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OnqrMzvkLH/qCgCDcEUb7ThwRFrS03cFa+XKkDV0Kk=;
 b=z2O350bEJGXSyaqwoQkBVeoyNzpss9WF0J2YEtEUtB1ADTMsOdaaDdrwgUGudw43emRrSs
 m56KXu87TN6fgwBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id F3E8013A8B;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id oE5POuchDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/11] drm/mgag200: Acquire I/O-register lock in DDC code
Date: Wed,  3 Apr 2024 11:24:46 +0200
Message-ID: <20240403093114.22163-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3FA705CAA2
X-Spamd-Result: default: False [-1.81 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.995]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_DKIM_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:98:from,2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Score: -1.81
X-Spam-Level: 
X-Spam-Flag: NO
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The modeset lock protects the DDC code from concurrent modeset
operations, which use the same registers. Move that code from the
connector helpers into the DDC helpers .pre_xfer() and .post_xfer().

Both, .pre_xfer() and .post_xfer(), enclose the transfer of data blocks
over the I2C channel in the internal I2C function bit_xfer(). Both
calls are executed unconditionally if present. Invoking DDC transfers
from any where within the driver now takes the lock.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_ddc.c  | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c |  9 ---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_ddc.c b/drivers/gpu/drm/mgag200/mgag200_ddc.c
index 3fa11b190943e..6d81ea8931e88 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ddc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ddc.c
@@ -99,6 +99,28 @@ static int mgag200_ddc_algo_bit_data_getscl(void *data)
 	return (mga_i2c_read_gpio(ddc->mdev) & ddc->clock) ? 1 : 0;
 }
 
+static int mgag200_ddc_algo_bit_data_pre_xfer(struct i2c_adapter *adapter)
+{
+	struct mgag200_ddc *ddc = i2c_get_adapdata(adapter);
+	struct mga_device *mdev = ddc->mdev;
+
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&mdev->rmmio_lock);
+
+	return 0;
+}
+
+static void mgag200_ddc_algo_bit_data_post_xfer(struct i2c_adapter *adapter)
+{
+	struct mgag200_ddc *ddc = i2c_get_adapdata(adapter);
+	struct mga_device *mdev = ddc->mdev;
+
+	mutex_unlock(&mdev->rmmio_lock);
+}
+
 static void mgag200_ddc_release(struct drm_device *dev, void *res)
 {
 	struct mgag200_ddc *ddc = res;
@@ -133,6 +155,8 @@ struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
 	bit->setscl = mgag200_ddc_algo_bit_data_setscl;
 	bit->getsda = mgag200_ddc_algo_bit_data_getsda;
 	bit->getscl = mgag200_ddc_algo_bit_data_getscl;
+	bit->pre_xfer = mgag200_ddc_algo_bit_data_pre_xfer;
+	bit->post_xfer = mgag200_ddc_algo_bit_data_post_xfer;
 	bit->udelay = 10;
 	bit->timeout = usecs_to_jiffies(2200);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4ca2f4cba1077..f6bec6d9a3b3f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -725,23 +725,14 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 
 int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct mga_device *mdev = to_mga_device(connector->dev);
 	const struct drm_edid *drm_edid;
 	int count;
 
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&mdev->rmmio_lock);
-
 	drm_edid = drm_edid_read(connector);
 	drm_edid_connector_update(connector, drm_edid);
 	count = drm_edid_connector_add_modes(connector);
 	drm_edid_free(drm_edid);
 
-	mutex_unlock(&mdev->rmmio_lock);
-
 	return count;
 }
 
-- 
2.44.0

