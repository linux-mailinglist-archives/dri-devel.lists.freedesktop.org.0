Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00047ED23
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280FF10E40E;
	Fri, 24 Dec 2021 08:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4453D10E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:07:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,227,1635174000"; d="scan'208";a="104859066"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 23 Dec 2021 04:01:56 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id A8BA840DF258;
 Thu, 23 Dec 2021 04:01:53 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/5] drm/exynos/exynos7_drm_decon: Use
 platform_get_irq_byname() to get the interrupt
Date: Wed, 22 Dec 2021 19:01:30 +0000
Message-Id: <20211222190134.24866-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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

platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypassed the hierarchical setup and messed up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq_byname().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 12571ac45540..c04264f70ad1 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -678,7 +678,6 @@ static int decon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct decon_context *ctx;
 	struct device_node *i80_if_timings;
-	struct resource *res;
 	int ret;
 
 	if (!dev->of_node)
@@ -728,16 +727,11 @@ static int decon_probe(struct platform_device *pdev)
 		goto err_iounmap;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-					   ctx->i80_if ? "lcd_sys" : "vsync");
-	if (!res) {
-		dev_err(dev, "irq request failed.\n");
-		ret = -ENXIO;
+	ret =  platform_get_irq_byname(pdev, ctx->i80_if ? "lcd_sys" : "vsync");
+	if (ret < 0)
 		goto err_iounmap;
-	}
 
-	ret = devm_request_irq(dev, res->start, decon_irq_handler,
-							0, "drm_decon", ctx);
+	ret = devm_request_irq(dev, ret, decon_irq_handler, 0, "drm_decon", ctx);
 	if (ret) {
 		dev_err(dev, "irq request failed.\n");
 		goto err_iounmap;
-- 
2.17.1

