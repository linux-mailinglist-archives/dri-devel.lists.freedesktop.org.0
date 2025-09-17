Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B3B7D555
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823B10E821;
	Wed, 17 Sep 2025 12:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="YShtF36k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D4E10E821
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 12:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758111834; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NKLexEr7AJLZ0/b8937VhVppN9TmQHQVr6fM0zJzzlgAjq8LZZXPp5T6zO+LDX5Qn/p/sJkMCs8Ax5iavyvVkDnc6P2Er0t44C+6TAJhicCidb48jD0rrYkWEU20dnGW6en/CMsDORVREq0ynGcnEtAIioaAHJAYiyyJCitAgQc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758111834;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YgQ1u8TXIPwB5gikKQCGFASO6bmBVfR87cbZTdgE0KE=; 
 b=RpVOTNHwAKPwamnIRJ6C13mFP2PJZUI7NOsKPN1UDYHD7T2N9E5n3IywkwR14SJhUnuIGRaHvKZ3oU4SrmqjnhxMPljVIKNdC60dztjvG3RcFw7YoKirf1RUe5Mz2SQ1ynJy7KwrnIzrLVWJOj8VZGcupCQwkmaG9+6XOyrmbwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111834; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=YgQ1u8TXIPwB5gikKQCGFASO6bmBVfR87cbZTdgE0KE=;
 b=YShtF36kV71aKi9+JCwVxqWAipFlmF4bBznV97zLh5XAJak0XOdfvXqbLm2scdL7
 5l7hBDx0vDqbXEeQuhlKLgONSC6qsL9UWWVOxmgUzfriwynmku9NuQoNi02zNaWRH5X
 gB4dCAfu5ohTadrV2IWZwb7lWFlU9HbKrTOdWsCE=
Received: by mx.zohomail.com with SMTPS id 1758111833136461.8065563339446;
 Wed, 17 Sep 2025 05:23:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Sep 2025 14:22:39 +0200
Subject: [PATCH v3 08/10] drm/panthor: devfreq: add pluggable devfreq providers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-mt8196-gpufreq-v3-8-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

On some devices, devfreq is not controlled directly by DT OPPs and the
common clock framework, but through an external devfreq driver. To
permit this type of usage, add the concept of devfreq providers.

Devfreq providers for panthor register themselves with panthor as a
provider. panthor then gets whatever device is pointed at on its
performance-domains property, finds the registered devfreq provider for
it, and uses its registered devfreq ops. It wraps those operations by
passing the provider ops the provider's struct device, as opposed to the
panthor device.

Providers can choose to omit overloading some operations. In that case,
panthor's own implementation is used. The only exception is the exit
operation, which panthor does not use, and the wrapper only gets
registered if a provider needs it.

Should the probe order work out such that panthor probes before the
devfreq provider is finished probing and registering itself, then we
just defer the probe after adding a device link.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 190 ++++++++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_devfreq.h |  47 ++++++++
 2 files changed, 212 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 118da7cbb3c809e4aabfef7d20914e61c2b62555..1f10724e2f08df09b52fa1a27ffe9cfd49994b09 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -4,6 +4,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
