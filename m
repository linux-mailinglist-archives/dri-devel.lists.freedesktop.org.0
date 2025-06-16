Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F551ADAB24
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2634B10E2E5;
	Mon, 16 Jun 2025 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2EcYXRFo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2yTJLDjS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TUj2wYbY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ekx0wZu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E3810E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:42:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D5EC61F394;
 Mon, 16 Jun 2025 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750063343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dO1ZlPdHaQwjXf1LVEhclyhylG6HhgDk1ipIK1QaNMw=;
 b=2EcYXRFofgQHrIVCYa5xl6j66Ii+FtRRpwXzhaLemYfx3kAMPJW0++wA3NWiWjGyHbJO3g
 JMuj7/DFoGRn/qpvMaL3Oo94GqgQA+EZnGYlFOAzZi2njV/qnPSlVWfIfXePyjlSGu6Yka
 skoeDzyoR0BagsilRteqJDQWtKW3vCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750063343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dO1ZlPdHaQwjXf1LVEhclyhylG6HhgDk1ipIK1QaNMw=;
 b=2yTJLDjSW6ynfC8EP2ultA0tqvxlFMrMzezLdt0T2u56FDc0XQ4dMGO1dmkW6KrydXkQYU
 ycl5zubErNTKlKCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TUj2wYbY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ekx0wZu1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750063342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dO1ZlPdHaQwjXf1LVEhclyhylG6HhgDk1ipIK1QaNMw=;
 b=TUj2wYbYnS1PmSF9k8h1RdcVE+FJaaNWGRRBgjcpCjRQfC02kZOLVapVEvaJ0aUqrEvLjx
 K4bk9y+qUfBaMIDHUhdXTWBYslbm1LIhMuWKtYCPuCfmndI3Mz8lBdjTjXfLbMIFbNoBYv
 OPcvxTnU5cAzr+C9LZF1MLY2R0S1Eyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750063342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dO1ZlPdHaQwjXf1LVEhclyhylG6HhgDk1ipIK1QaNMw=;
 b=Ekx0wZu10U76RjyjLaURRzebdfNTC+HXaCM8qQVISEkgrnE6bSLu2tXYOm0YNUhazaUx2+
 qn+hzLbEiE0VUSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CFF913A9C;
 Mon, 16 Jun 2025 08:42:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AIQeIe7YT2gwPgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jun 2025 08:42:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 3/3] drm/format-helper: Move drm_fb_build_fourcc_list() to
 sysfb helpers
Date: Mon, 16 Jun 2025 10:37:06 +0200
Message-ID: <20250616083846.221396-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616083846.221396-1-tzimmermann@suse.de>
References: <20250616083846.221396-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D5EC61F394
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[riseup.net,gmail.com,redhat.com,linux.intel.com,kernel.org]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.01
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

Only sysfb drivers use drm_fb_build_fourcc_list(). Move the function
to sysfb helpers and rename it accordingly. Update drivers and tests.

