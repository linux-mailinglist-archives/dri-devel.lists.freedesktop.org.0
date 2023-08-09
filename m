Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5277659B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E2D10E46F;
	Wed,  9 Aug 2023 16:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172FC10E46C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:39 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B513660721F;
 Wed,  9 Aug 2023 17:53:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600017;
 bh=eQ2aTW58gdn8aFwOOmirNHaaXnjl5lhslnV2HOxP9Tc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBP0HYfwRngPWiqQpMFzdqJcVbd8Yp/DqL2wNngsKIgaXfBev9YQoyTvmURmLM1Kg
 2GFyKg0/D95fV9nk+rqVM/EofxxFjoOipqKgdOsqFBmfX47JRLvNLdwuZ6RH+Pqu2j
 Oyw2PxvV+vCcNVlHV/1bpM4574t/lFEdpXPQ45WpTTr0fIcnlTbDMO+QY0L1mZVF55
 hKnovTLjiUwKLhP3FuOsB1bEVtn3EzBE6cERRLiANoyBVkGpxzBJNVEGhHjIvEsPfe
 MdbXrkIDcMTQJ+CT0nQtAlY1bY7clBtC+d7+4725qKrsMhCK4dytcclEPpLFvwTWy9
 30q5SwxqTepEA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/15] drm/panthor: Add the devfreq logical block
Date: Wed,  9 Aug 2023 18:53:20 +0200
Message-ID: <20230809165330.2451699-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every thing related to devfreq in placed in panthor_devfreq.c, and
helpers that can be called by other logical blocks are exposed through
panthor_devfreq.h.

This implementation is loosely based on the panfrost implementation,
the only difference being that we don't count device users, because
the idle/active state will be managed by the scheduler logic.

v2:
- Added in v2

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 281 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_devfreq.h |  25 ++
 2 files changed, 306 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
