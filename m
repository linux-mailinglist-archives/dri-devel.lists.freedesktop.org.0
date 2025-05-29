Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C39AC77DD
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7820910E6ED;
	Thu, 29 May 2025 05:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHfukW4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3272610E6EE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497396; x=1780033396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZxllDmS71frgFYePwIFmAbgOkfQeZNetfNQ4GrvCjw=;
 b=eHfukW4gflWBoIkXvfe2M1bjF7vltpRCgx18yXA2wVzvJ+lRZkCxoJ4J
 iqkDtDZSLfkRSPD/1LJ0ODxd1sjh4Zt9/fqiFBYMCL9g60aPlSWFHh6mE
 k7deFwyNchrwXivIDewVv+D2wGpSbLirR+tjtjmBqOFGiPtHA1U+vxfHR
 AQHNdqs+y+fspgQS1A/Qh89RIHbqpYCF5NfnuXP+0FSzRNWBT5Vlr5OUz
 +L0bl6Kwccvb4EiKAaPgQUqA02U+RyDirETw3PP7HXS2yLRUWbWzOB79f
 7DMkyZsK1ZfJ8EbQiPKRQnqf1C+8oG4yoYzzadvIy91rIsS5GmpUnJJM7 w==;
X-CSE-ConnectionGUID: tADeZTc6R6y94VHAE1mHSA==
X-CSE-MsgGUID: 3lYCFqGYScSyMfjsOR2SVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963177"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:43:15 -0700
X-CSE-ConnectionGUID: Fs3ze9vgS0+10ukv3r/wgw==
X-CSE-MsgGUID: egJESrszQraMvZPOBy2wlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443413"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:43:08 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 15/30] fixup: iommu/selftest: Sync .viommu_alloc() change
 to selftest
Date: Thu, 29 May 2025 13:34:58 +0800
Message-Id: <20250529053513.1592088-16-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

Sync up the additional struct kvm * parameter.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/iommu/iommufd/selftest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index d070807757f2..90e6d1d3aa62 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -734,6 +734,7 @@ static struct iommufd_viommu_ops mock_viommu_ops = {
 };
 
 static struct iommufd_viommu *mock_viommu_alloc(struct device *dev,
+						struct kvm *kvm,
 						struct iommu_domain *domain,
 						struct iommufd_ctx *ictx,
 						unsigned int viommu_type)
-- 
2.25.1

