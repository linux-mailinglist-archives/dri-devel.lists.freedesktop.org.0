Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB318D2C93
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9161129F1;
	Wed, 29 May 2024 05:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiL+s0AP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322A5113034
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960980; x=1748496980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQhpQrDpkr5d6QzI9UDmfi+nhpzVyW1CcaBVDpyFpuE=;
 b=KiL+s0APhHa4cQk7rUlYR/EqLgvuj1hDt3yVBexi1tmL78/kydZGGxyt
 Zpj+5ARBuGzNCKyx3dtTf2FzVrZhY2TvhZmjdVObrROJcKEfH9pn4L80U
 8piDyhcwC+wDwWcBcgUmbGsxopq9irKlaWOTmT0D6+hbkD7qkGiJHPIPs
 q8mEpIBAL+7CH18DzcKYvpvYM5pWjPXeWhFFyKqANFCtLoSM7GqETZ3FA
 soefGYOe8XG65N992RdniAVp7iz2fE+DmUV/R53C2hIY07ZCBmRSEA1qH
 IA/nmXj2ENO42w6Lhg13g6PaJZ/0G4nctUGlwNP0HirGRuQpSzmFIe+Wl Q==;
X-CSE-ConnectionGUID: Svf94zSkT5qc55GxVHTXsw==
X-CSE-MsgGUID: +A82jt+PQ5+Ap6vFWtT9WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13568970"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13568970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:35:49 -0700
X-CSE-ConnectionGUID: ibSOuVsuTWmBLKtjWng6DA==
X-CSE-MsgGUID: w/ltsPfbRAaZqzlQJES1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257682"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:35:44 -0700
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
Subject: [PATCH 10/20] media: venus: firmware: Use iommu_paging_domain_alloc()
Date: Wed, 29 May 2024 13:32:40 +0800
Message-Id: <20240529053250.91284-11-baolu.lu@linux.intel.com>
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

An iommu domain is allocated in venus_firmware_init() and is attached to
core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/media/platform/qcom/venus/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index fe7da2b30482..66a18830e66d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -316,10 +316,10 @@ int venus_firmware_init(struct venus_core *core)
 
 	core->fw.dev = &pdev->dev;
 
-	iommu_dom = iommu_domain_alloc(&platform_bus_type);
-	if (!iommu_dom) {
+	iommu_dom = iommu_paging_domain_alloc(core->fw.dev);
+	if (IS_ERR(iommu_dom)) {
 		dev_err(core->fw.dev, "Failed to allocate iommu domain\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(iommu_dom);
 		goto err_unregister;
 	}
 
-- 
2.34.1

