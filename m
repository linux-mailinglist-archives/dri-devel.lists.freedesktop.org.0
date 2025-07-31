Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C7B177B4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6674910E7F2;
	Thu, 31 Jul 2025 21:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZaRJNY+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599FF10E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lu18yJzfqnesWUovnuLNcS2DRplkXWq0NJm3RdxIW7Y=; b=ZaRJNY+I1HyHnarrM1dP0ZqVqF
 RuPMFHPR2gGjHZTRuubmXbjlenBdxlu7ti0k7gUg14ddqDZ9iHIc9nh9TMFANMFGavvlCAmBLJf6L
 fKVbYlfoXZ4dsJVcyS4ZD4Kw8gL/fXPn+V1yz64BG+vhv5mpFQyFytluE8DnbrBoDhw1Wmyr1kv1r
 zc2AaNaqT33iTrDYS1lUekz84qWC6tb5VsB4vjzJuNnAHsJNqp9vW3Uw4xKCa0Dsrno9+IQ1qfu7s
 eLu5B8cW7TxI2o6+CTZ069+26mztwr5Y7gGU5eoW2L1mZVUkmFXof7xYNXacAefGgXhSbRvLunnEd
 EeQQz4kQ==;
Received: from [189.7.87.79]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uhaUS-006udv-5D; Thu, 31 Jul 2025 23:07:04 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:21 -0300
Subject: [PATCH v2 5/5] drm/v3d: Introduce Runtime Power Management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-5-032d56b01964@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14607; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pIkS4sAw3o2nAvsh6AGf15hgREB4pVYaIlri65zQRnc=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rUEeZnYzonNMXp2L8msu11Ode19btzQIa36
 bwY92wB9xOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva1AAKCRA/8w6Kdoj6
 qvibCACZlJWiiEZ/euOLDwJnF0Q57x0v38uKLVObdpa670f8rsPHbE5IaMrdkbleWYhua6DUNm3
 v0cPOt0nBnddKvqsYqFgjYm+a+NJdBrTXunQ1MpEwu5NK43JAiMXjeaGq3PS7rVWds0OYc0Mqle
 YvZeFm2W+UT/MfEowWnfk6wiJJFv6mHghvaGunJLBUOD+/1y2mE3rmQWGAD9jcgsai3KY5WTAWc
 HiJ3r2CAsQwP+0sqmDBNetnU7JsNcpgeBec4qn3myPGsbFrVIlOipOvEwrFhbsWgzC8ldq9ygYA
 auzfkiMJanJ1CBu3MhTjJ4JJ/CS3Zvf7Dni2jQ3Va+z+oLL2
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

Commit 90a64adb0876 ("drm/v3d: Get rid of pm code") removed the last
bits of power management code that V3D had, which were actually never
hooked. Therefore, currently, the GPU clock is enabled during probe
and only disabled when removing the driver.

Implement proper power management using the kernel's Runtime PM
framework.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/Makefile      |  3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c | 23 ++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 83 ++++++++++++++++++---------------------
 drivers/gpu/drm/v3d/v3d_drv.h     | 18 +++++++++
 drivers/gpu/drm/v3d/v3d_gem.c     |  6 ++-
 drivers/gpu/drm/v3d/v3d_mmu.c     | 12 +++++-
 drivers/gpu/drm/v3d/v3d_power.c   | 79 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  | 19 +++++++--
 8 files changed, 188 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
index fcf710926057b34701792e1ee0458ae8ca5b25e3..c2d6d4b953435307f21c365e0ede1c2927407e06 100644
--- a/drivers/gpu/drm/v3d/Makefile
+++ b/drivers/gpu/drm/v3d/Makefile
@@ -14,7 +14,8 @@ v3d-y := \
 	v3d_sched.o \
 	v3d_sysfs.o \
 	v3d_submit.o \
-	v3d_gemfs.o
+	v3d_gemfs.o \
+	v3d_power.o
 
 v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
 
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 7e789e181af0ac138044f194a29555c30ab01836..d4cd4360ad21a22ebd0d9df7a93427bdb75d2c9c 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -96,7 +96,11 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
-	int i, core;
+	int i, core, ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(v3d_hub_reg_defs); i++) {
 		const struct v3d_reg_def *def = &v3d_hub_reg_defs[i];
@@ -138,6 +142,8 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 		}
 	}
 
