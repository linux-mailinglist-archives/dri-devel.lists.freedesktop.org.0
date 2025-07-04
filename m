Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA292AF8A1E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C3710E96E;
	Fri,  4 Jul 2025 07:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENWQjsGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1020310E96E;
 Fri,  4 Jul 2025 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615669; x=1783151669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tmUXPuvlaoWz6QTEoX4UrTQSVfTa4IbL6SQssU7O328=;
 b=ENWQjsGrazwq8nxz6/CBO7l5hD4tVHZOhTNSy/og2+0xwuKZYYunO474
 qTqu7hipbUhUiUtKxv9xCq8QyK77MkQaI6XvkgORLwGa39WITUp+rHllg
 ZHRyMawzayWifUHoc8q30nAr45AXh+UbSSqWSlVz8LnwgP1u32kJQHlYd
 mjQ6//u9pyPiMsMhHa1T+vwez6Xrw+WBUVzUhVjcrLiko8Une/5nBlK/E
 3Ni8jJ2PFP1BG6EAK2CJjXYzYvJhymH6Wgwd0bbrcBrYLDm0nSbkoCCez
 Yun3Mw4wkiLCmgo1VwSTsqUTn9F3wMnjhJVhxele2iCl7CM+70swqlnRZ Q==;
X-CSE-ConnectionGUID: pl/5YSQfR3ewAblZCffQiA==
X-CSE-MsgGUID: DKAACobuSqSHkrw4iVsCXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494649"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:27 -0700
X-CSE-ConnectionGUID: a3aJ5VaaR5igeozOvPlyzg==
X-CSE-MsgGUID: dj9EO3sxTVqxwdDS7hTK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924289"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:15 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id 6099A44394;
 Fri,  4 Jul 2025 10:54:13 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Damon Ding <damon.ding@rock-chips.com>,
 Ayushi Makhija <quic_amakhija@quicinc.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 imx@lists.linux.dev, lima@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:13 +0300
Message-Id: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 --
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 2 --
 drivers/gpu/drm/bridge/parade-ps8640.c             | 2 --
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 1 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 4 ----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 2 --
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            | 2 --
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 2 --
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        | 1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         | 1 -
 drivers/gpu/drm/i915/intel_runtime_pm.c            | 2 --
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               | 1 -
 drivers/gpu/drm/lima/lima_sched.c                  | 1 -
 drivers/gpu/drm/panel/panel-edp.c                  | 3 ---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   | 2 --
 drivers/gpu/drm/panel/panel-simple.c               | 2 --
 drivers/gpu/drm/panthor/panthor_sched.c            | 2 --
 drivers/gpu/drm/tegra/submit.c                     | 1 -
 drivers/gpu/drm/tidss/tidss_drv.c                  | 2 --
 drivers/gpu/drm/vc4/vc4_v3d.c                      | 1 -
 20 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a1bc3e96dd35..2f815e2e02ca 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1452,7 +1452,6 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 
 	ret = analogix_dp_transfer(dp, msg);
 out:
-	pm_runtime_mark_last_busy(dp->dev);
 	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
@@ -1472,7 +1471,6 @@ static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned lon
 	ret = readx_poll_timeout(analogix_dp_get_plug_in_status, dp, val, !val,
 				 wait_us / 100, wait_us);
 
-	pm_runtime_mark_last_busy(dp->dev);
 	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0ac4a82c5a6e..9577409a2eb2 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1520,7 +1520,6 @@ static int anx7625_wait_hpd_asserted(struct drm_dp_aux *aux,
 
 	pm_runtime_get_sync(dev);
 	ret = _anx7625_hpd_polling(ctx, wait_us);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -1770,7 +1769,6 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 	if (!ret)
 		ret = anx7625_aux_trans(ctx, msg->request, msg->address,
 					msg->size, msg->buffer);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	mutex_unlock(&ctx->aux_lock);
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 825777a5758f..4f46ce2c908e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -198,7 +198,6 @@ static int ps8640_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_u
 	 */
 	pm_runtime_get_sync(dev);
 	ret = _ps8640_wait_hpd_asserted(ps_bridge, wait_us);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -353,7 +352,6 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 		goto exit;
 	}
 	ret = ps8640_aux_transfer_msg(aux, msg);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 exit:
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index db5cc4030238..fc100d4a6276 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -587,7 +587,6 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 
 exit:
 	mutex_unlock(&pdata->comms_mutex);
