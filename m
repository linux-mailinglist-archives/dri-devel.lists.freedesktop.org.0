Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC968FA7C4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975B610E3F3;
	Tue,  4 Jun 2024 01:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGomGvjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AE510E3F3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466044; x=1749002044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i2g4o4FMSNI6vy56g2mVccrM+MuXNKNyXwoqmECaK9M=;
 b=MGomGvjh19dTkPR0w1aBpGbXedA+oPSkuq190ZKphcsIsv7LtWHsbPZg
 CrbBz91rhpz2nCsFCd9MJBd8AfOhkQZOxFtZ6cFBh7xvFSBnx6+UkL5m8
 Ygifn6WgLQ7EyDVUrXtmnVLkanpi8h5nRpw5KvEQYi3WclSbzuxkj/4oS
 x0sEMDl0jjIl2XYdb2RSdvbOY72jCGTn29vSaDdpT3t0nBi49j2/7COVL
 JcVhHTi4Xd9hOIi/H/HUUk0s7AjjRpuxgXEsbyCltfaUd6WDF0YFP3vFf
 UMU1fenTMFsbzJiqYoZhk73i8Dh/g7J9wN8KsPWc6/X7JYrh1KNxF3pW9 g==;
X-CSE-ConnectionGUID: APlereI+SxqEGKnxGOzQEA==
X-CSE-MsgGUID: G0s+81RhRRqkZySfBa1t2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25384863"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25384863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:54:04 -0700
X-CSE-ConnectionGUID: cJdjhM31QJCIcg5kz7jpwA==
X-CSE-MsgGUID: PJKNfxZORvC21A1XdJMlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37661791"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 18:53:59 -0700
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
Subject: [PATCH v2 02/22] iommufd: Use iommu_user_domain_alloc()
Date: Tue,  4 Jun 2024 09:51:14 +0800
Message-Id: <20240604015134.164206-3-baolu.lu@linux.intel.com>
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

Replace iommu_domain_alloc() with iommu_user_domain_alloc().

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommufd/hw_pagetable.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 33d142f8057d..ada05fccb36a 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -127,21 +127,11 @@ iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
 	hwpt_paging->ioas = ioas;
 	hwpt_paging->nest_parent = flags & IOMMU_HWPT_ALLOC_NEST_PARENT;
 
-	if (ops->domain_alloc_user) {
-		hwpt->domain = ops->domain_alloc_user(idev->dev, flags, NULL,
-						      user_data);
-		if (IS_ERR(hwpt->domain)) {
-			rc = PTR_ERR(hwpt->domain);
-			hwpt->domain = NULL;
-			goto out_abort;
-		}
-		hwpt->domain->owner = ops;
-	} else {
-		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
-		if (!hwpt->domain) {
-			rc = -ENOMEM;
-			goto out_abort;
-		}
+	hwpt->domain = iommu_user_domain_alloc(idev->dev, flags);
+	if (IS_ERR(hwpt->domain)) {
+		rc = PTR_ERR(hwpt->domain);
+		hwpt->domain = NULL;
+		goto out_abort;
 	}
 
 	/*
-- 
2.34.1

