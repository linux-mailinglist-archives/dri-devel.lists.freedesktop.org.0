Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D4901D87
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 10:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1563110E398;
	Mon, 10 Jun 2024 08:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EV+NCE9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59A310E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718009950; x=1749545950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I+6ZV6/EEpnAgWEguwHFARLKzGNGpw6wFQ/PVZkM/0g=;
 b=EV+NCE9bsVtJLjYjaDx7solcBftUXrCDC0OkVpZ9sq2r7ue0PSrLbi2l
 JIOlnfJDU74Gnm0qQMpy8ik1qnfuDOC1qKVIF6xjj8K483dnTyYH5wb7r
 CqHs6lbGzI2Q9PV9xAUQjHJw+tJaUX2kNPo24j+yTSJHbtRfFUvuKmHxu
 5G471e2FS9NShu5cIHruPK5n5K7IkKJyfX70dpvNBYkg+HAMZCJbb5Rja
 Tu1eNgALLK5ET2Nu1oMZVUtc/UHABv0NcQUUIkovCDm18ti6bUBVJSbOu
 nMnARGhy/tjFqCNh0hf0naCjhU+B2yC5vlmQqK3CEOQHB6gAnObnOyKKP w==;
X-CSE-ConnectionGUID: DUWahy+kT7aS0RcXDRaTdQ==
X-CSE-MsgGUID: DcqVqAkURti6CKPBKAnQLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17581716"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="17581716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:59:08 -0700
X-CSE-ConnectionGUID: DWaGHBPtRWWyKoZXzOPdmw==
X-CSE-MsgGUID: mAUB1mHyQdCuNi096HBmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43432626"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 01:59:03 -0700
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
Subject: [PATCH v3 10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
Date: Mon, 10 Jun 2024 16:55:44 +0800
Message-Id: <20240610085555.88197-11-baolu.lu@linux.intel.com>
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

An iommu domain is allocated in ath10k_fw_init() and is attached to
ar_snoc->fw.dev in the same function. Use iommu_paging_domain_alloc() to
make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
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