+	v3d_pm_runtime_put(v3d);
+
 	return 0;
 }
 
@@ -147,7 +153,11 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 ident0, ident1, ident2, ident3, cores;
-	int core;
+	int core, ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return ret;
 
 	ident0 = V3D_READ(V3D_HUB_IDENT0);
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
@@ -206,6 +216,8 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 		}
 	}
 
+	v3d_pm_runtime_put(v3d);
+
 	return 0;
 }
 
@@ -233,6 +245,11 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	uint32_t cycles;
 	int core = 0;
 	int measure_ms = 1000;
+	int ret;
+
+	ret = v3d_pm_runtime_get(v3d);
+	if (ret)
+		return ret;
 
 	if (v3d->ver >= V3D_GEN_41) {
 		int cycle_count_reg = V3D_PCTR_CYCLE_COUNT(v3d->ver);
@@ -252,6 +269,8 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	msleep(measure_ms);
 	cycles = V3D_CORE_READ(core, V3D_PCTR_0_PCTR0);
 
+	v3d_pm_runtime_put(v3d);
+
 	seq_printf(m, "cycles: %d (%d.%d Mhz)\n",
 		   cycles,
 		   cycles / (measure_ms * 1000),
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 4e4217c7052210262c7af431de5fc24e13ab6bd0..6e4a9281e741e51ea3841fc4241bd7e534b70c19 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -58,6 +58,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		[DRM_V3D_PARAM_V3D_CORE0_IDENT1] = V3D_CTL_IDENT1,
 		[DRM_V3D_PARAM_V3D_CORE0_IDENT2] = V3D_CTL_IDENT2,
 	};
+	int ret;
 
 	if (args->pad != 0)
 		return -EINVAL;
@@ -74,12 +75,19 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 		if (args->value != 0)
 			return -EINVAL;
 
+		ret = v3d_pm_runtime_get(v3d);
+		if (ret)
+			return ret;
+
 		if (args->param >= DRM_V3D_PARAM_V3D_CORE0_IDENT0 &&
 		    args->param <= DRM_V3D_PARAM_V3D_CORE0_IDENT2) {
 			args->value = V3D_CORE_READ(0, offset);
 		} else {
 			args->value = V3D_READ(offset);
 		}
+
+		v3d_pm_runtime_put(v3d);
+
 		return 0;
 	}
 
@@ -274,36 +282,6 @@ static const struct of_device_id v3d_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, v3d_of_match);
 
