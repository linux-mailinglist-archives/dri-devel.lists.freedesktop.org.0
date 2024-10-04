Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCA98FFEB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D33610E9CC;
	Fri,  4 Oct 2024 09:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL8oDSkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F1E10E9CC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 09:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034886; x=1759570886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3xjNspXK3jxMBLqy7YizOyjs2GjBbNcnEUxgvbeFtQ8=;
 b=SL8oDSkjOHw29tZs9dE2H39TM5+mh+Dbzr52/K9xOiHfTJ8w2DglLUPE
 uER3DIdHRWoBLYa38o0Zv4Gb1dky1PAHkiFx2azYn8jvtJusatzRsYt2u
 awJ0fkZn1jwiMM/BlLwzy+EUfi4oxUo84acHr3dR9x+jhwRYkruam7dtq
 Qie2+k6cSSmvVgmK70pe1Fs/LG//SOCroE1yGc33bHPw7LdsUPON84fZR
 JBVj6uDBep+CHVjVfB7ySpJAq0HHCIsYcKamZRJidzaKms3VOyM/DB/V8
 Y/gkcfRbQI0YvTdaSTElYik0+aDsB1eypUDhayXHm9FfMzl7DGXm2DbI/ A==;
X-CSE-ConnectionGUID: JWGoe3yvQk+SIGq8YIfUCA==
X-CSE-MsgGUID: 2XseBD7PT0GGhWM1pul+iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856228"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37856228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:26 -0700
X-CSE-ConnectionGUID: k1DoCC5XTt+aYD01V+gWTw==
X-CSE-MsgGUID: ch87iJCtQ+Gv0F8617134A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74331934"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:24 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 8321511FA28;
 Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoM-000TY2-1g;
 Fri, 04 Oct 2024 12:41:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/51] drivers: drm: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:22 +0300
Message-Id: <20241004094122.113572-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  4 ++--
 drivers/gpu/drm/bridge/parade-ps8640.c             |  4 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 12 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |  6 +++---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |  2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |  4 ++--
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |  2 +-
 drivers/gpu/drm/lima/lima_sched.c                  |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |  4 ++--
 drivers/gpu/drm/msm/msm_submitqueue.c              |  2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  8 ++++----
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |  6 +++---
 drivers/gpu/drm/panel/panel-simple.c               |  6 +++---
 drivers/gpu/drm/panthor/panthor_device.c           |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |  6 +++---
 drivers/gpu/drm/tegra/submit.c                     |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  2 +-
 26 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..42681a76ee67 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1543,7 +1543,7 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 	ret = analogix_dp_transfer(dp, msg);
 out:
 	pm_runtime_mark_last_busy(dp->dev);
-	pm_runtime_put_autosuspend(dp->dev);
+	__pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe4..f7dd55407ea9 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1521,7 +1521,7 @@ static int anx7625_wait_hpd_asserted(struct drm_dp_aux *aux,
 	pm_runtime_get_sync(dev);
 	ret = _anx7625_hpd_polling(ctx, wait_us);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -1771,7 +1771,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 		ret = anx7625_aux_trans(ctx, msg->request, msg->address,
 					msg->size, msg->buffer);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	mutex_unlock(&ctx->aux_lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 14d4dcf239da..a0faf4bd8866 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -200,7 +200,7 @@ static int ps8640_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_u
 	pm_runtime_get_sync(dev);
 	ret = _ps8640_wait_hpd_asserted(ps_bridge, wait_us);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -355,7 +355,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	}
 	ret = ps8640_aux_transfer_msg(aux, msg);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 exit:
 	mutex_unlock(&ps_bridge->aux_lock);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9e31f750fd88..06e9e538f351 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -420,7 +420,7 @@ static int status_show(struct seq_file *s, void *data)
 		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
 	}
 
-	pm_runtime_put_autosuspend(pdata->dev);
+	__pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -626,7 +626,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 exit:
 	mutex_unlock(&pdata->comms_mutex);
 	pm_runtime_mark_last_busy(pdata->dev);
-	pm_runtime_put_autosuspend(pdata->dev);
+	__pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
 		return ret;
@@ -721,7 +721,7 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
@@ -1201,7 +1201,7 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
 
 	pm_runtime_get_sync(pdata->dev);
 	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
+	__pm_runtime_put_autosuspend(pdata->dev);
 
 	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
 					 : connector_status_disconnected;
@@ -1694,7 +1694,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 */
 	pm_runtime_get_sync(pdata->dev);
 	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
+	__pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
 		return ret;
