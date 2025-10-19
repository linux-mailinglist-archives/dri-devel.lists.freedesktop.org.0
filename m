Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE764BEE794
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D8B10E200;
	Sun, 19 Oct 2025 14:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="HlVqG/Pc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBB710E200
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760885566; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nYpsxBdIrEpMCRGqNonG6waEt4iz32M/ZQZAnbzyMCLARvoX7u5q4YXiQG+Fx5pKgqnRUSZi7smKUDyXtpWKS9jIb1qI2CxwHYDdszqemCb3voTseAgEiE2dKyhyFP3UlMVeFG27ve/b/ZLiDvahZZ1Q2eZi9bXKbAicf5b9/mo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760885566;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=O/8fm3bCf/y+lph7qk4UqlL0Gd/a2lS9kTBjn3IDV6E=; 
 b=EV5aBE1h6SOv31Qr5iwvD1krraW5Bdx555BwR3ZVVpUR+tWok0/dFrLj0PYK5pEUKFYgNLGLRNBxMgdCW+WIjwIHwLZP2QUC5Sb7rntR3WCgE1De7lda+HYmmENdZ+ISTfOW86IChni5IgvQGUqWXDk5lZ2ycdkpYCb0I8cry4k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760885566; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=O/8fm3bCf/y+lph7qk4UqlL0Gd/a2lS9kTBjn3IDV6E=;
 b=HlVqG/PcsWSPd0YnwHDbzCGVXUmrwQZnTnVNurDfKHygp7WEcZVY5FU8hJ53u6Mg
 uOWjKRMJWxYYHECs8sr8t0mPlPH+zRYh5ktfDdCOXh52Zbj/pjnfOyQqxKNQH/OIqTi
 1AsRANJvnxSworIT6UhyX+rBGWdRVJSAhwiSLtC4=
Received: by mx.zohomail.com with SMTPS id 176088556482964.26048660058768;
 Sun, 19 Oct 2025 07:52:44 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 01/12] drm/panfrost: Replace DRM driver allocation method
 with newer one
Date: Sun, 19 Oct 2025 15:52:06 +0100
Message-ID: <20251019145225.3621989-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
References: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Drop the deprecated DRM driver allocation method in favour of
devm_drm_dev_alloc(). Overall just make it the same as in Panthor.
Also discard now superfluous generic and platform device pointers inside
the main panfrost device structure.

Some ancient checkpatch issues unearthed as a result of these changes
were also fixed, like lines too long or double assignment in one line.

Reviewed-by: Steven Price <steven.price@arm.com>
Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c    | 49 ++++++------
 drivers/gpu/drm/panfrost/panfrost_device.h    |  6 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 74 ++++++++-----------
 drivers/gpu/drm/panfrost/panfrost_dump.c      |  8 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  8 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  4 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c       | 49 ++++++------
 drivers/gpu/drm/panfrost/panfrost_job.c       | 37 +++++-----
 drivers/gpu/drm/panfrost/panfrost_mmu.c       | 46 ++++++------
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   | 18 ++---
 11 files changed, 146 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 5d0dce10336b..ac05df2a54fe 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -74,7 +74,7 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
 
 	spin_unlock_irqrestore(&pfdevfreq->lock, irqflags);
 
