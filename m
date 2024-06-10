Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957629023B9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6F810E12F;
	Mon, 10 Jun 2024 14:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2130710E189
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:11:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3912E1F7F4;
 Mon, 10 Jun 2024 14:11:45 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 042D313AA0;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +HNxO6AJZ2Z7QQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jun 2024 14:11:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/3] drm/mgag200: Set .detect_ctx() and enable connector
 polling
Date: Mon, 10 Jun 2024 16:06:06 +0200
Message-ID: <20240610141141.29527-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610141141.29527-1-tzimmermann@suse.de>
References: <20240610141141.29527-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 3912E1F7F4
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

Set .detect_ctx() in struct drm_connector_helper_funcs to the
common helper drm_connector_helper_detect_from_ddc() and enable
polling for the connector. Mgag200 will now test for the monitor's
presence by probing the DDC in regular intervals.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga.c     | 6 +++++-
 9 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index ff467b0f9cbf3..f874e29498409 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -401,6 +401,7 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 6f31c5249f0b1..52bf49ead5c50 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -277,6 +277,7 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 5befe8da4beb2..e7f89b2a59fd0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -182,6 +182,7 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 55c275180cde2..4e8a1756138d7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -316,6 +316,7 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 2466126140db6..d884f3cb0ec79 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -321,6 +321,7 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index a52e60609c3de..839401e8b4654 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -202,6 +202,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 212770acdd477..a824bb8ad5791 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -521,6 +521,7 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index cb6daa0426fbc..835df0f4fc13d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -326,6 +326,7 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga.c b/drivers/gpu/drm/mgag200/mgag200_vga.c
index 6d8982990c2c3..60568f32736dd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga.c
@@ -12,7 +12,8 @@ static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
 };
 
 static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes
+	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc
 };
 
 static const struct drm_connector_funcs mgag200_vga_connector_funcs = {
@@ -58,6 +59,9 @@ int mgag200_vga_output_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
-- 
2.45.2

