Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF8B0DF0E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DB410E6BC;
	Tue, 22 Jul 2025 14:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF310E6BB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:41:46 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 2A4891C233A;
 Tue, 22 Jul 2025 16:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdcb:3c00:ce39:8bff:5db4:1ef8])
 by srv01.abscue.de (Postfix) with ESMTPSA id 53CEF1C07FA;
 Tue, 22 Jul 2025 16:41:44 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 22 Jul 2025 16:41:15 +0200
Subject: [PATCH v2 13/15] drm: sprd: do not access IOMMU registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-ums9230-drm-v2-13-054276ec213d@abscue.de>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
In-Reply-To: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
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

Changing the IOMMU registers results in conflicts with the sprd_iommu
driver. Remove all references to IOMMU registers in the graphics driver.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index b946d015133db44d2d3d0b18803ed887b2b7ae2e..acf28de3fd08edaad03f01104f3e6cc7c243123c 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -55,14 +55,6 @@
 #define REG_DPI_H_TIMING	0x1F4
 #define REG_DPI_V_TIMING	0x1F8
 
-/* MMU control registers */
-#define REG_MMU_EN			0x800
-#define REG_MMU_VPN_RANGE		0x80C
-#define REG_MMU_PPN1			0x83C
-#define REG_MMU_RANGE1			0x840
-#define REG_MMU_PPN2			0x844
-#define REG_MMU_RANGE2			0x848
-
 /* Global control bits */
 #define BIT_DPU_RUN			BIT(0)
 #define BIT_DPU_STOP			BIT(1)
@@ -410,12 +402,6 @@ static void sprd_dpu_init(struct sprd_dpu *dpu)
 	u32 dpu_version = readl(ctx->base + REG_DPU_VERSION);
 
 	writel(0x00, ctx->base + REG_BG_COLOR);
-	writel(0x00, ctx->base + REG_MMU_EN);
-	writel(0x00, ctx->base + REG_MMU_PPN1);
-	writel(0xffff, ctx->base + REG_MMU_RANGE1);
-	writel(0x00, ctx->base + REG_MMU_PPN2);
-	writel(0xffff, ctx->base + REG_MMU_RANGE2);
-	writel(0x1ffff, ctx->base + REG_MMU_VPN_RANGE);
 
 	if (ctx->if_type == SPRD_DPU_IF_DPI) {
 		/* use dpi as interface */

-- 
2.50.0