@@ -34,6 +35,12 @@ struct panthor_devfreq {
 	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
 	bool last_busy_state;
 
+	/**
+	 * @panthor_devfreq_provider: the used performance-domain controller
+	 * through which devfreq callbacks are passed onto, or NULL if none.
+	 */
+	struct panthor_devfreq_provider *provider;
+
 	/**
 	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
 	 * last_busy_state.
@@ -44,6 +51,19 @@ struct panthor_devfreq {
 	spinlock_t lock;
 };
 
+static LIST_HEAD(panthor_devfreq_providers);
+static DEFINE_MUTEX(panthor_devfreq_providers_lock);
+
+int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov)
+{
+	guard(mutex)(&panthor_devfreq_providers_lock);
+
+	list_add(&prov->node, &panthor_devfreq_providers);
+
+	return 0;
+}
+EXPORT_SYMBOL(panthor_devfreq_register_provider);
+
 static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 {
 	ktime_t now, last;
@@ -59,12 +79,26 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 	pdevfreq->time_last_update = now;
 }
 
+static void panthor_devfreq_exit(struct device *dev)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	struct panthor_devfreq_provider *provider = ptdev->devfreq->provider;
+
+	if (provider && provider->exit)
+		provider->exit(provider->dev);
+}
+
 static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 				  u32 flags)
 {
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	struct panthor_devfreq_provider *provider = ptdev->devfreq->provider;
 	struct dev_pm_opp *opp;
 	int err;
 
+	if (provider && provider->target)
+		return provider->target(provider->dev, freq, flags);
+
 	opp = devfreq_recommended_opp(dev, freq, flags);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
@@ -87,6 +121,7 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	struct panthor_devfreq_provider *provider = pdevfreq->provider;
 	struct devfreq_dev_profile *p = pdevfreq->devfreq->profile;
 	unsigned long irqflags;
 	int ret;
@@ -97,32 +132,42 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 
 	spin_lock_irqsave(&pdevfreq->lock, irqflags);
 
-	panthor_devfreq_update_utilization(pdevfreq);
+	if (provider && provider->get_dev_status) {
+		ret = provider->get_dev_status(provider->dev, status);
+	} else {
+		panthor_devfreq_update_utilization(pdevfreq);
 
-	status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
-						   pdevfreq->idle_time));
+		status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
+							   pdevfreq->idle_time));
 
-	status->busy_time = ktime_to_ns(pdevfreq->busy_time);
+		status->busy_time = ktime_to_ns(pdevfreq->busy_time);
 
-	panthor_devfreq_reset(pdevfreq);
+		panthor_devfreq_reset(pdevfreq);
+	}
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 
-	drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
-		status->busy_time, status->total_time,
-		status->busy_time / (status->total_time / 100),
-		status->current_frequency / 1000 / 1000);
+	if (!ret)
+		drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
+			status->busy_time, status->total_time,
+			status->busy_time / (status->total_time / 100),
+			status->current_frequency / 1000 / 1000);
 
-	return 0;
+	return ret;
 }
 
 static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	struct panthor_devfreq_provider *provider = ptdev->devfreq->provider;
+	int ret = 0;
 
-	*freq = clk_get_rate(ptdev->clks.core);
+	if (provider && provider->get_cur_freq)
+		ret = provider->get_cur_freq(provider->dev, freq);
+	else
+		*freq = clk_get_rate(ptdev->clks.core);
 
-	return 0;
+	return ret;
 }
 
 static struct devfreq_dev_profile panthor_devfreq_profile = {
@@ -133,7 +178,51 @@ static struct devfreq_dev_profile panthor_devfreq_profile = {
 	.get_cur_freq = panthor_devfreq_get_cur_freq,
 };
 
-int panthor_devfreq_init(struct panthor_device *ptdev)
+static int panthor_devfreq_use_provider(struct panthor_device *ptdev,
+					struct panthor_devfreq_provider *provider)
+{
+	struct devfreq_dev_profile *p = &panthor_devfreq_profile;
+	struct device *dev = ptdev->base.dev;
+	unsigned int i;
+	int ret = 0;
+
+	ptdev->devfreq->provider = provider;
+
+	if (provider->exit)
+		p->exit = panthor_devfreq_exit;
+
+	for (i = 0; i < provider->num_opps; i++) {
+		ret = dev_pm_opp_add_dynamic(dev, provider->opp_table[i]);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "Couldn't add OPP %u: %pe\n", i, ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	p->max_state = provider->num_opps;
+
+	if (provider->num_opps)
+		ptdev->fast_rate = provider->opp_table[provider->num_opps - 1]->freq;
+
+	return ret;
+}
+
+static int panthor_devfreq_init_provider(struct panthor_device *ptdev,
+					 struct device *provider_dev)
+{
+	struct panthor_devfreq_provider *prov;
+
+	guard(mutex)(&panthor_devfreq_providers_lock);
+
+	list_for_each_entry(prov, &panthor_devfreq_providers, node) {
+		if (prov->dev == provider_dev)
+			return panthor_devfreq_use_provider(ptdev, prov);
+	}
+
+	return -EPROBE_DEFER;
+}
+
+static int panthor_devfreq_init_of(struct panthor_device *ptdev)
 {
 	/* There's actually 2 regulators (mali and sram), but the OPP core only
 	 * supports one.
@@ -142,20 +231,12 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	 * the coupling logic deal with voltage updates.
 	 */
 	static const char * const reg_names[] = { "mali", NULL };
-	struct thermal_cooling_device *cooling;
 	struct device *dev = ptdev->base.dev;
-	struct panthor_devfreq *pdevfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	unsigned long freq = ULONG_MAX;
 	int ret;
 
-	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
-	if (!pdevfreq)
-		return -ENOMEM;
-
-	ptdev->devfreq = pdevfreq;
-
 	ret = devm_pm_opp_set_regulators(dev, reg_names);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
@@ -168,10 +249,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
-	spin_lock_init(&pdevfreq->lock);
-
-	panthor_devfreq_reset(pdevfreq);
-
 	cur_freq = clk_get_rate(ptdev->clks.core);
 
 	/* Regulator coupling only takes care of synchronizing/balancing voltage
@@ -229,6 +306,61 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	dev_pm_opp_put(opp);
 
+	return 0;
+}
+
+static int panthor_devfreq_init_platform(struct panthor_device *ptdev)
+{
+	struct device_node *pcnode;
+	struct platform_device *pdev;
+	struct device_link *link;
+	int ret;
+
+	pcnode = of_parse_phandle(ptdev->base.dev->of_node,
+				  "performance-domains", 0);
+	if (!pcnode)
+		return -EINVAL;
+
+	pdev = of_find_device_by_node(pcnode);
+	of_node_put(pcnode);
+	if (!pdev)
+		return -ENODEV;
+
+	link = device_link_add(ptdev->base.dev, &pdev->dev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link) {
+		dev_err(ptdev->base.dev, "failed to add device link\n");
+		return -ENODEV;
+	}
+
+	ret = panthor_devfreq_init_provider(ptdev, &pdev->dev);
+	if (ret)
+		return dev_err_probe(ptdev->base.dev, ret,
+				     "failed to initialize devfreq provider\n");
+
+	DRM_DEV_INFO(ptdev->base.dev, "initialized devfreq provider %s\n",
+		     dev_name(&pdev->dev));
+
+	return 0;
+}
+
+int panthor_devfreq_init(struct panthor_device *ptdev)
+{
+	struct thermal_cooling_device *cooling;
+	struct device *dev = ptdev->base.dev;
+	struct panthor_devfreq *pdevfreq;
+	int ret;
+
+	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
+	if (!pdevfreq)
+		return -ENOMEM;
+
+	ptdev->devfreq = pdevfreq;
+
+	spin_lock_init(&pdevfreq->lock);
+
+	panthor_devfreq_reset(pdevfreq);
+
 	/*
 	 * Setup default thresholds for the simple_ondemand governor.
 	 * The values are chosen based on experiments.
@@ -236,6 +368,14 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	pdevfreq->gov_data.upthreshold = 45;
 	pdevfreq->gov_data.downdifferential = 5;
 
+	if (!of_property_present(dev->of_node, "performance-domains"))
+		ret = panthor_devfreq_init_of(ptdev);
+	else
+		ret = panthor_devfreq_init_platform(ptdev);
+
+	if (ret)
+		return ret;
+
 	pdevfreq->devfreq = devm_devfreq_add_device(dev, &panthor_devfreq_profile,
 						    DEVFREQ_GOV_SIMPLE_ONDEMAND,
 						    &pdevfreq->gov_data);
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index f8e29e02f66cb3281ed4bb4c75cda9bd4df82b92..777045d406242f46dea376bccb999bfc11f92a7a 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -10,6 +10,51 @@ struct thermal_cooling_device;
 struct panthor_device;
 struct panthor_devfreq;
 
+struct panthor_devfreq_provider {
+	/** @dev: device pointer to the provider device */
+	struct device *dev;
+
+	/**
+	 * @opp_table: table of unique OPPs, sorted from lowest frequency to
+	 * highest.
+	 */
+	struct dev_pm_opp_data **opp_table;
+
+	/** @num_opps: number of entries in @opp_table. */
+	unsigned int num_opps;
+
+	/**
+	 * @target: &struct devfreq_dev_profile "target" callback to wrap,
+	 * optional. Falls back to panthor internal implementation if absent.
+	 * Passes @dev as the first parameter, not panthor's device.
+	 */
+	int (*target)(struct device *dev, unsigned long *freq, u32 flags);
+
+	/**
+	 * @get_dev_status: &struct devfreq_dev_profile "get_dev_status" callback
+	 * to wrap, optional. Falls back to panthor internal implementation if
+	 * absent. Passes @dev as the first parameter, not panthor's device.
+	 */
+	int (*get_dev_status)(struct device *dev,
+			      struct devfreq_dev_status *stat);
+
+	/**
+	 * @get_cur_freq: &struct devfreq_dev_profile "get_dev_status" callback
+	 * to wrap, optional. Falls back to panthor internal implementation if
+	 * absent. Passes @dev as the first parameter, not panthor's device.
+	 */
+	int (*get_cur_freq)(struct device *dev, unsigned long *freq);
+
+	/**
+	 * @exit:  &struct devfreq_dev_profile "exit" callback to wrap, optional.
+	 * Falls back to not registering one an exit function at all if absent.
+	 * Passes @dev as the first parameter, not panthor's device.
+	 */
+	void (*exit)(struct device *dev);
+
+	struct list_head node;
+};
+
 int panthor_devfreq_init(struct panthor_device *ptdev);
 
 void panthor_devfreq_resume(struct panthor_device *ptdev);
@@ -20,4 +65,6 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev);
 
 unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
 
+int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov);
+
 #endif /* __PANTHOR_DEVFREQ_H__ */

-- 
2.51.0

