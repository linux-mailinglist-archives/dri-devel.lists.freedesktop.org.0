Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B200894E79E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20910E10E;
	Mon, 12 Aug 2024 07:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVkSVX8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826DE10E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723447178; x=1754983178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aqYxynmKWAzN3tmbJym4kTD4ZpqMVDx6t8F0Da0JRmQ=;
 b=DVkSVX8ksn2GS97QHA24+6npvfisFuZP8KlNS8VZkEMRFL+CqkQwlUuH
 WHs09Co8RVS58mDhFkF6wL4BWSNjUChacvufNoehrwXKYrxOal6IfwmmW
 3kkVZ3zceFAba1JLFGVAAkZesJjliQWcCA5E064x5O6jkB/rB65zza230
 hRw2YT3QB/kt2L5rHqHlRS3m5VG85BIR7FrsRlpuMyAwZaNR2KE1SB/zE
 +3ARXRPmi03KpX+DSY3bFTeG23VbZFG0LxthLkbq6OcGTvr2/fH4KkW0e
 CNOBet0vcvgswiGZVKEZ9kr4w5eXDLHAK5WySbSYs6joeWT3pU+rEeQb7 Q==;
X-CSE-ConnectionGUID: kLWToS1XSJ2Lq12c4NYOtg==
X-CSE-MsgGUID: AsW7gAKCTumTluRfuYZY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32217118"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32217118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 00:19:38 -0700
X-CSE-ConnectionGUID: VWRcncRhSaqSUrpAwR+Z0Q==
X-CSE-MsgGUID: S6zhtof9Ryq4v5H0Ei0bBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="81410745"
Received: from allen-box.sh.intel.com ([10.239.159.127])
 by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2024 00:19:34 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 1/1] gpu: host1x: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:16:05 +0800
Message-Id: <20240812071605.9513-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-8-baolu.lu@linux.intel.com
---
 drivers/gpu/host1x/dev.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f006bc931324..b62e4f0e8130 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -404,9 +404,10 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 		if (err < 0)
 			goto put_group;
 
-		host->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!host->domain) {
-			err = -ENOMEM;
+		host->domain = iommu_paging_domain_alloc(host->dev);
+		if (IS_ERR(host->domain)) {
+			err = PTR_ERR(host->domain);
+			host->domain = NULL;
 			goto put_cache;
 		}
 
-- 
2.34.1

