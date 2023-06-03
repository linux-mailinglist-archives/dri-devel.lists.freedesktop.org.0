Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755BE720FC5
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 13:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B546210E26E;
	Sat,  3 Jun 2023 11:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B4BE10E26D;
 Sat,  3 Jun 2023 11:00:08 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:51732.1826327623
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id E0446100239;
 Sat,  3 Jun 2023 19:00:05 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 c23bd1fc2e904056b40e5c6747f144d1 for l.stach@pengutronix.de; 
 Sat, 03 Jun 2023 19:00:05 CST
X-Transaction-ID: c23bd1fc2e904056b40e5c6747f144d1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v7 1/7] drm/etnaviv: add a dedicated function to register an
 irq handler
Date: Sat,  3 Jun 2023 18:59:37 +0800
Message-Id: <20230603105943.3042766-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230603105943.3042766-1-15330273260@189.cn>
References: <20230603105943.3042766-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because getting IRQ from a device is platform-dependent, PCI devices have
different methods for getting an IRQ. This patch is a preparation patch to
extend the driver for the PCI device support.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 34 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index de8c9894967c..636d3f39ddcb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1817,6 +1817,29 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
+static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
+{
+	struct device *dev = gpu->dev;
+	int err;
+
+	if (irq < 0) {
+		dev_err(dev, "failed to get irq: %d\n", irq);
+		return irq;
+	}
+
+	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
+	if (err) {
+		dev_err(dev, "failed to request IRQ %u: %d\n", irq, err);
+		return err;
+	}
+
+	gpu->irq = irq;
+
+	dev_info(dev, "IRQ handler registered, irq = %d\n", irq);
+
+	return 0;
+}
+
 static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1837,16 +1860,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(gpu->mmio);
 
 	/* Get Interrupt: */
-	gpu->irq = platform_get_irq(pdev, 0);
-	if (gpu->irq < 0)
-		return gpu->irq;
-
-	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
-			       dev_name(gpu->dev), gpu);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
+	err = etnaviv_gpu_register_irq(gpu,  platform_get_irq(pdev, 0));
+	if (err)
 		return err;
-	}
 
 	/* Get Clocks: */
 	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
-- 
2.25.1

