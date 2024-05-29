Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F68D2C88
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D19113128;
	Wed, 29 May 2024 05:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KD6w92b5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F6011311A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960990; x=1748496990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMsYOm7U7Zn12dWdb7SeO0fPM3MLpopXhwDJqBymYTM=;
 b=KD6w92b591ULTsCPBxdeTYPBBGUbUiWfw567/e+elWWAzafFt/mpIrmP
 LC6pAyRe8A1b2/9iKwSk6jX26MLFzKqJeBs9c/IWQzI6mxd20NY80c0qm
 jrx8Wu2ccIOV5mXzF7B8gsmkxccs3ksg0QIW9eFuWr+5um27brlnfBYMU
 hOEVtPNkS/GdIDCOBPmw4im9JSU+ZkowDgr91s9piw7hUvkGBF0l+uudS
 89jft2Rq4GT88uKPsBWH1YGgxOvr9+Zr5lC6JvOTz4AxX8R0u2xiBrbMs
 ZqU8f+5luoYv9i/RgLDO7jxlvTcV3fU3iKrFGBSdXQZdWtQElzZBF8cR4 A==;
X-CSE-ConnectionGUID: U612tGhdRmaM/PViv+SArw==
X-CSE-MsgGUID: 53uoTe46RoeB3mFY91tCew==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13569086"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13569086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:36:23 -0700
X-CSE-ConnectionGUID: ImXU7FqzTUizFrnygOVsyA==
X-CSE-MsgGUID: buiM+0knQZG9v/S3HkrdEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257777"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:36:18 -0700
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
Subject: [PATCH 17/20] iommu/vt-d: Simplify compatibility check for identity
 domain
Date: Wed, 29 May 2024 13:32:47 +0800
Message-Id: <20240529053250.91284-18-baolu.lu@linux.intel.com>
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

Currently, the identity domain attachment follows the same path as the
paging domain attachment and is subject to the same compatibility checks
as a normal paging domain. However, this level of check is unnecessary
for the identity domain since it only requires the hardware to support
passthrough mode, which is a given for modern hardware.

On the early VT-d platforms, where hardware passthrough mode is not yet
supported, the identity domain is supported by a makeshift paging domain
with the entire system memory 1:1 mapped. For such early hardware, the
appropriate domain type should be returned in device_def_domain_type(),
and the identity domain should be simplified in compatibility checks.

The identity domain workaround in prepare_domain_attach_device() is just
temporary and should be removed once the identity domain is converted to
have its own dedicated attachment path.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index eb8e08699b80..693a6d7c79ed 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2190,6 +2190,16 @@ static bool device_rmrr_is_relaxable(struct device *dev)
  */
 static int device_def_domain_type(struct device *dev)
 {
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct intel_iommu *iommu = info->iommu;
+
+	/*
+	 * Hardware does not support the passthrough translation mode.
+	 * Always use a dynamaic mapping domain.
+	 */
+	if (!ecap_pass_through(iommu->ecap))
+		return IOMMU_DOMAIN_DMA;
+
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 
@@ -3802,6 +3812,14 @@ int prepare_domain_attach_device(struct iommu_domain *domain,
 	struct intel_iommu *iommu = info->iommu;
 	int addr_width;
 
+	/*
+	 * This is a temporary solution as the identity domain attachment
+	 * goes through this path as well. It should be removed once the
+	 * identity domain has its own attach path.
+	 */
+	if (domain->type == IOMMU_DOMAIN_IDENTITY)
+		return ecap_pass_through(iommu->ecap) ? 0 : -EOPNOTSUPP;
+
 	if (dmar_domain->force_snooping && !ecap_sc_support(iommu->ecap))
 		return -EINVAL;
 
-- 
2.34.1

