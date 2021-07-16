Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162953CBBC3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 20:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654C16E9CB;
	Fri, 16 Jul 2021 18:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28F46E9C9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 18:20:56 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7F3038296F;
 Fri, 16 Jul 2021 20:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626459654;
 bh=WV6qYHrBtiiQJpGD/7gS+7yeByyNWoTpo29lEwVHHAk=;
 h=From:To:Cc:Subject:Date:From;
 b=R63ljb64b/NP2WWjn7DFtiN6LHbE5puc30XGBHZNfvBZSk3SFZ105xUY7NKwjYd1m
 iOaWts7CWNw0swsTFL0fROtHdjLQ+O+zNkJImZlL3WH4mht2a7IOeuQcox3u2LfN81
 Jk9YSRPeXtsAZ1FcrT6x7Dwb0jbFscHSwhhUy5hCiXlSNIK1XtCYRyQT6Ks3D3UrD5
 I3gwctn70LPLmebmLwOPef572MtecR9pTZR0HfGIH/dub6pFWkHX6hORg9IeYGiTmB
 EX1/xiE4ul/RizsYJ56Og+VprO2QVf889hMZcqxcUZpupdsXhkt1IcRr/YXkmy71D7
 xHk7045spzlgg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/lima: Convert to clk_bulk API
Date: Fri, 16 Jul 2021 20:20:51 +0200
Message-Id: <20210716182051.218575-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Qiang Yu <yuq825@gmail.com>,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of requesting two separate clock and then handling them
separately in various places of the driver, use clk_bulk_*() API.
This permits handling devices with more than "bus"/"core" clock,
like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as separate
clock.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: lima@lists.freedesktop.org
---
 drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
 drivers/gpu/drm/lima/lima_devfreq.h |  1 +
 drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++------------------
 drivers/gpu/drm/lima/lima_device.h  |  4 +--
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 8989e215dfc9..533b36932f79 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
 	struct lima_devfreq *devfreq = &ldev->devfreq;
 	unsigned long irqflags;
 
-	status->current_frequency = clk_get_rate(ldev->clk_gpu);
+	status->current_frequency = clk_get_rate(devfreq->clk_gpu);
 
 	spin_lock_irqsave(&devfreq->lock, irqflags);
 
@@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_device *ldev)
 	struct lima_devfreq *ldevfreq = &ldev->devfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
-	int ret;
+	int i, ret;
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
 		return 0;
 
+	/* Find first clock which are not "bus" clock */
+	for (i = 0; i < ldev->nr_clks; i++) {
+		if (!strcmp(ldev->clks[i].id, "bus"))
+			continue;
+		ldevfreq->clk_gpu = ldev->clks[i].clk;
+		break;
+	}
+
+	if (!ldevfreq->clk_gpu)
+		return -ENODEV;
+
 	spin_lock_init(&ldevfreq->lock);
 
 	ret = devm_pm_opp_set_clkname(dev, "core");
@@ -135,7 +146,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	lima_devfreq_reset(ldevfreq);
 
-	cur_freq = clk_get_rate(ldev->clk_gpu);
+	cur_freq = clk_get_rate(ldevfreq->clk_gpu);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
 	if (IS_ERR(opp))
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index b8e50feaeab6..ffef5c91795d 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -17,6 +17,7 @@ struct lima_devfreq {
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 	struct devfreq_simple_ondemand_data gov_data;
+	struct clk *clk_gpu;
 
 	ktime_t busy_time;
 	ktime_t idle_time;
diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 65fdca366e41..9f7bde7e9d22 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -85,29 +85,23 @@ static int lima_clk_enable(struct lima_device *dev)
 {
 	int err;
 
-	err = clk_prepare_enable(dev->clk_bus);
+	err = clk_bulk_prepare_enable(dev->nr_clks, dev->clks);
 	if (err)
 		return err;
 
-	err = clk_prepare_enable(dev->clk_gpu);
-	if (err)
-		goto error_out0;
-
 	if (dev->reset) {
 		err = reset_control_deassert(dev->reset);
 		if (err) {
 			dev_err(dev->dev,
 				"reset controller deassert failed %d\n", err);
-			goto error_out1;
+			goto error;
 		}
 	}
 
 	return 0;
 
-error_out1:
-	clk_disable_unprepare(dev->clk_gpu);
-error_out0:
-	clk_disable_unprepare(dev->clk_bus);
+error:
+	clk_bulk_disable_unprepare(dev->nr_clks, dev->clks);
 	return err;
 }
 
@@ -115,31 +109,23 @@ static void lima_clk_disable(struct lima_device *dev)
 {
 	if (dev->reset)
 		reset_control_assert(dev->reset);
-	clk_disable_unprepare(dev->clk_gpu);
-	clk_disable_unprepare(dev->clk_bus);
+	clk_bulk_disable_unprepare(dev->nr_clks, dev->clks);
 }
 
 static int lima_clk_init(struct lima_device *dev)
 {
 	int err;
 
-	dev->clk_bus = devm_clk_get(dev->dev, "bus");
-	if (IS_ERR(dev->clk_bus)) {
-		err = PTR_ERR(dev->clk_bus);
+	err = devm_clk_bulk_get_all(dev->dev, &dev->clks);
+	if (err < 1) {
+		if (err == 0)	/* No clock at all is an error too */
+			err = -ENODEV;
 		if (err != -EPROBE_DEFER)
-			dev_err(dev->dev, "get bus clk failed %d\n", err);
-		dev->clk_bus = NULL;
+			dev_err(dev->dev, "get clk failed %d\n", err);
 		return err;
 	}
 
-	dev->clk_gpu = devm_clk_get(dev->dev, "core");
-	if (IS_ERR(dev->clk_gpu)) {
-		err = PTR_ERR(dev->clk_gpu);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev->dev, "get core clk failed %d\n", err);
-		dev->clk_gpu = NULL;
-		return err;
-	}
+	dev->nr_clks = err;
 
 	dev->reset = devm_reset_control_array_get_optional_shared(dev->dev);
 	if (IS_ERR(dev->reset)) {
@@ -412,8 +398,10 @@ int lima_device_init(struct lima_device *ldev)
 	INIT_LIST_HEAD(&ldev->error_task_list);
 	mutex_init(&ldev->error_task_list_lock);
 
-	dev_info(ldev->dev, "bus rate = %lu\n", clk_get_rate(ldev->clk_bus));
-	dev_info(ldev->dev, "mod rate = %lu", clk_get_rate(ldev->clk_gpu));
+	for (i = 0; i < ldev->nr_clks; i++) {
+		dev_info(ldev->dev, "clk %s = %lu Hz\n", ldev->clks[i].id,
+			 clk_get_rate(ldev->clks[i].clk));
+	}
 
 	return 0;
 
diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 41b9d7b4bcc7..de11570c9903 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -85,8 +85,8 @@ struct lima_device {
 	int num_pp;
 
 	void __iomem *iomem;
-	struct clk *clk_bus;
-	struct clk *clk_gpu;
+	struct clk_bulk_data *clks;
+	int nr_clks;
 	struct reset_control *reset;
 	struct regulator *regulator;
 
-- 
2.30.2

