Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF38FA7D8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6310E408;
	Tue,  4 Jun 2024 01:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv+PDNX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B4E10E408
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466110; x=1749002110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q9WtpwCC02vx2ybK55ip8mbKEJ1zuaBDftnxsc6ieIQ=;
 b=cv+PDNX1p09gG2SgUoDWOnhcFPM9qGpbLN4q6zJJ5oob/hIPuVRnPErx
 lVEbpHFj4ejhgyPqzF5b8QwjniyA8E6zF/V7wjWhoD0fMMGYmwEbBVhdQ
 Bnn/mtlbz4G1+aYrN4Fl6UCm67/fRZVa92oynCISHgtHpd6TkKqvhrp+H
 PVVAoPYHNgYxLgUP6ZB8wdO95yOS2ZQReF+8NMvHOBNtFIEUuAHrn7eM4
 1I92eboU6jRn/Z0ccP87+KnaniwffSeb5V9+lKE44NoSAc+3Xbir2MmtU
 K+Ud2qh7GCr1WLLI5JFMakfVv2ZfIlzkQ7ooOsBsoRWS3RtangAkJiewu A==;
X-CSE-ConnectionGUID: BYz84tfQRgWeuJzFS3VPRQ==
X-CSE-MsgGUID: P65rufWLSxGM/sCMPwrU7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25385098"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25385098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:55:09 -0700
X-CSE-ConnectionGUID: e1r3ChScReqqwQzmKW9O+Q==
X-CSE-MsgGUID: hie+PAaPSB6kc851S6gIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37661993"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 18:55:05 -0700
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
Subject: [PATCH v2 15/22] RDMA/usnic: Use iommu_paging_domain_alloc()
Date: Tue,  4 Jun 2024 09:51:27 +0800
Message-Id: <20240604015134.164206-16-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604015134.164206-1-baolu.lu@linux.intel.com>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

usnic_uiom_alloc_pd() allocates a paging domain for a given device.
In this case, iommu_domain_alloc(dev->bus) is equivalent to 
iommu_paging_domain_alloc(dev). Replace it as iommu_domain_alloc()
has been deprecated.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/infiniband/hw/usnic/usnic_uiom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 84e0f41e7dfa..f948b76f984d 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -443,11 +443,11 @@ struct usnic_uiom_pd *usnic_uiom_alloc_pd(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	pd->domain = domain = iommu_domain_alloc(dev->bus);
-	if (!domain) {
+	pd->domain = domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(domain)) {
 		usnic_err("Failed to allocate IOMMU domain");
 		kfree(pd);
-		return ERR_PTR(-ENOMEM);
+		return ERR_CAST(domain);
 	}
 
 	iommu_set_fault_handler(pd->domain, usnic_uiom_dma_fault, NULL);
-- 
2.34.1

