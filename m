Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9957369D3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482C10E2C4;
	Tue, 20 Jun 2023 10:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E9BF10E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:48:15 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxd+ntg5FkYywHAA--.12830S3;
 Tue, 20 Jun 2023 18:48:13 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxCOXmg5FklJghAA--.28448S3; 
 Tue, 20 Jun 2023 18:48:13 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v10 01/11] drm/etnaviv: Add a dedicated function to register
 an irq handler
Date: Tue, 20 Jun 2023 18:47:56 +0800
Message-Id: <20230620104806.2236666-2-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620104806.2236666-1-suijingfeng@loongson.cn>
References: <20230620104806.2236666-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxCOXmg5FklJghAA--.28448S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWDWF13ZrW3uw15ur1rGrX_yoW8uFy3pa
 n7JFyYkr18Ca4jg34fAF98XFyYkr1xuayIywnrt3sI9398Jrs8tryFkF1jqFyfAr95Ga13
 tr1jqFW8ua15ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because getting IRQ from a device is platform-dependent, PCI devices have
different methods for getting an IRQ. This patch is a preparation to extend
this driver for supporting the PCI devices.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 32 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index de8c9894967c..a03e81337d8f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1817,6 +1817,27 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
+static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
+{
+	struct device *dev = gpu->dev;
+	int err;
+
+	if (irq < 0)
+		return irq;
+
+	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
+	if (err) {
+		dev_err(dev, "failed to request irq %u: %d\n", irq, err);
+		return err;
+	}
+
+	gpu->irq = irq;
+
+	dev_info(dev, "irq(%d) handler registered\n", irq);
+
+	return 0;
+}
+
 static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1837,16 +1858,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
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
+	err = etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
+	if (err)
 		return err;
-	}
 
 	/* Get Clocks: */
 	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
-- 
2.25.1

