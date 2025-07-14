Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4509B04358
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6C10E4B9;
	Mon, 14 Jul 2025 15:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3A010E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74D5E1F7CB;
 Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 537DD13A57;
 Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SLn/EsAfdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/9] drm/vesadrm: Rename vesadrm_set_gamma_lut() to
 vesadrm_set_color_lut()
Date: Mon, 14 Jul 2025 17:13:07 +0200
Message-ID: <20250714151513.309475-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714151513.309475-1-tzimmermann@suse.de>
References: <20250714151513.309475-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 74D5E1F7CB
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Rename vesadrm's gamma helpers in preparation of the upcoming support
for color palettes. Gamma correction and color palettes share the same
hardware features, but the driver's old naming only indicated support
for gamma LUTs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 90615e9ac86b..9596322c232b 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -82,7 +82,7 @@ static struct vesadrm_device *to_vesadrm_device(struct drm_device *dev)
 }
 
 /*
- * Palette
+ * Color LUT
  */
 
 static void vesadrm_vga_cmap_write(struct vesadrm_device *vesa, unsigned int index,
@@ -128,7 +128,7 @@ static void vesadrm_pmi_cmap_write(struct vesadrm_device *vesa, unsigned int ind
 }
 #endif
 
-static void vesadrm_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
+static void vesadrm_set_color_lut(struct drm_crtc *crtc, unsigned int index,
 				  u16 red, u16 green, u16 blue)
 {
 	struct drm_device *dev = crtc->dev;
@@ -149,15 +149,15 @@ static void vesadrm_fill_gamma_lut(struct vesadrm_device *vesa,
 
 	switch (format->format) {
 	case DRM_FORMAT_XRGB1555:
-		drm_crtc_fill_gamma_555(crtc, vesadrm_set_gamma_lut);
+		drm_crtc_fill_gamma_555(crtc, vesadrm_set_color_lut);
 		break;
 	case DRM_FORMAT_RGB565:
-		drm_crtc_fill_gamma_565(crtc, vesadrm_set_gamma_lut);
+		drm_crtc_fill_gamma_565(crtc, vesadrm_set_color_lut);
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_BGRX8888:
-		drm_crtc_fill_gamma_888(crtc, vesadrm_set_gamma_lut);
+		drm_crtc_fill_gamma_888(crtc, vesadrm_set_color_lut);
 		break;
 	default:
 		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
@@ -175,15 +175,15 @@ static void vesadrm_load_gamma_lut(struct vesadrm_device *vesa,
 
 	switch (format->format) {
 	case DRM_FORMAT_XRGB1555:
-		drm_crtc_load_gamma_555_from_888(crtc, lut, vesadrm_set_gamma_lut);
+		drm_crtc_load_gamma_555_from_888(crtc, lut, vesadrm_set_color_lut);
 		break;
 	case DRM_FORMAT_RGB565:
-		drm_crtc_load_gamma_565_from_888(crtc, lut, vesadrm_set_gamma_lut);
+		drm_crtc_load_gamma_565_from_888(crtc, lut, vesadrm_set_color_lut);
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_BGRX8888:
-		drm_crtc_load_gamma_888(crtc, lut, vesadrm_set_gamma_lut);
+		drm_crtc_load_gamma_888(crtc, lut, vesadrm_set_color_lut);
 		break;
 	default:
 		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
-- 
2.50.0

