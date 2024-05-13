Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0C8C412E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EB510E76A;
	Mon, 13 May 2024 12:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEC310E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:56:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E6395BED0;
 Mon, 13 May 2024 12:56:30 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE6F713A5C;
 Mon, 13 May 2024 12:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2OMKOf0NQmZpfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 May 2024 12:56:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/10] drm/mgag200: Acquire I/O-register lock in DDC code
Date: Mon, 13 May 2024 14:51:14 +0200
Message-ID: <20240513125620.6337-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513125620.6337-1-tzimmermann@suse.de>
References: <20240513125620.6337-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 2E6395BED0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
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
index cd1f48b2f9986..a04c2b550be02 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -743,23 +743,14 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 
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
2.45.0