-	dev_dbg(pfdev->dev, "busy %lu total %lu %lu %% freq %lu MHz\n",
+	dev_dbg(pfdev->base.dev, "busy %lu total %lu %lu %% freq %lu MHz\n",
 		status->busy_time, status->total_time,
 		status->busy_time / (status->total_time / 100),
 		status->current_frequency / 1000 / 1000);
@@ -119,7 +119,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	int ret;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
-	struct device *dev = &pfdev->pdev->dev;
+	struct device *dev = pfdev->base.dev;
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 04bec27449cb..733b728ec75f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -20,9 +20,9 @@
 
 static int panfrost_reset_init(struct panfrost_device *pfdev)
 {
-	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->dev);
+	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->base.dev);
 	if (IS_ERR(pfdev->rstc)) {
-		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
+		dev_err(pfdev->base.dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
 		return PTR_ERR(pfdev->rstc);
 	}
 
@@ -39,22 +39,22 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 	int err;
 	unsigned long rate;
 
-	pfdev->clock = devm_clk_get(pfdev->dev, NULL);
+	pfdev->clock = devm_clk_get(pfdev->base.dev, NULL);
 	if (IS_ERR(pfdev->clock)) {
-		dev_err(pfdev->dev, "get clock failed %ld\n", PTR_ERR(pfdev->clock));
+		dev_err(pfdev->base.dev, "get clock failed %ld\n", PTR_ERR(pfdev->clock));
 		return PTR_ERR(pfdev->clock);
 	}
 
 	rate = clk_get_rate(pfdev->clock);
-	dev_info(pfdev->dev, "clock rate = %lu\n", rate);
+	dev_info(pfdev->base.dev, "clock rate = %lu\n", rate);
 
 	err = clk_prepare_enable(pfdev->clock);
 	if (err)
 		return err;
 
-	pfdev->bus_clock = devm_clk_get_optional(pfdev->dev, "bus");
+	pfdev->bus_clock = devm_clk_get_optional(pfdev->base.dev, "bus");
 	if (IS_ERR(pfdev->bus_clock)) {
-		dev_err(pfdev->dev, "get bus_clock failed %ld\n",
+		dev_err(pfdev->base.dev, "get bus_clock failed %ld\n",
 			PTR_ERR(pfdev->bus_clock));
 		err = PTR_ERR(pfdev->bus_clock);
 		goto disable_clock;
@@ -62,7 +62,7 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 
 	if (pfdev->bus_clock) {
 		rate = clk_get_rate(pfdev->bus_clock);
-		dev_info(pfdev->dev, "bus_clock rate = %lu\n", rate);
+		dev_info(pfdev->base.dev, "bus_clock rate = %lu\n", rate);
 
 		err = clk_prepare_enable(pfdev->bus_clock);
 		if (err)
@@ -87,7 +87,7 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 {
 	int ret, i;
 
-	pfdev->regulators = devm_kcalloc(pfdev->dev, pfdev->comp->num_supplies,
+	pfdev->regulators = devm_kcalloc(pfdev->base.dev, pfdev->comp->num_supplies,
 					 sizeof(*pfdev->regulators),
 					 GFP_KERNEL);
 	if (!pfdev->regulators)
@@ -96,12 +96,12 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 	for (i = 0; i < pfdev->comp->num_supplies; i++)
 		pfdev->regulators[i].supply = pfdev->comp->supply_names[i];
 
-	ret = devm_regulator_bulk_get(pfdev->dev,
+	ret = devm_regulator_bulk_get(pfdev->base.dev,
 				      pfdev->comp->num_supplies,
 				      pfdev->regulators);
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER)
-			dev_err(pfdev->dev, "failed to get regulators: %d\n",
+			dev_err(pfdev->base.dev, "failed to get regulators: %d\n",
 				ret);
 		return ret;
 	}
@@ -109,7 +109,7 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 	ret = regulator_bulk_enable(pfdev->comp->num_supplies,
 				    pfdev->regulators);
 	if (ret < 0) {
-		dev_err(pfdev->dev, "failed to enable regulators: %d\n", ret);
+		dev_err(pfdev->base.dev, "failed to enable regulators: %d\n", ret);
 		return ret;
 	}
 
@@ -144,7 +144,7 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
 	int err;
 	int i, num_domains;
 
-	num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
+	num_domains = of_count_phandle_with_args(pfdev->base.dev->of_node,
 						 "power-domains",
 						 "#power-domain-cells");
 
@@ -156,7 +156,7 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
 		return 0;
 
 	if (num_domains != pfdev->comp->num_pm_domains) {
-		dev_err(pfdev->dev,
+		dev_err(pfdev->base.dev,
 			"Incorrect number of power domains: %d provided, %d needed\n",
 			num_domains, pfdev->comp->num_pm_domains);
 		return -EINVAL;
@@ -168,20 +168,21 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
 
 	for (i = 0; i < num_domains; i++) {
 		pfdev->pm_domain_devs[i] =
-			dev_pm_domain_attach_by_name(pfdev->dev,
-					pfdev->comp->pm_domain_names[i]);
+			dev_pm_domain_attach_by_name(pfdev->base.dev,
+						     pfdev->comp->pm_domain_names[i]);
 		if (IS_ERR_OR_NULL(pfdev->pm_domain_devs[i])) {
 			err = PTR_ERR(pfdev->pm_domain_devs[i]) ? : -ENODATA;
 			pfdev->pm_domain_devs[i] = NULL;
-			dev_err(pfdev->dev,
+			dev_err(pfdev->base.dev,
 				"failed to get pm-domain %s(%d): %d\n",
 				pfdev->comp->pm_domain_names[i], i, err);
 			goto err;
 		}
 
-		pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
-				pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
-				DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
+		pfdev->pm_domain_links[i] =
+			device_link_add(pfdev->base.dev,
+					pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
+					DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
 		if (!pfdev->pm_domain_links[i]) {
 			dev_err(pfdev->pm_domain_devs[i],
 				"adding device link failed!\n");
@@ -220,20 +221,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	err = panfrost_reset_init(pfdev);
 	if (err) {
-		dev_err(pfdev->dev, "reset init failed %d\n", err);
+		dev_err(pfdev->base.dev, "reset init failed %d\n", err);
 		goto out_pm_domain;
 	}
 
 	err = panfrost_clk_init(pfdev);
 	if (err) {
-		dev_err(pfdev->dev, "clk init failed %d\n", err);
+		dev_err(pfdev->base.dev, "clk init failed %d\n", err);
 		goto out_reset;
 	}
 
 	err = panfrost_devfreq_init(pfdev);
 	if (err) {
 		if (err != -EPROBE_DEFER)
-			dev_err(pfdev->dev, "devfreq init failed %d\n", err);
+			dev_err(pfdev->base.dev, "devfreq init failed %d\n", err);
 		goto out_clk;
 	}
 
@@ -244,7 +245,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 			goto out_devfreq;
 	}
 
-	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
+	pfdev->iomem = devm_platform_ioremap_resource(to_platform_device(pfdev->base.dev), 0);
 	if (IS_ERR(pfdev->iomem)) {
 		err = PTR_ERR(pfdev->iomem);
 		goto out_regulator;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 1e73efad02a8..474b232bb38e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -124,9 +124,7 @@ struct panfrost_device_debugfs {
 };
 
 struct panfrost_device {
-	struct device *dev;
-	struct drm_device *ddev;
-	struct platform_device *pdev;
+	struct drm_device base;
 	int gpu_irq;
 	int mmu_irq;
 
@@ -222,7 +220,7 @@ static inline bool panfrost_high_prio_allowed(struct drm_file *file)
 
 static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
 {
-	return ddev->dev_private;
+	return container_of(ddev, struct panfrost_device, base);
 }
 
 static inline int panfrost_model_cmp(struct panfrost_device *pfdev, s32 id)
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 607a5b8448d0..200c04d2fc55 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -36,7 +36,7 @@ static int panfrost_ioctl_query_timestamp(struct panfrost_device *pfdev,
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(pfdev->dev);
+	ret = pm_runtime_resume_and_get(pfdev->base.dev);
 	if (ret)
 		return ret;
 
@@ -44,14 +44,14 @@ static int panfrost_ioctl_query_timestamp(struct panfrost_device *pfdev,
 	*arg = panfrost_timestamp_read(pfdev);
 	panfrost_cycle_counter_put(pfdev);
 
-	pm_runtime_put(pfdev->dev);
+	pm_runtime_put(pfdev->base.dev);
 	return 0;
 }
 
 static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct drm_file *file)
 {
 	struct drm_panfrost_get_param *param = data;
-	struct panfrost_device *pfdev = ddev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(ddev);
 	int ret;
 
 	if (param->pad != 0)
@@ -283,7 +283,7 @@ panfrost_copy_in_sync(struct drm_device *dev,
 static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 	struct panfrost_file_priv *file_priv = file->driver_priv;
 	struct drm_panfrost_submit *args = data;
 	struct drm_syncobj *sync_out = NULL;
@@ -457,7 +457,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 {
 	struct panfrost_file_priv *priv = file_priv->driver_priv;
 	struct drm_panfrost_madvise *args = data;
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 	struct drm_gem_object *gem_obj;
 	struct panfrost_gem_object *bo;
 	int ret = 0;
@@ -590,7 +590,7 @@ static int
 panfrost_open(struct drm_device *dev, struct drm_file *file)
 {
 	int ret;
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 	struct panfrost_file_priv *panfrost_priv;
 
 	panfrost_priv = kzalloc(sizeof(*panfrost_priv), GFP_KERNEL);
@@ -686,8 +686,7 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
 
 static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_device *dev = file->minor->dev;
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(file->minor->dev);
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
 
@@ -704,8 +703,7 @@ static const struct file_operations panfrost_drm_driver_fops = {
 static int panthor_gems_show(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(node->minor->dev);
 
 	panfrost_gem_debugfs_print_bos(pfdev, m);
 
@@ -754,7 +752,8 @@ static int show_file_jm_ctxs(struct panfrost_file_priv *pfile,
 }
 
 static struct drm_info_list panthor_debugfs_list[] = {
-	{"gems", panthor_gems_show, 0, NULL},
+	{"gems",
+	 panthor_gems_show, 0, NULL},
 };
 
 static int panthor_gems_debugfs_init(struct drm_minor *minor)
@@ -861,15 +860,12 @@ static const struct drm_driver panfrost_drm_driver = {
 static int panfrost_probe(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev;
-	struct drm_device *ddev;
 	int err;
 
-	pfdev = devm_kzalloc(&pdev->dev, sizeof(*pfdev), GFP_KERNEL);
-	if (!pfdev)
-		return -ENOMEM;
-
-	pfdev->pdev = pdev;
-	pfdev->dev = &pdev->dev;
+	pfdev = devm_drm_dev_alloc(&pdev->dev, &panfrost_drm_driver,
+				   struct panfrost_device, base);
+	if (IS_ERR(pfdev))
+		return PTR_ERR(pfdev);
 
 	platform_set_drvdata(pdev, pfdev);
 
@@ -879,14 +875,6 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
 
-	/* Allocate and initialize the DRM device. */
-	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
-
-	ddev->dev_private = pfdev;
-	pfdev->ddev = ddev;
-
 	mutex_init(&pfdev->shrinker_lock);
 	INIT_LIST_HEAD(&pfdev->shrinker_list);
 
@@ -897,51 +885,47 @@ static int panfrost_probe(struct platform_device *pdev)
 		goto err_out0;
 	}
 
-	pm_runtime_set_active(pfdev->dev);
-	pm_runtime_mark_last_busy(pfdev->dev);
-	pm_runtime_enable(pfdev->dev);
-	pm_runtime_set_autosuspend_delay(pfdev->dev, 50); /* ~3 frames */
-	pm_runtime_use_autosuspend(pfdev->dev);
+	pm_runtime_set_active(pfdev->base.dev);
+	pm_runtime_mark_last_busy(pfdev->base.dev);
+	pm_runtime_enable(pfdev->base.dev);
+	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
+	pm_runtime_use_autosuspend(pfdev->base.dev);
 
 	/*
 	 * Register the DRM device with the core and the connectors with
 	 * sysfs
 	 */
-	err = drm_dev_register(ddev, 0);
+	err = drm_dev_register(&pfdev->base, 0);
 	if (err < 0)
 		goto err_out1;
 
-	err = panfrost_gem_shrinker_init(ddev);
+	err = panfrost_gem_shrinker_init(&pfdev->base);
 	if (err)
 		goto err_out2;
 
 	return 0;
 
 err_out2:
-	drm_dev_unregister(ddev);
+	drm_dev_unregister(&pfdev->base);
 err_out1:
-	pm_runtime_disable(pfdev->dev);
+	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
-	pm_runtime_set_suspended(pfdev->dev);
+	pm_runtime_set_suspended(pfdev->base.dev);
 err_out0:
-	drm_dev_put(ddev);
 	return err;
 }
 
 static void panfrost_remove(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
-	struct drm_device *ddev = pfdev->ddev;
 
-	drm_dev_unregister(ddev);
-	panfrost_gem_shrinker_cleanup(ddev);
+	drm_dev_unregister(&pfdev->base);
+	panfrost_gem_shrinker_cleanup(&pfdev->base);
 
-	pm_runtime_get_sync(pfdev->dev);
-	pm_runtime_disable(pfdev->dev);
+	pm_runtime_get_sync(pfdev->base.dev);
+	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
-	pm_runtime_set_suspended(pfdev->dev);
-
-	drm_dev_put(ddev);
+	pm_runtime_set_suspended(pfdev->base.dev);
 }
 
 static ssize_t profiling_show(struct device *dev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
index 4042afe2fbf4..3ed6c902d0a1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_dump.c
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -163,7 +163,7 @@ void panfrost_core_dump(struct panfrost_job *job)
 	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
 			__GFP_NORETRY);
 	if (!iter.start) {
-		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
+		dev_warn(pfdev->base.dev, "failed to allocate devcoredump file\n");
 		return;
 	}
 
@@ -204,14 +204,14 @@ void panfrost_core_dump(struct panfrost_job *job)
 		mapping = job->mappings[i];
 
 		if (!bo->base.sgt) {
-			dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
+			dev_err(pfdev->base.dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
 			iter.hdr->bomap.valid = 0;
 			goto dump_header;
 		}
 
 		ret = drm_gem_vmap(&bo->base.base, &map);
 		if (ret) {
-			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
+			dev_err(pfdev->base.dev, "Panfrost Dump: couldn't map Buffer Object\n");
 			iter.hdr->bomap.valid = 0;
 			goto dump_header;
 		}
@@ -237,5 +237,5 @@ dump_header:	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +
 	}
 	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_TRAILER, iter.data);
 
-	dev_coredumpv(pfdev->dev, iter.start, iter.data - iter.start, GFP_KERNEL);
+	dev_coredumpv(pfdev->base.dev, iter.start, iter.data - iter.start, GFP_KERNEL);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 85d6289a6eda..0528de674a4f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -26,7 +26,7 @@ static void panfrost_gem_debugfs_bo_add(struct panfrost_device *pfdev,
 
 static void panfrost_gem_debugfs_bo_rm(struct panfrost_gem_object *bo)
 {
-	struct panfrost_device *pfdev = bo->base.base.dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(bo->base.base.dev);
 
 	if (list_empty(&bo->debugfs.node))
 		return;
@@ -48,7 +48,7 @@ static void panfrost_gem_debugfs_bo_rm(struct panfrost_gem_object *bo) {}
 static void panfrost_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
-	struct panfrost_device *pfdev = obj->dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 
 	/*
 	 * Make sure the BO is no longer inserted in the shrinker list before
@@ -76,7 +76,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 
 		for (i = 0; i < n_sgt; i++) {
 			if (bo->sgts[i].sgl) {
-				dma_unmap_sgtable(pfdev->dev, &bo->sgts[i],
+				dma_unmap_sgtable(pfdev->base.dev, &bo->sgts[i],
 						  DMA_BIDIRECTIONAL, 0);
 				sg_free_table(&bo->sgts[i]);
 			}
@@ -284,7 +284,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
  */
 struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size)
 {
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 	struct panfrost_gem_object *obj;
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 02b60ea1433a..2fe967a90bcb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -97,7 +97,7 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
  */
 int panfrost_gem_shrinker_init(struct drm_device *dev)
 {
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 
 	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
 	if (!pfdev->shrinker)
@@ -120,7 +120,7 @@ int panfrost_gem_shrinker_init(struct drm_device *dev)
  */
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
 {
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 
 	if (pfdev->shrinker)
 		shrinker_free(pfdev->shrinker);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 174e190ba40f..f94337a6c302 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -36,12 +36,12 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
 		u64 address = (u64) gpu_read(pfdev, GPU_FAULT_ADDRESS_HI) << 32;
 		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
 
-		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
+		dev_warn(pfdev->base.dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panfrost_exception_name(fault_status & 0xFF),
 			 address);
 
 		if (state & GPU_IRQ_MULTIPLE_FAULT)
-			dev_warn(pfdev->dev, "There were multiple GPU faults - some have not been reported\n");
+			dev_warn(pfdev->base.dev, "There were multiple GPU faults - some have not been reported\n");
 
 		gpu_write(pfdev, GPU_INT_MASK, 0);
 	}
@@ -72,13 +72,13 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 		val, val & GPU_IRQ_RESET_COMPLETED, 10, 10000);
 
 	if (ret) {
-		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
+		dev_err(pfdev->base.dev, "gpu soft reset timed out, attempting hard reset\n");
 
 		gpu_write(pfdev, GPU_CMD, GPU_CMD_HARD_RESET);
 		ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT, val,
 						 val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
 		if (ret) {
-			dev_err(pfdev->dev, "gpu hard reset timed out\n");
+			dev_err(pfdev->base.dev, "gpu hard reset timed out\n");
 			return ret;
 		}
 	}
@@ -95,7 +95,7 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	 * All in-flight jobs should have released their cycle
 	 * counter references upon reset, but let us make sure
 	 */
-	if (drm_WARN_ON(pfdev->ddev, atomic_read(&pfdev->cycle_counter.use_count) != 0))
+	if (drm_WARN_ON(&pfdev->base, atomic_read(&pfdev->cycle_counter.use_count) != 0))
 		atomic_set(&pfdev->cycle_counter.use_count, 0);
 
 	return 0;
@@ -330,13 +330,13 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 	bitmap_from_u64(pfdev->features.hw_features, hw_feat);
 	bitmap_from_u64(pfdev->features.hw_issues, hw_issues);
 
-	dev_info(pfdev->dev, "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+	dev_info(pfdev->base.dev, "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
 		 name, gpu_id, major, minor, status);
-	dev_info(pfdev->dev, "features: %64pb, issues: %64pb",
+	dev_info(pfdev->base.dev, "features: %64pb, issues: %64pb",
 		 pfdev->features.hw_features,
 		 pfdev->features.hw_issues);
 
-	dev_info(pfdev->dev, "Features: L2:0x%08x Shader:0x%08x Tiler:0x%08x Mem:0x%0x MMU:0x%08x AS:0x%x JS:0x%x",
+	dev_info(pfdev->base.dev, "Features: L2:0x%08x Shader:0x%08x Tiler:0x%08x Mem:0x%0x MMU:0x%08x AS:0x%x JS:0x%x",
 		 pfdev->features.l2_features,
 		 pfdev->features.core_features,
 		 pfdev->features.tiler_features,
@@ -345,7 +345,7 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 		 pfdev->features.as_present,
 		 pfdev->features.js_present);
 
-	dev_info(pfdev->dev, "shader_present=0x%0llx l2_present=0x%0llx",
+	dev_info(pfdev->base.dev, "shader_present=0x%0llx l2_present=0x%0llx",
 		 pfdev->features.shader_present, pfdev->features.l2_present);
 }
 
@@ -411,7 +411,7 @@ static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
 	 */
 	core_mask = ~(pfdev->features.l2_present - 1) &
 		     (pfdev->features.l2_present - 2);
-	dev_info_once(pfdev->dev, "using only 1st core group (%lu cores from %lu)\n",
+	dev_info_once(pfdev->base.dev, "using only 1st core group (%lu cores from %lu)\n",
 		      hweight64(core_mask),
 		      hweight64(pfdev->features.shader_present));
 
@@ -432,7 +432,7 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 		val, val == (pfdev->features.l2_present & core_mask),
 		10, 20000);
 	if (ret)
-		dev_err(pfdev->dev, "error powering up gpu L2");
+		dev_err(pfdev->base.dev, "error powering up gpu L2");
 
 	gpu_write(pfdev, SHADER_PWRON_LO,
 		  pfdev->features.shader_present & core_mask);
@@ -440,13 +440,13 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 		val, val == (pfdev->features.shader_present & core_mask),
 		10, 20000);
 	if (ret)
-		dev_err(pfdev->dev, "error powering up gpu shader");
+		dev_err(pfdev->base.dev, "error powering up gpu shader");
 
 	gpu_write(pfdev, TILER_PWRON_LO, pfdev->features.tiler_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
 		val, val == pfdev->features.tiler_present, 10, 1000);
 	if (ret)
-		dev_err(pfdev->dev, "error powering up gpu tiler");
+		dev_err(pfdev->base.dev, "error powering up gpu tiler");
 }
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
@@ -458,19 +458,19 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
 					 val, !val, 1, 2000);
 	if (ret)
-		dev_err(pfdev->dev, "shader power transition timeout");
+		dev_err(pfdev->base.dev, "shader power transition timeout");
 
 	gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
 					 val, !val, 1, 2000);
 	if (ret)
-		dev_err(pfdev->dev, "tiler power transition timeout");
+		dev_err(pfdev->base.dev, "tiler power transition timeout");
 
 	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
 	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
 				 val, !val, 0, 2000);
 	if (ret)
-		dev_err(pfdev->dev, "l2 power transition timeout");
+		dev_err(pfdev->base.dev, "l2 power transition timeout");
 }
 
 void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev)
@@ -491,21 +491,22 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 
 	panfrost_gpu_init_features(pfdev);
 
-	err = dma_set_mask_and_coherent(pfdev->dev,
-		DMA_BIT_MASK(FIELD_GET(0xff00, pfdev->features.mmu_features)));
+	err = dma_set_mask_and_coherent(pfdev->base.dev,
+					DMA_BIT_MASK(FIELD_GET(0xff00,
+							       pfdev->features.mmu_features)));
 	if (err)
 		return err;
 
-	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
+	dma_set_max_seg_size(pfdev->base.dev, UINT_MAX);
 
-	pfdev->gpu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
+	pfdev->gpu_irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "gpu");
 	if (pfdev->gpu_irq < 0)
 		return pfdev->gpu_irq;
 
-	err = devm_request_irq(pfdev->dev, pfdev->gpu_irq, panfrost_gpu_irq_handler,
+	err = devm_request_irq(pfdev->base.dev, pfdev->gpu_irq, panfrost_gpu_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
 	if (err) {
-		dev_err(pfdev->dev, "failed to request gpu irq");
+		dev_err(pfdev->base.dev, "failed to request gpu irq");
 		return err;
 	}
 
@@ -525,9 +526,9 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev)
 
 	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION)) {
 		/* Flush reduction only makes sense when the GPU is kept powered on between jobs */
-		if (pm_runtime_get_if_in_use(pfdev->dev)) {
+		if (pm_runtime_get_if_in_use(pfdev->base.dev)) {
 			flush_id = gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
-			pm_runtime_put(pfdev->dev);
+			pm_runtime_put(pfdev->base.dev);
 			return flush_id;
 		}
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0cc80da12562..01fcba4e0d57 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -99,7 +99,7 @@ static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, in
 	if (!fence)
 		return ERR_PTR(-ENOMEM);
 
-	fence->dev = pfdev->ddev;
+	fence->dev = &pfdev->base;
 	fence->queue = js_num;
 	fence->seqno = ++js->queue[js_num].emit_seqno;
 	dma_fence_init(&fence->base, &panfrost_fence_ops, &js->job_lock,
@@ -210,7 +210,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
 
-	ret = pm_runtime_get_sync(pfdev->dev);
+	ret = pm_runtime_get_sync(pfdev->base.dev);
 	if (ret < 0)
 		return;
 
@@ -261,7 +261,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		}
 
 		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
-		dev_dbg(pfdev->dev,
+		dev_dbg(pfdev->base.dev,
 			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
 			job, js, subslot, jc_head, cfg & 0xf);
 	}
@@ -446,12 +446,12 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 	bool signal_fence = true;
 
 	if (!panfrost_exception_is_fault(js_status)) {
-		dev_dbg(pfdev->dev, "js event, js=%d, status=%s, head=0x%x, tail=0x%x",
+		dev_dbg(pfdev->base.dev, "js event, js=%d, status=%s, head=0x%x, tail=0x%x",
 			js, exception_name,
 			job_read(pfdev, JS_HEAD_LO(js)),
 			job_read(pfdev, JS_TAIL_LO(js)));
 	} else {
-		dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
+		dev_err(pfdev->base.dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
 			js, exception_name,
 			job_read(pfdev, JS_HEAD_LO(js)),
 			job_read(pfdev, JS_TAIL_LO(js)));
@@ -483,7 +483,7 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 	if (signal_fence)
 		dma_fence_signal_locked(job->done_fence);
 
-	pm_runtime_put_autosuspend(pfdev->dev);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 
 	if (panfrost_exception_needs_reset(pfdev, js_status)) {
 		atomic_set(&pfdev->reset.pending, 1);
@@ -502,7 +502,7 @@ static void panfrost_job_handle_done(struct panfrost_device *pfdev,
 	panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 
 	dma_fence_signal_locked(job->done_fence);
-	pm_runtime_put_autosuspend(pfdev->dev);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
 static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
@@ -611,7 +611,7 @@ static void panfrost_job_handle_irqs(struct panfrost_device *pfdev)
 	u32 status = job_read(pfdev, JOB_INT_RAWSTAT);
 
 	while (status) {
-		pm_runtime_mark_last_busy(pfdev->dev);
+		pm_runtime_mark_last_busy(pfdev->base.dev);
 
 		spin_lock(&pfdev->js->job_lock);
 		panfrost_job_handle_irq(pfdev, status);
@@ -692,7 +692,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 				 10, 10000);
 
 	if (ret)
-		dev_err(pfdev->dev, "Soft-stop failed\n");
+		dev_err(pfdev->base.dev, "Soft-stop failed\n");
 
 	/* Handle the remaining interrupts before we reset. */
 	panfrost_job_handle_irqs(pfdev);
@@ -710,7 +710,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
 			    pfdev->jobs[i][j]->is_profiled)
 				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
-			pm_runtime_put_noidle(pfdev->dev);
+			pm_runtime_put_noidle(pfdev->base.dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 		}
 	}
@@ -778,11 +778,11 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	synchronize_irq(pfdev->js->irq);
 
 	if (dma_fence_is_signaled(job->done_fence)) {
-		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
+		dev_warn(pfdev->base.dev, "unexpectedly high interrupt latency\n");
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
+	dev_err(pfdev->base.dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
 		js,
 		job_read(pfdev, JS_CONFIG(js)),
 		job_read(pfdev, JS_STATUS(js)),
@@ -850,7 +850,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = 2,
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
-		.dev = pfdev->dev,
+		.dev = pfdev->base.dev,
 	};
 	struct panfrost_job_slot *js;
 	int ret, j;
@@ -864,24 +864,25 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_JOBCHAIN_DISAMBIGUATION))
 		args.credit_limit = 1;
 
-	pfdev->js = js = devm_kzalloc(pfdev->dev, sizeof(*js), GFP_KERNEL);
+	js = devm_kzalloc(pfdev->base.dev, sizeof(*js), GFP_KERNEL);
 	if (!js)
 		return -ENOMEM;
+	pfdev->js = js;
 
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 	spin_lock_init(&js->job_lock);
 
-	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
+	js->irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "job");
 	if (js->irq < 0)
 		return js->irq;
 
-	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
+	ret = devm_request_threaded_irq(pfdev->base.dev, js->irq,
 					panfrost_job_irq_handler,
 					panfrost_job_irq_handler_thread,
 					IRQF_SHARED, KBUILD_MODNAME "-job",
 					pfdev);
 	if (ret) {
-		dev_err(pfdev->dev, "failed to request job irq");
+		dev_err(pfdev->base.dev, "failed to request job irq");
 		return ret;
 	}
 
@@ -896,7 +897,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 
 		ret = drm_sched_init(&js->queue[j].sched, &args);
 		if (ret) {
-			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
+			dev_err(pfdev->base.dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
 		}
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index f6b91c052cfb..1d696eeea2fa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -81,7 +81,7 @@ static int wait_ready(struct panfrost_device *pfdev, u32 as_nr)
 	if (ret) {
 		/* The GPU hung, let's trigger a reset */
 		panfrost_device_schedule_reset(pfdev);
-		dev_err(pfdev->dev, "AS_ACTIVE bit stuck\n");
+		dev_err(pfdev->base.dev, "AS_ACTIVE bit stuck\n");
 	}
 
 	return ret;
@@ -222,7 +222,7 @@ static int mmu_cfg_init_aarch64_4k(struct panfrost_mmu *mmu)
 	struct io_pgtable_cfg *pgtbl_cfg = &mmu->pgtbl_cfg;
 	struct panfrost_device *pfdev = mmu->pfdev;
 
-	if (drm_WARN_ON(pfdev->ddev, pgtbl_cfg->arm_lpae_s1_cfg.ttbr &
+	if (drm_WARN_ON(&pfdev->base, pgtbl_cfg->arm_lpae_s1_cfg.ttbr &
 				     ~AS_TRANSTAB_AARCH64_4K_ADDR_MASK))
 		return -EINVAL;
 
@@ -253,7 +253,7 @@ static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
 		return mmu_cfg_init_mali_lpae(mmu);
 	default:
 		/* This should never happen */
-		drm_WARN(pfdev->ddev, 1, "Invalid pgtable format");
+		drm_WARN(&pfdev->base, 1, "Invalid pgtable format");
 		return -EINVAL;
 	}
 }
@@ -315,7 +315,9 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 	atomic_set(&mmu->as_count, 1);
 	list_add(&mmu->list, &pfdev->as_lru_list);
 
-	dev_dbg(pfdev->dev, "Assigned AS%d to mmu %p, alloc_mask=%lx", as, mmu, pfdev->as_alloc_mask);
+	dev_dbg(pfdev->base.dev,
+		"Assigned AS%d to mmu %p, alloc_mask=%lx",
+		as, mmu, pfdev->as_alloc_mask);
 
 	panfrost_mmu_enable(pfdev, mmu);
 
@@ -381,13 +383,13 @@ static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
 	if (mmu->as < 0)
 		return;
 
-	pm_runtime_get_noresume(pfdev->dev);
+	pm_runtime_get_noresume(pfdev->base.dev);
 
 	/* Flush the PTs only if we're already awake */
-	if (pm_runtime_active(pfdev->dev))
+	if (pm_runtime_active(pfdev->base.dev))
 		mmu_hw_do_operation(pfdev, mmu, iova, size, AS_COMMAND_FLUSH_PT);
 
-	pm_runtime_put_autosuspend(pfdev->dev);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
 static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
@@ -402,7 +404,9 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 		unsigned long paddr = sg_dma_address(sgl);
 		size_t len = sg_dma_len(sgl);
 
-		dev_dbg(pfdev->dev, "map: as=%d, iova=%llx, paddr=%lx, len=%zx", mmu->as, iova, paddr, len);
+		dev_dbg(pfdev->base.dev,
+			"map: as=%d, iova=%llx, paddr=%lx, len=%zx",
+			mmu->as, iova, paddr, len);
 
 		while (len) {
 			size_t pgcount, mapped = 0;
@@ -462,7 +466,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 	if (WARN_ON(!mapping->active))
 		return;
 
-	dev_dbg(pfdev->dev, "unmap: as=%d, iova=%llx, len=%zx",
+	dev_dbg(pfdev->base.dev, "unmap: as=%d, iova=%llx, len=%zx",
 		mapping->mmu->as, iova, len);
 
 	while (unmapped_len < len) {
@@ -559,7 +563,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 
 	bo = bomapping->obj;
 	if (!bo->is_heap) {
-		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
+		dev_WARN(pfdev->base.dev, "matching BO is not heap type (GPU VA = %llx)",
 			 bomapping->mmnode.start << PAGE_SHIFT);
 		ret = -EINVAL;
 		goto err_bo;
@@ -626,7 +630,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	if (ret)
 		goto err_unlock;
 
-	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(pfdev->base.dev, sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
 		goto err_map;
 
@@ -636,7 +640,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	bomapping->active = true;
 	bo->heap_rss_size += SZ_2M;
 
-	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
+	dev_dbg(pfdev->base.dev, "mapped page fault @ AS%d %llx", as, addr);
 
 out:
 	dma_resv_unlock(obj->resv);
@@ -662,10 +666,10 @@ static void panfrost_mmu_release_ctx(struct kref *kref)
 
 	spin_lock(&pfdev->as_lock);
 	if (mmu->as >= 0) {
-		pm_runtime_get_noresume(pfdev->dev);
-		if (pm_runtime_active(pfdev->dev))
+		pm_runtime_get_noresume(pfdev->base.dev);
+		if (pm_runtime_active(pfdev->base.dev))
 			panfrost_mmu_disable(pfdev, mmu->as);
-		pm_runtime_put_autosuspend(pfdev->dev);
+		pm_runtime_put_autosuspend(pfdev->base.dev);
 
 		clear_bit(mmu->as, &pfdev->as_alloc_mask);
 		clear_bit(mmu->as, &pfdev->as_in_use_mask);
@@ -726,7 +730,7 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 
 	if (pfdev->comp->gpu_quirks & BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE)) {
 		if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
-			dev_err_once(pfdev->dev,
+			dev_err_once(pfdev->base.dev,
 				     "AARCH64_4K page table not supported\n");
 			return ERR_PTR(-EINVAL);
 		}
@@ -755,7 +759,7 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 		.oas		= pa_bits,
 		.coherent_walk	= pfdev->coherent,
 		.tlb		= &mmu_tlb_ops,
-		.iommu_dev	= pfdev->dev,
+		.iommu_dev	= pfdev->base.dev,
 	};
 
 	mmu->pgtbl_ops = alloc_io_pgtable_ops(fmt, &mmu->pgtbl_cfg, mmu);
@@ -848,7 +852,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 
 		if (ret) {
 			/* terminal fault, print info about the fault */
-			dev_err(pfdev->dev,
+			dev_err(pfdev->base.dev,
 				"Unhandled Page fault in AS%d at VA 0x%016llX\n"
 				"Reason: %s\n"
 				"raw fault status: 0x%X\n"
@@ -896,18 +900,18 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 {
 	int err;
 
-	pfdev->mmu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
+	pfdev->mmu_irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "mmu");
 	if (pfdev->mmu_irq < 0)
 		return pfdev->mmu_irq;
 
-	err = devm_request_threaded_irq(pfdev->dev, pfdev->mmu_irq,
+	err = devm_request_threaded_irq(pfdev->base.dev, pfdev->mmu_irq,
 					panfrost_mmu_irq_handler,
 					panfrost_mmu_irq_handler_thread,
 					IRQF_SHARED, KBUILD_MODNAME "-mmu",
 					pfdev);
 
 	if (err) {
-		dev_err(pfdev->dev, "failed to request mmu irq");
+		dev_err(pfdev->base.dev, "failed to request mmu irq");
 		return err;
 	}
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 0dd62e8b2fa7..718eb44b40f8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -84,11 +84,11 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	else if (perfcnt->user)
 		return -EBUSY;
 
-	ret = pm_runtime_get_sync(pfdev->dev);
+	ret = pm_runtime_get_sync(pfdev->base.dev);
 	if (ret < 0)
 		goto err_put_pm;
 
-	bo = drm_gem_shmem_create(pfdev->ddev, perfcnt->bosize);
+	bo = drm_gem_shmem_create(&pfdev->base, perfcnt->bosize);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto err_put_pm;
@@ -175,7 +175,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 err_put_bo:
 	drm_gem_object_put(&bo->base);
 err_put_pm:
-	pm_runtime_put(pfdev->dev);
+	pm_runtime_put(pfdev->base.dev);
 	return ret;
 }
 
@@ -203,7 +203,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
 	panfrost_gem_mapping_put(perfcnt->mapping);
 	perfcnt->mapping = NULL;
-	pm_runtime_put_autosuspend(pfdev->dev);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 
 	return 0;
 }
@@ -211,7 +211,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 int panfrost_ioctl_perfcnt_enable(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv)
 {
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
 	struct drm_panfrost_perfcnt_enable *req = data;
 	int ret;
@@ -238,7 +238,7 @@ int panfrost_ioctl_perfcnt_enable(struct drm_device *dev, void *data,
 int panfrost_ioctl_perfcnt_dump(struct drm_device *dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_device *pfdev = to_panfrost_device(dev);
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
 	struct drm_panfrost_perfcnt_dump *req = data;
 	void __user *user_ptr = (void __user *)(uintptr_t)req->buf_ptr;
@@ -273,12 +273,12 @@ void panfrost_perfcnt_close(struct drm_file *file_priv)
 	struct panfrost_device *pfdev = pfile->pfdev;
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
 
-	pm_runtime_get_sync(pfdev->dev);
+	pm_runtime_get_sync(pfdev->base.dev);
 	mutex_lock(&perfcnt->lock);
 	if (perfcnt->user == pfile)
 		panfrost_perfcnt_disable_locked(pfdev, file_priv);
 	mutex_unlock(&perfcnt->lock);
-	pm_runtime_put_autosuspend(pfdev->dev);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
 int panfrost_perfcnt_init(struct panfrost_device *pfdev)
@@ -316,7 +316,7 @@ int panfrost_perfcnt_init(struct panfrost_device *pfdev)
 		       COUNTERS_PER_BLOCK * BYTES_PER_COUNTER;
 	}
 
-	perfcnt = devm_kzalloc(pfdev->dev, sizeof(*perfcnt), GFP_KERNEL);
+	perfcnt = devm_kzalloc(pfdev->base.dev, sizeof(*perfcnt), GFP_KERNEL);
 	if (!perfcnt)
 		return -ENOMEM;
 
-- 
2.51.0

