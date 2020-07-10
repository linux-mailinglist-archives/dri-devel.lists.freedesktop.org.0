Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B421B060
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B736EB79;
	Fri, 10 Jul 2020 07:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968CC6EB7A;
 Fri, 10 Jul 2020 07:42:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s10so4841956wrw.12;
 Fri, 10 Jul 2020 00:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mceKfuwvPXw4LfrpyxKXBpFo3LdMDItWoA8IgjhJzM=;
 b=mcCbx+W49m9LaQeY0TxVhVcgEjnTx9nW3d/ss0DtdCpyvY5Bnn3B+a48gtIEgI1DO7
 xy3lDOplcyTNmxpEJQxl43FBedxE77A0ZEdrT4ViB/RLPNL3QdcjVMUd0MvCt96UwBtu
 KyAzuiK3G9jaO+AELzbhxfAL/JutZ4D6DKSFC1m1Oq3KduZQ9eb1UWO033iu7tst9GHV
 lBaWo5FBQFw1zBtHncb3h9E9hd5OzNgtDMxrzX+751hygtFm7sxCD5LQHJwVYlrs+YlA
 XYq8K2dE3z5rQOCpLQYmYbRR1XOw7VrNqMeAaqupZefrDwAtF5NPhCHXXLFrL4dZKRxo
 bMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mceKfuwvPXw4LfrpyxKXBpFo3LdMDItWoA8IgjhJzM=;
 b=IquuihwjDq3e21WflhTN08Eq8f76hEx/NOV1Qin10q5RCewEW8A7MMPq84SjTzy/MK
 LhbJK6xoI3OWGoxyHIlB55AswhAswcUvaMDfuUH5TkaJFcYDeecmnIqJAMW/PRY2T8jP
 2OCHHwazM4Hk8PvY5I//qqeds875IDUMZM6/Pe2Yyw9YC87Q1FpAYHPWApafArtGEgLG
 sPccb5XhtFiNS71k9w82l97ApMBIuAVG/oXRG5vo1pd1w4UK/XjtCknpguc8u2jlbRuO
 xaUW5Nd5ta+3PMueP4nn8tJbiVrHNpv5TchsLdVvxBGK0TOYB9sRcK21Mlz0Ma+jHkby
 psTg==
X-Gm-Message-State: AOAM533Qju+Eeua6UkVRVkTfSfggRAsXW5FO2bh3VTSLOaBSclpf1euv
 EAIRBRMhlwRNwZXJU+r124g=
X-Google-Smtp-Source: ABdhPJyOxotx4CP1hcQHbzgM1hkwOyWlgVipkFmV8WlfQG4DDW0G9qoaG6e9fQoF2Rn2zm7qWcBvjw==
X-Received: by 2002:adf:9404:: with SMTP id 4mr64952829wrq.367.1594366930282; 
 Fri, 10 Jul 2020 00:42:10 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id p17sm7951375wma.47.2020.07.10.00.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 00:42:09 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/etnaviv: add loadavg accounting
Date: Fri, 10 Jul 2020 09:41:25 +0200
Message-Id: <20200710074143.306787-3-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710074143.306787-1-christian.gmeiner@gmail.com>
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 14 ++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 29 ++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index f9afe11c50f0..b31920241c86 100644
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
@@ -581,6 +594,7 @@ static void etnaviv_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct etnaviv_drm_private *priv = drm->dev_private;
 
+	unload_gpu(drm);
 	drm_dev_unregister(drm);
 
 	component_unbind_all(dev, drm);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b297..1f0eb7e00657 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -714,6 +714,28 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 	gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
 }
 
+static void etnaviv_loadavg_function(struct timer_list *t)
+{
+	struct etnaviv_gpu *gpu = from_timer(gpu, t, loadavg_timer);
+	const u32 idle = gpu_read(gpu, VIVS_HI_IDLE_STATE);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
+		if ((idle & etna_idle_module_names[i].bit))
+			sma_loadavg_add(&gpu->loadavg_value[i], 0);
+		else
+			sma_loadavg_add(&gpu->loadavg_value[i], 100);
+
+	spin_lock_bh(&gpu->loadavg_spinlock);
+
+	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
+		gpu->loadavg_percentage[i] = sma_loadavg_read(&gpu->loadavg_value[i]);
+
+	spin_unlock_bh(&gpu->loadavg_spinlock);
+
+	mod_timer(t, jiffies + msecs_to_jiffies(10));
+}
+
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 {
 	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
@@ -804,6 +826,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	for (i = 0; i < ARRAY_SIZE(gpu->event); i++)
 		complete(&gpu->event_free);
 
+	/* Setup loadavg timer */
+	timer_setup(&gpu->loadavg_timer, etnaviv_loadavg_function, 0);
+	mod_timer(&gpu->loadavg_timer, jiffies + msecs_to_jiffies(10));
+
 	/* Now program the hardware */
 	mutex_lock(&gpu->lock);
 	etnaviv_gpu_hw_init(gpu);
@@ -824,6 +850,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	return ret;
 }
 
+void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu)
+{
+	del_timer(&gpu->loadavg_timer);
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct dma_debug {
 	u32 address[2];
@@ -1762,6 +1793,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	gpu->dev = &pdev->dev;
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->fence_lock);
+	spin_lock_init(&gpu->loadavg_spinlock);
 
 	/* Map registers: */
 	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 8ea48697d132..a5b9c89c6744 100644
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
@@ -91,6 +93,26 @@ struct clk;
 
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
+};
+
 struct etnaviv_gpu {
 	struct drm_device *drm;
 	struct thermal_cooling_device *cooling;
@@ -145,6 +167,12 @@ struct etnaviv_gpu {
 	unsigned int freq_scale;
 	unsigned long base_rate_core;
 	unsigned long base_rate_shader;
+
+	/* Loadavg: */
+	struct timer_list loadavg_timer;
+	spinlock_t loadavg_spinlock;
+	struct sma_loadavg loadavg_value[ARRAY_SIZE(etna_idle_module_names)];
+	unsigned int loadavg_percentage[ARRAY_SIZE(etna_idle_module_names)];
 };
 
 static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
@@ -160,6 +188,7 @@ static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
+void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu);
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
