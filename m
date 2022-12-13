Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9064BDCD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537D010E34E;
	Tue, 13 Dec 2022 20:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344810E356
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:12:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF79222A0D;
 Tue, 13 Dec 2022 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670962358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsGXve8CxQUUJfyW6KSE63P4LIMILCh3QeHw6iGnBNA=;
 b=ZVhrrYBT+KWwkuGLeHsecRkZL7aX064vnAPnccnvQk960FiJROpeIW6KxliIkuIRh6GwtC
 TRMCFQAauRUr1Er+mo/YhfrK7fhI1GLdeAp96f2d/WT7eeIO1I/fE29cquRFa5GXLRpFG2
 Ykt6+c8oBv1NZehjf/QUQ9L46I2CeR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670962358;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsGXve8CxQUUJfyW6KSE63P4LIMILCh3QeHw6iGnBNA=;
 b=ebfhN7w2nVazrO2EFRbsogO0rr0xmEvsQ3t1BnsZsri8d07s1uSoZr1fdoCeR5TMgmf8a4
 Op34idApoGDYHcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1F3F138EE;
 Tue, 13 Dec 2022 20:12:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EEpyLrbcmGNyJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Dec 2022 20:12:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net
Subject: [PATCH 8/9] drm/format-helper: Simplify drm_fb_build_fourcc_list()
Date: Tue, 13 Dec 2022 21:12:32 +0100
Message-Id: <20221213201233.9341-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213201233.9341-1-tzimmermann@suse.de>
References: <20221213201233.9341-1-tzimmermann@suse.de>
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
---
 drivers/gpu/drm/drm_format_helper.c | 112 ++++++++++++++--------------
 drivers/gpu/drm/tiny/ofdrm.c        |  20 -----
 drivers/gpu/drm/tiny/simpledrm.c    |  21 ------
 include/drm/drm_format_helper.h     |   1 -
 4 files changed, 57 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index aa6138756458..25d572f7b116 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1068,6 +1068,39 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
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
@@ -1080,73 +1113,48 @@ static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t
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
@@ -1154,7 +1162,12 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
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
@@ -1165,14 +1178,6 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 
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
@@ -1181,17 +1186,14 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
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
2.38.1

