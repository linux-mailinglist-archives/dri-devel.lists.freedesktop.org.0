Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5BA8FA7DA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE18310E411;
	Tue,  4 Jun 2024 01:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn7l0nOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2F10E40D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466125; x=1749002125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9YhH5rA1b+ID5Xo/cB0X+5j1j2KZOf2zs+wByq5adpQ=;
 b=Nn7l0nOSktkuJJtwluKnuA5MVDsA8MaGFRnzT2tU/5W8dCN3Kjq3b8gy
 O0Msoco0kgrCd+2NnOOaFHjMPl674zrJI8ZGnGTC6c+qukWjMC3jpifwR
 L4hI2LddPywPwrPTOCcOWEbG9wYoIsjV+at7aF3LrxvOiISWUzuZc7jXa
 HKCRgdxIyi57TG99mCMTj4255oo/CADnlxL3y8SCOeUO79BO0vA3nQQFB
 SdaKJC7iCTsozBsMreoDFgWn6AXLZzK3DnaFAHJQt8U5WUF53hFE42/lh
 6C/vO7gvibvU/wBDVkcwG0gqXtAHKYzK2it4eeT4CMJUzELe9r1y3dGCE g==;
X-CSE-ConnectionGUID: 4IGvBr3hS1iAWgHHpxH+Rw==
X-CSE-MsgGUID: fdIIo+NBRvi36TpM9KCTjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25385150"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25385150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:55:25 -0700
X-CSE-ConnectionGUID: T4omcRksRbOOdlHyphpw8A==
X-CSE-MsgGUID: c7zTJVNbQXuNhzYvb42Urw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37662045"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 18:55:21 -0700
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
Subject: [PATCH v2 18/22] ARM: dma-mapping: Use iommu_paging_domain_alloc()
Date: Tue,  4 Jun 2024 09:51:30 +0800
Message-Id: <20240604015134.164206-19-baolu.lu@linux.intel.com>
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

Since arm_iommu_create_mapping() now accepts the device, let's replace
iommu_domain_alloc() with iommu_paging_domain_alloc() to retire the former.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 arch/arm/mm/dma-mapping.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 52f9c56cc3cb..88c2d68a69c9 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1585,9 +1585,11 @@ arm_iommu_create_mapping(struct device *dev, dma_addr_t base, u64 size)
 
 	spin_lock_init(&mapping->lock);
 
-	mapping->domain = iommu_domain_alloc(dev->bus);
-	if (!mapping->domain)
+	mapping->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(mapping->domain)) {
+		err = PTR_ERR(mapping->domain);
 		goto err4;
+	}
 
 	kref_init(&mapping->kref);
 	return mapping;
-- 
2.34.1

