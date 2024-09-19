Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AD97D19F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425610E7C2;
	Fri, 20 Sep 2024 07:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="A55hCsmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9B610E040
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:20:15 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id A959620454;
 Thu, 19 Sep 2024 17:20:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo0bG5SzFI2j; Thu, 19 Sep 2024 17:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1726759213; bh=OGLUCgDWH562twCZsYpJURmvO0GqslL15kZSjFqgcgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=A55hCsmdEO8Gznbzp2FRJwmJjccXj+GTJF6zPvzNisXBEsznw9wdjCwIQI166AcPo
 kIlEko3sMTln1yqa2b1Za3GTR5vGdGxbmnuJg2f8en3Nup9x+isUhs/IRV5pTH0Ynt
 u+2pdEmp5NHsOrDKIJlx8SYiCnhmyyby3o3E2P6gZZdtT1uhtvtzd1GKFHgsy3XmnK
 AEK+8+nzGAf8l5C+MbfkqSlMMMr1xiFqB3xB+dVL1uInlA13sT8rKg2ZzZyFnX5kfm
 +baHz/b17dQj2fwTqdKwNKPDHAL7wxLx7RLOAIEXi6XAeLjxeeTjhwnwa2RVxeIf0x
 rHvLk+VwG0r4Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: kauschluss@disroot.org
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, krzk@kernel.org, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de
Subject: [PATCH 5/6] drm/exynos: exynos7_drm_decon: add driver data and
 support for Exynos7870
Date: Thu, 19 Sep 2024 20:49:39 +0530
Message-ID: <20240919-exynosdrm-decon-v1-5-8c3e3ccffad5@disroot.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Sep 2024 07:22:50 +0000
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

Add support for Exynos 7870 DECON in the Exynos 7 DECON driver.

Some Exynos 7 series SoCs (Exynos 7580 onwards) have different
register values. In order to address such changes, include a driver
data struct (named decon_data) so that correct base addresses and
shift values can be provided.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 58 ++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/regs-decon7.h       | 15 ++++----
 2 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 7f0985eb216e..4d93d2d7959f 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -37,6 +37,24 @@
 
 #define WINDOWS_NR	2
 
