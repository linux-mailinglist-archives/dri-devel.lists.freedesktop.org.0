Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8147ED22
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709EC10E40B;
	Fri, 24 Dec 2021 08:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D194C10E1ED
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:07:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,227,1635174000"; d="scan'208";a="104382696"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2021 04:02:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2008040DF45D;
 Thu, 23 Dec 2021 04:02:02 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/5] drm/exynos/fimc: Use platform_get_irq() to get the
 interrupt
Date: Wed, 22 Dec 2021 19:01:33 +0000
Message-Id: <20211222190134.24866-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:14 +0000
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
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypassed the hierarchical setup and messed up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index ecfd82d0afb7..dd806743e4de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1267,7 +1267,6 @@ static int fimc_probe(struct platform_device *pdev)
 	struct exynos_drm_ipp_formats *formats;
 	struct device *dev = &pdev->dev;
 	struct fimc_context *ctx;
-	struct resource *res;
 	int ret;
 	int i, j, num_limits, num_formats;
 
@@ -1330,14 +1329,12 @@ static int fimc_probe(struct platform_device *pdev)
 		return PTR_ERR(ctx->regs);
 
 	/* resource irq */
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(dev, "failed to request irq resource.\n");
-		return -ENOENT;
-	}
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
 
-	ret = devm_request_irq(dev, res->start, fimc_irq_handler,
-		0, dev_name(dev), ctx);
+	ret = devm_request_irq(dev, ret, fimc_irq_handler,
+			       0, dev_name(dev), ctx);
 	if (ret < 0) {
 		dev_err(dev, "failed to request irq.\n");
 		return ret;
-- 
2.17.1

