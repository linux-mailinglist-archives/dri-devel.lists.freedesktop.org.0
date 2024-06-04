Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3B8FA7C9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0331710E3F6;
	Tue,  4 Jun 2024 01:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXuCHG+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D0C10E3F6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717466064; x=1749002064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y8tmajavNhEb2U4e54gDZyZwgTBk84qW7m36BoQgWp0=;
 b=KXuCHG+6IJBSBfhb4lOgwBoN7SwhyImuy8jyE4bXjBMgDqJoJLnX3p4q
 jApEFRn2Yh72q+HpDC6exNXVOaZpnGbPLkkBi9wVmKiIB43Lj5lxwSjRg
 s6KVIVw2D0ySS1C29IdIfEm+S8dUNav+7zPwAhci7YintSgEhayX3hH0Y
 NiRp0f/dOClAyQVTqx6Nt8JtZm5+gIDUqlxau8wvVxmmASQymyHhs3ASR
 N8svGxf1tjM3YH734EhcihiTR+flRgSSPoRmVYALknQGV+jAd8RdZgDm4
 p9I32TCEJJPI9p/O8lqPPCVpYl6uQ9wKG6sGhs1ZrvHf8lsBD1NZhcLbI Q==;
X-CSE-ConnectionGUID: diyMbhOQQZarYIXtNfWiwA==
X-CSE-MsgGUID: g77pa/CuTHeKC3+GMNZKJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25384958"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25384958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:54:24 -0700
X-CSE-ConnectionGUID: q82kEK5bRvekjrNhIFC1Zw==
X-CSE-MsgGUID: CmxBK1IlQW2p11gUJOibRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37661843"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 18:54:20 -0700
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
Subject: [PATCH v2 06/22] drm/msm: Use iommu_paging_domain_alloc()
Date: Tue,  4 Jun 2024 09:51:18 +0800
Message-Id: <20240604015134.164206-7-baolu.lu@linux.intel.com>
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

The domain allocated in msm_iommu_new() is for the @dev. Replace
iommu_domain_alloc() with iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d5512037c38b..2a94e82316f9 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -407,10 +407,13 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 	struct msm_iommu *iommu;
 	int ret;
 
-	domain = iommu_domain_alloc(dev->bus);
-	if (!domain)
+	if (!device_iommu_mapped(dev))
 		return NULL;
 
+	domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(domain))
+		return ERR_CAST(domain);
+
 	iommu_set_pgtable_quirks(domain, quirks);
 
 	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
-- 
2.34.1