+struct decon_data {
+	unsigned int vidw_buf_start_base;
+	unsigned int shadowcon_win_protect_shift;
+	unsigned int wincon_burstlen_shift;
+};
+
+static struct decon_data exynos7_decon_data = {
+	.vidw_buf_start_base = 0x80,
+	.shadowcon_win_protect_shift = 10,
+	.wincon_burstlen_shift = 11,
+};
+
+static struct decon_data exynos7870_decon_data = {
+	.vidw_buf_start_base = 0x880,
+	.shadowcon_win_protect_shift = 8,
+	.wincon_burstlen_shift = 10,
+};
+
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
@@ -55,11 +73,19 @@ struct decon_context {
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
 
+	const struct decon_data *data;
 	struct drm_encoder *encoder;
 };
 
 static const struct of_device_id decon_driver_dt_match[] = {
-	{.compatible = "samsung,exynos7-decon"},
+	{
+		.compatible = "samsung,exynos7-decon",
+		.data = &exynos7_decon_data,
+	},
+	{
+		.compatible = "samsung,exynos7870-decon",
+		.data = &exynos7870_decon_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, decon_driver_dt_match);
@@ -92,8 +118,9 @@ static void decon_shadow_protect_win(struct decon_context *ctx,
 				     unsigned int win, bool protect)
 {
 	u32 bits, val;
+	unsigned int shift = ctx->data->shadowcon_win_protect_shift;
 
-	bits = SHADOWCON_WINx_PROTECT(win);
+	bits = SHADOWCON_WINx_PROTECT(shift, win);
 
 	val = readl(ctx->regs + SHADOWCON);
 	if (protect)
@@ -291,6 +318,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 {
 	unsigned long val;
 	int padding;
+	unsigned int shift = ctx->data->wincon_burstlen_shift;
 
 	val = readl(ctx->regs + WINCON(win));
 	val &= ~WINCONx_BPPMODE_MASK;
@@ -298,44 +326,44 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		val |= WINCONx_BPPMODE_16BPP_565;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_XRGB8888:
 		val |= WINCONx_BPPMODE_24BPP_xRGB;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_XBGR8888:
 		val |= WINCONx_BPPMODE_24BPP_xBGR;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_RGBX8888:
 		val |= WINCONx_BPPMODE_24BPP_RGBx;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_BGRX8888:
 		val |= WINCONx_BPPMODE_24BPP_BGRx;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_ARGB8888:
 		val |= WINCONx_BPPMODE_32BPP_ARGB | WINCONx_BLD_PIX |
 			WINCONx_ALPHA_SEL;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_ABGR8888:
 		val |= WINCONx_BPPMODE_32BPP_ABGR | WINCONx_BLD_PIX |
 			WINCONx_ALPHA_SEL;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_RGBA8888:
 		val |= WINCONx_BPPMODE_32BPP_RGBA | WINCONx_BLD_PIX |
 			WINCONx_ALPHA_SEL;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	case DRM_FORMAT_BGRA8888:
 	default:
 		val |= WINCONx_BPPMODE_32BPP_BGRA | WINCONx_BLD_PIX |
 			WINCONx_ALPHA_SEL;
-		val |= WINCONx_BURSTLEN_16WORD;
+		val |= WINCONx_BURSTLEN_16WORD(shift);
 		break;
 	}
 
@@ -351,8 +379,8 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 
 	padding = (fb->pitches[0] / fb->format->cpp[0]) - fb->width;
 	if (fb->width + padding < MIN_FB_WIDTH_FOR_16WORD_BURST) {
-		val &= ~WINCONx_BURSTLEN_MASK;
-		val |= WINCONx_BURSTLEN_8WORD;
+		val &= ~WINCONx_BURSTLEN_MASK(shift);
+		val |= WINCONx_BURSTLEN_8WORD(shift);
 	}
 
 	writel(val, ctx->regs + WINCON(win));
@@ -397,6 +425,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int win = plane->index;
 	unsigned int cpp = fb->format->cpp[0];
 	unsigned int pitch = fb->pitches[0];
+	unsigned int vidw_addr0_base = ctx->data->vidw_buf_start_base;
 
 	if (ctx->suspended)
 		return;
@@ -413,7 +442,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	/* buffer start address */
 	val = (unsigned long)exynos_drm_fb_dma_addr(fb, 0);
-	writel(val, ctx->regs + VIDW_BUF_START(win));
+	writel(val, ctx->regs + VIDW_BUF_START(vidw_addr0_base, win));
 
 	padding = (pitch / cpp) - fb->width;
 
@@ -695,6 +724,7 @@ static int decon_probe(struct platform_device *pdev)
 
 	ctx->dev = dev;
 	ctx->suspended = true;
+	ctx->data = of_device_get_match_data(dev);
 
 	i80_if_timings = of_get_child_by_name(dev->of_node, "i80-if-timings");
 	if (i80_if_timings)
diff --git a/drivers/gpu/drm/exynos/regs-decon7.h b/drivers/gpu/drm/exynos/regs-decon7.h
index 5bc5f1db5196..216c106dac8f 100644
--- a/drivers/gpu/drm/exynos/regs-decon7.h
+++ b/drivers/gpu/drm/exynos/regs-decon7.h
@@ -48,7 +48,7 @@
 /* SHADOWCON */
 #define SHADOWCON				0x30
 
-#define SHADOWCON_WINx_PROTECT(_win)		(1 << (10 + (_win)))
+#define SHADOWCON_WINx_PROTECT(_shf, _win)	(1 << ((_shf) + (_win)))
 
 /* WINCONx */
 #define WINCON(_win)				(0x50 + ((_win) * 4))
@@ -58,10 +58,9 @@
 #define WINCONx_BUFSEL_SHIFT			28
 #define WINCONx_TRIPLE_BUF_MODE			(0x1 << 18)
 #define WINCONx_DOUBLE_BUF_MODE			(0x0 << 18)
-#define WINCONx_BURSTLEN_16WORD			(0x0 << 11)
-#define WINCONx_BURSTLEN_8WORD			(0x1 << 11)
-#define WINCONx_BURSTLEN_MASK			(0x1 << 11)
-#define WINCONx_BURSTLEN_SHIFT			11
+#define WINCONx_BURSTLEN_16WORD(_shf)		(0x0 << (_shf))
+#define WINCONx_BURSTLEN_8WORD(_shf)		(0x1 << (_shf))
+#define WINCONx_BURSTLEN_MASK(_shf)		(0x1 << (_shf))
 #define WINCONx_BLD_PLANE			(0 << 8)
 #define WINCONx_BLD_PIX				(1 << 8)
 #define WINCONx_ALPHA_MUL			(1 << 7)
@@ -89,9 +88,9 @@
 #define VIDOSD_H(_x)				(0x80 + ((_x) * 4))
 
 /* Frame buffer start addresses: VIDWxxADD0n */
-#define VIDW_BUF_START(_win)			(0x80 + ((_win) * 0x10))
-#define VIDW_BUF_START1(_win)			(0x84 + ((_win) * 0x10))
-#define VIDW_BUF_START2(_win)			(0x88 + ((_win) * 0x10))
+#define VIDW_BUF_START(_base, _win)		((_base) + ((_win) * 0x10))
+#define VIDW_BUF_START1(_base, _win)		((_base) + ((_win) * 0x10))
+#define VIDW_BUF_START2(_base, _win)		((_base) + ((_win) * 0x10))
 
 #define VIDW_WHOLE_X(_win)			(0x0130 + ((_win) * 8))
 #define VIDW_WHOLE_Y(_win)			(0x0134 + ((_win) * 8))

-- 
2.46.1
