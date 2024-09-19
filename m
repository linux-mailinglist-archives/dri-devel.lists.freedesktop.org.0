Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B156C97D19E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE10B10E7BF;
	Fri, 20 Sep 2024 07:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Ysj/aRL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D6410E040
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:24:47 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CF3BA23DFD;
 Thu, 19 Sep 2024 17:11:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1VxGGLcqtJu; Thu, 19 Sep 2024 17:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1726758708; bh=8o85bus/0rE9Cesf9JRpcxZtGUE4BpUrbgAzVXQTVc8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Ysj/aRL1u62Gn0awDl+2XPfKVS13f8EXYghIEeMliIlwn5jzVVvdCuysWvDE+uQCQ
 67/TQICD+TqkPLwscbpSQg1zSyi1QUq0Zzk3JnCnQfLQLz983c9WTdI7Y0XepMi8mq
 hoPzjWXqpQTFTUgf8sERtWD5OZs8tzk/cGvA//Wj1w+f8DO2dUDjs/1sKxWQFKgPu/
 U8lWt06vJ+kLzq7EEHCM3hvDPmopftnN9hR/NBPDmXSUi/S7IT49y1+GF1uVbTetJA
 UT8twdv64OwFRzTwLWyN9zw6AtywymqtajFXrv/dwauDFXgTCEu6OCb05LSH2YAPWH
 iaWxXRetkRTGA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 19 Sep 2024 20:41:03 +0530
Subject: [PATCH 4/6] drm/exynos: exynos7_drm_decon: properly clear channels
 during bind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-exynosdrm-decon-v1-4-6c5861c1cb04@disroot.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
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

The DECON channels are not cleared properly as the windows aren't
shadow protected. When accompanied with an IOMMU, it pagefaults, and
the kernel panics.

Implement shadow protect/unprotect, along with a standalone update,
for channel clearing to properly take effect.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 55 +++++++++++++++++-------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 4e4ced50ff15..7f0985eb216e 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -81,6 +81,28 @@ static const enum drm_plane_type decon_win_types[WINDOWS_NR] = {
 	DRM_PLANE_TYPE_CURSOR,
 };
 
+/**
+ * decon_shadow_protect_win() - disable updating values from shadow registers at vsync
+ *
+ * @ctx: display and enhancement controller context
+ * @win: window to protect registers for
+ * @protect: 1 to protect (disable updates)
+ */
+static void decon_shadow_protect_win(struct decon_context *ctx,
+				     unsigned int win, bool protect)
+{
+	u32 bits, val;
+
+	bits = SHADOWCON_WINx_PROTECT(win);
+
+	val = readl(ctx->regs + SHADOWCON);
+	if (protect)
+		val |= bits;
+	else
+		val &= ~bits;
+	writel(val, ctx->regs + SHADOWCON);
+}
+
 static void decon_wait_for_vblank(struct decon_context *ctx)
 {
 	if (ctx->suspended)
@@ -101,18 +123,27 @@ static void decon_wait_for_vblank(struct decon_context *ctx)
 static void decon_clear_channels(struct decon_context *ctx)
 {
 	unsigned int win, ch_enabled = 0;
+	u32 val;
 
 	/* Check if any channel is enabled. */
 	for (win = 0; win < WINDOWS_NR; win++) {
-		u32 val = readl(ctx->regs + WINCON(win));
+		val = readl(ctx->regs + WINCON(win));
 
 		if (val & WINCONx_ENWIN) {
+			decon_shadow_protect_win(ctx, win, true);
+
 			val &= ~WINCONx_ENWIN;
 			writel(val, ctx->regs + WINCON(win));
 			ch_enabled = 1;
+
+			decon_shadow_protect_win(ctx, win, false);
 		}
 	}
 
+	val = readl(ctx->regs + DECON_UPDATE);
+	val |= DECON_UPDATE_STANDALONE_F;
+	writel(val, ctx->regs + DECON_UPDATE);
+
 	/* Wait for vsync, as disable channel takes effect at next vsync */
 	if (ch_enabled)
 		decon_wait_for_vblank(ctx);
@@ -340,28 +371,6 @@ static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
 	writel(keycon1, ctx->regs + WKEYCON1_BASE(win));
 }
 
-/**
- * decon_shadow_protect_win() - disable updating values from shadow registers at vsync
- *
- * @ctx: display and enhancement controller context
- * @win: window to protect registers for
- * @protect: 1 to protect (disable updates)
- */
-static void decon_shadow_protect_win(struct decon_context *ctx,
-				     unsigned int win, bool protect)
-{
-	u32 bits, val;
-
-	bits = SHADOWCON_WINx_PROTECT(win);
-
-	val = readl(ctx->regs + SHADOWCON);
-	if (protect)
-		val |= bits;
-	else
-		val &= ~bits;
-	writel(val, ctx->regs + SHADOWCON);
-}
-
 static void decon_atomic_begin(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;

-- 
2.46.1

