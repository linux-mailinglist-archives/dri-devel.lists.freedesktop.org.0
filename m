Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D318C871
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568E46EACF;
	Fri, 20 Mar 2020 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13BD6EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:35:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c187so4201046wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziVyD9FCJN4HG2z3+da7r9GM//DAxlOZcLamqBGLWB0=;
 b=eKxP82kaHZyJ2eOg0JyFtYiy2cKsXjY0adzjQEVq23qlXCkR2f6z8Gy7qYqEbd/kaH
 6qhu/kx3rkL71nTzrj47WuHu3E4jqdTmRm6l5Nv2x1y189f7GZmuwuK5w5A9VtROo0hM
 miCaFOijdFJ3JIA6MIjvsqjAkkaH3g9I3PKQMntQSZmptg70T+idWOPaGJVyJtfoBWJy
 vOACXlbUGDdynVBTAmpW0ouxh1ImCDRtaWXrbIYbN70SIAT5iChKU4IwnKgywwzIQVnH
 CmPeQ2ByVTARCZELAiZ7iNOSet7dqUbhExQCVAVtiebHOnF+YEwYLMSW/y1DaJg/LBtU
 dsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziVyD9FCJN4HG2z3+da7r9GM//DAxlOZcLamqBGLWB0=;
 b=tRaP8e5aCkaHWqcJRrs9I0xkV3a7kj0x8vuCsCcicJeFcnRXrQxUxYwYGq7qPf3Kc1
 Yuiev6aoVTxuhGJ6Rgzs/XrsFXfmBx8c4dziXS+FWHijMZvAan9S+Jkl/E6vTlEzTh4I
 nsANu9VhW0VDzv+UGZk3uqFBFOGLgK+lFsdesboa4nUi7KaEdynygwyhKZZPPi7nWnaP
 z8ffVtiWWYLY8u3TX5eQhKjWQ43/jO41jKBBFS332ZnHEzhbEx6Im9GJ2sc1DGjemYzj
 AuNYoHKhMrQPBgAcLA115vHD3AtqUewtTtT9OcPtjPNWYX7bvad5zcdZwvmIR1HVW8wP
 wrew==
X-Gm-Message-State: ANhLgQ1gD06gg5sMlbIVaMPCyjXBRvpjaH1NXcri0jbOdOiwq/dvbkex
 gFXWg64nzkTLut0vc9FyMsNkoPUu7oY=
X-Google-Smtp-Source: ADFU+vsUytrUAI2t+cc3E1j9XRtenXcuMyKcFRE0qTNjCbNH+P0lzplaW3CcIr8Evw/umHjSzkzxnA==
X-Received: by 2002:a1c:ba06:: with SMTP id k6mr5553945wmf.136.1584650103166; 
 Thu, 19 Mar 2020 13:35:03 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r9sm4744968wma.47.2020.03.19.13.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:35:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/lima: Add optional devfreq and cooling device
 support
Date: Thu, 19 Mar 2020 21:34:27 +0100
Message-Id: <20200319203427.2259891-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most platforms with a Mali-400 or Mali-450 GPU also have support for
changing the GPU clock frequency. Add devfreq support so the GPU clock
rate is updated based on the actual GPU usage when the
"operating-points-v2" property is present in the board.dts.

The actual devfreq code is taken from panfrost_devfreq.c and modified so
it matches what the lima hardware needs:
- a call to dev_pm_opp_set_clkname() during initialization because there
  are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
  the GPU so we need to control it using devfreq.
- locking when reading or writing the devfreq statistics because (unlike
  than panfrost) we have multiple PP and GP IRQs which may finish jobs
  concurrently.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/lima/Kconfig        |   2 +
 drivers/gpu/drm/lima/Makefile       |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c | 234 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  41 +++++
 drivers/gpu/drm/lima/lima_device.c  |   4 +
 drivers/gpu/drm/lima/lima_device.h  |   3 +
 drivers/gpu/drm/lima/lima_drv.c     |  14 +-
 drivers/gpu/drm/lima/lima_sched.c   |   7 +
 drivers/gpu/drm/lima/lima_sched.h   |   3 +
 9 files changed, 308 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