v3:
- update naming in tests
v2:
- select DRM_SYSFB_HELPER (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/Kconfig.debug                 |   1 +
 drivers/gpu/drm/drm_format_helper.c           | 138 ------------------
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   4 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     | 138 ++++++++++++++++++
 drivers/gpu/drm/sysfb/efidrm.c                |   4 +-
 drivers/gpu/drm/sysfb/ofdrm.c                 |   5 +-
 drivers/gpu/drm/sysfb/simpledrm.c             |   5 +-
 drivers/gpu/drm/sysfb/vesadrm.c               |   4 +-
 .../gpu/drm/tests/drm_sysfb_modeset_test.c    |  24 +--
 include/drm/drm_format_helper.h               |   4 -
 10 files changed, 164 insertions(+), 163 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index fa6ee76f4d3c..05dc43c0b8c5 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -70,6 +70,7 @@ config DRM_KUNIT_TEST
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KUNIT_TEST_HELPERS
 	select DRM_LIB_RANDOM
+	select DRM_SYSFB_HELPER
 	select PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
 	help
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 63dc46f9fc49..99d9f7bbc261 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1339,141 +1339,3 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	}
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
-
-static uint32_t drm_fb_nonalpha_fourcc(uint32_t fourcc)
-{
-	/* only handle formats with depth != 0 and alpha channel */
-	switch (fourcc) {
-	case DRM_FORMAT_ARGB1555:
-		return DRM_FORMAT_XRGB1555;
-	case DRM_FORMAT_ABGR1555:
-		return DRM_FORMAT_XBGR1555;
-	case DRM_FORMAT_RGBA5551:
-		return DRM_FORMAT_RGBX5551;
-	case DRM_FORMAT_BGRA5551:
-		return DRM_FORMAT_BGRX5551;
-	case DRM_FORMAT_ARGB8888:
-		return DRM_FORMAT_XRGB8888;
-	case DRM_FORMAT_ABGR8888:
-		return DRM_FORMAT_XBGR8888;
-	case DRM_FORMAT_RGBA8888:
-		return DRM_FORMAT_RGBX8888;
-	case DRM_FORMAT_BGRA8888:
-		return DRM_FORMAT_BGRX8888;
-	case DRM_FORMAT_ARGB2101010:
-		return DRM_FORMAT_XRGB2101010;
-	case DRM_FORMAT_ABGR2101010:
-		return DRM_FORMAT_XBGR2101010;
-	case DRM_FORMAT_RGBA1010102:
-		return DRM_FORMAT_RGBX1010102;
-	case DRM_FORMAT_BGRA1010102:
-		return DRM_FORMAT_BGRX1010102;
-	}
-
-	return fourcc;
-}
-
-static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
-{
-	const uint32_t *fourccs_end = fourccs + nfourccs;
-
-	while (fourccs < fourccs_end) {
-		if (*fourccs == fourcc)
-			return true;
-		++fourccs;
-	}
-	return false;
-}
-
-/**
- * drm_fb_build_fourcc_list - Filters a list of supported color formats against
- *                            the device's native formats
- * @dev: DRM device
- * @native_fourccs: 4CC codes of natively supported color formats
- * @native_nfourccs: The number of entries in @native_fourccs
- * @fourccs_out: Returns 4CC codes of supported color formats
- * @nfourccs_out: The number of available entries in @fourccs_out
- *
- * This function create a list of supported color format from natively
- * supported formats and additional emulated formats.
- * At a minimum, most userspace programs expect at least support for
- * XRGB8888 on the primary plane. Devices that have to emulate the
- * format, and possibly others, can use drm_fb_build_fourcc_list() to
- * create a list of supported color formats. The returned list can
- * be handed over to drm_universal_plane_init() et al. Native formats
- * will go before emulated formats. Native formats with alpha channel
- * will be replaced by such without, as primary planes usually don't
- * support alpha. Other heuristics might be applied
- * to optimize the order. Formats near the beginning of the list are
- * usually preferred over formats near the end of the list.
- *
- * Returns:
- * The number of color-formats 4CC codes returned in @fourccs_out.
- */
-size_t drm_fb_build_fourcc_list(struct drm_device *dev,
-				const u32 *native_fourccs, size_t native_nfourccs,
-				u32 *fourccs_out, size_t nfourccs_out)
-{
-	/*
-	 * XRGB8888 is the default fallback format for most of userspace
-	 * and it's currently the only format that should be emulated for
-	 * the primary plane. Only if there's ever another default fallback,
-	 * it should be added here.
-	 */
-	static const uint32_t extra_fourccs[] = {
-		DRM_FORMAT_XRGB8888,
-	};
-	static const size_t extra_nfourccs = ARRAY_SIZE(extra_fourccs);
-
-	u32 *fourccs = fourccs_out;
-	const u32 *fourccs_end = fourccs_out + nfourccs_out;
-	size_t i;
-
-	/*
-	 * The device's native formats go first.
-	 */
-
-	for (i = 0; i < native_nfourccs; ++i) {
-		/*
-		 * Several DTs, boot loaders and firmware report native
-		 * alpha formats that are non-alpha formats instead. So
-		 * replace alpha formats by non-alpha formats.
-		 */
-		u32 fourcc = drm_fb_nonalpha_fourcc(native_fourccs[i]);
-
-		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
-			continue; /* skip duplicate entries */
-		} else if (fourccs == fourccs_end) {
-			drm_warn(dev, "Ignoring native format %p4cc\n", &fourcc);
-			continue; /* end of available output buffer */
-		}
-
-		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
-
-		*fourccs = fourcc;
-		++fourccs;
-	}
-
-	/*
-	 * The extra formats, emulated by the driver, go second.
-	 */
-
-	for (i = 0; (i < extra_nfourccs) && (fourccs < fourccs_end); ++i) {
-		u32 fourcc = extra_fourccs[i];
-
-		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
-			continue; /* skip duplicate and native entries */
-		} else if (fourccs == fourccs_end) {
-			drm_warn(dev, "Ignoring emulated format %p4cc\n", &fourcc);
-			continue; /* end of available output buffer */
-		}
-
-		drm_dbg_kms(dev, "adding emulated format %p4cc\n", &fourcc);
-
-		*fourccs = fourcc;
-		++fourccs;
-	}
-
-	return fourccs - fourccs_out;
-}
-EXPORT_SYMBOL(drm_fb_build_fourcc_list);
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index cb08a88242cc..1424b63dde99 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -93,6 +93,10 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
  * Plane
  */
 
