Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF727A847
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550466E406;
	Mon, 28 Sep 2020 07:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D766E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601139913; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USgjbNdGyw5p9Xc+uNjChURWrYWAIwKYSffHpj4OmAw=;
 b=U0HCvjIfVRkEpgHzJFgp1j0mKfxhylIhRwnVbVvTfl60uXHi/SN7LG5UxiF4IYv8uDzLYX
 UT9pwpXsXM29w0IUqEzzyvEPnhB/p3DAP4d8WT8BOpqSYOwLD09FS1Aw6ZalZ1jBzrDlEQ
 19IHWIiebH3HVvx90FMifKrf7egyg58=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/7] drm/ingenic: Support handling different pixel formats
 in F0/F1 planes
Date: Sat, 26 Sep 2020 19:04:58 +0200
Message-Id: <20200926170501.1109197-5-paul@crapouillou.net>
In-Reply-To: <20200926170501.1109197-1-paul@crapouillou.net>
References: <20200926170501.1109197-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now the ingenic-drm driver supported the same pixel formats on the
F0 and F1 planes, and across all SoCs. However, the F0 plane does support
paletted 8bpp, while the F1 plane doesn't.

Furthermore, the three SoCs currently supported all have different pixel
formats available; 24bpp was added in JZ4725B, 30bpp was added in
JZ4770.

Prepare the inclusion of paletted 8bpp, 24bpp and 30bpp support by
having separate pixel format lists for F0 and F1 planes.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 57 +++++++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e8d47549ff2e..567facfb7217 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -56,6 +56,8 @@ struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
 	unsigned int max_width, max_height;
+	const u32 *formats_f0, *formats_f1;
+	unsigned int num_formats_f0, num_formats_f1;
 };
 
 struct ingenic_drm {
@@ -95,12 +97,6 @@ struct ingenic_drm {
 	struct notifier_block clock_nb;
 };
 
-static const u32 ingenic_drm_primary_formats[] = {
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_XRGB8888,
-};
-
 static bool ingenic_drm_cached_gem_buf;
 module_param_named(cached_gem_buffers, ingenic_drm_cached_gem_buf, bool, 0400);
 MODULE_PARM_DESC(cached_gem_buffers,
@@ -963,8 +959,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	ret = drm_universal_plane_init(drm, &priv->f1, 1,
 				       &ingenic_drm_primary_plane_funcs,
-				       ingenic_drm_primary_formats,
-				       ARRAY_SIZE(ingenic_drm_primary_formats),
+				       priv->soc_info->formats_f1,
+				       priv->soc_info->num_formats_f1,
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to register plane: %i\n", ret);
@@ -988,8 +984,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 		ret = drm_universal_plane_init(drm, &priv->f0, 1,
 					       &ingenic_drm_primary_plane_funcs,
-					       ingenic_drm_primary_formats,
-					       ARRAY_SIZE(ingenic_drm_primary_formats),
+					       priv->soc_info->formats_f0,
+					       priv->soc_info->num_formats_f0,
 					       NULL, DRM_PLANE_TYPE_OVERLAY,
 					       NULL);
 		if (ret) {
@@ -1204,11 +1200,44 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const u32 jz4740_formats[] = {
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const u32 jz4725b_formats_f1[] = {
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const u32 jz4725b_formats_f0[] = {
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const u32 jz4770_formats_f1[] = {
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+};
+
+static const u32 jz4770_formats_f0[] = {
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = false,
 	.max_width = 800,
 	.max_height = 600,
+	.formats_f1 = jz4740_formats,
+	.num_formats_f1 = ARRAY_SIZE(jz4740_formats),
+	/* JZ4740 has only one plane */
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
@@ -1216,6 +1245,10 @@ static const struct jz_soc_info jz4725b_soc_info = {
 	.has_osd = true,
 	.max_width = 800,
 	.max_height = 600,
+	.formats_f1 = jz4725b_formats_f1,
+	.num_formats_f1 = ARRAY_SIZE(jz4725b_formats_f1),
+	.formats_f0 = jz4725b_formats_f0,
+	.num_formats_f0 = ARRAY_SIZE(jz4725b_formats_f0),
 };
 
 static const struct jz_soc_info jz4770_soc_info = {
@@ -1223,6 +1256,10 @@ static const struct jz_soc_info jz4770_soc_info = {
 	.has_osd = true,
 	.max_width = 1280,
 	.max_height = 720,
+	.formats_f1 = jz4770_formats_f1,
+	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
+	.formats_f0 = jz4770_formats_f0,
+	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
 };
 
 static const struct of_device_id ingenic_drm_of_match[] = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
