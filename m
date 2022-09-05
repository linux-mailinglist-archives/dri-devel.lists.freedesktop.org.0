Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75D5AD499
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E358E10E3C1;
	Mon,  5 Sep 2022 14:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0E10E3B3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 14:16:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 178061FD7D;
 Mon,  5 Sep 2022 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662387411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLuuS1+uP9YffvexGDEOKAYnEEWPuuJn6KzeQaJIhDQ=;
 b=DMokN7pR0rHtvPMdzZ30K6n+p4oG/j6Igmb6dj3S9XKAd5ctDCdmoHGruoeS5tVpQaWx9m
 WPF0q1u18j2XFTfLgyvK8SlR5dlVthiaDUDTD/NOK9CM5TplrlWt/9cadtMEgWlylVSNn/
 7MRfyisyOmEnl1IvjACDEfWv0HTJXfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662387411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLuuS1+uP9YffvexGDEOKAYnEEWPuuJn6KzeQaJIhDQ=;
 b=jxd4XePpQFG8pWrRIwqjWDWfJLhfnZGoveC4sZO2kI94yuHypeJBhR3hpA/8m2PFTv4QR3
 FUZtVVfxs0pThlDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCD9613A66;
 Mon,  5 Sep 2022 14:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8DQYMdIEFmMoNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 14:16:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH v3 4/4] drm/format-helper: Add drm_fb_build_fourcc_list()
 helper
Date: Mon,  5 Sep 2022 16:16:48 +0200
Message-Id: <20220905141648.22013-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905141648.22013-1-tzimmermann@suse.de>
References: <20220905141648.22013-1-tzimmermann@suse.de>
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

Add drm_fb_build_fourcc_list() function that builds a list of supported
formats from native and emulated ones. Helpful for all drivers that do
format conversion as part of their plane updates. Update current caller.

v3:
	* improve warnings on ignored formats (Sam)
v2:
	* use u32 instead of uint32_t (Sam)
	* print a warning if output array is too small (Sam)
	* comment fixes (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 108 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c    |  47 ++----------
 include/drm/drm_format_helper.h     |  11 ++-
 3 files changed, 123 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 56642816fdff..4afc4ac27342 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -793,3 +793,111 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	kfree(src32);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
+
+static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
+{
+	const uint32_t *fourccs_end = fourccs + nfourccs;
+
+	while (fourccs < fourccs_end) {
+		if (*fourccs == fourcc)
+			return true;
+		++fourccs;
+	}
+	return false;
+}
+
+/**
+ * drm_fb_build_fourcc_list - Filters a list of supported color formats against
+ *                            the device's native formats
+ * @dev: DRM device
+ * @native_fourccs: 4CC codes of natively supported color formats
+ * @native_nfourccs: The number of entries in @native_fourccs
+ * @driver_fourccs: 4CC codes of all driver-supported color formats
+ * @driver_nfourccs: The number of entries in @driver_fourccs
+ * @fourccs_out: Returns 4CC codes of supported color formats
+ * @nfourccs_out: The number of available entries in @fourccs_out
+ *
+ * This function create a list of supported color format from natively
+ * supported formats and the emulated formats.
+ * At a minimum, most userspace programs expect at least support for
+ * XRGB8888 on the primary plane. Devices that have to emulate the
+ * format, and possibly others, can use drm_fb_build_fourcc_list() to
+ * create a list of supported color formats. The returned list can
+ * be handed over to drm_universal_plane_init() et al. Native formats
+ * will go before emulated formats. Other heuristics might be applied
+ * to optimize the order. Formats near the beginning of the list are
+ * usually preferred over formats near the end of the list.
+ *
+ * Returns:
+ * The number of color-formats 4CC codes returned in @fourccs_out.
+ */
+size_t drm_fb_build_fourcc_list(struct drm_device *dev,
+				const u32 *native_fourccs, size_t native_nfourccs,
+				const u32 *driver_fourccs, size_t driver_nfourccs,
+				u32 *fourccs_out, size_t nfourccs_out)
+{
+	u32 *fourccs = fourccs_out;
+	const u32 *fourccs_end = fourccs_out + nfourccs_out;
+	bool found_native = false;
+	size_t i;
+
+	/*
+	 * The device's native formats go first.
+	 */
+
+	for (i = 0; i < native_nfourccs; ++i) {
+		u32 fourcc = native_fourccs[i];
+
+		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
+			continue; /* skip duplicate entries */
+		} else if (fourccs == fourccs_end) {
+			drm_warn(dev, "Ignoring native format %p4cc\n", &fourcc);
+			continue; /* end of available output buffer */
+		}
+
+		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
+
+		if (!found_native)
+			found_native = is_listed_fourcc(driver_fourccs, driver_nfourccs, fourcc);
+		*fourccs = fourcc;
+		++fourccs;
+	}
+
+	/*
+	 * The plane's atomic_update helper converts the framebuffer's color format
+	 * to a native format when copying to device memory.
+	 *
+	 * If there is not a single format supported by both, device and
+	 * driver, the native formats are likely not supported by the conversion
+	 * helpers. Therefore *only* support the native formats and add a
+	 * conversion helper ASAP.
+	 */
+	if (!found_native) {
+		drm_warn(dev, "Format conversion helpers required to add extra formats.\n");
+		goto out;
+	}
+
+	/*
+	 * The extra formats, emulated by the driver, go second.
+	 */
+
+	for (i = 0; (i < driver_nfourccs) && (fourccs < fourccs_end); ++i) {
+		u32 fourcc = driver_fourccs[i];
+
+		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
+			continue; /* skip duplicate and native entries */
+		} else if (fourccs == fourccs_end) {
+			drm_warn(dev, "Ignoring emulated format %p4cc\n", &fourcc);
+			continue; /* end of available output buffer */
+		}
+
+		drm_dbg_kms(dev, "adding emulated format %p4cc\n", &fourcc);
+
+		*fourccs = fourcc;
+		++fourccs;
+	}
+
+out:
+	return fourccs - fourccs_out;
+}
+EXPORT_SYMBOL(drm_fb_build_fourcc_list);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 404290760c60..777ccd250871 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -644,45 +644,6 @@ static struct drm_display_mode simpledrm_mode(unsigned int width,
 	return mode;
 }
 
