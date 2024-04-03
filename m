Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6C7896AA0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19954112933;
	Wed,  3 Apr 2024 09:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KDZHlzUK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZYS6d9MV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE4911292D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:22 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB4335CAA4;
 Wed,  3 Apr 2024 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeXoNpxnhK4nCFT0K9Y6dejFrkEXB1NPZQANiEj9rh4=;
 b=KDZHlzUKbLSx+0fnDzVNqxao+5shfE9yldD7pTfLAEW7+DXVlvz7XhKK8GIfuic+AE8jdC
 tylqxgp0VMwcgUHEfiUCUApHkRdIicVE86OizHAp6ta0p6YIy6UF/AHnJhcvg0nEd2oz/i
 UnvtrZ95tIk94hxwIpcFGZnPYYXkDBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeXoNpxnhK4nCFT0K9Y6dejFrkEXB1NPZQANiEj9rh4=;
 b=ZYS6d9MV2Sq3g1LzGJeTTOYqrm0v1eFePW8WNsrAsUL/er+JGL16iZQ4o6o+6lP0g+yjv+
 U6ggAvY34VgqZDDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B3E513A8B;
 Wed,  3 Apr 2024 09:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IBLBIOghDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/11] drm/mgag200: Set .detect_ctx() and enable connector
 polling
Date: Wed,  3 Apr 2024 11:24:48 +0200
Message-ID: <20240403093114.22163-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 2.39
X-Spam-Flag: NO
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.39 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-0.999];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Level: **
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CB4335CAA4
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
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 3 ++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 4 ++++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 4 ++++
 9 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 49237a260ab05..2a3bc9db60870 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -416,7 +416,8 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	.destroy = drm_encoder_cleanup
 
 #define MGAG200_VGA_CONNECTOR_HELPER_FUNCS \
-	.get_modes = drm_connector_helper_get_modes
+	.get_modes = drm_connector_helper_get_modes, \
+	.detect_ctx = drm_connector_helper_detect_from_ddc
 
 #define MGAG200_VGA_CONNECTOR_FUNCS \
 	.reset                  = drm_atomic_helper_connector_reset, \
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 39a29d8ffca6e..0fe102db5a1a6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -255,6 +255,9 @@ static int mgag200_g200_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -443,6 +446,7 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 619fee7ffdf5e..5a493bbf4a9ae 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -254,6 +254,9 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200eh_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -315,6 +318,7 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index a172b8a4500a0..a439dfc521489 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -158,6 +158,9 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200eh3_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -220,6 +223,7 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index a11c91331e43e..b3e6c2a7281cd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -297,6 +297,9 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200er_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -354,6 +357,7 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index dfb641b83842a..eefef4ec4abdb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -298,6 +298,9 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200ev_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -359,6 +362,7 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 525b7f75e6228..51f8cec5c70c0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -167,6 +167,9 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200ew3_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -240,6 +243,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index ef7606b529ea1..49f433eddf3cc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -429,6 +429,9 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200se_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -559,6 +562,7 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index e4def62b1e575..689c8959daaa2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -301,6 +301,9 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_g200wb_vga_connector_helper_funcs);
 
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
@@ -364,6 +367,7 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
 
 	return mdev;
 }
-- 
2.44.0

