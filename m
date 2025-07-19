Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB21B0AFD6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 14:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C7610E296;
	Sat, 19 Jul 2025 12:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB0310E336
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 12:20:40 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id DD22E1C07FA;
 Sat, 19 Jul 2025 14:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdf7:4000:ceae:3606:9020:cd4f])
 by srv01.abscue.de (Postfix) with ESMTPSA id 4B0101C233B;
 Sat, 19 Jul 2025 14:11:33 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 19 Jul 2025 14:09:45 +0200
Subject: [PATCH 09/12] drm: sprd: add support for newer DPU versions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-ums9230-drm-v1-9-e4344a05eb3d@abscue.de>
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

Newer DPU revisions such as the one used in UMS9230 (version 5) do not
have internal MMU registers and also require different defaults for the
display interface configuration.

Check the DPU version register to account for these configuration
differences.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 575bcdb0e0bb30055ac5c3d0e65178cc9f6611f3..01906243a93e3306fbce5bf617838b517822a2b6 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -27,6 +27,7 @@
 #include "sprd_dsi.h"
 
 /* Global control registers */
+#define REG_DPU_VERSION	0x00
 #define REG_DPU_CTRL	0x04
 #define REG_DPU_CFG0	0x08
 #define REG_PANEL_SIZE	0x20
@@ -406,22 +407,31 @@ static void sprd_dpu_init(struct sprd_dpu *dpu)
 {
 	struct dpu_context *ctx = &dpu->ctx;
 	u32 int_mask = 0;
+	u32 dpu_version = readl(ctx->base + REG_DPU_VERSION);
 
 	writel(0x00, ctx->base + REG_BG_COLOR);
-	writel(0x00, ctx->base + REG_MMU_EN);
-	writel(0x00, ctx->base + REG_MMU_PPN1);
-	writel(0xffff, ctx->base + REG_MMU_RANGE1);
-	writel(0x00, ctx->base + REG_MMU_PPN2);
-	writel(0xffff, ctx->base + REG_MMU_RANGE2);
-	writel(0x1ffff, ctx->base + REG_MMU_VPN_RANGE);
+	if (dpu_version < 0x300) {
+		writel(0x00, ctx->base + REG_MMU_EN);
+		writel(0x00, ctx->base + REG_MMU_PPN1);
+		writel(0xffff, ctx->base + REG_MMU_RANGE1);
+		writel(0x00, ctx->base + REG_MMU_PPN2);
+		writel(0xffff, ctx->base + REG_MMU_RANGE2);
+		writel(0x1ffff, ctx->base + REG_MMU_VPN_RANGE);
+	}
 
 	if (ctx->if_type == SPRD_DPU_IF_DPI) {
 		/* use dpi as interface */
 		dpu_reg_clr(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
-		/* disable Halt function for SPRD DSI */
-		dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
-		/* select te from external pad */
-		dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
+
+		if (dpu_version < 0x300) {
+			/* disable Halt function for SPRD DSI */
+			dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
+			/* select te from external pad */
+			dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
+		} else {
+			/* enable Halt function for SPRD DSI */
+			dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
+		}
 
 		/* enable dpu update done INT */
 		int_mask |= BIT_DPU_INT_UPDATE_DONE;

-- 
2.50.0
