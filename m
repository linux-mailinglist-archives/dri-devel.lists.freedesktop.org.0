Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E839898AB2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 17:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99DD10EA9F;
	Thu,  4 Apr 2024 15:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA3810EA9F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 15:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97B8B5F842;
 Thu,  4 Apr 2024 15:09:01 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6708B139E8;
 Thu,  4 Apr 2024 15:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qHrUF43CDmZ2FgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Apr 2024 15:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/7] drm/udl: Move drm_dev_{enter,
 exit}() into udl_get_edid_block()
Date: Thu,  4 Apr 2024 17:03:21 +0200
Message-ID: <20240404150857.5520-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404150857.5520-1-tzimmermann@suse.de>
References: <20240404150857.5520-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 97B8B5F842
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

Protect the code in udl_get_edid_block() with drm_dev_enter() and
drm_dev_exit(), so that all callers automatically invoke it. The
function uses hardware resources, which can be hot-unplugged at
any time. The other code in udl_connector_detect() does not use the
resources of the hardware device and therefore does not require
protection.

This change will allow to use udl_get_edid_block() in various
contexts easily.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

