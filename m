Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F3AD38717
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F29610E927;
	Fri, 16 Jan 2026 20:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SpFVNgSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16C910E926
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tq55ETnKQS6pz5m2sngYEY7BX4wcQsVteelEjlRt2a4=; b=SpFVNgSG7+a/0hdten17aTHg4I
 lbYdXRn7HovcFxDsXe0NiQ1t3ICDbJ1dj+Dge8fiX7h+2DDjgjqac5b0imUB1qBP8Oqdak0O7aYs0
 Kq7TLBW+QTAO6Hq0y/x9HGGdHPMtmzvY9eB/uQSRXFPEpoOdWPwqys41/cjf5hBzn6PBLC4qpyJjU
 HTidb62xFwAOvEpdu3beGQQ4xd5zp9o1RZqYJH7rsbSCc7wa6cLGWK5qb1AYdITi1pqGfTuLKv3QD
 7ziqUigafvjAjkJOuFQ1EOVJFvR5kcmSBfjmdyaPsdYUrIR+Z7wC9Fi8G3zTxTYNzX3CVWvWnc4NB
 LpH+sYtw==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vgqIY-006Ixj-Vz; Fri, 16 Jan 2026 21:19:59 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 16 Jan 2026 17:19:24 -0300
Subject: [PATCH v3 3/4] drm/v3d: Allocate all resources before enabling the
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-v3d-power-management-v3-3-4e1874e81dd6@igalia.com>
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
In-Reply-To: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7372; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pfqnnx/OSqbvy5G09PmDtvuyBbM46kezu4CheUA33hE=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpap1dd/tPc92jlDywbfU6sYBCyzK9mRKCsNH+n
 yjhKHFuz3iJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWqdXQAKCRA/8w6Kdoj6
 qntqB/9CMD9X27mhuYQ217ZcsIO9WzuUT6Jj2izXFy7uE8nIPAS7GbjPQHqKP5KBYHdVAH/yRma
 1h/qSIJDo5ZsrdrCzq4xO52Ch7ireGYfxl76uf2LO9IapjsWyYbtppTRmy206XX+NXhAErw23Lt
 +xITs2+1qZdLd1hoRmfpGotkMmWZ+j2vQcSTMXj/5dJA/OanJc74LZolOEz9P7gEJnSQdGSpPEx
 pMaEAIJpW8fJM9FWOdgJk9MMQGouPaHxNsdfoJW/3EhAQTJKoKhfONMTOr8r0/CjF/6DLvHNjWh
 sWYhHq23o4PavaiVE0r78Fp1RsvNwQru4tNZofLbY+71b8Vp
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
clock, as those operations don't require the GPU to be powered on.

While here, use devm_reset_control_get_optional_exclusive() instead of
open-code it.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 93 +++++++++++++++++++++----------------------
 drivers/gpu/drm/v3d/v3d_drv.h |  3 +-
 drivers/gpu/drm/v3d/v3d_gem.c | 14 +++++--
 drivers/gpu/drm/v3d/v3d_irq.c | 15 +++----
 4 files changed, 64 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index a11ca276061a8462977ed3d837ffcc96b2f444f6..cb12d17cce2bf9e49432e3d3dddef1afdc4d93a0 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -360,14 +360,50 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
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
@@ -396,45 +432,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
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
@@ -450,12 +449,13 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
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
 
@@ -469,14 +469,13 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 
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
index 99a39329bb85b10aec990ea1c7ad2a780a6dad07..738a09351c306db33078db1e053cd133d55d2138 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -565,7 +565,8 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
 
 /* v3d_gem.c */
 extern bool super_pages;
-int v3d_gem_init(struct drm_device *dev);
+int v3d_gem_allocate(struct drm_device *dev);
+void v3d_gem_init(struct drm_device *dev);
 void v3d_gem_destroy(struct drm_device *dev);
 void v3d_reset_sms(struct v3d_dev *v3d);
 void v3d_reset(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 697b0b3ca92cf8f4cc7910a2a7b01ea43c79fe11..1f532030c3883257810877c75da38636bf25f58e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -278,7 +278,7 @@ v3d_huge_mnt_init(struct v3d_dev *v3d)
 }
 
 int
-v3d_gem_init(struct drm_device *dev)
+v3d_gem_allocate(struct drm_device *dev)
 {
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 pt_size = 4096 * 1024;
@@ -325,9 +325,6 @@ v3d_gem_init(struct drm_device *dev)
 		return -ENOMEM;
 	}
 
-	v3d_init_hw_state(v3d);
-	v3d_mmu_set_page_table(v3d);
-
 	v3d_huge_mnt_init(v3d);
 
 	ret = v3d_sched_init(v3d);
@@ -341,6 +338,15 @@ v3d_gem_init(struct drm_device *dev)
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
index b55880fd6c508bd47a27c15db3fd8d21ded2dbd1..b901d416c9d6145f7b162cdeadc40e67e75fdffb 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -248,17 +248,10 @@ v3d_hub_irq(int irq, void *arg)
 int
 v3d_irq_init(struct v3d_dev *v3d)
 {
-	int irq, ret, core;
+	int irq, ret;
 
 	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
 
-	/* Clear any pending interrupts someone might have left around
-	 * for us.
-	 */
-	for (core = 0; core < v3d->cores; core++)
-		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
-	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
-
 	irq = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
 	if (irq == -EPROBE_DEFER)
 		return irq;
@@ -296,7 +289,6 @@ v3d_irq_init(struct v3d_dev *v3d)
 			goto fail;
 	}
 
-	v3d_irq_enable(v3d);
 	return 0;
 
 fail:
@@ -310,6 +302,11 @@ v3d_irq_enable(struct v3d_dev *v3d)
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
2.52.0