@@ -1745,7 +1745,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 	 * it off and when it comes back it will have lost all state, but
 	 * that's OK because the default is input and we're now an input.
 	 */
-	pm_runtime_put_autosuspend(pdata->dev);
+	__pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -1771,7 +1771,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 				 SN_GPIO_MUX_OUTPUT << shift);
 	if (ret) {
 		clear_bit(offset, pdata->gchip_output);
-		pm_runtime_put_autosuspend(pdata->dev);
+		__pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..ffcf76af9585 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -896,14 +896,14 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	mutex_unlock(&gpu->lock);
 
 	pm_runtime_mark_last_busy(gpu->dev);
-	pm_runtime_put_autosuspend(gpu->dev);
+	__pm_runtime_put_autosuspend(gpu->dev);
 
 	return 0;
 
 fail:
 	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
-	pm_runtime_put_autosuspend(gpu->dev);
+	__pm_runtime_put_autosuspend(gpu->dev);
 
 	return ret;
 }
@@ -1090,7 +1090,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
-	pm_runtime_put_autosuspend(gpu->dev);
+	__pm_runtime_put_autosuspend(gpu->dev);
 
 	return ret;
 }
@@ -1217,7 +1217,7 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
 
 out_rpm:
 	for (i = 0; i < rpm_count; i++)
-		pm_runtime_put_autosuspend(gpu->dev);
+		__pm_runtime_put_autosuspend(gpu->dev);
 out:
 	for (i = 0; i < acquired; i++)
 		complete(&gpu->event_free);
@@ -1235,7 +1235,7 @@ static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
 		complete(&gpu->event_free);
 	}
 
-	pm_runtime_put_autosuspend(gpu->dev);
+	__pm_runtime_put_autosuspend(gpu->dev);
 }
 
 /*
@@ -1492,7 +1492,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
 	mutex_unlock(&gpu->lock);
 	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
-	pm_runtime_put_autosuspend(gpu->dev);
+	__pm_runtime_put_autosuspend(gpu->dev);
 }
 
 static void dump_mmu_fault(struct etnaviv_gpu *gpu)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 4d7ea65b7dd8..4ad9c39b52aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -968,7 +968,7 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 
 		ctx->task = NULL;
 		pm_runtime_mark_last_busy(ctx->dev);
-		pm_runtime_put_autosuspend(ctx->dev);
+		__pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, 0);
 	}
 
@@ -1120,7 +1120,7 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
 
 		ctx->task = NULL;
 		pm_runtime_mark_last_busy(ctx->dev);
-		pm_runtime_put_autosuspend(ctx->dev);
+		__pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, -EIO);
 	}
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 3a3b2c00e400..cb315077d5f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -882,7 +882,7 @@ static void g2d_runqueue_worker(struct work_struct *work)
 
 	if (runqueue_node) {
 		pm_runtime_mark_last_busy(g2d->dev);
-		pm_runtime_put_autosuspend(g2d->dev);
+		__pm_runtime_put_autosuspend(g2d->dev);
 
 		complete(&runqueue_node->complete);
 		if (runqueue_node->async)
@@ -1010,7 +1010,7 @@ static void g2d_wait_finish(struct g2d_data *g2d, struct drm_file *file)
 	 * So do this manually here.
 	 */
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	complete(&runqueue_node->complete);
 	if (runqueue_node->async)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 59fa22050717..0a85e746e3f8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1054,7 +1054,7 @@ static irqreturn_t gsc_irq_handler(int irq, void *dev_id)
 
 		ctx->task = NULL;
 		pm_runtime_mark_last_busy(ctx->dev);
-		pm_runtime_put_autosuspend(ctx->dev);
+		__pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, err);
 	}
 
@@ -1127,7 +1127,7 @@ static int gsc_commit(struct exynos_drm_ipp *ipp,
 
 	ret = gsc_reset(ctx);
 	if (ret) {
-		pm_runtime_put_autosuspend(ctx->dev);
+		__pm_runtime_put_autosuspend(ctx->dev);
 		ctx->task = NULL;
 		return ret;
 	}
@@ -1157,7 +1157,7 @@ static void gsc_abort(struct exynos_drm_ipp *ipp,
 
 		ctx->task = NULL;
 		pm_runtime_mark_last_busy(ctx->dev);
-		pm_runtime_put_autosuspend(ctx->dev);
+		__pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, -EIO);
 	}
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 2eb0b701672f..252555003a74 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -108,7 +108,7 @@ static irqreturn_t rotator_irq_handler(int irq, void *arg)
 
 		rot->task = NULL;
 		pm_runtime_mark_last_busy(rot->dev);
