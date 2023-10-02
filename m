Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560457B50EE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 13:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8CA10E297;
	Mon,  2 Oct 2023 11:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 338C410E28B;
 Mon,  2 Oct 2023 11:12:10 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxjuuIpRplLZIuAA--.20733S3;
 Mon, 02 Oct 2023 19:12:08 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxE+SHpRplEh4XAA--.50320S6; 
 Mon, 02 Oct 2023 19:12:08 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 4/5] drm/etnaviv: Add a helper to get the first available
 GPU device node
Date: Mon,  2 Oct 2023 19:12:06 +0800
Message-Id: <20231002111207.513297-5-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002111207.513297-1-suijingfeng@loongson.cn>
References: <20231002111207.513297-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxE+SHpRplEh4XAA--.50320S6
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4DGFyrWryfJF4UZryfZrc_yoW8KF1fpF
 43GFyYyrykWFyUK34xXFW5ZFyYkw1Iq3yFy34IkwnY9ws5AryrJr1FgFyUAF9xJFWrJ3W3
 tr18tr17uF48ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8gAw7UUUUU==
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch make the code in the etnaviv_pdev_probe() less twisted, and it
also make it easier to drop the reference to device node after finished.
Before apply this patch, there is no call to of_node_put() when done. We
should call of_node_put() when done.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 28 ++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 8fe39e31d22d..a9a1659840ec 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -29,6 +29,17 @@
  * DRM operations:
  */
 
+static struct device_node *etnaviv_of_first_available_node(void)
+{
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "vivante,gc") {
+		if (of_device_is_available(np))
+			return np;
+	}
+
+	return NULL;
+}
 
 static void load_gpu(struct drm_device *dev)
 {
@@ -597,11 +608,10 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!of_device_is_available(core_node))
 				continue;
 
-			if (!first_node)
-				first_node = core_node;
-
 			drm_of_component_match_add(&pdev->dev, &match,
 						   component_compare_of, core_node);
+
+			of_node_put(core_node);
 		}
 	} else {
 		char **names = dev->platform_data;
@@ -634,8 +644,11 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * device as the GPU we found. This assumes that all Vivante
 	 * GPUs in the system share the same DMA constraints.
 	 */
-	if (first_node)
+	first_node = etnaviv_of_first_available_node();
+	if (first_node) {
 		of_dma_configure(&pdev->dev, first_node, true);
+		of_node_put(first_node);
+	}
 
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
@@ -709,16 +722,13 @@ static int __init etnaviv_init(void)
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
 	 */
-	for_each_compatible_node(np, NULL, "vivante,gc") {
-		if (!of_device_is_available(np))
-			continue;
+	np = etnaviv_of_first_available_node();
+	if (np) {
 		of_node_put(np);
 
 		ret = etnaviv_create_platform_device("etnaviv", &etnaviv_drm);
 		if (ret)
 			goto unregister_platform_driver;
-
-		break;
 	}
 
 	return 0;
-- 
2.34.1

