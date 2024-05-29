Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0138D2C84
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36542113116;
	Wed, 29 May 2024 05:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEjvpa7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736891130FE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960983; x=1748496983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kv68qkR9q97yuL81djioGxxqJnKTS0o+E5D+XI6WQks=;
 b=fEjvpa7V1IaOk/PMm4+cS6wlwSmmafhwB9mxRmGszHh+eFavZKBHPyQc
 ja93Ku9zFwskHeOks7t+WiAxHfiRdYERINwbJCzx4GCsR5n9uhqNd7TgC
 1qCPyjUrm9jqQ7VzBtPoQbubQh9o2otLJ+5fsPh6YmFvRAnyRJnD9HFQ6
 HCYbgDsQlLgWc7x2xASZqHmTbEB6eEdaHwtGCXhl+fU4j44VdbDpTdrYl
 dO8OFgh7T1gX/yvlCDHp4xHbtMsQVIUa3QLydxqq36SYFDMfdJ0kng/64
 k+YKsjWjZA50UY1Y8a/kI/yflo5lg0EHZCJPZqWO0Wa7CVHvansaqq9Gb Q==;
X-CSE-ConnectionGUID: mIQKph62TPejpesWmkXdSg==
X-CSE-MsgGUID: 81u/inZ9S5aggsXW5ycXwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13569000"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13569000"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:35:53 -0700
X-CSE-ConnectionGUID: C5UxFXeCS62GXV5ofkH9mg==
X-CSE-MsgGUID: 0gi2TYzwQaSnWJDrgXMwWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257688"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:35:49 -0700
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
Subject: [PATCH 11/20] ath10k: Use iommu_paging_domain_alloc()
Date: Wed, 29 May 2024 13:32:41 +0800
Message-Id: <20240529053250.91284-12-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529053250.91284-1-baolu.lu@linux.intel.com>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
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

An iommu domain is allocated in ath10k_fw_init() and is attached to
ar_snoc->fw.dev in the same function. Use iommu_paging_domain_alloc() to
make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8530550cf5df..0fe47d51013c 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1635,10 +1635,10 @@ static int ath10k_fw_init(struct ath10k *ar)
 
 	ar_snoc->fw.dev = &pdev->dev;
 
-	iommu_dom = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu_dom) {
+	iommu_dom = iommu_paging_domain_alloc(ar_snoc->fw.dev);
+	if (IS_ERR(iommu_dom)) {
 		ath10k_err(ar, "failed to allocate iommu domain\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(iommu_dom);
 		goto err_unregister;
 	}
 
-- 
2.34.1

