Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE24FBDAD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264E10F55D;
	Mon, 11 Apr 2022 13:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B87710F55D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:46:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A365E1570;
 Mon, 11 Apr 2022 06:46:47 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC3083F73B;
 Mon, 11 Apr 2022 06:46:46 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2] drm/tegra: Stop using iommu_present()
Date: Mon, 11 Apr 2022 14:46:43 +0100
Message-Id: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor the confusing logic to make it both clearer and more robust. If
the host1x parent device does have an IOMMU domain then iommu_present()
is redundantly true, while otherwise for the 32-bit DMA mask case it
still doesn't say whether the IOMMU driver actually knows about the DRM
device or not.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Fix logic for older SoCs and clarify.

 drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 9464f522e257..4f2bdab31064 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
 	struct iommu_domain *domain;
 
+	/* For starters, this is moot if no IOMMU is available */
+	if (!device_iommu_mapped(&dev->dev))
+		return false;
+
+	/*
+	 * Tegra20 and Tegra30 don't support addressing memory beyond the
+	 * 32-bit boundary, so the regular GATHER opcodes will always be
+	 * sufficient and whether or not the host1x is attached to an IOMMU
+	 * doesn't matter.
+	 */
+	if (host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
+		return true;
+
 	/*
 	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
 	 * likely to be allocated beyond the 32-bit boundary if sufficient
@@ -1122,14 +1135,13 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	domain = iommu_get_domain_for_dev(dev->dev.parent);
 
 	/*
-	 * Tegra20 and Tegra30 don't support addressing memory beyond the
-	 * 32-bit boundary, so the regular GATHER opcodes will always be
-	 * sufficient and whether or not the host1x is attached to an IOMMU
-	 * doesn't matter.
+	 * At the moment, the exact type of domain doesn't actually matter.
+	 * Only for 64-bit kernels might this be a managed DMA API domain, and
+	 * then only on newer SoCs using arm-smmu, since tegra-smmu doesn't
+	 * support default domains at all, and since those SoCs are the same
+	 * ones with extended GATHER support, even if it's a passthrough domain
+	 * it can still work out OK.
 	 */
-	if (!domain && host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
-		return true;
-
 	return domain != NULL;
 }
 
@@ -1149,7 +1161,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
+	if (host1x_drm_wants_iommu(dev)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err = -ENOMEM;
-- 
2.28.0.dirty

