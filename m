Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D2652463
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D999A10E0D6;
	Tue, 20 Dec 2022 16:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9518610E0BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:11:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1711A76493;
 Tue, 20 Dec 2022 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TmxOr7m6DmcmjC/iJJ0kHRTDp1lk8M20LuxluTCBZI=;
 b=gJs+jxaKaD++wcafKWmS0xB+Z2Et/Nd6xuZ/im07RbN4ZZDH0gmQ9DAe5HGDbCPdlfnWR/
 xnO5CFE5tY1eWaom9X/1bg+4v0CgaP8ZTox6qkG8H0gPbLVHKzfup3H4lnSKgP33kZCxC+
 QRm2hSyDbXo3maodhmpMazYTUk1yxho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TmxOr7m6DmcmjC/iJJ0kHRTDp1lk8M20LuxluTCBZI=;
 b=s5h9b78LpCfVe5AyRgOe6YTwsOT05RZnUgcf/NZVy0s0WPrSGPBc8CnQ4+s7KLBKhR4JcA
 CBu3Tp5e0IMxClCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9DC41390E;
 Tue, 20 Dec 2022 16:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SNxCNMfeoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 12/13] drm/format-helper: Simplify
 drm_fb_build_fourcc_list()
Date: Tue, 20 Dec 2022 17:11:44 +0100
Message-Id: <20221220161145.27568-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220161145.27568-1-tzimmermann@suse.de>
References: <20221220161145.27568-1-tzimmermann@suse.de>
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

The DRM helper drm_fb_build_fourcc_list() creates a list of color
formats for primary planes of the generic drivers. Simplify the helper:

 - It used to mix and filter native and emulated formats as provided
   by the driver. Now the only emulated format is XRGB8888, which is
   required as fallback by legacy software. Drop support for emulating
   any other formats.
 - Also convert alpha formats to their non-alpha counterparts. Generic
   drivers don't support primary planes with alpha formats and some
   DTs incorrectly advertise alpha channels for non-alpha hardware. So
   only export non-alpha formats for primary planes.

With the simplified helper, scrap format lists of the affected generic
drivers. All they need is the firmware buffer's native format, from which
the helper creates the list of color formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 112 ++++++++++++++--------------
 drivers/gpu/drm/tiny/ofdrm.c        |  20 -----
 drivers/gpu/drm/tiny/simpledrm.c    |  21 ------
 include/drm/drm_format_helper.h     |   1 -
 4 files changed, 57 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 1cedfe02fadf..07791aa5385d 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1070,6 +1070,39 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
 
+static uint32_t drm_fb_nonalpha_fourcc(uint32_t fourcc)
+{
+	/* only handle formats with depth != 0 and alpha channel */
+	switch (fourcc) {
+	case DRM_FORMAT_ARGB1555:
+		return DRM_FORMAT_XRGB1555;
+	case DRM_FORMAT_ABGR1555:
+		return DRM_FORMAT_XBGR1555;
+	case DRM_FORMAT_RGBA5551:
+		return DRM_FORMAT_RGBX5551;
+	case DRM_FORMAT_BGRA5551:
+		return DRM_FORMAT_BGRX5551;
+	case DRM_FORMAT_ARGB8888:
+		return DRM_FORMAT_XRGB8888;
+	case DRM_FORMAT_ABGR8888:
+		return DRM_FORMAT_XBGR8888;
+	case DRM_FORMAT_RGBA8888:
+		return DRM_FORMAT_RGBX8888;
+	case DRM_FORMAT_BGRA8888:
+		return DRM_FORMAT_BGRX8888;
+	case DRM_FORMAT_ARGB2101010:
+		return DRM_FORMAT_XRGB2101010;
+	case DRM_FORMAT_ABGR2101010:
+		return DRM_FORMAT_XBGR2101010;
+	case DRM_FORMAT_RGBA1010102:
+		return DRM_FORMAT_RGBX1010102;
+	case DRM_FORMAT_BGRA1010102:
+		return DRM_FORMAT_BGRX1010102;
+	}
+
+	return fourcc;
+}
+
 static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
 {
 	const uint32_t *fourccs_end = fourccs + nfourccs;
@@ -1082,73 +1115,48 @@ static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t
 	return false;
 }
 
