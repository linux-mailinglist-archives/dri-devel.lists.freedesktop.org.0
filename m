Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E6B0AFCC
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 14:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D786210E268;
	Sat, 19 Jul 2025 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E9C10E25E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 12:20:40 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 3BC511C233A;
 Sat, 19 Jul 2025 14:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdf7:4000:ceae:3606:9020:cd4f])
 by srv01.abscue.de (Postfix) with ESMTPSA id 9C7581C07FA;
 Sat, 19 Jul 2025 14:11:32 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 19 Jul 2025 14:09:44 +0200
Subject: [PATCH 08/12] drm: sprd: add gate clock support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-ums9230-drm-v1-8-e4344a05eb3d@abscue.de>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
In-Reply-To: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

Enable the DPU and DSI gate clocks specified in the device tree.
Disable the DSI clock when it is not needed.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c |  7 +++++++
 drivers/gpu/drm/sprd/sprd_dpu.h |  1 +
 drivers/gpu/drm/sprd/sprd_dsi.c | 10 ++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h |  4 +++-
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 0d9eb778794d92418b39f8535d94abde3566de43..575bcdb0e0bb30055ac5c3d0e65178cc9f6611f3 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2020 Unisoc Inc.
  */
 
+#include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/dma-buf.h>
@@ -794,6 +795,12 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 	if (ctx->irq < 0)
 		return ctx->irq;
 
+	ctx->clk = devm_clk_get_optional_enabled(dev, "enable");
+	if (IS_ERR(ctx->clk)) {
+		dev_err(dev, "failed to get dpu enable clock\n");
+		return PTR_ERR(ctx->clk);
+	}
+
 	/* disable and clear interrupts before register dpu IRQ. */
 	writel(0x00, ctx->base + REG_DPU_INT_EN);
 	writel(0xff, ctx->base + REG_DPU_INT_CLR);
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sprd_dpu.h
index 157a78f24dc18b071602552ea9d005af66525263..d48b922de580a8a4bf07c4610c431d3321f7b810 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.h
+++ b/drivers/gpu/drm/sprd/sprd_dpu.h
@@ -44,6 +44,7 @@ enum {
  */
 struct dpu_context {
 	void __iomem *base;
+	struct clk *clk;
 	int irq;
 	u8 if_type;
 	struct videomode vm;
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index e01d1d28fe579644ec2e0c83ec9170269932adfe..e781e6c84860402f37352e768244d88ca6ffd4c9 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -828,6 +828,8 @@ static void sprd_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
 	struct dsi_context *ctx = &dsi->ctx;
 
+	clk_prepare_enable(ctx->clk);
+
 	if (ctx->enabled) {
 		drm_warn(dsi->drm, "dsi is initialized\n");
 		return;
@@ -875,6 +877,8 @@ static void sprd_dsi_bridge_post_disable(struct drm_bridge *bridge)
 	sprd_dphy_fini(ctx);
 	sprd_dsi_fini(ctx);
 
+	clk_disable_unprepare(ctx->clk);
+
 	ctx->enabled = false;
 }
 
@@ -1098,6 +1102,12 @@ static int sprd_dsi_probe(struct platform_device *pdev)
 	if (!dsi->ctx.pll.platform)
 		return -EINVAL;
 
+	dsi->ctx.clk = devm_clk_get_optional(dev, "enable");
+	if (IS_ERR(dsi->ctx.clk)) {
+		dev_err(dev, "failed to get dsi enable clock\n");
+		return PTR_ERR(dsi->ctx.clk);
+	}
+
 	return mipi_dsi_host_register(&dsi->host);
 }
 
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/sprd_dsi.h
index 0b9f1cabe71570743cbc68a8061e95a249f27191..15e57f3f49f8e5c4f856fb496a0c88f1b0414ced 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.h
+++ b/drivers/gpu/drm/sprd/sprd_dsi.h
@@ -6,8 +6,9 @@
 #ifndef __SPRD_DSI_H__
 #define __SPRD_DSI_H__
 
-#include <linux/of.h>
+#include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <video/videomode.h>
 
@@ -95,6 +96,7 @@ struct dphy_pll {
 struct dsi_context {
 	void __iomem *base;
 	struct regmap *regmap;
+	struct clk *clk;
 	struct dphy_pll pll;
 	struct videomode vm;
 	bool enabled;

-- 
2.50.0