index d589f09d04d9..fa1d4f5df31e 100644
--- a/drivers/gpu/drm/lima/Kconfig
+++ b/drivers/gpu/drm/lima/Kconfig
@@ -10,5 +10,7 @@ config DRM_LIMA
        depends on OF
        select DRM_SCHED
        select DRM_GEM_SHMEM_HELPER
+       select PM_DEVFREQ
+       select DEVFREQ_GOV_SIMPLE_ONDEMAND
        help
 	 DRM driver for ARM Mali 400/450 GPUs.
diff --git a/drivers/gpu/drm/lima/Makefile b/drivers/gpu/drm/lima/Makefile
index a85444b0a1d4..5e5c29875e9c 100644
--- a/drivers/gpu/drm/lima/Makefile
+++ b/drivers/gpu/drm/lima/Makefile
@@ -14,6 +14,7 @@ lima-y := \
 	lima_sched.o \
 	lima_ctx.o \
 	lima_dlbu.o \
-	lima_bcast.o
+	lima_bcast.o \
+	lima_devfreq.o
 
 obj-$(CONFIG_DRM_LIMA) += lima.o
diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
new file mode 100644
index 000000000000..8c4d21d07529
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ *
+ * Based on panfrost_devfreq.c:
+ *   Copyright 2019 Collabora ltd.
+ */
+#include <linux/clk.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/property.h>
+
+#include "lima_device.h"
+#include "lima_devfreq.h"
+
+static void lima_devfreq_update_utilization(struct lima_devfreq *devfreq)
+{
+	ktime_t now, last;
+
+	now = ktime_get();
+	last = devfreq->time_last_update;
+
+	if (devfreq->busy_count > 0)
+		devfreq->busy_time += ktime_sub(now, last);
+	else
+		devfreq->idle_time += ktime_sub(now, last);
+
+	devfreq->time_last_update = now;
+}
+
+static int lima_devfreq_target(struct device *dev, unsigned long *freq,
+			       u32 flags)
+{
+	struct dev_pm_opp *opp;
+	int err;
+
+	opp = devfreq_recommended_opp(dev, freq, flags);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	err = dev_pm_opp_set_rate(dev, *freq);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void lima_devfreq_reset(struct lima_devfreq *devfreq)
+{
+	devfreq->busy_time = 0;
+	devfreq->idle_time = 0;
+	devfreq->time_last_update = ktime_get();
+}
+
+static int lima_devfreq_get_dev_status(struct device *dev,
+				       struct devfreq_dev_status *status)
+{
+	struct lima_device *ldev = dev_get_drvdata(dev);
+	struct lima_devfreq *devfreq = &ldev->devfreq;
+	unsigned long irqflags;
+
+	status->current_frequency = clk_get_rate(ldev->clk_gpu);
+
+	spin_lock_irqsave(&devfreq->lock, irqflags);
+
+	lima_devfreq_update_utilization(devfreq);
+
+	status->total_time = ktime_to_ns(ktime_add(devfreq->busy_time,
+						   devfreq->idle_time));
+	status->busy_time = ktime_to_ns(devfreq->busy_time);
+
+	lima_devfreq_reset(devfreq);
+
+	spin_unlock_irqrestore(&devfreq->lock, irqflags);
+
+	dev_dbg(ldev->dev, "busy %lu total %lu %lu %% freq %lu MHz\n",
+		status->busy_time, status->total_time,
+		status->busy_time / (status->total_time / 100),
+		status->current_frequency / 1000 / 1000);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile lima_devfreq_profile = {
+	.polling_ms = 50, /* ~3 frames */
+	.target = lima_devfreq_target,
+	.get_dev_status = lima_devfreq_get_dev_status,
+};
+
+void lima_devfreq_fini(struct lima_device *ldev)
+{
+	struct lima_devfreq *devfreq = &ldev->devfreq;
+
+	if (devfreq->cooling) {
+		devfreq_cooling_unregister(devfreq->cooling);
+		devfreq->cooling = NULL;
+	}
+
+	if (devfreq->devfreq) {
+		devm_devfreq_remove_device(&ldev->pdev->dev,
+					   devfreq->devfreq);
+		devfreq->devfreq = NULL;
+	}
+
+	if (devfreq->opp_of_table_added) {
+		dev_pm_opp_of_remove_table(&ldev->pdev->dev);
+		devfreq->opp_of_table_added = false;
+	}
+
+	if (devfreq->regulators_opp_table) {
+		dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
+		devfreq->regulators_opp_table = NULL;
+	}
+
+	if (devfreq->clkname_opp_table) {
+		dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
+		devfreq->clkname_opp_table = NULL;
+	}
+}
+
+int lima_devfreq_init(struct lima_device *ldev)
+{
+	struct thermal_cooling_device *cooling;
+	struct device *dev = &ldev->pdev->dev;
+	struct opp_table *opp_table;
+	struct devfreq *devfreq;
+	struct lima_devfreq *ldevfreq = &ldev->devfreq;
+	struct dev_pm_opp *opp;
+	unsigned long cur_freq;
+	int ret;
+
+	if (!device_property_present(dev, "operating-points-v2"))
+		/* Optional, continue without devfreq */
+		return 0;
+
+	spin_lock_init(&ldevfreq->lock);
+
+	opp_table = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
+		goto err_fini;
+	}
+
+	ldevfreq->clkname_opp_table = opp_table;
+
+	opp_table = dev_pm_opp_set_regulators(dev,
+					      (const char *[]){ "mali" },
+					      1);
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
+
+		/* Continue if the optional regulator is missing */
+		if (ret != -ENODEV)
+			goto err_fini;
+	} else {
+		ldevfreq->regulators_opp_table = opp_table;
+	}
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret)
+		goto err_fini;
+	ldevfreq->opp_of_table_added = true;
+
+	lima_devfreq_reset(ldevfreq);
+
+	cur_freq = clk_get_rate(ldev->clk_gpu);
+
+	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		goto err_fini;
+	}
+
+	lima_devfreq_profile.initial_freq = cur_freq;
+	dev_pm_opp_put(opp);
+
+	devfreq = devm_devfreq_add_device(dev, &lima_devfreq_profile,
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
+	if (IS_ERR(devfreq)) {
+		dev_err(dev, "Couldn't initialize GPU devfreq\n");
+		ret = PTR_ERR(devfreq);
+		goto err_fini;
+	}
+
+	ldevfreq->devfreq = devfreq;
+
+	cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
+	if (IS_ERR(cooling))
+		dev_info(dev, "Failed to register cooling device\n");
+	else
+		ldevfreq->cooling = cooling;
+
+	return 0;
+
+err_fini:
+	lima_devfreq_fini(ldev);
+	return ret;
+}
+
+void lima_devfreq_record_busy(struct lima_devfreq *devfreq)
+{
+	unsigned long irqflags;
+
+	if (!devfreq->devfreq)
+		return;
+
+	spin_lock_irqsave(&devfreq->lock, irqflags);
+
+	lima_devfreq_update_utilization(devfreq);
+
+	devfreq->busy_count++;
+
+	spin_unlock_irqrestore(&devfreq->lock, irqflags);
+}
+
+void lima_devfreq_record_idle(struct lima_devfreq *devfreq)
+{
+	unsigned long irqflags;
+
+	if (!devfreq->devfreq)
+		return;
+
+	spin_lock_irqsave(&devfreq->lock, irqflags);
+
+	lima_devfreq_update_utilization(devfreq);
+
+	WARN_ON(--devfreq->busy_count < 0);
+
+	spin_unlock_irqrestore(&devfreq->lock, irqflags);
+}
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
new file mode 100644
index 000000000000..8d71ba9fb22a
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com> */
+
+#ifndef __LIMA_DEVFREQ_H__
+#define __LIMA_DEVFREQ_H__
+
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+
+struct devfreq;
+struct opp_table;
+struct thermal_cooling_device;
+
+struct lima_device;
+
+struct lima_devfreq {
+	struct devfreq *devfreq;
+	struct opp_table *clkname_opp_table;
+	struct opp_table *regulators_opp_table;
+	struct thermal_cooling_device *cooling;
+	bool opp_of_table_added;
+
+	ktime_t busy_time;
+	ktime_t idle_time;
+	ktime_t time_last_update;
+	int busy_count;
+	/*
+	 * Protect busy_time, idle_time, time_last_update and busy_count
+	 * because these can be updated concurrently, for example by the GP
+	 * and PP interrupts.
+	 */
+	spinlock_t lock;
+};
+
+int lima_devfreq_init(struct lima_device *ldev);
+void lima_devfreq_fini(struct lima_device *ldev);
+
+void lima_devfreq_record_busy(struct lima_devfreq *devfreq);
+void lima_devfreq_record_idle(struct lima_devfreq *devfreq);
+
+#endif
diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 19829b543024..7f1f7a1c03e5 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -214,6 +214,8 @@ static int lima_init_gp_pipe(struct lima_device *dev)
 	struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_gp;
 	int err;
 
