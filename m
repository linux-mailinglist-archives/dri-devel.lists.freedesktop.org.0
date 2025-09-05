Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE0B45490
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FF810EB72;
	Fri,  5 Sep 2025 10:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="clVEnI9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BFA10EB72
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757067868; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L4EPZidN+OdnJX59KwXFztNlAoo2Zv6EB9UwfwXFrIP7QWQ2NVx7hZ5dALXX4axIEelf+J4bNFVjG2cnW8EwEGtV5hf+GuF9ME3TguNeiHXsY8ONeRGcnzHDshfVg4Qxe7eS5/wwbHuqs3iHPtfh0qQ80yWWTYFuFJVYfv5ZSOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757067868;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BgcAwBs9k0Tva6LWKXeX4UCp/51+JkoYADUR446m4EA=; 
 b=eyBSv5Tg5Mdnl7+mhbBZaG8N+3yQ36IxdWWwZRF/kWXg6F+PzCLmiLhE9FiO0rF2h5GF/L5Y06Wqp5vxnmP646ha44FhUjTln02YWJrnnkvwbmM+Ip8ZocD64FD135r8+Kh0Gl0sZtospkLFbcBNYcu05QUlhMyqsHpKa2OwVK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067868; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=BgcAwBs9k0Tva6LWKXeX4UCp/51+JkoYADUR446m4EA=;
 b=clVEnI9jKVRfUoVuADf20X59xEZcoOU9i0kBY2vC0PhuzrTiKkH08qLOhhMMihac
 PAhk0O/X9oP4FGNQ3MsC+D2nvLuulV7RDbj57V2Vs5uUAhsO8rKlphGSXjCHRgdPX/2
 treq9HdTYn+jztxCatpObAkfPyQiSYDfvmFJSpwc=
Received: by mx.zohomail.com with SMTPS id 1757067868062527.7136886020036;
 Fri, 5 Sep 2025 03:24:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:23:05 +0200
Subject: [PATCH RFC 09/10] drm/panthor: devfreq: add pluggable devfreq
 providers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-9-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
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
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
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
provider. panthor then gets whatever driver is suckling on its
performance-node property, finds the registered devfreq provider init
function for it, and calls it.

Should the probe order work out such that panthor probes before the
devfreq provider is finished probing and registering itself, then we
just defer the probe after adding a device link.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 74 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_devfreq.h | 16 +++++++
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index d495dd856299826c4bddc205087d8914d01d7fc4..1b0c21f6f069b059b8b0e412a79556c602c5f1e7 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -4,6 +4,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
@@ -12,6 +13,34 @@
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
 
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
+static int panthor_devfreq_init_provider(struct panthor_device *ptdev,
+					 struct device *provider_dev)
+{
+	struct panthor_devfreq_provider *prov;
+
+	guard(mutex)(&panthor_devfreq_providers_lock);
+
+	list_for_each_entry(prov, &panthor_devfreq_providers, node) {
+		if (prov->dev == provider_dev)
+			return prov->init(ptdev, provider_dev);
+	}
+
+	return -EPROBE_DEFER;
+}
+
 static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 {
 	ktime_t now, last;
@@ -102,7 +131,7 @@ static struct devfreq_dev_profile panthor_devfreq_profile = {
 	.get_cur_freq = panthor_devfreq_get_cur_freq,
 };
 
-int panthor_devfreq_init(struct panthor_device *ptdev)
+static int panthor_devfreq_init_of(struct panthor_device *ptdev)
 {
 	/* There's actually 2 regulators (mali and sram), but the OPP core only
 	 * supports one.
@@ -222,6 +251,49 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+static int panthor_devfreq_init_platform(struct panthor_device *ptdev)
+{
+	struct device_node *pcnode;
+	struct platform_device *pdev;
+	struct device_link *link;
+	int ret;
+
+	pcnode = of_parse_phandle(ptdev->base.dev->of_node,
+				  "performance-controller", 0);
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
+	if (!of_property_present(ptdev->base.dev->of_node, "performance-controller"))
+		return panthor_devfreq_init_of(ptdev);
+
+	return panthor_devfreq_init_platform(ptdev);
+}
+
 void panthor_devfreq_resume(struct panthor_device *ptdev)
 {
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516929edb565a1f13443fb 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -8,6 +8,7 @@
 
 struct devfreq;
 struct thermal_cooling_device;
+struct platform_device;
 
 struct panthor_device;
 
@@ -43,6 +44,19 @@ struct panthor_devfreq {
 	spinlock_t lock;
 };
 
+struct panthor_devfreq_provider {
+	/** @dev: device pointer to the provider device */
+	struct device *dev;
+	/**
+	 * @init: the provider's init callback that allocates a
+	 * &struct panthor_devfreq, adds it to panthor, and adds a devfreq
+	 * device to panthor. Will be called during panthor's probe.
+	 */
+	int (*init)(struct panthor_device *ptdev, struct device *dev);
+
+	struct list_head node;
+};
+
 
 int panthor_devfreq_init(struct panthor_device *ptdev);
 
@@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
 
 unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
 
+int panthor_devfreq_register_provider(struct panthor_devfreq_provider *prov);
+
 #endif /* __PANTHOR_DEVFREQ_H__ */

-- 
2.51.0