-static void
-v3d_idle_sms(struct v3d_dev *v3d)
-{
-	if (v3d->ver < V3D_GEN_71)
-		return;
-
-	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
-
-	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
-				    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
-		DRM_ERROR("Failed to power up SMS\n");
-	}
-
-	v3d_reset_sms(v3d);
-}
-
-static void
-v3d_power_off_sms(struct v3d_dev *v3d)
-{
-	if (v3d->ver < V3D_GEN_71)
-		return;
-
-	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
-
-	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
-				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
-		DRM_ERROR("Failed to power off SMS\n");
-	}
-}
-
 static int
 map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
 {
@@ -387,19 +365,26 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto dma_free;
 
-	ret = clk_prepare_enable(v3d->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
 		goto gem_destroy;
-	}
 
-	v3d_idle_sms(v3d);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto gem_destroy;
+
+	/* If PM is disabled, we need to call v3d_power_resume() manually. */
+	if (!IS_ENABLED(CONFIG_PM)) {
+		ret = v3d_power_resume(dev);
+		if (ret)
+			goto gem_destroy;
+	}
 
 	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
 	mask = DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
 	ret = dma_set_mask_and_coherent(dev, mask);
 	if (ret)
-		goto clk_disable;
+		goto runtime_pm_put;
 
 	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
 
@@ -418,25 +403,27 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
 
 	v3d_gem_init(drm);
-	v3d_irq_enable(v3d);
+
+	pm_runtime_set_autosuspend_delay(dev, 50);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		goto irq_disable;
+		goto runtime_pm_put;
 
 	ret = v3d_sysfs_init(dev);
 	if (ret)
 		goto drm_unregister;
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 drm_unregister:
 	drm_dev_unregister(drm);
-irq_disable:
-	v3d_irq_disable(v3d);
-clk_disable:
-	v3d_power_off_sms(v3d);
-	clk_disable_unprepare(v3d->clk);
+runtime_pm_put:
+	pm_runtime_put_sync_suspend(dev);
 gem_destroy:
 	v3d_gem_destroy(drm);
 dma_free:
@@ -454,21 +441,27 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(drm);
 
-	v3d_power_off_sms(v3d);
+	pm_runtime_suspend(dev);
 
-	clk_disable_unprepare(v3d->clk);
+	/* If PM is disabled, we need to call v3d_power_suspend() manually. */
+	if (!IS_ENABLED(CONFIG_PM))
+		v3d_power_suspend(dev);
 
 	v3d_gem_destroy(drm);
 
 	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(v3d_pm_ops, v3d_power_suspend,
+				 v3d_power_resume, NULL);
+
 static struct platform_driver v3d_platform_driver = {
 	.probe		= v3d_platform_drm_probe,
 	.remove		= v3d_platform_drm_remove,
 	.driver		= {
 		.name	= "v3d",
 		.of_match_table = v3d_of_match,
+		.pm = pm_ptr(&v3d_pm_ops),
 	},
 };
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index aa33dcdc6a371393576dd8c20ab1dae920039a0c..c92b5fa6066be88b8bf04ff4dfd273c5e8cd441d 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -3,6 +3,7 @@
 
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/spinlock_types.h>
 #include <linux/workqueue.h>
 
@@ -325,6 +326,8 @@ struct v3d_job {
 
 	/* Callback for the freeing of the job on refcount going to 0. */
 	void (*free)(struct kref *ref);
+
+	bool has_pm_ref;
 };
 
 struct v3d_bin_job {
@@ -602,6 +605,21 @@ int v3d_mmu_set_page_table(struct v3d_dev *v3d);
 void v3d_mmu_insert_ptes(struct v3d_bo *bo);
 void v3d_mmu_remove_ptes(struct v3d_bo *bo);
 
+/* v3d_power.c */
+int v3d_power_suspend(struct device *dev);
+int v3d_power_resume(struct device *dev);
+
+static __always_inline int v3d_pm_runtime_get(struct v3d_dev *v3d)
+{
+	return pm_runtime_resume_and_get(v3d->drm.dev);
+}
+
+static __always_inline int v3d_pm_runtime_put(struct v3d_dev *v3d)
+{
+	pm_runtime_mark_last_busy(v3d->drm.dev);
+	return pm_runtime_put_autosuspend(v3d->drm.dev);
+}
+
 /* v3d_sched.c */
 void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *query_info,
 				   unsigned int count);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 4626ee6e4ac4412c293a87e8a8cc5ec84376cf24..fd2582629a431c6e41d07a9edb3608190ee23e5e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -128,6 +128,9 @@ v3d_reset(struct v3d_dev *v3d)
 	DRM_DEV_ERROR(dev->dev, "Resetting GPU for hang.\n");
 	DRM_DEV_ERROR(dev->dev, "V3D_ERR_STAT: 0x%08x\n",
 		      V3D_CORE_READ(0, V3D_ERR_STAT));
+
+	v3d_pm_runtime_get(v3d);
+
 	trace_v3d_reset_begin(dev);
 
 	/* XXX: only needed for safe powerdown, not reset. */
@@ -144,6 +147,8 @@ v3d_reset(struct v3d_dev *v3d)
 	v3d_perfmon_stop(v3d, v3d->active_perfmon, false);
 
 	trace_v3d_reset_end(dev);
+
+	v3d_pm_runtime_put(v3d);
 }
 
 static void
@@ -321,7 +326,6 @@ v3d_gem_init(struct drm_device *dev)
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 
 	v3d_init_hw_state(v3d);
-	v3d_mmu_set_page_table(v3d);
 }
 
 void
diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
index a25d25a8ae617bf68e133e1793cd0bb930bb07f6..1699819756aadfc40f7d41ff19847d42ddf10dce 100644
--- a/drivers/gpu/drm/v3d/v3d_mmu.c
+++ b/drivers/gpu/drm/v3d/v3d_mmu.c
@@ -37,7 +37,13 @@ static bool v3d_mmu_is_aligned(u32 page, u32 page_address, size_t alignment)
 
 int v3d_mmu_flush_all(struct v3d_dev *v3d)
 {
-	int ret;
+	int ret = 0;
+
+	pm_runtime_get_noresume(v3d->drm.dev);
+
+	/* Flush the PTs only if we're already awake */
+	if (!pm_runtime_active(v3d->drm.dev))
+		goto pm_put;
 
 	V3D_WRITE(V3D_MMUC_CONTROL, V3D_MMUC_CONTROL_FLUSH |
 		  V3D_MMUC_CONTROL_ENABLE);
@@ -46,7 +52,7 @@ int v3d_mmu_flush_all(struct v3d_dev *v3d)
 			 V3D_MMUC_CONTROL_FLUSHING), 100);
 	if (ret) {
 		dev_err(v3d->drm.dev, "MMUC flush wait idle failed\n");
-		return ret;
+		goto pm_put;
 	}
 
 	V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
