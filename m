Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF854CD5D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 17:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2F1124C2;
	Wed, 15 Jun 2022 15:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77DB71124D0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 15:48:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EF4153B;
 Wed, 15 Jun 2022 08:48:49 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.7.82])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7D33F7F5;
 Wed, 15 Jun 2022 08:48:47 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH] drm/rockchip: Detach from ARM DMA domain in attach_device
Date: Wed, 15 Jun 2022 16:48:30 +0100
Message-Id: <20220615154830.555422-1-steven.price@arm.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 1ea2a07a532b ("iommu: Add DMA ownership management
interfaces") the Rockchip display driver on the Firefly RK3288 fails to
initialise properly. This is because ARM DMA domain is still attached.

Let's follow the lead of exynos and tegra and add code to explicitly
remove the ARM domain before attaching a new one.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
See also the thread[1] where I reported the regression.

[1] https://lore.kernel.org/linux-kernel/da9cca0a-ec5b-2e73-9de0-a930f7d947b2%40arm.com
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 67d38f53d3e5..13ed33e74457 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -23,6 +23,14 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+#if defined(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#else
+#define arm_iommu_detach_device(...)	({ })
+#define arm_iommu_release_mapping(...)	({ })
+#define to_dma_iommu_mapping(dev) NULL
+#endif
+
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_gem.h"
@@ -49,6 +57,15 @@ int rockchip_drm_dma_attach_device(struct drm_device *drm_dev,
 	if (!private->domain)
 		return 0;
 
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+
+		if (mapping) {
+			arm_iommu_detach_device(dev);
+			arm_iommu_release_mapping(mapping);
+		}
+	}
+
 	ret = iommu_attach_device(private->domain, dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to attach iommu device\n");
-- 
2.25.1

