Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B974B73E5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD4410E542;
	Tue, 15 Feb 2022 16:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98BE10E577
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:52:33 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7534:e0be:5adf:2691])
 by laurent.telenet-ops.be with bizsmtp
 id vUsV2600D18GbK101UsV5U; Tue, 15 Feb 2022 17:52:31 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nK140-000tUk-NI; Tue, 15 Feb 2022 17:52:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nK13z-00BURR-Uu; Tue, 15 Feb 2022 17:52:27 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH 1/8] drm/fourcc: Add DRM_FORMAT_C[124]
Date: Tue, 15 Feb 2022 17:52:19 +0100
Message-Id: <20220215165226.2738568-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215165226.2738568-1-geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce fourcc codes for color-indexed frame buffer formats with two,
four, and sixteen color, and provide a suitable mapping from bit per
pixel and depth to fourcc codes.

As the number of bits per pixel is less than eight, these rely on proper
block handling for the calculation of bits per pixel and pitch.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Do we want to keep the rounding down if depth < bpp, or insist on depth
== bpp? I don't think the rounding down will still be needed after
"[PATCH 4/8] drm/client: Use actual bpp when allocating frame buffers".
---
 drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
 include/uapi/drm/drm_fourcc.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 07741b678798b0f1..60ce63d728b8e308 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -46,6 +46,18 @@ uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth)
 	case 8:
 		if (depth == 8)
 			fmt = DRM_FORMAT_C8;
+		fallthrough;
+	case 4:
+		if (depth == 4)
+			fmt = DRM_FORMAT_C4;
+		fallthrough;
+	case 2:
+		if (depth == 2)
+			fmt = DRM_FORMAT_C2;
+		fallthrough;
+	case 1:
+		if (depth == 1)
+			fmt = DRM_FORMAT_C1;
 		break;
 
 	case 16:
@@ -132,6 +144,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
 const struct drm_format_info *__drm_format_info(u32 format)
 {
 	static const struct drm_format_info formats[] = {
+		{ .format = DRM_FORMAT_C1,		.depth = 1,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_C2,		.depth = 2,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 4, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_C4,		.depth = 4,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index fc0c1454d2757d5d..3f09174670b3cce6 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -99,6 +99,9 @@ extern "C" {
 #define DRM_FORMAT_INVALID	0
 
 /* color index */
+#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [0] C */
+#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [1:0] C */
+#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [3:0] C */
 #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
 
 /* 8 bpp Red */
-- 
2.25.1

