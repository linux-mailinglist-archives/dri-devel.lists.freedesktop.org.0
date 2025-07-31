Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DC2B17446
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8B410E7D2;
	Thu, 31 Jul 2025 15:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1139910E7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:53:01 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 710FD1C2727;
 Thu, 31 Jul 2025 17:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdc9:0:1347:874c:9851:58c6])
 by srv01.abscue.de (Postfix) with ESMTPSA id BFFE11C2715;
 Thu, 31 Jul 2025 17:52:58 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 31 Jul 2025 17:51:25 +0200
Subject: [PATCH v3 12/16] drm: sprd: add support for newer DPU versions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-ums9230-drm-v3-12-06d4f57c4b08@abscue.de>
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
In-Reply-To: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Eric Anholt <eric@anholt.net>, 
 Kevin Tang <kevin3.tang@gmail.com>
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

Newer DPU revisions with the same register layout, such as the one used
in UMS9230 (version 5), require different defaults for the display
interface configuration but otherwise remain compatible with the version
this driver was originally written for.

Check the DPU version register to account for these configuration
differences.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 9d274600e6a80bdfc435f6c6eff77c9dd71cb38c..978d4947e1bc5cd5b13b1f25719268fa08b77297 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -27,6 +27,7 @@
 #include "sprd_dsi.h"
 
 /* Global control registers */
+#define REG_DPU_VERSION	0x00
 #define REG_DPU_CTRL	0x04
 #define REG_DPU_CFG0	0x08
 #define REG_PANEL_SIZE	0x20
@@ -406,6 +407,7 @@ static void sprd_dpu_init(struct sprd_dpu *dpu)
 {
 	struct dpu_context *ctx = &dpu->ctx;
 	u32 int_mask = 0;
+	u32 dpu_version = readl(ctx->base + REG_DPU_VERSION);
 
 	writel(0x00, ctx->base + REG_BG_COLOR);
 	writel(0x00, ctx->base + REG_MMU_EN);
@@ -418,10 +420,16 @@ static void sprd_dpu_init(struct sprd_dpu *dpu)
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