-		pm_runtime_put_autosuspend(rot->dev);
+		__pm_runtime_put_autosuspend(rot->dev);
 		exynos_drm_ipp_task_done(task,
 			irq_status == ROT_IRQ_STATUS_COMPLETE ? 0 : -EINVAL);
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 2788105ac780..0be5eaf1335e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -439,7 +439,7 @@ static irqreturn_t scaler_irq_handler(int irq, void *arg)
 
 		scaler->task = NULL;
 		pm_runtime_mark_last_busy(scaler->dev);
-		pm_runtime_put_autosuspend(scaler->dev);
+		__pm_runtime_put_autosuspend(scaler->dev);
 		exynos_drm_ipp_task_done(task, scaler_task_done(val));
 	}
 
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index a21f5a1c89bc..bceb94f8d2f8 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -304,7 +304,7 @@ static void __intel_runtime_pm_put(struct intel_runtime_pm *rpm,
 	intel_runtime_pm_release(rpm, wakelock);
 
 	pm_runtime_mark_last_busy(kdev);
-	pm_runtime_put_autosuspend(kdev);
+	__pm_runtime_put_autosuspend(kdev);
 }
 
 /**
@@ -415,7 +415,7 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
 	 * We drop that here and will reacquire it during unloading in
 	 * intel_power_domains_fini().
 	 */
-	pm_runtime_put_autosuspend(kdev);
+	__pm_runtime_put_autosuspend(kdev);
 }
 
 void intel_runtime_pm_disable(struct intel_runtime_pm *rpm)
diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index af91e45b5d13..48a4becb92e9 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -155,7 +155,7 @@ static void dcss_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 
 	pm_runtime_mark_last_busy(dcss->dev);
-	pm_runtime_put_autosuspend(dcss->dev);
+	__pm_runtime_put_autosuspend(dcss->dev);
 }
 
 static const struct drm_crtc_helper_funcs dcss_helper_funcs = {
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index b40c90e97d7e..c7e6e995c01b 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -196,7 +196,7 @@ static void lima_pm_idle(struct lima_device *ldev)
 
 	/* GPU can do auto runtime suspend */
 	pm_runtime_mark_last_busy(ldev->dev);
-	pm_runtime_put_autosuspend(ldev->dev);
+	__pm_runtime_put_autosuspend(ldev->dev);
 }
 
 static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cfc74a9e2646..8fc0c9ca14bd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -110,7 +110,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 		goto err_put_rpm;
 	}
 
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 #ifdef CONFIG_DEBUG_FS
 	if (gpu->funcs->debugfs_init) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 465a4cd14a43..fbe38f5c1ec8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -343,7 +343,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 
 			pm_runtime_get_sync(&gpu->pdev->dev);
 			ret = adreno_gpu->funcs->get_timestamp(gpu, value);
-			pm_runtime_put_autosuspend(&gpu->pdev->dev);
+			__pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
 			return ret;
 		}
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a274b8466423..8fcfa7e65848 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -687,7 +687,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	WARN_ON(gpu->active_submits < 0);
 	if (!gpu->active_submits) {
 		msm_devfreq_idle(gpu);
-		pm_runtime_put_autosuspend(&gpu->pdev->dev);
+		__pm_runtime_put_autosuspend(&gpu->pdev->dev);
 	}
 
 	mutex_unlock(&gpu->active_lock);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f9..ea478ab9fdbd 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -213,7 +213,7 @@ static void msm_iommu_tlb_flush_all(void *cookie)
 
 	pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);
 
-	pm_runtime_put_autosuspend(pagetable->iommu_dev);
+	__pm_runtime_put_autosuspend(pagetable->iommu_dev);
 }
 
 static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
@@ -229,7 +229,7 @@ static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
 
 	pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->cookie);
 
-	pm_runtime_put_autosuspend(pagetable->iommu_dev);
+	__pm_runtime_put_autosuspend(pagetable->iommu_dev);
 }
 
 static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325..4c003c884184 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -32,7 +32,7 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 	/* unwind old value: */
 	switch (ctx->sysprof) {
 	case 2:
-		pm_runtime_put_autosuspend(&gpu->pdev->dev);
+		__pm_runtime_put_autosuspend(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
 		refcount_dec(&gpu->sysprof_active);
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 767e47a2b0c1..0d3b9b9e410d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -532,7 +532,7 @@ static int panel_edp_prepare(struct drm_panel *panel)
 
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(panel->dev);
+		__pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
@@ -614,7 +614,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 		}
 
 		pm_runtime_mark_last_busy(panel->dev);
-		pm_runtime_put_autosuspend(panel->dev);
+		__pm_runtime_put_autosuspend(panel->dev);
 	}
 
 	if (has_hard_coded_modes)