+size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
+				   const u32 *native_fourccs, size_t native_nfourccs,
+				   u32 *fourccs_out, size_t nfourccs_out);
+
 int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 					struct drm_atomic_state *new_state);
 void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index ffaa2522ab96..1bcdb5ee8f09 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -47,6 +47,144 @@ EXPORT_SYMBOL(drm_sysfb_mode);
  * Plane
  */
 
+static u32 to_nonalpha_fourcc(u32 fourcc)
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
+static bool is_listed_fourcc(const u32 *fourccs, size_t nfourccs, u32 fourcc)
+{
+	const u32 *fourccs_end = fourccs + nfourccs;
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
+ * drm_sysfb_build_fourcc_list - Filters a list of supported color formats against
+ *                               the device's native formats
+ * @dev: DRM device
+ * @native_fourccs: 4CC codes of natively supported color formats
+ * @native_nfourccs: The number of entries in @native_fourccs
+ * @fourccs_out: Returns 4CC codes of supported color formats
+ * @nfourccs_out: The number of available entries in @fourccs_out
+ *
+ * This function create a list of supported color format from natively
+ * supported formats and additional emulated formats.
+ * At a minimum, most userspace programs expect at least support for
+ * XRGB8888 on the primary plane. Sysfb devices that have to emulate
+ * the format should use drm_sysfb_build_fourcc_list() to create a list
+ * of supported color formats. The returned list can be handed over to
+ * drm_universal_plane_init() et al. Native formats will go before
+ * emulated formats. Native formats with alpha channel will be replaced
+ * by equal formats without alpha channel, as primary planes usually
+ * don't support alpha. Other heuristics might be applied to optimize
+ * the sorting order. Formats near the beginning of the list are usually
+ * preferred over formats near the end of the list.
+ *
+ * Returns:
+ * The number of color-formats 4CC codes returned in @fourccs_out.
+ */
+size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
+				   const u32 *native_fourccs, size_t native_nfourccs,
+				   u32 *fourccs_out, size_t nfourccs_out)
+{
+	/*
+	 * XRGB8888 is the default fallback format for most of userspace
+	 * and it's currently the only format that should be emulated for
+	 * the primary plane. Only if there's ever another default fallback,
+	 * it should be added here.
+	 */
+	static const u32 extra_fourccs[] = {
+		DRM_FORMAT_XRGB8888,
+	};
+	static const size_t extra_nfourccs = ARRAY_SIZE(extra_fourccs);
+
+	u32 *fourccs = fourccs_out;
+	const u32 *fourccs_end = fourccs_out + nfourccs_out;
+	size_t i;
+
+	/*
+	 * The device's native formats go first.
+	 */
+
+	for (i = 0; i < native_nfourccs; ++i) {
+		/*
+		 * Several DTs, boot loaders and firmware report native
+		 * alpha formats that are non-alpha formats instead. So
+		 * replace alpha formats by non-alpha formats.
+		 */
+		u32 fourcc = to_nonalpha_fourcc(native_fourccs[i]);
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
+		*fourccs = fourcc;
+		++fourccs;
+	}
+
+	/*
+	 * The extra formats, emulated by the driver, go second.
+	 */
+
+	for (i = 0; (i < extra_nfourccs) && (fourccs < fourccs_end); ++i) {
+		u32 fourcc = extra_fourccs[i];
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
+	return fourccs - fourccs_out;
+}
+EXPORT_SYMBOL(drm_sysfb_build_fourcc_list);
+
 int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 					struct drm_atomic_state *new_state)
 {
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 46912924636a..9562f9dc7835 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -271,8 +271,8 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 
 	/* Primary plane */
 
-	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
-					    efi->formats, ARRAY_SIZE(efi->formats));
+	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
+					       efi->formats, ARRAY_SIZE(efi->formats));
 
 	primary_plane = &efi->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0, &efidrm_primary_plane_funcs,
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index c9415f0cb3ed..8d8ab39c5f36 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -15,7 +15,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fbdev_shmem.h>
-#include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -1015,8 +1014,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 
 	/* Primary plane */
 