-static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
-						size_t *nformats_out)
-{
-	struct drm_device *dev = &sdev->dev;
-	size_t i;
-
-	if (sdev->nformats)
-		goto out; /* don't rebuild list on recurring calls */
-
-	/* native format goes first */
-	sdev->formats[0] = sdev->format->format;
-	sdev->nformats = 1;
-
-	/* default formats go second */
-	for (i = 0; i < ARRAY_SIZE(simpledrm_primary_plane_formats); ++i) {
-		if (simpledrm_primary_plane_formats[i] == sdev->format->format)
-			continue; /* native format already went first */
-		sdev->formats[sdev->nformats] = simpledrm_primary_plane_formats[i];
-		sdev->nformats++;
-	}
-
-	/*
-	 * TODO: The simpledrm driver converts framebuffers to the native
-	 * format when copying them to device memory. If there are more
-	 * formats listed than supported by the driver, the native format
-	 * is not supported by the conversion helpers. Therefore *only*
-	 * support the native format and add a conversion helper ASAP.
-	 */
-	if (drm_WARN_ONCE(dev, i != sdev->nformats,
-			  "format conversion helpers required for %p4cc",
-			  &sdev->format->format)) {
-		sdev->nformats = 1;
-	}
-
-out:
-	*nformats_out = sdev->nformats;
-	return sdev->formats;
-}
-
 static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 							struct platform_device *pdev)
 {
@@ -699,7 +660,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	unsigned long max_width, max_height;
-	const uint32_t *formats;
 	size_t nformats;
 	int ret;
 
@@ -811,11 +771,14 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 	/* Primary plane */
 
-	formats = simpledrm_device_formats(sdev, &nformats);
+	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
+					    simpledrm_primary_plane_formats,
+					    ARRAY_SIZE(simpledrm_primary_plane_formats),
+					    sdev->formats, ARRAY_SIZE(sdev->formats));
 
 	primary_plane = &sdev->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
-				       formats, nformats,
+				       sdev->formats, nformats,
 				       simpledrm_primary_plane_format_modifiers,
 				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index caa181194335..eb5c98cf82b8 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -6,11 +6,15 @@
 #ifndef __LINUX_DRM_FORMAT_HELPER_H
 #define __LINUX_DRM_FORMAT_HELPER_H
 
-struct iosys_map;
+#include <linux/types.h>
+
+struct drm_device;
 struct drm_format_info;
 struct drm_framebuffer;
 struct drm_rect;
 
+struct iosys_map;
+
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
 
@@ -44,4 +48,9 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
 			     const struct drm_rect *clip);
 
+size_t drm_fb_build_fourcc_list(struct drm_device *dev,
+				const u32 *native_fourccs, size_t native_nfourccs,
+				const u32 *extra_fourccs, size_t extra_nfourccs,
+				u32 *fourccs_out, size_t nfourccs_out);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.37.2

