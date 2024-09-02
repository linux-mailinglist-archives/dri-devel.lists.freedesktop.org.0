Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57FB967D8C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 03:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115F10E1E3;
	Mon,  2 Sep 2024 01:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyLh5Ijb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D685010E1E3;
 Mon,  2 Sep 2024 01:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725241882; x=1756777882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNOviPAyOZhMOAzv2QCrEMyisdMbFcDCq2iEBrdz3QQ=;
 b=AyLh5Ijb7GkRHzQ86SsD9TT/XumemhyIz3aEjEiZrVjhA0SQiC7IvJxY
 7XE/RAAeEQeJu/0POss1L6zUTh9hG+IPGLLgObU47j+t73wNhmZSA3l8b
 xirMS5jf6+Tqyj4GemKhQtwLEved+80mdCqmO5hJT/BRNqsw7v01eEIVl
 U3l+1oQt3kJKh3/kMG/uDIHGdjk9kvqFgxkxdUsP9RobJItoeNAJB6jSj
 2Fm2J5uHpfWi3VXh+0MkmE7OBD8G0SEWucSpOEtmeB8oAnJUrPjT4NFkn
 a6DZ4fwYbYmhUXU7SbzIzfOyCEw0F4cj9IasZfHzMO8B8qMqvPhLHT4Qd w==;
X-CSE-ConnectionGUID: nsLUP83mRfGRq3fSw2Wfvg==
X-CSE-MsgGUID: kLzmYauHSrKzQae6F2YpsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41307706"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; d="scan'208";a="41307706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2024 18:51:21 -0700
X-CSE-ConnectionGUID: 29OEIk5/RfmpO23cXnBNZA==
X-CSE-MsgGUID: ON9C07fzS3iCg+btlHUEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; d="scan'208";a="64817693"
Received: from allen-box.sh.intel.com ([10.239.159.127])
 by orviesa006.jf.intel.com with ESMTP; 01 Sep 2024 18:51:15 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v2 3/3] drm/tegra: Use iommu_paging_domain_alloc()
Date: Mon,  2 Sep 2024 09:47:00 +0800
Message-Id: <20240902014700.66095-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902014700.66095-1-baolu.lu@linux.intel.com>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
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

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
the bus structure. The iommu subsystem no longer relies on bus for
operations. So iommu_domain_alloc() interface is no longer relevant.

Replace iommu_domain_alloc() with iommu_paging_domain_alloc() which takes
the physical device from which the host1x_device virtual device was
instantiated. This physical device is a common parent to all physical
devices that are part of the virtual device.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/tegra/drm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..d79c76a287f2 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1135,6 +1135,7 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 
 static int host1x_drm_probe(struct host1x_device *dev)
 {
+	struct device *dma_dev = dev->dev.parent;
 	struct tegra_drm *tegra;
 	struct drm_device *drm;
 	int err;
@@ -1149,8 +1150,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
-		tegra->domain = iommu_domain_alloc(&platform_bus_type);
+	if (host1x_drm_wants_iommu(dev) && device_iommu_mapped(dma_dev)) {
+		tegra->domain = iommu_paging_domain_alloc(dma_dev);
 		if (!tegra->domain) {
 			err = -ENOMEM;
 			goto free;
-- 
2.34.1

