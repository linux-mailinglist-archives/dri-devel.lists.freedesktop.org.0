Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE327441B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C1789F85;
	Tue, 22 Sep 2020 14:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D5676E86E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:17:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C104B12FC;
 Tue, 22 Sep 2020 07:17:00 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 363353F718;
 Tue, 22 Sep 2020 07:16:59 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com
Subject: [PATCH v2 2/3] drm/panfrost: Support cache-coherent integrations
Date: Tue, 22 Sep 2020 15:16:49 +0100
Message-Id: <7024ce18c1cb1a226e918037d49175571db0b436.1600780574.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1600780574.git.robin.murphy@arm.com>
References: <cover.1600780574.git.robin.murphy@arm.com>
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
Cc: linux-amlogic@lists.infradead.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the GPU's ACE-Lite interface is fully wired up and capable of
snooping CPU caches, it may be described as "dma-coherent" in
devicetree, which will already inform the DMA layer not to perform
unnecessary cache maintenance. However, we still need to ensure that
the GPU uses the appropriate cacheable outer-shareable attributes in
order to generate the requisite snoop signals, and that CPU mappings
don't create a mismatch by using a non-cacheable type either.

Reviewed-by: Steven Price <steven.price@arm.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 2 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 +
 4 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index c30c719a8059..b31f45315e96 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -84,6 +84,7 @@ struct panfrost_device {
 	/* pm_domains for devices with more than one. */
 	struct device *pm_domain_devs[MAX_PM_DOMAINS];
 	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
+	bool coherent;
 
 	struct panfrost_features features;
 	const struct panfrost_compatible *comp;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ada51df9a7a3..2a6f2f716b2f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -588,6 +588,8 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (!pfdev->comp)
 		return -ENODEV;
 
+	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
+
 	/* Allocate and initialze the DRM device. */
 	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
 	if (IS_ERR(ddev))
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 33355dd302f1..cdf1a8754eba 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -220,6 +220,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
  */
 struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size)
 {
+	struct panfrost_device *pfdev = dev->dev_private;
 	struct panfrost_gem_object *obj;
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
@@ -229,6 +230,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	INIT_LIST_HEAD(&obj->mappings.list);
 	mutex_init(&obj->mappings.lock);
 	obj->base.base.funcs = &panfrost_gem_funcs;
+	obj->base.map_cached = pfdev->coherent;
 
 	return &obj->base.base;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e8f7b11352d2..8852fd378f7a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -371,6 +371,7 @@ int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
 		.pgsize_bitmap	= SZ_4K | SZ_2M,
 		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
 		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
+		.coherent_walk	= pfdev->coherent,
 		.tlb		= &mmu_tlb_ops,
 		.iommu_dev	= pfdev->dev,
 	};
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
