Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757628FA7DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1110E404;
	Tue,  4 Jun 2024 01:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9g6H+yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0D610E418
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466135; x=1749002135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I56l8aUrWEsOdJKWYfI6TJlpnl4t+tX3NQmfYGnyV7M=;
 b=H9g6H+yiPOB+1V2jTkmFFiAiqZ1HzZjoDyd2PhjIe/JuqavYVZ0GBhu2
 JsmIY03EuEpCHVbo6AJTitWDqaWaiUgRl3oVy7lT00cGj6v1Z+ilmn5Ip
 XKfLU/BdQaOxu8qlQI8xDsi1gNnX/4RX9LbYmiGQjQQoSDL86uHamN8ti
 HaX6rVNghyK4O/oBJgzVU67jQw6Z5BgBjyLENLutHMXU/mMjKnVVKpTCB
 TSNRMLZX50Ujeb/6/xvkKPHZkrkwzJ2vWMCW4J1Bi2afCZq+35Sj6MP4G
 jxM2QBOkndyH0gnHyI003e55hC0olphoPqqrRS8Z4yIA58jbuTbwzFG3r Q==;
X-CSE-ConnectionGUID: JriU5RlUSH+7gyRzwKGL+w==
X-CSE-MsgGUID: CgvZ1D2VR7i21GBpfziL0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25385192"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25385192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:55:35 -0700
X-CSE-ConnectionGUID: iy5Ha6XGSomqRxRqbU9xMQ==
X-CSE-MsgGUID: 0J02TVC8Qyu9oAdvu9xQyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37662052"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 18:55:31 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v2 20/22] drm/tegra: Remove call to iommu_domain_alloc()
Date: Tue,  4 Jun 2024 09:51:32 +0800
Message-Id: <20240604015134.164206-21-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604015134.164206-1-baolu.lu@linux.intel.com>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
the bus structure. The iommu subsystem no longer relies on bus for
operations. So iommu_domain_alloc() interface is no longer relevant.

Normally, iommu_paging_domain_alloc() could be a replacement for
iommu_domain_alloc() if the caller has the right device for IOMMU API
use. Unfortunately, this is not the case for this driver.

Iterate the devices on the platform bus and find a suitable device
whose device DMA is translated by an IOMMU. Then use this device to
allocate an iommu domain. The iommu subsystem prevents domains
allocated by one iommu driver from being attached to devices managed
by any different iommu driver.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/tegra/drm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..ee391f859992 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1133,6 +1133,17 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	return domain != NULL;
 }
 
+static int iommu_mapped_device(struct device *dev, void *data)
+{
+	struct device **iommu_dev = data;
+
+	if (!device_iommu_mapped(dev))
+		return 0;
+
+	*iommu_dev = dev;
+	return 1;
+}
+
 static int host1x_drm_probe(struct host1x_device *dev)
 {
 	struct tegra_drm *tegra;
@@ -1149,16 +1160,21 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
-		tegra->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tegra->domain) {
-			err = -ENOMEM;
-			goto free;
+	if (host1x_drm_wants_iommu(dev)) {
+		struct device *iommu_dev = NULL;
+
+		bus_for_each_dev(&platform_bus_type, NULL, &iommu_dev, iommu_mapped_device);
+		if (iommu_dev) {
+			tegra->domain = iommu_paging_domain_alloc(iommu_dev);
+			if (IS_ERR(tegra->domain)) {
+				err = PTR_ERR(tegra->domain);
+				goto free;
+			}
+
+			err = iova_cache_get();
+			if (err < 0)
+				goto domain;
 		}
-
-		err = iova_cache_get();
-		if (err < 0)
-			goto domain;
 	}
 
 	mutex_init(&tegra->clients_lock);
-- 
2.34.1

