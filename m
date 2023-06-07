Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45893725C27
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 12:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F5010E4BE;
	Wed,  7 Jun 2023 10:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74F5C10E0DB;
 Wed,  7 Jun 2023 10:56:06 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:55208.1520123491
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 6144A1002B3;
 Wed,  7 Jun 2023 18:56:02 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 2b02ab02dee24e789783e8e04e4c8ddc for l.stach@pengutronix.de; 
 Wed, 07 Jun 2023 18:56:04 CST
X-Transaction-ID: 2b02ab02dee24e789783e8e04e4c8ddc
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH v8 2/8] drm/etnaviv: add a dedicated function to get various
 clocks
Date: Wed,  7 Jun 2023 18:55:45 +0800
Message-Id: <20230607105551.568639-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607105551.568639-1-15330273260@189.cn>
References: <20230607105551.568639-1-15330273260@189.cn>
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
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because it is also platform-dependent, there are environments where don't
have CLK subsystem support, for example, discreted PCI GPUs. So don't rage
quit if there is no CLK subsystem support.

For the GPU in LS7A1000 and LS2K1000, the working frequency of the GPU is
tuned by configuring the PLL registers.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 53 ++++++++++++++++-----------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index b9c12d3145a2..d4f99cb0456f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1565,6 +1565,35 @@ static irqreturn_t irq_handler(int irq, void *data)
 	return ret;
 }
 
+static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu)
+{
+	struct device *dev = gpu->dev;
+
+	gpu->clk_reg = devm_clk_get_optional(dev, "reg");
+	DBG("clk_reg: %p", gpu->clk_reg);
+	if (IS_ERR(gpu->clk_reg))
+		return PTR_ERR(gpu->clk_reg);
+
+	gpu->clk_bus = devm_clk_get_optional(dev, "bus");
+	DBG("clk_bus: %p", gpu->clk_bus);
+	if (IS_ERR(gpu->clk_bus))
+		return PTR_ERR(gpu->clk_bus);
+
+	gpu->clk_core = devm_clk_get(dev, "core");
+	DBG("clk_core: %p", gpu->clk_core);
+	if (IS_ERR(gpu->clk_core))
+		return PTR_ERR(gpu->clk_core);
+	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
+
+	gpu->clk_shader = devm_clk_get_optional(dev, "shader");
+	DBG("clk_shader: %p", gpu->clk_shader);
+	if (IS_ERR(gpu->clk_shader))
+		return PTR_ERR(gpu->clk_shader);
+	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
+
+	return 0;
+}
+
 static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 {
 	int ret;
@@ -1865,27 +1894,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 		return err;
 
 	/* Get Clocks: */
-	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
-	DBG("clk_reg: %p", gpu->clk_reg);
-	if (IS_ERR(gpu->clk_reg))
-		return PTR_ERR(gpu->clk_reg);
-
-	gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");
-	DBG("clk_bus: %p", gpu->clk_bus);
-	if (IS_ERR(gpu->clk_bus))
-		return PTR_ERR(gpu->clk_bus);
-
-	gpu->clk_core = devm_clk_get(&pdev->dev, "core");
-	DBG("clk_core: %p", gpu->clk_core);
-	if (IS_ERR(gpu->clk_core))
-		return PTR_ERR(gpu->clk_core);
-	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
-
-	gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
-	DBG("clk_shader: %p", gpu->clk_shader);
-	if (IS_ERR(gpu->clk_shader))
-		return PTR_ERR(gpu->clk_shader);
-	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
+	err = etnaviv_gpu_clk_get(gpu);
+	if (err)
+		return err;
 
 	/* TODO: figure out max mapped size */
 	dev_set_drvdata(dev, gpu);
-- 
2.25.1

