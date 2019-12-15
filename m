Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1D11FFC4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D223F6E43A;
	Mon, 16 Dec 2019 08:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46B46E151;
 Sun, 15 Dec 2019 21:12:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so4519463wma.1;
 Sun, 15 Dec 2019 13:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvxTfJ9wAPisJby6lTrO/voo2RFqMt15KNRrFuQl4oc=;
 b=gofAVh7E3LV7AMlQju+boAVNUTqsESxBYGoC3PCd5Xcc7DQjDmFIUzzg1MnLf3WXuP
 W6hUL/OB6i6TGNh6n8S0DoUgZCaxG/qmiBas/WJE9AgQ/89Tz3QTW/niqIjKwZYGpfD4
 dwmOaGDuWuRtcOJcrmLIn+PQqQ0vKnHdlMaanZCKFYOOCEnc/3IuaL+0VEquDT2SLQEU
 FnXfSTwWiA0qyQxgX83aWLuw1Ss52WLwMf7ISoqmpysh3906ZBh9u85VtLZLtoevSOJA
 eZ9Cp0iuIY3xIpPzftdTjsiK9dgL84d+w3Pkf7KA1a2iP5TJERGVNPR+CEI6wC2FFzjJ
 y0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvxTfJ9wAPisJby6lTrO/voo2RFqMt15KNRrFuQl4oc=;
 b=olwQSHz9tRAoKnOy9fy2yvKs0/ZrVmirXoQb+pdyiuRJN97kUcZ4CrNQmcM//lFUy4
 3djk+sV0ChpoUbQQo7CalA7vvSYA3XEmHeHSbH0FnjcZP1q4O0etZay1f22fzWJ+35wm
 zyehloHO9QKHbG1HFfDPuZkFmqhZEB3jtEzL4YGZ5WG3PW/Wr77L5iHJ0U5kLt4CHABj
 9q6KljFzyB5tev1ztnWOiNDHqbM3B11WLyPkCd+vX5Y6uVFI+hyg+y+g3L7Ty4t9emEW
 tq4hcJy4eLNsCt+uega6DuqHh48dNmdnr/OgBm6po4vt3BlwlhfoPPmuRpkIoWTqpvmm
 yv9Q==
X-Gm-Message-State: APjAAAWn35MUWAYZsl+BxN29xdB6eH5TipvLkwEMgqKV+dEgdVJ1QblE
 CTRrDHX/GSfGAuraws07G6Y=
X-Google-Smtp-Source: APXvYqzE5yctGypDK+jMi10fbP+6wUA32vTmj94TkTVC09WUi1pReUQGyifbpSofl8x5m6sodwwiIg==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr27298610wmj.90.1576444356203; 
 Sun, 15 Dec 2019 13:12:36 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1370FCC00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:370f:cc00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j12sm19888598wrw.54.2019.12.15.13.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 13:12:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [RFC v1 1/1] drm/lima: Add optional devfreq support
Date: Sun, 15 Dec 2019 22:12:23 +0100
Message-Id: <20191215211223.1451499-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, wens@csie.org,
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

The actual devfreq code is taken from panfrost_devfreq.c.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/lima/Kconfig        |   1 +
 drivers/gpu/drm/lima/Makefile       |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
 drivers/gpu/drm/lima/lima_device.c  |   4 +
 drivers/gpu/drm/lima/lima_device.h  |  11 ++
 drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
 drivers/gpu/drm/lima/lima_sched.c   |   7 ++
 drivers/gpu/drm/lima/lima_sched.h   |   3 +
 9 files changed, 217 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
index 571dc369a7e9..cdd24b68b5d4 100644
--- a/drivers/gpu/drm/lima/Kconfig
+++ b/drivers/gpu/drm/lima/Kconfig
@@ -10,5 +10,6 @@ config DRM_LIMA
        depends on OF
        select DRM_SCHED
        select DRM_GEM_SHMEM_HELPER