-static const uint32_t conv_from_xrgb8888[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB2101010,
-	DRM_FORMAT_ARGB2101010,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
-};
-
-static const uint32_t conv_from_rgb565_888[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-};
-
-static bool is_conversion_supported(uint32_t from, uint32_t to)
-{
-	switch (from) {
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_ARGB8888:
-		return is_listed_fourcc(conv_from_xrgb8888, ARRAY_SIZE(conv_from_xrgb8888), to);
-	case DRM_FORMAT_RGB565:
-	case DRM_FORMAT_RGB888:
-		return is_listed_fourcc(conv_from_rgb565_888, ARRAY_SIZE(conv_from_rgb565_888), to);
-	case DRM_FORMAT_XRGB2101010:
-		return to == DRM_FORMAT_ARGB2101010;
-	case DRM_FORMAT_ARGB2101010:
-		return to == DRM_FORMAT_XRGB2101010;
-	default:
-		return false;
-	}
-}
-
 /**
  * drm_fb_build_fourcc_list - Filters a list of supported color formats against
  *                            the device's native formats
  * @dev: DRM device
  * @native_fourccs: 4CC codes of natively supported color formats
  * @native_nfourccs: The number of entries in @native_fourccs
- * @driver_fourccs: 4CC codes of all driver-supported color formats
- * @driver_nfourccs: The number of entries in @driver_fourccs
  * @fourccs_out: Returns 4CC codes of supported color formats
  * @nfourccs_out: The number of available entries in @fourccs_out
  *
  * This function create a list of supported color format from natively
- * supported formats and the emulated formats.
+ * supported formats and additional emulated formats.
  * At a minimum, most userspace programs expect at least support for
  * XRGB8888 on the primary plane. Devices that have to emulate the
  * format, and possibly others, can use drm_fb_build_fourcc_list() to
  * create a list of supported color formats. The returned list can
  * be handed over to drm_universal_plane_init() et al. Native formats
- * will go before emulated formats. Other heuristics might be applied
+ * will go before emulated formats. Native formats with alpha channel
+ * will be replaced by such without, as primary planes usually don't
+ * support alpha. Other heuristics might be applied
  * to optimize the order. Formats near the beginning of the list are
- * usually preferred over formats near the end of the list. Formats
- * without conversion helpers will be skipped. New drivers should only
- * pass in XRGB8888 and avoid exposing additional emulated formats.
+ * usually preferred over formats near the end of the list.
  *
  * Returns:
  * The number of color-formats 4CC codes returned in @fourccs_out.
  */
 size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