-	pm_runtime_mark_last_busy(pdata->dev);
 	pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..bc5a94dba2d4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -916,13 +916,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	etnaviv_gpu_hw_init(gpu);
 	mutex_unlock(&gpu->lock);
 
-	pm_runtime_mark_last_busy(gpu->dev);
 	pm_runtime_put_autosuspend(gpu->dev);
 
 	return 0;
 
 fail:
-	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 
@@ -1109,7 +1107,6 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	ret = 0;
 
-	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 
@@ -1509,7 +1506,6 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
 	etnaviv_gpu_hw_init(gpu);
 
 	mutex_unlock(&gpu->lock);
-	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 09e33a26caaf..13ce35443206 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -967,7 +967,6 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 		struct exynos_drm_ipp_task *task = ctx->task;
 
 		ctx->task = NULL;
-		pm_runtime_mark_last_busy(ctx->dev);
 		pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, 0);
 	}
@@ -1119,7 +1118,6 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
 		struct exynos_drm_ipp_task *task = ctx->task;
 
 		ctx->task = NULL;
-		pm_runtime_mark_last_busy(ctx->dev);
 		pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, -EIO);
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index d32f2474cbaa..58a830ffdcd7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -881,7 +881,6 @@ static void g2d_runqueue_worker(struct work_struct *work)
 	g2d->runqueue_node = NULL;
 
 	if (runqueue_node) {
-		pm_runtime_mark_last_busy(g2d->dev);
 		pm_runtime_put_autosuspend(g2d->dev);
 
 		complete(&runqueue_node->complete);
@@ -1009,7 +1008,6 @@ static void g2d_wait_finish(struct g2d_data *g2d, struct drm_file *file)
 	 * the IRQ which triggers the PM runtime put().
 	 * So do this manually here.
 	 */
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	complete(&runqueue_node->complete);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index e6d516e1976d..3b02126b7174 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1053,7 +1053,6 @@ static irqreturn_t gsc_irq_handler(int irq, void *dev_id)
 		struct exynos_drm_ipp_task *task = ctx->task;
 
 		ctx->task = NULL;
-		pm_runtime_mark_last_busy(ctx->dev);
 		pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, err);
 	}
@@ -1156,7 +1155,6 @@ static void gsc_abort(struct exynos_drm_ipp *ipp,
 		struct exynos_drm_ipp_task *task = ctx->task;
 
 		ctx->task = NULL;
-		pm_runtime_mark_last_busy(ctx->dev);
 		pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, -EIO);
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 7b0f4a98a70a..06a064f5d8b4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -107,7 +107,6 @@ static irqreturn_t rotator_irq_handler(int irq, void *arg)
 		struct exynos_drm_ipp_task *task = rot->task;
 
 		rot->task = NULL;
-		pm_runtime_mark_last_busy(rot->dev);
 		pm_runtime_put_autosuspend(rot->dev);
 		exynos_drm_ipp_task_done(task,
 			irq_status == ROT_IRQ_STATUS_COMPLETE ? 0 : -EINVAL);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index c8a1b6b0a29c..b59fa9973beb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -438,7 +438,6 @@ static irqreturn_t scaler_irq_handler(int irq, void *arg)
 		struct exynos_drm_ipp_task *task = scaler->task;
 
 		scaler->task = NULL;
-		pm_runtime_mark_last_busy(scaler->dev);
 		pm_runtime_put_autosuspend(scaler->dev);
 		exynos_drm_ipp_task_done(task, scaler_task_done(val));
 	}
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 7ce3e6de0c19..8e95afced2ce 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -305,7 +305,6 @@ static void __intel_runtime_pm_put(struct intel_runtime_pm *rpm,
 
 	intel_runtime_pm_release(rpm, wakelock);
 
-	pm_runtime_mark_last_busy(kdev);
 	pm_runtime_put_autosuspend(kdev);
 }
 
