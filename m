Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E09129284
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 08:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262DB6E192;
	Mon, 23 Dec 2019 07:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442DE6E192
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 07:49:56 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 09E131546A1702F4E987;
 Mon, 23 Dec 2019 15:49:53 +0800 (CST)
Received: from localhost (10.45.239.209) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Dec 2019
 15:49:45 +0800
From: Zhihui Chen <chenzhihui4@huawei.com>
To: <xinliang.liu@linaro.org>, <zourongrong@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/hisilicon/hibmc: add gamma_set function
Date: Mon, 23 Dec 2019 15:49:10 +0800
Message-ID: <20191223074910.1030-1-chenzhihui4@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
X-Originating-IP: [10.45.239.209]
X-CFilter-Loop: Reflected
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
Cc: puck.chen@hisilicon.com, kong.kongxinwei@hisilicon.com, baowenyi@huawei.com,
 Zhihui Chen <chenzhihui4@huawei.com>, allan.wang@siliconmotion.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add gamma_set function, and we can also use it to adjust the brightness of the
display.

Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 37 +++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h  |  5 +++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 24de937c1cb1..f1ce6cb099d0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -456,6 +456,42 @@ static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
 }
 
+static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
+{
+	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	void __iomem   *mmio = priv->mmio;
+	u16 *r, *g, *b;
+	unsigned int reg;
+	int i;
+
+	r = crtc->gamma_store;
+	g = r + crtc->gamma_size;
+	b = g + crtc->gamma_size;
+
+	for (i = 0; i < crtc->gamma_size; i++) {
+		unsigned int offset = i << 2;
+		u8 red = *r++ >> 8;
+		u8 green = *g++ >> 8;
+		u8 blue = *b++ >> 8;
+		u32 rgb = (red << 16) | (green << 8) | blue;
+
+		writel(rgb, mmio + HIBMC_CRT_PALETTE + offset);
+	}
+
+	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
+	reg |= HIBMC_FIELD(HIBMC_CTL_DISP_CTL_GAMMA, 1);
+	writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
+}
+
+static int hibmc_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
+			      u16 *blue, uint32_t size,
+			      struct drm_modeset_acquire_ctx *ctx)
+{
+	hibmc_crtc_load_lut(crtc);
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs hibmc_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.set_config = drm_atomic_helper_set_config,
@@ -465,6 +501,7 @@ static const struct drm_crtc_funcs hibmc_crtc_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank = hibmc_crtc_enable_vblank,
 	.disable_vblank = hibmc_crtc_disable_vblank,
+	.gamma_set = hibmc_crtc_gamma_set,
 };
 
 static const struct drm_crtc_helper_funcs hibmc_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
index b9e20cfcfb5a..9b7e85947113 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
@@ -91,6 +91,9 @@
 #define HIBMC_CRT_DISP_CTL_TIMING(x)		((x) << 8)
 #define HIBMC_CRT_DISP_CTL_TIMING_MASK		0x100
 
+#define HIBMC_CTL_DISP_CTL_GAMMA(x)		((x) << 3)
+#define HIBMC_CTL_DISP_CTL_GAMMA_MASK		0x08
+
 #define HIBMC_CRT_DISP_CTL_PLANE(x)		((x) << 2)
 #define HIBMC_CRT_DISP_CTL_PLANE_MASK		4
 
@@ -193,5 +196,7 @@
 #define CRT_PLL2_HS_148MHZ			0xB0CCCCCD
 #define CRT_PLL2_HS_193MHZ			0xC0872B02
 
+#define HIBMC_CRT_PALETTE                       0x80C00
+
 #define HIBMC_FIELD(field, value) (field(value) & field##_MASK)
 #endif
-- 
2.20.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