+	pipe->ldev = dev;
+
 	err = lima_sched_pipe_init(pipe, "gp");
 	if (err)
 		return err;
@@ -244,6 +246,8 @@ static int lima_init_pp_pipe(struct lima_device *dev)
 	struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_pp;
 	int err, i;
 
+	pipe->ldev = dev;
+
 	err = lima_sched_pipe_init(pipe, "pp");
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 31158d86271c..d6c0f8b8f7e8 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include "lima_sched.h"
+#include "lima_devfreq.h"
 
 enum lima_gpu_id {
 	lima_gpu_mali400 = 0,
@@ -94,6 +95,8 @@ struct lima_device {
 
 	u32 *dlbu_cpu;
 	dma_addr_t dlbu_dma;
+
+	struct lima_devfreq devfreq;
 };
 
 static inline struct lima_device *
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 2daac64d8955..d9f64e52ae9e 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -10,6 +10,7 @@
 #include <drm/drm_prime.h>
 #include <drm/lima_drm.h>
 
+#include "lima_device.h"
 #include "lima_drv.h"
 #include "lima_gem.h"
 #include "lima_vm.h"
@@ -306,18 +307,26 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	if (err)
 		goto err_out1;
 
+	err = lima_devfreq_init(ldev);
+	if (err) {
+		dev_err(&pdev->dev, "Fatal error during devfreq init\n");
+		goto err_out2;
+	}
+
 	/*
 	 * Register the DRM device with the core and the connectors with
 	 * sysfs.
 	 */
 	err = drm_dev_register(ddev, 0);
 	if (err < 0)
-		goto err_out2;
+		goto err_out3;
 
 	return 0;
 
-err_out2:
+err_out3:
 	lima_device_fini(ldev);
+err_out2:
+	lima_devfreq_fini(ldev);
 err_out1:
 	drm_dev_put(ddev);
 err_out0:
@@ -331,6 +340,7 @@ static int lima_pdev_remove(struct platform_device *pdev)
 	struct drm_device *ddev = ldev->ddev;
 
 	drm_dev_unregister(ddev);
+	lima_devfreq_fini(ldev);
 	lima_device_fini(ldev);
 	drm_dev_put(ddev);
 	lima_sched_slab_fini();
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 3886999b4533..d937d626b892 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/xarray.h>
 
+#include "lima_devfreq.h"
 #include "lima_drv.h"
 #include "lima_sched.h"
 #include "lima_vm.h"
@@ -214,6 +215,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	 */
 	ret = dma_fence_get(task->fence);
 
+	lima_devfreq_record_busy(&pipe->ldev->devfreq);
+
 	pipe->current_task = task;
 
 	/* this is needed for MMU to work correctly, otherwise GP/PP
@@ -285,6 +288,8 @@ static void lima_sched_timedout_job(struct drm_sched_job *job)
 	pipe->current_vm = NULL;
 	pipe->current_task = NULL;
 
+	lima_devfreq_record_idle(&pipe->ldev->devfreq);
+
 	drm_sched_resubmit_jobs(&pipe->base);
 	drm_sched_start(&pipe->base, true);
 }
@@ -364,5 +369,7 @@ void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
 	} else {
 		pipe->task_fini(pipe);
 		dma_fence_signal(task->fence);
+
+		lima_devfreq_record_idle(&pipe->ldev->devfreq);
 	}
 }
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index d64393fb50a9..19bbc5214cf2 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -6,6 +6,7 @@
 
 #include <drm/gpu_scheduler.h>
 
+struct lima_device;
 struct lima_vm;
 
 struct lima_sched_task {
@@ -44,6 +45,8 @@ struct lima_sched_pipe {
 	u32 fence_seqno;
 	spinlock_t fence_lock;
 
+	struct lima_device *ldev;
+
 	struct lima_sched_task *current_task;
 	struct lima_vm *current_vm;
 
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
