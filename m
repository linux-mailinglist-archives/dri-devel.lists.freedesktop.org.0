Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C233552BB6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23E21126DD;
	Tue, 21 Jun 2022 07:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059ED1126A2;
 Tue, 21 Jun 2022 07:21:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kq6so25475912ejb.11;
 Tue, 21 Jun 2022 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M7igW8eszoZT6WZ3jDv76+6QMOtlL+86zPzbbKCOfSA=;
 b=eCQeZXQB7xHXjg5HtLoVc2TBHIMAHPj9t7+hAnRAUCOSZy4FapwHBeTK+seVoxtqJJ
 6rQCKTF7n8sOSOPNBoEGJHgc2aJ+9EA3RVcEaK2772ILxOAXVcyIRraQ8zkW9EWmKjDZ
 ass9XC8I659suvHKM+CGqadKqHljxn3TK4m6VMMOeYr3mUI/Ski0gWDlvSyuZQo+MwEx
 7wsF7oWJRcnn3srgcQGIYSPH+jOstEl/RLIvzrr8AlYA3SViC21qMIR83sJmHQEDf9Fb
 bvxfFZAR64p7yuW2pPJtgVU7dQUOGU+pKb5aEc9JeIFR3Skd0i2Px8D82jm8TSEgff14
 YhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M7igW8eszoZT6WZ3jDv76+6QMOtlL+86zPzbbKCOfSA=;
 b=lKBIZVbKh+WGqoZfDHT4hxP9meb1Tyy26h+urSumM2UPQbeNRaSe7Wtbj9WImt6JUZ
 2wRGs6aMgAN8u1F1lbjdc6atF0CsL1VvXqdEGJwdwe7zhSj3kneBZ/oMyhll9hkl93tn
 1ye+ZlUTxnaR7NZ6O4hg6tqwtjQP6de4wZH7Fd8brU9ZcLtpYMbsCMU/w1kZ9tM2ku3h
 rFG3oYZeSEw9oUMEGtQ8Tsy2dnCgHtm2fZD+0IK5C4GXfzwNu6gk7HwL4+11keRpdsL3
 e0IGduDgeKowKwCMXh+owhx2cspc/kjniFgY5rP3gI4azXn2va7hGMO9q+YOklsr9kaz
 Uicg==
X-Gm-Message-State: AJIora+zbW9ntu2PduwieacjbsN9iuVI2VhG+o4n6Qs2ja1C0Z3ZAHfu
 VD4roorcfn1TvQ9eRaCdIsI=
X-Google-Smtp-Source: AGRyM1v1tW2mODL88pIyRoU3mVOnBn6xxAxaFrLbYGlVQ9TPCoJgVAwG+uQU40Icvlmuf14MrGxgFA==
X-Received: by 2002:a17:906:5187:b0:712:477:df9b with SMTP id
 y7-20020a170906518700b007120477df9bmr24526440ejk.424.1655796076836; 
 Tue, 21 Jun 2022 00:21:16 -0700 (PDT)
Received: from localhost.localdomain.info
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b00722e771007fsm50711ejo.37.2022.06.21.00.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:21:15 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/etnaviv: add loadavg accounting
Date: Tue, 21 Jun 2022 09:20:48 +0200
Message-Id: <20220621072050.76229-3-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621072050.76229-1-christian.gmeiner@gmail.com>
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU has an idle state register where each bit represents the idle
state of a sub-GPU component like FE or TX. Sample this register
every 10ms and calculate a simple moving average over the sub-GPU
component idle states with a total observation time frame of 1s.

This provides us with a percentage based load of each sub-GPU
component.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 14 ++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 64 ++++++++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 37 ++++++++++++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1d2b4fb4bcf8..d5c6115e56bd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -46,6 +46,19 @@ static void load_gpu(struct drm_device *dev)
 	}
 }
 
+static void unload_gpu(struct drm_device *dev)
+{
+	struct etnaviv_drm_private *priv = dev->dev_private;
+	unsigned int i;
+
+	for (i = 0; i < ETNA_MAX_PIPES; i++) {
+		struct etnaviv_gpu *g = priv->gpu[i];
+
+		if (g)
+			etnaviv_gpu_shutdown(g);
+	}
+}
+
 static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct etnaviv_drm_private *priv = dev->dev_private;
@@ -557,6 +570,7 @@ static void etnaviv_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct etnaviv_drm_private *priv = drm->dev_private;
 
+	unload_gpu(drm);
 	drm_dev_unregister(drm);
 
 	component_unbind_all(dev, drm);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..202002ae75ee 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -27,6 +27,8 @@
 #include "state_hi.xml.h"
 #include "cmdstream.xml.h"
 
+static const ktime_t loadavg_polling_frequency = 10 * NSEC_PER_MSEC;
+
 static const struct platform_device_id gpu_ids[] = {
 	{ .name = "etnaviv-gpu,2d" },
 	{ },
@@ -745,6 +747,32 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 	gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
 }
 