new file mode 100644
index 000000000000..500ce34cccc2
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2019 Collabora ltd. */
+
+#include <linux/clk.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+
+#include <drm/drm_managed.h>
+
+#include "panthor_device.h"
+#include "panthor_devfreq.h"
+
+/**
+ * struct panthor_devfreq - Device frequency management
+ */
+struct panthor_devfreq {
+	/** @devfreq: devfreq device. */
+	struct devfreq *devfreq;
+
+	/** @gov_data: Governor data. */
+	struct devfreq_simple_ondemand_data gov_data;
+
+	/** @busy_time: Busy time. */
+	ktime_t busy_time;
+
+	/** @idle_time: Idle time. */
+	ktime_t idle_time;
+
+	/** @time_last_update: Last update time. */
+	ktime_t time_last_update;
+
+	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
+	bool last_busy_state;
+
+	/*
+	 * Protect busy_time, idle_time, time_last_update and last_busy_state
+	 * because these can be accessed concurrently by panthor_devfreq_get_dev_status()
+	 * and panthor_devfreq_record_{busy,idle}().
+	 */
+	spinlock_t lock;
+};
+
+static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
+{
+	ktime_t now, last;
+
+	now = ktime_get();
+	last = pdevfreq->time_last_update;
+
+	if (pdevfreq->last_busy_state)
+		pdevfreq->busy_time += ktime_sub(now, last);
+	else
+		pdevfreq->idle_time += ktime_sub(now, last);
+
+	pdevfreq->time_last_update = now;
+}
+
+static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
+				  u32 flags)
+{
+	struct dev_pm_opp *opp;
+
+	opp = devfreq_recommended_opp(dev, freq, flags);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	return dev_pm_opp_set_rate(dev, *freq);
+}
+
+static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
+{
+	pdevfreq->busy_time = 0;
+	pdevfreq->idle_time = 0;
+	pdevfreq->time_last_update = ktime_get();
+}
+
+static int panthor_devfreq_get_dev_status(struct device *dev,
+					  struct devfreq_dev_status *status)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	unsigned long irqflags;
+
+	status->current_frequency = clk_get_rate(ptdev->clks.core);
+
+	spin_lock_irqsave(&pdevfreq->lock, irqflags);
+
+	panthor_devfreq_update_utilization(pdevfreq);
+
+	status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
+						   pdevfreq->idle_time));
+
+	status->busy_time = ktime_to_ns(pdevfreq->busy_time);
+
+	panthor_devfreq_reset(pdevfreq);
+
+	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
+
+	drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
+		status->busy_time, status->total_time,
+		status->busy_time / (status->total_time / 100),
+		status->current_frequency / 1000 / 1000);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile panthor_devfreq_profile = {
+	.timer = DEVFREQ_TIMER_DELAYED,
+	.polling_ms = 50, /* ~3 frames */
+	.target = panthor_devfreq_target,
+	.get_dev_status = panthor_devfreq_get_dev_status,
+};
+
+int panthor_devfreq_init(struct panthor_device *ptdev)
+{
+	/* There's actually 2 regulators (mali and sram), but the OPP core only
+	 * supports one.
+	 *
+	 * We assume the sram regulator is coupled with the mali one and let
+	 * the coupling logic deal with voltage updates.
+	 */
+	static const char *reg_names[] = { "mali", NULL };
+	struct thermal_cooling_device *cooling;
+	struct device *dev = ptdev->base.dev;
+	struct panthor_devfreq *pdevfreq;
+	struct dev_pm_opp *opp;
+	unsigned long cur_freq;
+	int ret;
+
+	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
+	if (!pdevfreq)
+		return -ENOMEM;
+
+	ptdev->devfreq = pdevfreq;
+
+	ret = devm_pm_opp_set_regulators(dev, reg_names);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+
+		return ret;
+	}
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&pdevfreq->lock);
+
+	panthor_devfreq_reset(pdevfreq);
+
+	cur_freq = clk_get_rate(ptdev->clks.core);
+
+	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	panthor_devfreq_profile.initial_freq = cur_freq;
+
+	/* Regulator coupling only takes care of synchronizing/balancing voltage
+	 * updates, but the coupled regulator needs to be enabled manually.
+	 *
+	 * We use devm_regulator_get_enable_optional() and keep the sram supply
+	 * enabled until the device is removed, just like we do for the mali
+	 * supply, which is enabled when dev_pm_opp_set_opp(dev, opp) is called,
+	 * and disabled when the opp_table is torn down, using the devm action.
+	 *
+	 * If we really care about disabling regulators on suspend, we should:
+	 * - use devm_regulator_get_optional() here
+	 * - call dev_pm_opp_set_opp(dev, NULL) before leaving this function
+	 *   (this disables the regulator passed to the OPP layer)
+	 * - call dev_pm_opp_set_opp(dev, NULL) and
+	 *   regulator_disable(ptdev->regulators.sram) in
+	 *   panthor_devfreq_suspend()
+	 * - call dev_pm_opp_set_opp(dev, default_opp) and
+	 *   regulator_enable(ptdev->regulators.sram) in
+	 *   panthor_devfreq_resume()
+	 *
+	 * But without knowing if it's beneficial or not (in term of power
+	 * consumption), or how much it slows down the suspend/resume steps,
+	 * let's just keep regulators enabled for the device lifetime.
+	 */
+	ret = devm_regulator_get_enable_optional(dev, "sram");
+	if (ret && ret != -ENODEV) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
+		return ret;
+	}
+
+	/*
+	 * Set the recommend OPP this will enable and configure the regulator
+	 * if any and will avoid a switch off by regulator_late_cleanup()
+	 */
+	ret = dev_pm_opp_set_opp(dev, opp);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
+		return ret;
+	}
+
+	dev_pm_opp_put(opp);
+
+	/*
+	 * Setup default thresholds for the simple_ondemand governor.
+	 * The values are chosen based on experiments.
+	 */
+	pdevfreq->gov_data.upthreshold = 45;
+	pdevfreq->gov_data.downdifferential = 5;
+
+	pdevfreq->devfreq = devm_devfreq_add_device(dev, &panthor_devfreq_profile,
+						    DEVFREQ_GOV_SIMPLE_ONDEMAND,
+						    &pdevfreq->gov_data);
+	if (IS_ERR(pdevfreq->devfreq)) {
+		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
+		ret = PTR_ERR(pdevfreq->devfreq);
+		pdevfreq->devfreq = NULL;
+		return ret;
+	}
+
+	cooling = devfreq_cooling_em_register(pdevfreq->devfreq, NULL);
+	if (IS_ERR(cooling))
+		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
+
+	return 0;
+}
+
+int panthor_devfreq_resume(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+
+	if (!pdevfreq->devfreq)
+		return 0;
+
+	panthor_devfreq_reset(pdevfreq);
+
+	return devfreq_resume_device(pdevfreq->devfreq);
+}
+
+int panthor_devfreq_suspend(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+
+	if (!pdevfreq->devfreq)
+		return 0;
+
+	return devfreq_suspend_device(pdevfreq->devfreq);
+}
+
+void panthor_devfreq_record_busy(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	unsigned long irqflags;
+
+	if (!pdevfreq->devfreq)
+		return;
+
+	spin_lock_irqsave(&pdevfreq->lock, irqflags);
+
+	panthor_devfreq_update_utilization(pdevfreq);
+	pdevfreq->last_busy_state = true;
+
+	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
+}
+
+void panthor_devfreq_record_idle(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	unsigned long irqflags;
+
+	if (!pdevfreq->devfreq)
+		return;
+
+	spin_lock_irqsave(&pdevfreq->lock, irqflags);
+
+	panthor_devfreq_update_utilization(pdevfreq);
+	pdevfreq->last_busy_state = false;
+
+	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
new file mode 100644
index 000000000000..875fbb5a1c1b
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2019 Collabora ltd. */
+
+#ifndef __PANTHOR_DEVFREQ_H__
+#define __PANTHOR_DEVFREQ_H__
+
+#include <linux/devfreq.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+
+struct devfreq;
+struct thermal_cooling_device;
+
+struct panthor_device;
+struct panthor_devfreq;
+
+int panthor_devfreq_init(struct panthor_device *ptdev);
+
+int panthor_devfreq_resume(struct panthor_device *ptdev);
+int panthor_devfreq_suspend(struct panthor_device *ptdev);
+
+void panthor_devfreq_record_busy(struct panthor_device *ptdev);
+void panthor_devfreq_record_idle(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_DEVFREQ_H__ */
-- 
2.41.0

