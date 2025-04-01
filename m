Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D8A777FF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B297610E0F9;
	Tue,  1 Apr 2025 09:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3F610E542
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:44:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B14AF21194;
 Tue,  1 Apr 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 762A6138A5;
 Tue,  1 Apr 2025 09:44:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oBiVG3y162dSBgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 09:44:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/18] drm/sysfb: Provide single mode-init helper
Date: Tue,  1 Apr 2025 11:37:09 +0200
Message-ID: <20250401094056.32904-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401094056.32904-1-tzimmermann@suse.de>
References: <20250401094056.32904-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: B14AF21194
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Merge the mode-init functions of ofdrm and simpledrm to the new helper
drm_sysfb_mode(). Also implement the DPI defaults there. Replace the
code in each driver with the shared helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  5 +++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 17 +----------------
 drivers/gpu/drm/sysfb/simpledrm.c        | 23 +----------------------
 4 files changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index c083d21fd9cab..6deeac81a41de 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -6,3 +6,27 @@
 
 MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
 MODULE_LICENSE("GPL");
+
+struct drm_display_mode drm_sysfb_mode(unsigned int width,
+				       unsigned int height,
+				       unsigned int width_mm,
+				       unsigned int height_mm)
+{
+	/*
+	 * Assume a monitor resolution of 96 dpi to
+	 * get a somewhat reasonable screen size.
+	 */
+	if (!width_mm)
+		width_mm = DRM_MODE_RES_MM(width, 96ul);
+	if (!height_mm)
+		height_mm = DRM_MODE_RES_MM(height, 96ul);
+
+	{
+		const struct drm_display_mode mode = {
+			DRM_MODE_INIT(60, width, height, width_mm, height_mm)
+		};
+
+		return mode;
+	}
+}
+EXPORT_SYMBOL(drm_sysfb_mode);
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 8f05eee7f49e5..8b4cc4af702b2 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -11,6 +11,11 @@
 
 struct drm_format_info;
 
+struct drm_display_mode drm_sysfb_mode(unsigned int width,
+				       unsigned int height,
+				       unsigned int width_mm,
+				       unsigned int height_mm);
+
 /*
  * Device
  */
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index d42704facb455..7df6901157fb1 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -1070,21 +1070,6 @@ static const struct ofdrm_device_funcs ofdrm_qemu_device_funcs = {
 	.cmap_write = ofdrm_qemu_cmap_write,
 };
 
-static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
-{
-	/*
-	 * Assume a monitor resolution of 96 dpi to
-	 * get a somewhat reasonable screen size.
-	 */
-	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height,
-			      DRM_MODE_RES_MM(width, 96ul),
-			      DRM_MODE_RES_MM(height, 96ul))
-	};
-
-	return mode;
-}
-
 static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 						struct platform_device *pdev)
 {
@@ -1251,7 +1236,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	 */
 
 	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
-	sysfb->fb_mode = ofdrm_mode(width, height);
+	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = linebytes;
 
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index f258d8cdb6b68..149df6941b6c7 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -756,18 +756,6 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
  * Init / Cleanup
  */
 
-static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height,
-					      unsigned int width_mm,
-					      unsigned int height_mm)
-{
-	const struct drm_display_mode mode = {
-		DRM_MODE_INIT(60, width, height, width_mm, height_mm)
-	};
-
-	return mode;
-}
-
 static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 							struct platform_device *pdev)
 {
@@ -855,16 +843,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 			return ERR_PTR(-EINVAL);
 	}
 
-	/*
-	 * Assume a monitor resolution of 96 dpi if physical dimensions
-	 * are not specified to get a somewhat reasonable screen size.
-	 */
-	if (!width_mm)
-		width_mm = DRM_MODE_RES_MM(width, 96ul);
-	if (!height_mm)
-		height_mm = DRM_MODE_RES_MM(height, 96ul);
-
-	sysfb->fb_mode = simpledrm_mode(width, height, width_mm, height_mm);
+	sysfb->fb_mode = drm_sysfb_mode(width, height, width_mm, height_mm);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = stride;
 
-- 
2.49.0