-	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
-					    odev->formats, ARRAY_SIZE(odev->formats));
+	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
+					       odev->formats, ARRAY_SIZE(odev->formats));
 
 	primary_plane = &odev->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0, &ofdrm_primary_plane_funcs,
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330de..8530a3ef8a7a 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -18,7 +18,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
-#include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -765,8 +764,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 	/* Primary plane */
 
-	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
-					    sdev->formats, ARRAY_SIZE(sdev->formats));
+	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
+					       sdev->formats, ARRAY_SIZE(sdev->formats));
 
 	primary_plane = &sdev->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 7945544ba73e..86e0b88dd51b 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -402,8 +402,8 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 
 	/* Primary plane */
 
-	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
-					    vesa->formats, ARRAY_SIZE(vesa->formats));
+	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
+					       vesa->formats, ARRAY_SIZE(vesa->formats));
 
 	primary_plane = &vesa->primary_plane;
 	ret = drm_universal_plane_init(dev, primary_plane, 0, &vesadrm_primary_plane_funcs,
diff --git a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
index 5104fb21c6bc..e875d876118f 100644
--- a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
@@ -2,13 +2,14 @@
 
 #include <kunit/test.h>
 
-#include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_kunit_helpers.h>
 
+#include "../sysfb/drm_sysfb_helper.h"
+
 #define TEST_BUF_SIZE 50
 
-struct fb_build_fourcc_list_case {
+struct sysfb_build_fourcc_list_case {
 	const char *name;
 	u32 native_fourccs[TEST_BUF_SIZE];
 	size_t native_fourccs_size;
@@ -16,7 +17,7 @@ struct fb_build_fourcc_list_case {
 	size_t expected_fourccs_size;
 };
 
-static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
+static struct sysfb_build_fourcc_list_case sysfb_build_fourcc_list_cases[] = {
 	{
 		.name = "no native formats",
 		.native_fourccs = { },
@@ -120,16 +121,17 @@ static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
 	},
 };
 
-static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
+static void sysfb_build_fourcc_list_case_desc(struct sysfb_build_fourcc_list_case *t, char *desc)
 {
 	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
-KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
+KUNIT_ARRAY_PARAM(sysfb_build_fourcc_list, sysfb_build_fourcc_list_cases,
+		  sysfb_build_fourcc_list_case_desc);
 
-static void drm_test_fb_build_fourcc_list(struct kunit *test)
+static void drm_test_sysfb_build_fourcc_list(struct kunit *test)
 {
-	const struct fb_build_fourcc_list_case *params = test->param_value;
+	const struct sysfb_build_fourcc_list_case *params = test->param_value;
 	u32 fourccs_out[TEST_BUF_SIZE] = {0};
 	size_t nfourccs_out;
 	struct drm_device *drm;
@@ -141,16 +143,16 @@ static void drm_test_fb_build_fourcc_list(struct kunit *test)
 	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
 
-	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
-						params->native_fourccs_size,
-						fourccs_out, TEST_BUF_SIZE);
+	nfourccs_out = drm_sysfb_build_fourcc_list(drm, params->native_fourccs,
+						   params->native_fourccs_size,
+						   fourccs_out, TEST_BUF_SIZE);
 
 	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
 	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
 }
 
 static struct kunit_case drm_sysfb_modeset_test_cases[] = {
-	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
+	KUNIT_CASE_PARAM(drm_test_sysfb_build_fourcc_list, sysfb_build_fourcc_list_gen_params),
 	{}
 };
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 49a2e09155d1..0d3ee2a1313f 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -134,8 +134,4 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
 			     const struct drm_rect *clip, struct drm_format_conv_state *state);
 
-size_t drm_fb_build_fourcc_list(struct drm_device *dev,
-				const u32 *native_fourccs, size_t native_nfourccs,
-				u32 *fourccs_out, size_t nfourccs_out);
-
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.49.0