-				const u32 *driver_fourccs, size_t driver_nfourccs,
 				u32 *fourccs_out, size_t nfourccs_out)
 {
+	/*
+	 * XRGB8888 is the default fallback format for most of userspace
+	 * and it's currently the only format that should be emulated for
+	 * the primary plane. Only if there's ever another default fallback,
+	 * it should be added here.
+	 */
+	static const uint32_t extra_fourccs[] = {
+		DRM_FORMAT_XRGB8888,
+	};
+	static const size_t extra_nfourccs = ARRAY_SIZE(extra_fourccs);
+
 	u32 *fourccs = fourccs_out;
 	const u32 *fourccs_end = fourccs_out + nfourccs_out;
-	uint32_t native_format = 0;
 	size_t i;
 
 	/*
@@ -1156,7 +1164,12 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 	 */
 
 	for (i = 0; i < native_nfourccs; ++i) {
-		u32 fourcc = native_fourccs[i];
+		/*
+		 * Several DTs, boot loaders and firmware report native
+		 * alpha formats that are non-alpha formats instead. So
+		 * replace alpha formats by non-alpha formats.
+		 */
+		u32 fourcc = drm_fb_nonalpha_fourcc(native_fourccs[i]);
 
 		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
 			continue; /* skip duplicate entries */
@@ -1167,14 +1180,6 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 
 		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
 
-		/*
-		 * There should only be one native format with the current API.
-		 * This API needs to be refactored to correctly support arbitrary
-		 * sets of native formats, since it needs to report which native
-		 * format to use for each emulated format.
-		 */
-		if (!native_format)
-			native_format = fourcc;
 		*fourccs = fourcc;
 		++fourccs;
 	}
@@ -1183,17 +1188,14 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 	 * The extra formats, emulated by the driver, go second.
 	 */
 
-	for (i = 0; (i < driver_nfourccs) && (fourccs < fourccs_end); ++i) {
-		u32 fourcc = driver_fourccs[i];
+	for (i = 0; (i < extra_nfourccs) && (fourccs < fourccs_end); ++i) {
+		u32 fourcc = extra_fourccs[i];
 
 		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
 			continue; /* skip duplicate and native entries */
 		} else if (fourccs == fourccs_end) {
 			drm_warn(dev, "Ignoring emulated format %p4cc\n", &fourcc);
 			continue; /* end of available output buffer */
-		} else if (!is_conversion_supported(fourcc, native_format)) {
-			drm_dbg_kms(dev, "Unsupported emulated format %p4cc\n", &fourcc);
-			continue; /* format is not supported for conversion */
 		}
 
 		drm_dbg_kms(dev, "adding emulated format %p4cc\n", &fourcc);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 33eefeba437c..39c5fd463fec 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -754,24 +754,6 @@ static void ofdrm_crtc_state_destroy(struct ofdrm_crtc_state *ofdrm_crtc_state)
 	kfree(ofdrm_crtc_state);
 }
 
-/*
- * Support all formats of OF display and maybe more; in order
- * of preference. The display's update function will do any
- * conversion necessary.
- *
- * TODO: Add blit helpers for remaining formats and uncomment
- *       constants.
- */
-static const uint32_t ofdrm_primary_plane_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_RGB565,
-	//DRM_FORMAT_XRGB1555,
-	//DRM_FORMAT_C8,
-	/* Big-endian formats below */
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN,
-};
-
 static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -1290,8 +1272,6 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	/* Primary plane */
 
 	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
-					    ofdrm_primary_plane_formats,
-					    ARRAY_SIZE(ofdrm_primary_plane_formats),
 					    odev->formats, ARRAY_SIZE(odev->formats));
 
 	primary_plane = &odev->primary_plane;
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 30e928d627e8..7355617f38d3 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -446,25 +446,6 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
  * Modesetting
  */
 
-/*
- * Support all formats of simplefb and maybe more; in order
- * of preference. The display's update function will do any
- * conversion necessary.
- *
- * TODO: Add blit helpers for remaining formats and uncomment
- *       constants.
- */
-static const uint32_t simpledrm_primary_plane_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_RGB565,
-	//DRM_FORMAT_XRGB1555,
-	//DRM_FORMAT_ARGB1555,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_XRGB2101010,
-	DRM_FORMAT_ARGB2101010,
-};
-
 static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -745,8 +726,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	/* Primary plane */
 
 	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
-					    simpledrm_primary_plane_formats,
-					    ARRAY_SIZE(simpledrm_primary_plane_formats),
 					    sdev->formats, ARRAY_SIZE(sdev->formats));
 
 	primary_plane = &sdev->primary_plane;
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 2d04f5863722..291deb09475b 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -65,7 +65,6 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 
 size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
-				const u32 *extra_fourccs, size_t extra_nfourccs,
 				u32 *fourccs_out, size_t nfourccs_out);
 
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.39.0

