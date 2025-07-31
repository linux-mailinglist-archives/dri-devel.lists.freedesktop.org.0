Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB8B177B2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200210E7EE;
	Thu, 31 Jul 2025 21:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CZiuU39f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD8610E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CnKuR2IBq9HS8gJbg+MhoZopCk3rJ2IX/z6rXbK6MH8=; b=CZiuU39fQvqD1HZGinysuP8CC2
 eLtTw+lIFILuA70d0XZarTQJkoSo5M43EqnEorRDnD4496OWm3poa4dWtOYtf5T+rvNyW92LAMWRD
 saZc7uPdIlmks5BxN3lJ01rZSbx6zqL4vm5vmRfqsZg3CtW88Qfmp0ZRztHzy3dcA5DenDdYZEzHW
 v4Z/8i+b1f+yjseksBEcCxKg/QCQsZOQxO/771yBq8N5JsGR7ciSA2L90yGBsR53JATsQ47CvZlWV
 kFdBYuZy0f/aQPpDR6zCbY7E507OzGkbOnIoeigV6cJsK0gVzbinMhFYYHb4N/CoKGu1yL/snq+dJ
 /P9zJqlQ==;
Received: from [189.7.87.79]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uhaUM-006udv-Aq; Thu, 31 Jul 2025 23:06:58 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:20 -0300
Subject: [PATCH v2 4/5] drm/v3d: Allocate all resources before enabling the
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-4-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
In-Reply-To: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7352; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=ZkAqS+1IpDqhlbySoF2W3vmJ+bPo1zrjOi2c7MSr2iI=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rUZaR4HA+2r9DLvasgnexCxMMBg/uMHDm2w
 ua+xYrAi8yJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva1AAKCRA/8w6Kdoj6
 qjttB/9TvUdxpxEnmOrQSaKp4oR4qgiEurbSgOce7ZZsl+M8Pd7pN+TJ3JSs3ug7NdIMM67sY8S
 DHnPMuM/VoZNjz6kNmt21IVFiTJtD0YABEVP17xM7nf7VPh/FN8Q/i9pWns7bp4+UYD+Vh1Wo11
 5PbERoA2EgyLlRJUzrWF7rGAMBgA6VGAvnzLDTiTDDiiyL2PqsZeVSoeM0vLRCorg3WUohZvCyQ
 CFRlvEwOG8CzaHc9fCOYcQBOYl9BM5FTBaQozVhh8Cmt90X9TbOIgxjRsj1P9MYnbgKCebw3Crg
 FJOKPYbAjMz/qHKCaPpN9BPrpBmRfjQLRLIbxNcZKkVaQ8dx
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

Move all resource allocation operations before actually enabling the
clock, as those operation don't require the GPU to be powered on.

While here, use devm_reset_control_get_optional_exclusive() instead of
open-code it.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 93 +++++++++++++++++++++----------------------
 drivers/gpu/drm/v3d/v3d_drv.h |  3 +-
 drivers/gpu/drm/v3d/v3d_gem.c | 14 +++++--
 drivers/gpu/drm/v3d/v3d_irq.c | 15 +++----
 4 files changed, 64 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 2def155ce496ec5f159f6bda9929aeaae141d1a6..4e4217c7052210262c7af431de5fc24e13ab6bd0 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -347,14 +347,50 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (v3d->ver < V3D_GEN_41) {
+		ret = map_regs(v3d, &v3d->gca_regs, "gca");
+		if (ret)
+			return ret;
+	}
+
+	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(v3d->reset))
+		return dev_err_probe(dev, PTR_ERR(v3d->reset),
+				     "Failed to get reset control\n");
+
+	if (!v3d->reset) {
+		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
+		if (ret) {
+			dev_err(dev, "Failed to get bridge registers\n");
+			return ret;
+		}
+	}
+
 	v3d->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(v3d->clk))
 		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
 
+	ret = v3d_irq_init(v3d);
+	if (ret)
+		return ret;
+
+	v3d_perfmon_init(v3d);
+
+	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
+					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
+	if (!v3d->mmu_scratch) {
+		dev_err(dev, "Failed to allocate MMU scratch page\n");
+		return -ENOMEM;
+	}
+
+	ret = v3d_gem_allocate(drm);
+	if (ret)
+		goto dma_free;
+
 	ret = clk_prepare_enable(v3d->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
-		return ret;
+		goto gem_destroy;
 	}
 
 	v3d_idle_sms(v3d);
@@ -381,45 +417,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	ident3 = V3D_READ(V3D_HUB_IDENT3);
 	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
 