+static enum hrtimer_restart etnaviv_loadavg_function(struct hrtimer *t)
+{
+	struct etnaviv_gpu *gpu = container_of(t, struct etnaviv_gpu, loadavg_timer);
+	const u32 idle = gpu_read(gpu, VIVS_HI_IDLE_STATE);
+	int i;
+
+	gpu->loadavg_last_sample_time = ktime_get();
+
+	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
+		if ((idle & etna_idle_module_names[i].bit))
+			sma_loadavg_add(&gpu->loadavg_value[i], 0);
+		else
+			sma_loadavg_add(&gpu->loadavg_value[i], 100);
+
+	spin_lock(&gpu->loadavg_spinlock);
+
+	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
+		gpu->loadavg_percentage[i] = sma_loadavg_read(&gpu->loadavg_value[i]);
+
+	spin_unlock(&gpu->loadavg_spinlock);
+
+	hrtimer_forward_now(t, loadavg_polling_frequency);
+
+	return HRTIMER_RESTART;
+}
+
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 {
 	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
@@ -839,6 +867,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	for (i = 0; i < ARRAY_SIZE(gpu->event); i++)
 		complete(&gpu->event_free);
 
+	/* Setup loadavg timer */
+	hrtimer_init(&gpu->loadavg_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_SOFT);
+	gpu->loadavg_timer.function = etnaviv_loadavg_function;
+	hrtimer_start(&gpu->loadavg_timer, loadavg_polling_frequency, HRTIMER_MODE_ABS_SOFT);
+
 	/* Now program the hardware */
 	mutex_lock(&gpu->lock);
 	etnaviv_gpu_hw_init(gpu);
@@ -859,6 +892,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	return ret;
 }
 
+void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu)
+{
+	hrtimer_cancel(&gpu->loadavg_timer);
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct dma_debug {
 	u32 address[2];
@@ -1585,6 +1623,8 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
 static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 {
 	if (gpu->initialized && gpu->fe_running) {
+		hrtimer_cancel(&gpu->loadavg_timer);
+
 		/* Replace the last WAIT with END */
 		mutex_lock(&gpu->lock);
 		etnaviv_buffer_end(gpu);
@@ -1608,7 +1648,8 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 #ifdef CONFIG_PM
 static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
 {
-	int ret;
+	s64 missing_samples;
+	int ret, i, j;
 
 	ret = mutex_lock_killable(&gpu->lock);
 	if (ret)
@@ -1617,7 +1658,27 @@ static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
 	etnaviv_gpu_update_clock(gpu);
 	etnaviv_gpu_hw_init(gpu);
 
+	/* Update loadavg based on delta of suspend and resume ktime.
+	 *
+	 * Our SMA algorithm uses a fixed size of 100 items to be able
+	 * to calculate the mean over one second as we sample every 10ms.
+	 */
+	missing_samples = div_s64(ktime_ms_delta(ktime_get(), gpu->loadavg_last_sample_time), 10);
+	missing_samples = min(missing_samples, (s64)100);
+
+	spin_lock_bh(&gpu->loadavg_spinlock);
+
+	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++) {
+		struct sma_loadavg *loadavg = &gpu->loadavg_value[i];
+
+		for (j = 0; j < missing_samples; j++)
+			sma_loadavg_add(loadavg, 0);
+	}
+
+	spin_unlock_bh(&gpu->loadavg_spinlock);
+
 	mutex_unlock(&gpu->lock);
+	hrtimer_start(&gpu->loadavg_timer, loadavg_polling_frequency, HRTIMER_MODE_ABS_SOFT);
 
 	return 0;
 }
@@ -1787,6 +1848,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	gpu->dev = &pdev->dev;
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->fence_lock);
+	spin_lock_init(&gpu->loadavg_spinlock);
 
 	/* Map registers: */
 	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..881f071f640e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -10,6 +10,8 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_drv.h"
+#include "etnaviv_sma.h"
+#include "state_hi.xml.h"
 
 struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
@@ -91,6 +93,33 @@ struct clk;
 
 #define ETNA_NR_EVENTS 30
 
+DECLARE_SMA(loadavg, 100)
+
+static const struct {
+    const char *name;
+    u32 bit;
+} etna_idle_module_names[] = {
+    { "FE", VIVS_HI_IDLE_STATE_FE },
+    { "DE", VIVS_HI_IDLE_STATE_DE },
+    { "PE", VIVS_HI_IDLE_STATE_PE },
+    { "SH", VIVS_HI_IDLE_STATE_SH },
+    { "PA", VIVS_HI_IDLE_STATE_PA },
+    { "SE", VIVS_HI_IDLE_STATE_SE },
+    { "RA", VIVS_HI_IDLE_STATE_RA },
+    { "TX", VIVS_HI_IDLE_STATE_TX },
+    { "VG", VIVS_HI_IDLE_STATE_VG },
+    { "IM", VIVS_HI_IDLE_STATE_IM },
+    { "FP", VIVS_HI_IDLE_STATE_FP },
+    { "TS", VIVS_HI_IDLE_STATE_TS },
+    { "BL", VIVS_HI_IDLE_STATE_BL },
+    { "ASYNCFE", VIVS_HI_IDLE_STATE_ASYNCFE },
+    { "MC", VIVS_HI_IDLE_STATE_MC },
+    { "PPA", VIVS_HI_IDLE_STATE_PPA },
+    { "WD", VIVS_HI_IDLE_STATE_WD },
+    { "NN", VIVS_HI_IDLE_STATE_NN },
+    { "TP", VIVS_HI_IDLE_STATE_TP },
+};
+
 struct etnaviv_gpu {
 	struct drm_device *drm;
 	struct thermal_cooling_device *cooling;
@@ -147,6 +176,13 @@ struct etnaviv_gpu {
 	unsigned int freq_scale;
 	unsigned long base_rate_core;
 	unsigned long base_rate_shader;
+
+	/* Loadavg: */
+	struct hrtimer loadavg_timer;
+	spinlock_t loadavg_spinlock;
+	ktime_t loadavg_last_sample_time;
+	struct sma_loadavg loadavg_value[ARRAY_SIZE(etna_idle_module_names)];
+	unsigned int loadavg_percentage[ARRAY_SIZE(etna_idle_module_names)];
 };
 
 static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
@@ -162,6 +198,7 @@ static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
+void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu);
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.36.1

