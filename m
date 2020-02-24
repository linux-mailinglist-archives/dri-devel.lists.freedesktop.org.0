Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD416BC38
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC56EA1C;
	Tue, 25 Feb 2020 08:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs39.siol.net [185.57.226.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718C26E820
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 17:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id B5E49523735;
 Mon, 24 Feb 2020 18:39:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id VgrH-4XPApOv; Mon, 24 Feb 2020 18:39:16 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 52FC25236BB;
 Mon, 24 Feb 2020 18:39:16 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 0463C5236EE;
 Mon, 24 Feb 2020 18:39:14 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 3/7] drm/sun4i: Fix DE2 VI layer format support
Date: Mon, 24 Feb 2020 18:38:57 +0100
Message-Id: <20200224173901.174016-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224173901.174016-1-jernej.skrabec@siol.net>
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DE2 VI layer doesn't support blending which means alpha channel is
ignored. Replace all formats with alpha with "don't care" (X) channel.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 56 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 22 +++++-----
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 655445bfe64a..4a64f7ae437a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -106,48 +106,104 @@ static const struct de2_fmt_info de2_formats[] = {
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_XRGB4444,
+		.de2_fmt = SUN8I_MIXER_FBFMT_ARGB4444,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_ABGR4444,
 		.de2_fmt = SUN8I_MIXER_FBFMT_ABGR4444,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_XBGR4444,
+		.de2_fmt = SUN8I_MIXER_FBFMT_ABGR4444,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_RGBA4444,
 		.de2_fmt = SUN8I_MIXER_FBFMT_RGBA4444,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_RGBX4444,
+		.de2_fmt = SUN8I_MIXER_FBFMT_RGBA4444,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_BGRA4444,
 		.de2_fmt = SUN8I_MIXER_FBFMT_BGRA4444,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_BGRX4444,
+		.de2_fmt = SUN8I_MIXER_FBFMT_BGRA4444,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_ARGB1555,
 		.de2_fmt = SUN8I_MIXER_FBFMT_ARGB1555,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_XRGB1555,
+		.de2_fmt = SUN8I_MIXER_FBFMT_ARGB1555,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_ABGR1555,
 		.de2_fmt = SUN8I_MIXER_FBFMT_ABGR1555,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_XBGR1555,
+		.de2_fmt = SUN8I_MIXER_FBFMT_ABGR1555,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_RGBA5551,
 		.de2_fmt = SUN8I_MIXER_FBFMT_RGBA5551,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_RGBX5551,
+		.de2_fmt = SUN8I_MIXER_FBFMT_RGBA5551,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_BGRA5551,
 		.de2_fmt = SUN8I_MIXER_FBFMT_BGRA5551,
 		.rgb = true,
 		.csc = SUN8I_CSC_MODE_OFF,
 	},
+	{
+		/* for DE2 VI layer which ignores alpha */
+		.drm_fmt = DRM_FORMAT_BGRX5551,
+		.de2_fmt = SUN8I_MIXER_FBFMT_BGRA5551,
+		.rgb = true,
+		.csc = SUN8I_CSC_MODE_OFF,
+	},
 	{
 		.drm_fmt = DRM_FORMAT_ARGB2101010,
 		.de2_fmt = SUN8I_MIXER_FBFMT_ARGB2101010,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6c0084a3c3d7..b8398ca18b0f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -398,26 +398,26 @@ static const struct drm_plane_funcs sun8i_vi_layer_funcs = {
 };
 
 /*
- * While all RGB formats are supported, VI planes don't support
- * alpha blending, so there is no point having formats with alpha
- * channel if their opaque analog exist.
+ * While DE2 VI layer supports same RGB formats as UI layer, alpha
+ * channel is ignored. This structure lists all unique variants
+ * where alpha channel is replaced with "don't care" (X) channel.
  */
 static const u32 sun8i_vi_layer_formats[] = {
-	DRM_FORMAT_ABGR1555,
-	DRM_FORMAT_ABGR4444,
-	DRM_FORMAT_ARGB1555,
-	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_BGRA5551,
-	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRX4444,
+	DRM_FORMAT_BGRX5551,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_RGB888,
-	DRM_FORMAT_RGBA4444,
-	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBX4444,
+	DRM_FORMAT_RGBX5551,
 	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_XBGR4444,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XRGB4444,
 	DRM_FORMAT_XRGB8888,
 
 	DRM_FORMAT_NV16,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
