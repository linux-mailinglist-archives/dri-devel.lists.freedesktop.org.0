Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12E967D83
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 03:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0581210E1D6;
	Mon,  2 Sep 2024 01:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLaEmzqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2C10E1D6;
 Mon,  2 Sep 2024 01:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725241862; x=1756777862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aBpacNPMohRcwSsOR11sSC5U39gBhwta0pqjN6fSZyw=;
 b=RLaEmzqIbGpCIbyjRy9ml87mhLGBzrpHJaukVDXV1KgvYXCsuspo0TMg
 6rNEXNs4HIujVRGkoyyqAtI3pNDlRdkTEmnXZXVYvQryt+4wKoc8ymaQZ
 +Z8gfE0oDvT9pNEyjnuQMPk0sK23K82mZ1WptEfgrspDuYRwSmdckzSI9
 kQ3LW5K9SsTHqhLyKtu8SuOMH45s+R5p8GWvBakPeVRTFqQIY6UaYaBVf
 D+Gj0UqcRdowKPetD86GTX6ZZv+ZYem+ciyyf7UC5AGL+zGqVoW24be7b
 KSOrHGAHJV0m5TMcpDWvKeoZASHdkt0Y//cHUNgm7cbk2+USSKpGhxDqy Q==;
X-CSE-ConnectionGUID: 3NISXAaRQq6Xo3rignHqcw==
X-CSE-MsgGUID: irxSOY50RRubK8g3L6R1lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41307654"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; d="scan'208";a="41307654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2024 18:51:01 -0700
X-CSE-ConnectionGUID: IRhh+f7nQQCcc3lrV/qkew==
X-CSE-MsgGUID: V2HiG/ObQqC4xEN2WrNWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; d="scan'208";a="64817612"
Received: from allen-box.sh.intel.com ([10.239.159.127])
 by orviesa006.jf.intel.com with ESMTP; 01 Sep 2024 18:50:55 -0700
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
Subject: [PATCH v2 0/3] drm: Use iommu_paging_domain_alloc()
Date: Mon,  2 Sep 2024 09:46:57 +0800
Message-Id: <20240902014700.66095-1-baolu.lu@linux.intel.com>
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

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
the bus structure. The iommu subsystem no longer relies on bus for
operations. So iommu_domain_alloc() interface is no longer relevant.

A new helper named iommu_paging_domain_alloc() was introduced in the
iommu subsystem as a replacement of iommu_domain_alloc(). This helper
relies on the device for IOMMU API use instead of the bus.

The replacement work started from this series:

https://lore.kernel.org/linux-iommu/20240610085555.88197-1-baolu.lu@linux.intel.com/

Several patches have already been merged into the mainline kernel, but
we've decided to route all remaining ones through the subsystem tree.

Change log:
v2:
 - Patch 3/3: use dev->dev.parent as the input for
   iommu_paging_domain_alloc(), suggested by Thierry Reding.
   https://lore.kernel.org/linux-iommu/qyvyd2ftebjlgmzyayfvxsqa64c4wgx7keix3a6eexdspbvawy@a5ffnm5h5tgp/

v1:
 - https://lore.kernel.org/linux-iommu/20240812071034.9443-1-baolu.lu@linux.intel.com/

Lu Baolu (3):
  drm/nouveau/tegra: Use iommu_paging_domain_alloc()
  drm/rockchip: Use iommu_paging_domain_alloc()
  drm/tegra: Use iommu_paging_domain_alloc()

 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |  4 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        | 10 +++++++---
 drivers/gpu/drm/tegra/drm.c                        |  5 +++--
 3 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.34.1

