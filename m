Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B78D2C81
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D51113028;
	Wed, 29 May 2024 05:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VamwWKgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D536113034
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960978; x=1748496978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QPVW+nVXZ/Qv6phdysqv5NqIfLXG+N6nb5d8ku5/Eew=;
 b=VamwWKgrFbJJZ/vC1tQj0486SsBrZLQBgg9XxUhd+fvv+6/bXNg7MdaV
 KE6kWq2AT23vyrpiVJdTqnLV9QdTq6HArE2E6MD34GQkIdDFrQcmdhLS0
 7EDJrvIYMdMcQhdm+WIzvk3M2OAwAq08wdRmlTCyfp1ztEOW7SBgU00Xs
 07SJchH2z1RCqdx5Md9KgwU+U66eAwpPSQgXsn2oFeZmK8ijypielcbyV
 +ccm9tub/gpFkaMW+mQWZB/aNHfdAKZsvWysFdfLsLxPNTvRY/xPecBVW
 oMN5ld94O/XgDShHrZSH4E30kBoaWC9l62GvSAn2BY4z7aLghMz6HFiMN g==;
X-CSE-ConnectionGUID: tb/fdStaTz+O7pywe7bNtg==
X-CSE-MsgGUID: 2S8VJhH9Q6OytmoYr/HC4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13568915"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13568915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:35:39 -0700
X-CSE-ConnectionGUID: H0Tfydb8Sd2Y4vK78rZTQg==
X-CSE-MsgGUID: ejihKNhgR8KfyMoR83nR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257652"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:35:34 -0700
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
Subject: [PATCH 08/20] gpu: host1x: Use iommu_paging_domain_alloc()
Date: Wed, 29 May 2024 13:32:38 +0800
Message-Id: <20240529053250.91284-9-baolu.lu@linux.intel.com>
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

An iommu domain is allocated in host1x_iommu_attach() and is attached to
host->dev. Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/host1x/dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3a0aaa68ac8d..46a2447c1124 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -404,9 +404,9 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 		if (err < 0)
 			goto put_group;
 
-		host->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!host->domain) {
-			err = -ENOMEM;
+		host->domain = iommu_paging_domain_alloc(host->dev);
+		if (IS_ERR(host->domain)) {
+			err = PTR_ERR(host->domain);
 			goto put_cache;
 		}
 
-- 
2.34.1

