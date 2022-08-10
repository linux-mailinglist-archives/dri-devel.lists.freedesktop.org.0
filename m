Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948958EB30
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F44B2E6E;
	Wed, 10 Aug 2022 11:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4CA6B5F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:20:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D08FD1F978;
 Wed, 10 Aug 2022 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660130455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yk5AMIpNadNwJitqp+m7clfjWxQ9PIu6WmxZ0GRIK5Y=;
 b=0FM+EH4DQblv8Kosbo3g7piwwmbAZPOl3E8/52UymFhLmOxjLaMfO/qYhO2TKIzsYNuYlN
 dCTK8dUheYQbj5/L4NjINbRtj4lP5QlU27naRgo20moQOp9syx5QN4XbLf1FX+wJE69iWI
 IadBdMTPZfteoQoO3kTw2n+2hSbi1KE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660130455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yk5AMIpNadNwJitqp+m7clfjWxQ9PIu6WmxZ0GRIK5Y=;
 b=ZlnmH6kznRZ30XUwnvTTT4+Dxs7pxuVRJhVCT9alVqsaG/xyZ7Jn3B1kJQh4FDdMuUNGyl
 iFmri2eIBQXabbCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9485A13ABC;
 Wed, 10 Aug 2022 11:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uJ5OI5eU82KAVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Aug 2022 11:20:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH 3/4] drm/modes: Add initializer macro DRM_MODE_INIT()
Date: Wed, 10 Aug 2022 13:20:52 +0200
Message-Id: <20220810112053.19547-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810112053.19547-1-tzimmermann@suse.de>
References: <20220810112053.19547-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro DRM_MODE_INIT() initializes an instance of
struct drm_display_mode with typical parameters. Convert simpledrm
and also update the macro DRM_SIMPLE_MODE().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 23 ++++++++-------------
 include/drm/drm_modes.h          | 35 +++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 31d3bc6c5acf..cc509154b296 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -30,16 +30,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-/*
- * Assume a monitor resolution of 96 dpi to
- * get a somewhat reasonable screen size.
- */
-#define RES_MM(d)	\
-	(((d) * 254ul) / (96ul * 10ul))
-
-#define SIMPLEDRM_MODE(hd, vd)	\
-	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
-
 /*
  * Helpers for simplefb
  */
@@ -641,10 +631,15 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
 static struct drm_display_mode simpledrm_mode(unsigned int width,
 					      unsigned int height)
 {
-	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
-
-	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
-	drm_mode_set_name(&mode);
+	/*
+	 * Assume a monitor resolution of 96 dpi to
+	 * get a somewhat reasonable screen size.
+	 */
+	const struct drm_display_mode mode = {
+		DRM_MODE_INIT(60, width, height,
+			      DRM_MODE_RES_MM(width, 96ul),
+			      DRM_MODE_RES_MM(height, 96ul))
+	};
 
 	return mode;
 }
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index a80ae9639e96..bb932806f029 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -138,6 +138,35 @@ enum drm_mode_status {
 	.vsync_start = (vss), .vsync_end = (vse), .vtotal = (vt), \
 	.vscan = (vs), .flags = (f)
 
+/**
+ * DRM_MODE_RES_MM - Calculates the display size from resolution and DPI
+ * @res: The resolution in pixel
+ * @dpi: The number of dots per inch
+ */
+#define DRM_MODE_RES_MM(res, dpi)	\
+	(((res) * 254ul) / ((dpi) * 10ul))
+
+#define __DRM_MODE_INIT(pix, hd, vd, hd_mm, vd_mm) \
+	.type = DRM_MODE_TYPE_DRIVER, .clock = (pix), \
+	.hdisplay = (hd), .hsync_start = (hd), .hsync_end = (hd), \
+	.htotal = (hd), .vdisplay = (vd), .vsync_start = (vd), \
+	.vsync_end = (vd), .vtotal = (vd), .width_mm = (hd_mm), \
+	.height_mm = (vd_mm)
+
+/**
+ * DRM_SIMPLE_MODE_INIT - Initialize display mode
+ * @hz: Vertical refresh rate in Hertz
+ * @hd: Horizontal resolution, width
+ * @vd: Vertical resolution, height
+ * @hd_mm: Display width in millimeters
+ * @vd_mm: Display height in millimeters
+ *
+ * This macro initializes a &drm_display_mode that contains information about
+ * refresh rate, resolution and physical size.
+ */
+#define DRM_MODE_INIT(hz, hd, vd, hd_mm, vd_mm) \
+	__DRM_MODE_INIT((hd) * (vd) * (hz) / 1000 /* kHz */, hd, vd, hd_mm, vd_mm)
+
 /**
  * DRM_SIMPLE_MODE - Simple display mode
  * @hd: Horizontal resolution, width
@@ -149,11 +178,7 @@ enum drm_mode_status {
  * resolution and physical size.
  */
 #define DRM_SIMPLE_MODE(hd, vd, hd_mm, vd_mm) \
-	.type = DRM_MODE_TYPE_DRIVER, .clock = 1 /* pass validation */, \
-	.hdisplay = (hd), .hsync_start = (hd), .hsync_end = (hd), \
-	.htotal = (hd), .vdisplay = (vd), .vsync_start = (vd), \
-	.vsync_end = (vd), .vtotal = (vd), .width_mm = (hd_mm), \
-	.height_mm = (vd_mm)
+	__DRM_MODE_INIT(1 /* pass validation */, hd, vd, hd_mm, vd_mm)
 
 #define CRTC_INTERLACE_HALVE_V	(1 << 0) /* halve V values for interlacing */
 #define CRTC_STEREO_DOUBLE	(1 << 1) /* adjust timings for stereo modes */
-- 
2.37.1

