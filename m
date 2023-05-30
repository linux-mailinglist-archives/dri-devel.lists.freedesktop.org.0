Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1B716877
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 18:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDB710E3C9;
	Tue, 30 May 2023 16:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD85510E17C;
 Tue, 30 May 2023 16:01:28 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Axm+rWHXZklaUCAA--.1565S3;
 Wed, 31 May 2023 00:01:26 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxn7PWHXZkp92AAA--.14122S3; 
 Wed, 31 May 2023 00:01:26 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH v6 1/6] drm/etnaviv: add a dedicated function to register an
 irq handler
Date: Wed, 31 May 2023 00:01:21 +0800
Message-Id: <20230530160126.2344425-2-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530160126.2344425-1-suijingfeng@loongson.cn>
References: <20230530160126.2344425-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxn7PWHXZkp92AAA--.14122S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AFWDWF4UKFyfArW3ZF47Jwb_yoW8Zr15pa
 17Ja4Ykr18ua42g34fZF98ZF1akw1IqayIkwnrt3sak398Jrs8JryFkF1UJa4fAryrGay3
 tF1jgFWUuF45u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWUJVW8JwAS0I0E
 0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzV
 Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
 6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026x
 CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
 JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
 1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
 Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8Jb
 IYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because getting IRQ from a device is platform-dependent, PCI devices have
different methods for getting an IRQ. This patch is a preparation patch to
extend support for the PCI device.

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

