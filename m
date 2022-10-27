Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164D60F9D6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592B410E63E;
	Thu, 27 Oct 2022 13:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E4D10E63E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 13:57:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E68B73FA55;
 Thu, 27 Oct 2022 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1666879039; bh=TK1fFuny4zxoXEgTLy+wI9CY1SFw6RXNtfSesjtadqU=;
 h=From:To:Cc:Subject:Date;
 b=ww+vPmOG62oLzBS2yPE6x7AS+yIRPHjk0TnpYPW4KrokdwFEj7KGJscZ/ESUTyIFy
 Hg9iiaM81RBNss92uThzw8E9qu8yGyUS8XRbXC48DgoNVbL5SzVWsVbvQvtOWEgm6j
 ft4XbZ1CfRYZaGMMcivgt6PrBvuwa8zLokgocfrLDNiEjbOQxDR25gwgpsWGyNPdak
 jAscKJKbFZvho9pAacCczfcfSeyI9FxmfoCM87qZLJ4w+iEHAC8wXh1ZA5qgVuRuO/
 PaNKwmIhh9lQ44Uwe0GjNltGn+mQ68tq0FAeCccmqQEBqiTqYnSao5qxk0asvHjr1S
 GlrEJiwreHJWQ==
From: Hector Martin <marcan@marcan.st>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2] drm/format-helper: Only advertise supported formats for
 conversion
Date: Thu, 27 Oct 2022 22:57:11 +0900
Message-Id: <20221027135711.24425-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_fb_build_fourcc_list() currently returns all emulated formats
unconditionally as long as the native format is among them, even though
not all combinations have conversion helpers. Although the list is
arguably provided to userspace in precedence order, userspace can pick
something out-of-order (and thus break when it shouldn't), or simply
only support a format that is unsupported (and thus think it can work,
which results in the appearance of a hang as FB blits fail later on,
instead of the initialization error you'd expect in this case).

Add checks to filter the list of emulated formats to only those
supported for conversion to the native format. This presumes that there
is a single native format (only the first is checked, if there are
multiple). Refactoring this API to drop the native list or support it
properly (by returning the appropriate emulated->native mapping table)
is left for a future patch.

The simpledrm driver is left as-is with a full table of emulated
formats. This keeps all currently working conversions available and
drops all the broken ones (i.e. this a strict bugfix patch, adding no
new supported formats nor removing any actually working ones). In order
to avoid proliferation of emulated formats, future drivers should
advertise only XRGB8888 as the sole emulated format (since some
userspace assumes its presence).

This fixes a real user regression where the ?RGB2101010 support commit
started advertising it unconditionally where not supported, and KWin
decided to start to use it over the native format and broke, but also
the fixes the spurious RGB565/RGB888 formats which have been wrongly
unconditionally advertised since the dawn of simpledrm.

Fixes: 6ea966fca084 ("drm/simpledrm: Add [AX]RGB2101010 formats")
Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hector Martin <marcan@marcan.st>
---
I'm proposing this alternative approach after a heated discussion on
IRC. I'm out of ideas, if y'all don't like this one you can figure it
out for yourseves :-)

Changes since v1:
This v2 moves all the changes to the helper (so they will apply to
the upcoming ofdrm, though ofdrm also needs to be fixed to trim its
format table to only formats that should be emulated, probably only
XRGB8888, to avoid further proliferating the use of conversions),
and avoids touching more than one file. The API still needs cleanup
as mentioned (supporting more than one native format is fundamentally
broken, since the helper would need to tell the driver *what* native
format to use for *each* emulated format somehow), but all current and
planned users only pass in one native format, so this can (and should)
be fixed later.

Aside: After other IRC discussion, I'm testing nuking the
XRGB2101010 <-> ARGB2101010 advertisement (which does not involve
conversion) by removing those entries from simpledrm in the Asahi Linux
downstream tree. As far as I'm concerned, it can be removed if nobody
complains (by removing those entries from the simpledrm array), if
maintainers are generally okay with removing advertised formats at all.
If so, there might be other opportunities for further trimming the list
non-native formats advertised to userspace.

Tested with KWin-X11, KWin-Wayland, GNOME-X11, GNOME-Wayland, and Weston
on both XRGB2101010 and RGB8888 simpledrm framebuffers.

 drivers/gpu/drm/drm_format_helper.c | 66 ++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index e2f76621453c..3ee59bae9d2f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -807,6 +807,38 @@ static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t
 	return false;
 }
 
