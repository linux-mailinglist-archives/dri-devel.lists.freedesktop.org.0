Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99F33B1AD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 12:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA19289C17;
	Mon, 15 Mar 2021 11:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060589C17
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 11:49:02 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DzZQh055qz17LYr;
 Mon, 15 Mar 2021 19:47:08 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 19:48:55 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <inki.dae@samsung.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <krzk@kernel.org>
Subject: [PATCH v2] drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag
Date: Mon, 15 Mar 2021 19:49:37 +0800
Message-ID: <1615808977-36044-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After this patch cbe16f35bee68 genirq: Add IRQF_NO_AUTOEN for
request_irq/nmi() is merged. request_irq() after setting
IRQ_NOAUTOEN as below

irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq(dev, irq...);
can be replaced by request_irq() with IRQF_NO_AUTOEN flag.

v2:
Fix the problem of using wrong flags

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1f79bc2..c277d2f 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -775,8 +775,8 @@ static int decon_conf_irq(struct decon_context *ctx, const char *name,
 			return irq;
 		}
 	}
-	irq_set_status_flags(irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(ctx->dev, irq, handler, flags, "drm_decon", ctx);
+	ret = devm_request_irq(ctx->dev, irq, handler,
+			       flags | IRQF_NO_AUTOEN, "drm_decon", ctx);
 	if (ret < 0) {
 		dev_err(ctx->dev, "IRQ %s request failed\n", name);
 		return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 83ab6b3..44e402b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1352,10 +1352,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	}
 
 	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
-	irq_set_status_flags(te_gpio_irq, IRQ_NOAUTOEN);
 
 	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
-					IRQF_TRIGGER_RISING, "TE", dsi);
+				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
 		gpio_free(dsi->te_gpio);
@@ -1802,9 +1801,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (dsi->irq < 0)
 		return dsi->irq;
 
-	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
-					exynos_dsi_irq, IRQF_ONESHOT,
+					exynos_dsi_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					dev_name(dev), dsi);
 	if (ret) {
 		dev_err(dev, "failed to request dsi irq\n");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
