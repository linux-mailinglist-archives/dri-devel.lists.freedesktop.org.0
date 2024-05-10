Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F448C2825
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DA310E2C2;
	Fri, 10 May 2024 15:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IBopFWT3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hDsRPwam";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IBopFWT3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hDsRPwam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D229310E2C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:48:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 71E2367388;
 Fri, 10 May 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EHuqySPAOHLBQLOAGPSQ7gzSMMHwABvSU24sx9KIyc=;
 b=IBopFWT3l/DCE1RKkKQ02k8bpOLDLKaEjaS/dupQW7M35s+wNlxRDwPeL7MXk0PdDjz/EI
 +AUI4cgQN9wO8UXA6oWgVi+JtPdPoAQrZlmjT42N3EKLAjd2fHZi3RwfMD+6zz0Rm+yTIx
 06fdra0tD05MlvC5WV6s8QbeTyq4Z2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EHuqySPAOHLBQLOAGPSQ7gzSMMHwABvSU24sx9KIyc=;
 b=hDsRPwam29zCnahxtLiE3yxJ6/7uHi66I+dqSD+g+MKvoK53euwLWnAZWELb/QB6iF0/tP
 oHUf/korlpfQeSAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IBopFWT3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hDsRPwam
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EHuqySPAOHLBQLOAGPSQ7gzSMMHwABvSU24sx9KIyc=;
 b=IBopFWT3l/DCE1RKkKQ02k8bpOLDLKaEjaS/dupQW7M35s+wNlxRDwPeL7MXk0PdDjz/EI
 +AUI4cgQN9wO8UXA6oWgVi+JtPdPoAQrZlmjT42N3EKLAjd2fHZi3RwfMD+6zz0Rm+yTIx
 06fdra0tD05MlvC5WV6s8QbeTyq4Z2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EHuqySPAOHLBQLOAGPSQ7gzSMMHwABvSU24sx9KIyc=;
 b=hDsRPwam29zCnahxtLiE3yxJ6/7uHi66I+dqSD+g+MKvoK53euwLWnAZWELb/QB6iF0/tP
 oHUf/korlpfQeSAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BC6213A32;
 Fri, 10 May 2024 15:48:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ODVxDdxBPma7MgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 15:48:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 2/5] drm/udl: Move drm_dev_{enter,
 exit}() into udl_get_edid_block()
Date: Fri, 10 May 2024 17:47:09 +0200
Message-ID: <20240510154841.11370-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510154841.11370-1-tzimmermann@suse.de>
References: <20240510154841.11370-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim]; TO_DN_SOME(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 71E2367388
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Protect the code in udl_get_edid_block() with drm_dev_enter() and
drm_dev_exit(), so that all callers automatically invoke it. The
function uses hardware resources, which can be hot-unplugged at
any time. The other code in udl_connector_detect() does not use the
resources of the hardware device and therefore does not require
protection.

This change will allow to use udl_get_edid_block() in various
contexts easily.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 751da3a294c44..3df9fc38388b4 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -434,13 +434,18 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
 	struct drm_device *dev = &udl->drm;
 	struct usb_device *udev = udl_to_usb_device(udl);
 	u8 *read_buff;
-	int ret;
+	int idx, ret;
 	size_t i;
 
 	read_buff = kmalloc(2, GFP_KERNEL);
 	if (!read_buff)
 		return -ENOMEM;
 
+	if (!drm_dev_enter(dev, &idx)) {
+		ret = -ENODEV;
+		goto err_kfree;
+	}
+
 	for (i = 0; i < len; i++) {
 		int bval = (i + block * EDID_LENGTH) << 8;
 
@@ -449,20 +454,23 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
 				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
 		if (ret < 0) {
 			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
-			goto err_kfree;
+			goto err_drm_dev_exit;
 		} else if (ret < 1) {
 			ret = -EIO;
 			drm_err(dev, "Read EDID byte %zu failed\n", i);
-			goto err_kfree;
+			goto err_drm_dev_exit;
 		}
 
 		buf[i] = read_buff[1];
 	}
 
+	drm_dev_exit(idx);
 	kfree(read_buff);
 
 	return 0;
 
+err_drm_dev_exit:
+	drm_dev_exit(idx);
 err_kfree:
 	kfree(read_buff);
 	return ret;
@@ -474,21 +482,15 @@ static enum drm_connector_status udl_connector_detect(struct drm_connector *conn
 	struct udl_device *udl = to_udl(dev);
 	struct udl_connector *udl_connector = to_udl_connector(connector);
 	enum drm_connector_status status = connector_status_disconnected;
-	int idx;
 
 	/* cleanup previous EDID */
 	kfree(udl_connector->edid);
 	udl_connector->edid = NULL;
 
-	if (!drm_dev_enter(dev, &idx))
-		return connector_status_disconnected;
-
 	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
 	if (udl_connector->edid)
 		status = connector_status_connected;
 
-	drm_dev_exit(idx);
-
 	return status;
 }
 
-- 
2.44.0