@@ -826,7 +826,7 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 
 exit:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
@@ -919,7 +919,7 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 		pm_runtime_get_sync(dev);
 		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
 		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 
 		/*
 		 * Warn if we get an error, but don't consider it fatal. Having
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9a482a744b8c..65e7400adec1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -213,7 +213,7 @@ static int atana33xc20_prepare(struct drm_panel *panel)
 
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(panel->dev);
+		__pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
@@ -237,7 +237,7 @@ static int atana33xc20_get_modes(struct drm_panel *panel,
 	num = drm_edid_connector_add_modes(connector);
 
 	pm_runtime_mark_last_busy(panel->dev);
-	pm_runtime_put_autosuspend(panel->dev);
+	__pm_runtime_put_autosuspend(panel->dev);
 
 	return num;
 }
@@ -306,7 +306,7 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 	pm_runtime_get_sync(dev);
 	ret = drm_panel_dp_aux_backlight(&panel->base, aux_ep->aux);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	/*
 	 * Warn if we get an error, but don't consider it fatal. Having
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 86735430462f..b79bab689dae 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -312,7 +312,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	int ret;
 
 	pm_runtime_mark_last_busy(panel->dev);
-	ret = pm_runtime_put_autosuspend(panel->dev);
+	ret = __pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
 		return ret;
 
@@ -346,7 +346,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(panel->dev);
+		__pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
@@ -381,7 +381,7 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 		num += drm_edid_connector_add_modes(connector);
 
 		pm_runtime_mark_last_busy(panel->dev);
-		pm_runtime_put_autosuspend(panel->dev);
+		__pm_runtime_put_autosuspend(panel->dev);
 	}
 
 	/* add hard-coded panel modes */
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951d..7cf237f21ae1 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -250,7 +250,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_disable_autosuspend;
 
-	pm_runtime_put_autosuspend(ptdev->base.dev);
+	__pm_runtime_put_autosuspend(ptdev->base.dev);
 	return 0;
 
 err_disable_autosuspend:
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index eb9f6635cc12..9d342d660b71 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2412,7 +2412,7 @@ static void tick_work(struct work_struct *work)
 	if (ctx.idle_group_count == ctx.group_count) {
 		panthor_devfreq_record_idle(sched->ptdev);
 		if (sched->pm.has_ref) {
-			pm_runtime_put_autosuspend(ptdev->base.dev);
+			__pm_runtime_put_autosuspend(ptdev->base.dev);
 			sched->pm.has_ref = false;
 		}
 	} else {
@@ -2437,7 +2437,7 @@ static void tick_work(struct work_struct *work)
 out_unlock:
 	mutex_unlock(&sched->lock);
 	pm_runtime_mark_last_busy(ptdev->base.dev);
-	pm_runtime_put_autosuspend(ptdev->base.dev);
+	__pm_runtime_put_autosuspend(ptdev->base.dev);
 
 out_dev_exit:
 	drm_dev_exit(cookie);
@@ -3181,7 +3181,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 out_unlock:
 	mutex_unlock(&sched->lock);
 	pm_runtime_mark_last_busy(ptdev->base.dev);
-	pm_runtime_put_autosuspend(ptdev->base.dev);
+	__pm_runtime_put_autosuspend(ptdev->base.dev);
 
 	return done_fence;
 }
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 2430fcc97448..d9e8ec2f7a6c 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -503,7 +503,7 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data);
 
 	pm_runtime_mark_last_busy(client->base.dev);
-	pm_runtime_put_autosuspend(client->base.dev);
+	__pm_runtime_put_autosuspend(client->base.dev);
 }
 
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 2428b9aaa003..95060073cc5c 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -46,7 +46,7 @@ void tidss_runtime_put(struct tidss_device *tidss)
 
 	pm_runtime_mark_last_busy(tidss->dev);
 
-	r = pm_runtime_put_autosuspend(tidss->dev);
+	r = __pm_runtime_put_autosuspend(tidss->dev);
 	WARN_ON(r < 0);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 2423826c89eb..8a21a3a834e3 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -154,7 +154,7 @@ vc4_v3d_pm_put(struct vc4_dev *vc4)
 	mutex_lock(&vc4->power_lock);
 	if (--vc4->power_refcount == 0) {
 		pm_runtime_mark_last_busy(&vc4->v3d->pdev->dev);
-		pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
+		__pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
 	}
 	mutex_unlock(&vc4->power_lock);
 }
-- 
2.39.5

