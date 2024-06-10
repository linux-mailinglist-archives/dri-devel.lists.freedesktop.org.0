Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C55901D83
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172710E38D;
	Mon, 10 Jun 2024 08:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpGzbgHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69B010E398
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718009938; x=1749545938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gcVUdhVM6KwB99b7OFzWjZ/BBZdHQiOtwXYtd2+KA+I=;
 b=OpGzbgHVTaxv/WxRsEGzwRMF1eJHaIypUc10IWthhmIRN9hO4xjIBGC8
 g+Pfo8WCb5E9iiaWeurAiitSYYYV5FblW8ZtWP2UwvZgDNW1CFofNXZi5
 /ErJPkBkd8PBB1mzrrMtXqINHsJX2RWbpOU/7MJ26oyIyfYvhyg3WsBEJ
 LNjuZg8uKUPx5Ejs+xzVKIo2nQxDSVDXtzJs/QL8Q5zAQbIWQJfYjYLum
 1tEMY5zzdMM2ga2l7YXKCojNr//s1zREiGGn3N0TJsBwVhCZPv8QnPl5s
 d8Dsth8rm4LZFseF4KeM/p3CnkdLmI3zPtdPuKl21f3+Wj8X9QK0yAyZ3 A==;
X-CSE-ConnectionGUID: 1KSEmxL+RhWpjnQCr/19WA==
X-CSE-MsgGUID: dhOR49plQGOGmOpFkP9baA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581650"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="17581650"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:58:57 -0700
X-CSE-ConnectionGUID: S518TnLfQLutDzB5t6Znmg==
X-CSE-MsgGUID: oLlb/Z4oQiiBn2odn2LRRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43432568"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:58:53 -0700
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
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v3 08/21] media: nvidia: tegra: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:42 +0800
Message-Id: <20240610085555.88197-9-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
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

An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
vde->dev. Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/iommu.c b/drivers/media/platform/nvidia/tegra-vde/iommu.c
index 5521ed3e465f..b1d9d841d944 100644
--- a/drivers/media/platform/nvidia/tegra-vde/iommu.c
+++ b/drivers/media/platform/nvidia/tegra-vde/iommu.c
@@ -78,9 +78,10 @@ int tegra_vde_iommu_init(struct tegra_vde *vde)
 		arm_iommu_release_mapping(mapping);
 	}
 #endif
-	vde->domain = iommu_domain_alloc(&platform_bus_type);
-	if (!vde->domain) {
-		err = -ENOMEM;
+	vde->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(vde->domain)) {
+		err = PTR_ERR(vde->domain);
+		vde->domain = NULL;
 		goto put_group;
 	}
 
-- 
2.34.1