-	v3d_perfmon_init(v3d);
-
-	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(v3d->reset)) {
-		ret = PTR_ERR(v3d->reset);
-
-		if (ret == -EPROBE_DEFER)
-			goto clk_disable;
-
-		v3d->reset = NULL;
-		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
-		if (ret) {
-			dev_err(dev,
-				"Failed to get reset control or bridge regs\n");
-			goto clk_disable;
-		}
-	}
-
-	if (v3d->ver < V3D_GEN_41) {
-		ret = map_regs(v3d, &v3d->gca_regs, "gca");
-		if (ret)
-			goto clk_disable;
-	}
-
-	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
-					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
-	if (!v3d->mmu_scratch) {
-		dev_err(dev, "Failed to allocate MMU scratch page\n");
-		ret = -ENOMEM;
-		goto clk_disable;
-	}
-
-	ret = v3d_gem_init(drm);
-	if (ret)
-		goto dma_free;
-
-	ret = v3d_irq_init(v3d);
-	if (ret)
-		goto gem_destroy;
+	v3d_gem_init(drm);
+	v3d_irq_enable(v3d);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
@@ -435,12 +434,13 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	drm_dev_unregister(drm);
 irq_disable:
 	v3d_irq_disable(v3d);
+clk_disable:
+	v3d_power_off_sms(v3d);
+	clk_disable_unprepare(v3d->clk);
 gem_destroy:
 	v3d_gem_destroy(drm);
 dma_free:
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
-clk_disable:
-	clk_disable_unprepare(v3d->clk);
 	return ret;
 }
 
@@ -454,14 +454,13 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 
-	v3d_gem_destroy(drm);
-
-	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
-		    v3d->mmu_scratch_paddr);
-
 	v3d_power_off_sms(v3d);
 
 	clk_disable_unprepare(v3d->clk);
+
+	v3d_gem_destroy(drm);
+
+	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 }
 
 static struct platform_driver v3d_platform_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index dabda7aaf00074d8de42dcdb345d5f3331ac13b2..aa33dcdc6a371393576dd8c20ab1dae920039a0c 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -565,7 +565,8 @@ extern const struct dma_fence_ops v3d_fence_ops;
 struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue);
 
 /* v3d_gem.c */
-int v3d_gem_init(struct drm_device *dev);
+int v3d_gem_allocate(struct drm_device *dev);
+void v3d_gem_init(struct drm_device *dev);
 void v3d_gem_destroy(struct drm_device *dev);
 void v3d_reset_sms(struct v3d_dev *v3d);
 void v3d_reset(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index d7d16da78db328f004d1d702731d1a1b5437a394..4626ee6e4ac4412c293a87e8a8cc5ec84376cf24 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -257,7 +257,7 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
 }
 
 int
-v3d_gem_init(struct drm_device *dev)
+v3d_gem_allocate(struct drm_device *dev)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 pt_size = 4096 * 1024;
@@ -302,9 +302,6 @@ v3d_gem_init(struct drm_device *dev)
 		return -ENOMEM;
 	}
 
-	v3d_init_hw_state(v3d);
-	v3d_mmu_set_page_table(v3d);
-
 	v3d_gemfs_init(v3d);
 
 	ret = v3d_sched_init(v3d);
@@ -318,6 +315,15 @@ v3d_gem_init(struct drm_device *dev)
 	return 0;
 }
 
+void
+v3d_gem_init(struct drm_device *dev)
+{
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+
+	v3d_init_hw_state(v3d);
+	v3d_mmu_set_page_table(v3d);
+}
+
 void
 v3d_gem_destroy(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 2cca5d3a26a22cf03d2c4e9ae0688ab57e0eedcd..89eb3034db4bddf878a88f17793b2ea08f4c37d5 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -260,17 +260,10 @@ v3d_hub_irq(int irq, void *arg)
 int
 v3d_irq_init(struct v3d_dev *v3d)
 {
-	int irq1, ret, core;
+	int irq1, ret;
 
 	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
 
-	/* Clear any pending interrupts someone might have left around
-	 * for us.
-	 */
-	for (core = 0; core < v3d->cores; core++)
-		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
-	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
-
 	irq1 = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
 	if (irq1 == -EPROBE_DEFER)
 		return irq1;
@@ -297,7 +290,6 @@ v3d_irq_init(struct v3d_dev *v3d)
 			goto fail;
 	}
 
-	v3d_irq_enable(v3d);
 	return 0;
 
 fail:
@@ -311,6 +303,11 @@ v3d_irq_enable(struct v3d_dev *v3d)
 {
 	int core;
 
+	/* Clear any pending interrupts someone might have left around for us. */
+	for (core = 0; core < v3d->cores; core++)
+		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
+	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
+
 	/* Enable our set of interrupts, masking out any others. */
 	for (core = 0; core < v3d->cores; core++) {
 		V3D_CORE_WRITE(core, V3D_CTL_INT_MSK_SET, ~V3D_CORE_IRQS(v3d->ver));

-- 
2.50.0

