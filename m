Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8834F37A3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2710E911;
	Tue,  5 Apr 2022 14:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C58B910E8F4;
 Tue,  5 Apr 2022 14:21:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 626B81474;
 Tue,  5 Apr 2022 07:21:39 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27BF73F5A1;
 Tue,  5 Apr 2022 07:21:38 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com
Subject: [PATCH] drm/nouveau/tegra: Stop using iommu_present()
Date: Tue,  5 Apr 2022 15:21:34 +0100
Message-Id: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if some IOMMU has registered itself on the platform "bus", that
doesn't necessarily mean it provides translation for the device we
care about. Replace iommu_present() with a more appropriate check.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 992cc285f2fe..2ed528c065fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -123,7 +123,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 
 	mutex_init(&tdev->iommu.mutex);
 
-	if (iommu_present(&platform_bus_type)) {
+	if (device_iommu_mapped(dev)) {
 		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tdev->iommu.domain)
 			goto error;
-- 
2.28.0.dirty