@@ -383,7 +382,6 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
 	dev_pm_set_driver_flags(kdev, DPM_FLAG_NO_DIRECT_COMPLETE);
 
 	pm_runtime_set_autosuspend_delay(kdev, 10000); /* 10s */
-	pm_runtime_mark_last_busy(kdev);
 
 	/*
 	 * Take a permanent reference to disable the RPM functionality and drop
diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index af91e45b5d13..7ad8dfd4367f 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -154,7 +154,6 @@ static void dcss_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	pm_runtime_mark_last_busy(dcss->dev);
 	pm_runtime_put_autosuspend(dcss->dev);
 }
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 954f4325b859..267d5b68031d 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -197,7 +197,6 @@ static void lima_pm_idle(struct lima_device *ldev)
 	lima_devfreq_record_idle(&ldev->devfreq);
 
 	/* GPU can do auto runtime suspend */
-	pm_runtime_mark_last_busy(ldev->dev);
 	pm_runtime_put_autosuspend(ldev->dev);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3796c41629cc..2de51e3ccca2 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -613,7 +613,6 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 			}
 		}
 
-		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
@@ -825,7 +824,6 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	}
 
 exit:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -917,7 +915,6 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	if (!panel->base.backlight && panel->aux) {
 		pm_runtime_get_sync(dev);
 		err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 
 		/*
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 20ec27d2d6c2..34a90ea4ba7b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -236,7 +236,6 @@ static int atana33xc20_get_modes(struct drm_panel *panel,
 
 	num = drm_edid_connector_add_modes(connector);
 
-	pm_runtime_mark_last_busy(panel->dev);
 	pm_runtime_put_autosuspend(panel->dev);
 
 	return num;
@@ -306,7 +305,6 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 
 	pm_runtime_get_sync(dev);
 	ret = drm_panel_dp_aux_backlight(&panel->base, aux_ep->aux);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	/*
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3333d4a07504..d6bdee56b32f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -320,7 +320,6 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	int ret;
 
-	pm_runtime_mark_last_busy(panel->dev);
 	ret = pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
 		return ret;
@@ -389,7 +388,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 
 		num += drm_edid_connector_add_modes(connector);
 
-		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a03..f635f26a23f4 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2446,7 +2446,6 @@ static void tick_work(struct work_struct *work)
 
 out_unlock:
 	mutex_unlock(&sched->lock);
-	pm_runtime_mark_last_busy(ptdev->base.dev);
 	pm_runtime_put_autosuspend(ptdev->base.dev);
 
 out_dev_exit:
@@ -3203,7 +3202,6 @@ queue_run_job(struct drm_sched_job *sched_job)
 
 out_unlock:
 	mutex_unlock(&sched->lock);
-	pm_runtime_mark_last_busy(ptdev->base.dev);
 	pm_runtime_put_autosuspend(ptdev->base.dev);
 
 	return done_fence;
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 2430fcc97448..5e0e76ebc5be 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -502,7 +502,6 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
-	pm_runtime_mark_last_busy(client->base.dev);
 	pm_runtime_put_autosuspend(client->base.dev);
 }
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index a1b12e52aca4..e7e02d6017b4 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -45,8 +45,6 @@ void tidss_runtime_put(struct tidss_device *tidss)
 
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
-	pm_runtime_mark_last_busy(tidss->dev);
-
 	r = pm_runtime_put_autosuspend(tidss->dev);
 	WARN_ON(r < 0);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index bb09df5000bd..11ec7e913974 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -153,7 +153,6 @@ vc4_v3d_pm_put(struct vc4_dev *vc4)
 
 	mutex_lock(&vc4->power_lock);
 	if (--vc4->power_refcount == 0) {
-		pm_runtime_mark_last_busy(&vc4->v3d->pdev->dev);
 		pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
 	}
 	mutex_unlock(&vc4->power_lock);
-- 
2.39.5