+       select PM_DEVFREQ
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
index 000000000000..9cefce6352db
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019 Collabora ltd. */
+/* Copyright 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com> */
+#include <linux/clk.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+
+#include "lima_device.h"
+#include "lima_devfreq.h"
+
+static void lima_devfreq_update_utilization(struct lima_device *ldev)
+{
+	ktime_t now;
+	ktime_t last;
+
+	if (!ldev->devfreq.devfreq)
+		return;
+
+	now = ktime_get();
+	last = ldev->devfreq.time_last_update;
+
+	if (atomic_read(&ldev->devfreq.busy_count) > 0)
+		ldev->devfreq.busy_time += ktime_sub(now, last);
+	else
+		ldev->devfreq.idle_time += ktime_sub(now, last);
+
+	ldev->devfreq.time_last_update = now;
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
+static void lima_devfreq_reset(struct lima_device *ldev)
+{
+	ldev->devfreq.busy_time = 0;
+	ldev->devfreq.idle_time = 0;
+	ldev->devfreq.time_last_update = ktime_get();
+}
+
+static int lima_devfreq_get_dev_status(struct device *dev,
+				       struct devfreq_dev_status *status)
+{
+	struct lima_device *ldev = dev_get_drvdata(dev);
+
+	lima_devfreq_update_utilization(ldev);
+
+	status->current_frequency = clk_get_rate(ldev->clk_gpu);
+	status->total_time = ktime_to_ns(ktime_add(ldev->devfreq.busy_time,
+						   ldev->devfreq.idle_time));
+
+	status->busy_time = ktime_to_ns(ldev->devfreq.busy_time);
+
+	lima_devfreq_reset(ldev);
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
+int lima_devfreq_init(struct lima_device *ldev)
+{
+	struct thermal_cooling_device *cooling;
+	struct device *dev = &ldev->pdev->dev;
+	struct devfreq *devfreq;
+	struct dev_pm_opp *opp;
+	unsigned long cur_freq;
+	int ret;
+
+	ldev->devfreq.opp_table = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(ldev->devfreq.opp_table))
+		return PTR_ERR(ldev->devfreq.opp_table);
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret == -ENODEV) /* Optional, continue without devfreq */
+		return 0;
+	else if (ret)
+		return ret;
+
+	lima_devfreq_reset(ldev);
+
+	cur_freq = clk_get_rate(ldev->clk_gpu);
+
+	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	lima_devfreq_profile.initial_freq = cur_freq;
+	dev_pm_opp_put(opp);
+
+	devfreq = devm_devfreq_add_device(dev, &lima_devfreq_profile,
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
+	if (IS_ERR(devfreq)) {
+		dev_err(dev, "Couldn't initialize GPU devfreq\n");
+		dev_pm_opp_of_remove_table(dev);
+		return PTR_ERR(devfreq);
+	}
+
+	ldev->devfreq.devfreq = devfreq;
+
+	cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
+	if (IS_ERR(cooling))
+		dev_info(dev, "Failed to register cooling device\n");
+	else
+		ldev->devfreq.cooling = cooling;
+
+	return 0;
+}
+
+void lima_devfreq_fini(struct lima_device *ldev)
+{
+	if (ldev->devfreq.cooling)
+		devfreq_cooling_unregister(ldev->devfreq.cooling);
+
+	if (ldev->devfreq.opp_table) {
+		dev_pm_opp_put_clkname(ldev->devfreq.opp_table);
+		ldev->devfreq.opp_table = NULL;
+	}
+
+	dev_pm_opp_of_remove_table(&ldev->pdev->dev);
+}
+
+void lima_devfreq_record_busy(struct lima_device *ldev)
+{
+	lima_devfreq_update_utilization(ldev);
+	atomic_inc(&ldev->devfreq.busy_count);
+}
+
+void lima_devfreq_record_idle(struct lima_device *ldev)
+{
+	int count;
+
+	lima_devfreq_update_utilization(ldev);
+	count = atomic_dec_if_positive(&ldev->devfreq.busy_count);
+	WARN_ON(count < 0);
+}
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
new file mode 100644
index 000000000000..fe4f8a437033
--- /dev/null
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com> */
+
+#ifndef __LIMA_DEVFREQ_H__
+#define __LIMA_DEVFREQ_H__
+
+struct lima_device;
+
+int lima_devfreq_init(struct lima_device *ldev);
+void lima_devfreq_fini(struct lima_device *ldev);
+
+void lima_devfreq_record_busy(struct lima_device *ldev);
+void lima_devfreq_record_idle(struct lima_device *ldev);
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
index 31158d86271c..9a3ab7e3169c 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -5,6 +5,7 @@
 #define __LIMA_DEVICE_H__
 
 #include <drm/drm_device.h>
+#include <linux/atomic.h>
 #include <linux/delay.h>
 
 #include "lima_sched.h"
@@ -94,6 +95,16 @@ struct lima_device {
 
 	u32 *dlbu_cpu;
 	dma_addr_t dlbu_dma;
+
+	struct {
+		struct devfreq *devfreq;
+		struct opp_table *opp_table;
+		struct thermal_cooling_device *cooling;
+		ktime_t busy_time;
+		ktime_t idle_time;
+		ktime_t time_last_update;
+		atomic_t busy_count;
+	} devfreq;
 };
 
 static inline struct lima_device *
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 124efe4fa97b..b64b1777f220 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -10,6 +10,7 @@
 #include <drm/drm_prime.h>
 #include <drm/lima_drm.h>
 
+#include "lima_devfreq.h"
 #include "lima_drv.h"
 #include "lima_gem.h"
 #include "lima_vm.h"
@@ -296,18 +297,26 @@ static int lima_pdev_probe(struct platform_device *pdev)
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
@@ -321,6 +330,7 @@ static int lima_pdev_remove(struct platform_device *pdev)
 	struct drm_device *ddev = ldev->ddev;
 
 	drm_dev_unregister(ddev);
+	lima_devfreq_fini(ldev);
 	lima_device_fini(ldev);
 	drm_dev_put(ddev);
 	lima_sched_slab_fini();
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index f522c5f99729..851c496a168b 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/xarray.h>
 
+#include "lima_devfreq.h"
 #include "lima_drv.h"
 #include "lima_sched.h"
 #include "lima_vm.h"
@@ -213,6 +214,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	 */
 	ret = dma_fence_get(task->fence);
 
+	lima_devfreq_record_busy(pipe->ldev);
+
 	pipe->current_task = task;
 
 	/* this is needed for MMU to work correctly, otherwise GP/PP
@@ -280,6 +283,8 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
 	pipe->current_vm = NULL;
 	pipe->current_task = NULL;
 
+	lima_devfreq_record_idle(pipe->ldev);
+
 	drm_sched_resubmit_jobs(&pipe->base);
 	drm_sched_start(&pipe->base, true);
 }
@@ -348,6 +353,8 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
 
 void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
 {
+	lima_devfreq_record_idle(pipe->ldev);
+
 	if (pipe->error)
 		schedule_work(&pipe->error_work);
 	else {
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 928af91c1118..9ae7df7d7fbb 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -6,6 +6,7 @@
 
 #include <drm/gpu_scheduler.h>
 
+struct lima_device;
 struct lima_vm;
 
 struct lima_sched_task {
@@ -41,6 +42,8 @@ struct lima_sched_pipe {
 	u32 fence_seqno;
 	spinlock_t fence_lock;
 
+	struct lima_device *ldev;
+
 	struct lima_sched_task *current_task;
 	struct lima_vm *current_vm;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