@@ -57,6 +63,8 @@ int v3d_mmu_flush_all(struct v3d_dev *v3d)
 	if (ret)
 		dev_err(v3d->drm.dev, "MMU TLB clear wait idle failed\n");
 
+pm_put:
+	pm_runtime_put_autosuspend(v3d->drm.dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_power.c b/drivers/gpu/drm/v3d/v3d_power.c
new file mode 100644
index 0000000000000000000000000000000000000000..33eecfd9825af90ee607fa2eae67666ba020ad27
--- /dev/null
+++ b/drivers/gpu/drm/v3d/v3d_power.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (C) 2025 Raspberry Pi */
+
+#include <linux/clk.h>
+#include <linux/reset.h>
+
+#include "v3d_drv.h"
+#include "v3d_regs.h"
+
+static void
+v3d_resume_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
+
+	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
+				    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
+		DRM_ERROR("Failed to power up SMS\n");
+	}
+
+	v3d_reset_sms(v3d);
+}
+
+static void
+v3d_suspend_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
+
+	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
+				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
+		DRM_ERROR("Failed to power off SMS\n");
+	}
+}
+
+int v3d_power_suspend(struct device *dev)
+{
+	struct v3d_dev *v3d = dev_get_drvdata(dev);
+
+	v3d_irq_disable(v3d);
+	v3d_suspend_sms(v3d);
+
+	if (v3d->reset)
+		reset_control_assert(v3d->reset);
+
+	clk_disable_unprepare(v3d->clk);
+
+	return 0;
+}
+
+int v3d_power_resume(struct device *dev)
+{
+	struct v3d_dev *v3d = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(v3d->clk);
+	if (ret)
+		return ret;
+
+	if (v3d->reset) {
+		ret = reset_control_deassert(v3d->reset);
+		if (ret)
+			goto clk_disable;
+	}
+
+	v3d_resume_sms(v3d);
+	v3d_mmu_set_page_table(v3d);
+	v3d_irq_enable(v3d);
+
+	return 0;
+
+clk_disable:
+	clk_disable_unprepare(v3d->clk);
+	return ret;
+}
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 5171ffe9012d4d0140d82d40af71ecbaf029a24a..5236d647608d4ecfc8b06d3163735f6ede5cac9f 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -102,6 +102,9 @@ v3d_job_free(struct kref *ref)
 	if (job->perfmon)
 		v3d_perfmon_put(job->perfmon);
 
+	if (job->has_pm_ref)
+		v3d_pm_runtime_put(job->v3d);
+
 	kfree(job);
 }
 
@@ -183,13 +186,13 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 				if (copy_from_user(&in, handle++, sizeof(in))) {
 					ret = -EFAULT;
 					DRM_DEBUG("Failed to copy wait dep handle.\n");
-					goto fail_deps;
+					goto fail_job_init;
 				}
 				ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in.handle, 0);
 
 				// TODO: Investigate why this was filtered out for the IOCTL.
 				if (ret && ret != -ENOENT)
-					goto fail_deps;
+					goto fail_job_init;
 			}
 		}
 	} else {
@@ -197,14 +200,22 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 
 		// TODO: Investigate why this was filtered out for the IOCTL.
 		if (ret && ret != -ENOENT)
-			goto fail_deps;
+			goto fail_job_init;
+	}
+
+	/* CPU jobs don't require hardware resources */
+	if (queue != V3D_CPU) {
+		ret = v3d_pm_runtime_get(v3d);
+		if (ret)
+			goto fail_job_init;
+		job->has_pm_ref = true;
 	}
 
 	kref_init(&job->refcount);
 
 	return 0;
 
-fail_deps:
+fail_job_init:
 	drm_sched_job_cleanup(&job->base);
 	return ret;
 }

-- 
2.50.0

