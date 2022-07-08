Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C856BE91
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4110EBAD;
	Fri,  8 Jul 2022 18:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1DB10EAEB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:11 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siM72700P4C55Sk06iM7fl; Fri, 08 Jul 2022 20:21:09 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbD-002fGk-0M; Fri, 08 Jul 2022 20:21:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbC-00BtJb-EA; Fri, 08 Jul 2022 20:21:06 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
Date: Fri,  8 Jul 2022 20:20:50 +0200
Message-Id: <3d88ca7ad32ff3ff3469c10f0b36c312ea233a33.1657294931.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657294931.git.geert@linux-m68k.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Pekka Paalanen <pekka.paalanen@collabora.com>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce fourcc codes for color-indexed frame buffer formats with two,
four, and sixteen colors, and provide a mapping from bits per pixel and
depth to fourcc codes.

As the number of bits per pixel is less than eight, these rely on proper
block handling for the calculation of bits per pixel and pitch.

The fill order (the order in which multiple pixels are packed in a byte)
is the same order as used for indexed-color (2, 4, and 16 colors) images
in the PNG specification, Version 1.2.
This order is also the recommended and default order (FillOrder = 1) for
palette-color (16 colors) images in the TIFF 6.0 Specification, and is
also used for 16-color Linux frame buffer logos.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
v3:
  - Add Reviewed-by,
  - Document fill order,

v2:
  - Improve pixel description,
  - Require depth to match bpp in drm_mode_legacy_fb_format(),
  - Set .is_color_indexed flag.
---
 drivers/gpu/drm/drm_fourcc.c  | 21 +++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 6c76bd821d17e7c7..29f4fe199c4ddcf0 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -43,6 +43,21 @@ uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth)
 	uint32_t fmt = DRM_FORMAT_INVALID;
 
 	switch (bpp) {
+	case 1:
+		if (depth == 1)
+			fmt = DRM_FORMAT_C1;
+		break;
+
+	case 2:
+		if (depth == 2)
+			fmt = DRM_FORMAT_C2;
+		break;
+
+	case 4:
+		if (depth == 4)
+			fmt = DRM_FORMAT_C4;
+		break;
+
 	case 8:
 		if (depth == 8)
 			fmt = DRM_FORMAT_C8;
@@ -132,6 +147,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
 const struct drm_format_info *__drm_format_info(u32 format)
 {
 	static const struct drm_format_info formats[] = {
+		{ .format = DRM_FORMAT_C1,		.depth = 1,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
+		{ .format = DRM_FORMAT_C2,		.depth = 2,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 4, }, .block_h = { 1, }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
+		{ .format = DRM_FORMAT_C4,		.depth = 4,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
 		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_color_indexed = true },
 		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0980678d502dc784..e18de6f258302673 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -99,6 +99,9 @@ extern "C" {
 #define DRM_FORMAT_INVALID	0
 
 /* color index */
+#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
+#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
+#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
 #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
 
 /* 8 bpp Red */
-- 
2.25.1