+static const uint32_t conv_from_xrgb8888[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+};
+
+static const uint32_t conv_from_rgb565_888[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static bool is_conversion_supported(uint32_t from, uint32_t to)
+{
+	switch (from) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+		return is_listed_fourcc(conv_from_xrgb8888, ARRAY_SIZE(conv_from_xrgb8888), to);
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB888:
+		return is_listed_fourcc(conv_from_rgb565_888, ARRAY_SIZE(conv_from_rgb565_888), to);
+	case DRM_FORMAT_XRGB2101010:
+		return to == DRM_FORMAT_ARGB2101010;
+	case DRM_FORMAT_ARGB2101010:
+		return to == DRM_FORMAT_XRGB2101010;
+	default:
+		return false;
+	}
+}
+
 /**
  * drm_fb_build_fourcc_list - Filters a list of supported color formats against
  *                            the device's native formats
@@ -827,7 +859,9 @@ static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t
  * be handed over to drm_universal_plane_init() et al. Native formats
  * will go before emulated formats. Other heuristics might be applied
  * to optimize the order. Formats near the beginning of the list are
- * usually preferred over formats near the end of the list.
+ * usually preferred over formats near the end of the list. Formats
+ * without conversion helpers will be skipped. New drivers should only
+ * pass in XRGB8888 and avoid exposing additional emulated formats.
  *
  * Returns:
  * The number of color-formats 4CC codes returned in @fourccs_out.
@@ -839,7 +873,7 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 {
 	u32 *fourccs = fourccs_out;
 	const u32 *fourccs_end = fourccs_out + nfourccs_out;
-	bool found_native = false;
+	uint32_t native_format = 0;
 	size_t i;
 
 	/*
@@ -858,26 +892,18 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 
 		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
 
-		if (!found_native)
-			found_native = is_listed_fourcc(driver_fourccs, driver_nfourccs, fourcc);
+		/*
+		 * There should only be one native format with the current API.
+		 * This API needs to be refactored to correctly support arbitrary
+		 * sets of native formats, since it needs to report which native
+		 * format to use for each emulated format.
+		 */
+		if (!native_format)
+			native_format = fourcc;
 		*fourccs = fourcc;
 		++fourccs;
 	}
 
-	/*
-	 * The plane's atomic_update helper converts the framebuffer's color format
-	 * to a native format when copying to device memory.
-	 *
-	 * If there is not a single format supported by both, device and
-	 * driver, the native formats are likely not supported by the conversion
-	 * helpers. Therefore *only* support the native formats and add a
-	 * conversion helper ASAP.
-	 */
-	if (!found_native) {
-		drm_warn(dev, "Format conversion helpers required to add extra formats.\n");
-		goto out;
-	}
-
 	/*
 	 * The extra formats, emulated by the driver, go second.
 	 */
@@ -890,6 +916,9 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 		} else if (fourccs == fourccs_end) {
 			drm_warn(dev, "Ignoring emulated format %p4cc\n", &fourcc);
 			continue; /* end of available output buffer */
+		} else if (!is_conversion_supported(fourcc, native_format)) {
+			drm_dbg_kms(dev, "Unsupported emulated format %p4cc\n", &fourcc);
+			continue; /* format is not supported for conversion */
 		}
 
 		drm_dbg_kms(dev, "adding emulated format %p4cc\n", &fourcc);
@@ -898,7 +927,6 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 		++fourccs;
 	}
 
-out:
 	return fourccs - fourccs_out;
 }
 EXPORT_SYMBOL(drm_fb_build_fourcc_list);
-- 
2.35.1

