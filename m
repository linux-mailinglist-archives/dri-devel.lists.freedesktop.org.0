Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB92CC511E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 21:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E828C10E2AA;
	Tue, 16 Dec 2025 20:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J46fIK9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA7310E155;
 Tue, 16 Dec 2025 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765915963; x=1797451963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FW5sTX7foAG8AegAWqd9HNuIFmr9pElDVm/JpwESwS8=;
 b=J46fIK9wDQEp16Lea8kkRHIUDAFktWEt/r9c2tfjWGDN/2ECJ/M9wvSg
 q7/PO7QhNSYNaz2U/VPLSmnbK5zC2xbEqp97zyF8qx55mE73vgX4rgHBA
 xtQJhDtYV1bvjj//B46X6j2ODDZ+KVcUHVc7jF3Y+WVhmeao5ii8LtO/E
 eczNBF6ZqvVyon0K3YKaSMUaDS5BZsHMmBsWWLWn0ApM4rmP7uZEswbw7
 FPYtjlN55W0thJ/bhZDLhE/uFoyE9lsXpB7elc9aMPKSxAgWVocnEDkl6
 mmXdVFqqc6HdmPfB2sbe/pCmIxS5bdi9hNTJcfbZYW/pDNBP9H10f4VaZ w==;
X-CSE-ConnectionGUID: IO6hGkMCTweQVH5uBCr4cQ==
X-CSE-MsgGUID: IT3Ze0MDSg2/xjhTHJScrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="68000570"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="68000570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:43 -0800
X-CSE-ConnectionGUID: KLcbvuahR2WU69is1Ep2gA==
X-CSE-MsgGUID: BLXGU1PFSSi4XP4JKK1EzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202612414"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.214])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:42 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 0/4] Enable THP support in drm_pagemap
Date: Tue, 16 Dec 2025 21:10:10 +0100
Message-ID: <20251216201206.1660899-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use Balbir Singh's series for device-private THP support [1] and previous
preparation work in drm_pagemap [2] to add 2MB/THP support in xe. This leads
to significant performance improvements when using SVM with 2MB pages.

[1] https://lore.kernel.org/linux-mm/20251001065707.920170-1-balbirs@nvidia.com/
[2] https://patchwork.freedesktop.org/series/151754/

Francois Dugast (3):
  drm/pagemap: Unlock and put folios when possible
  drm/pagemap: Add helper to access zone_device_data
  drm/pagemap: Enable THP support for GPU memory migration

Matthew Brost (1):
  mm/migrate: Add migrate_device_split_page

 drivers/gpu/drm/drm_gpusvm.c  |   7 +-
 drivers/gpu/drm/drm_pagemap.c | 146 +++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.c   |   5 ++
 include/drm/drm_pagemap.h     |   7 +-
 include/linux/huge_mm.h       |   3 +
 include/linux/migrate.h       |   1 +
 mm/huge_memory.c              |   6 +-
 mm/migrate_device.c           |  49 ++++++++++++
 8 files changed, 188 insertions(+), 36 deletions(-)

-- 
2.43.0

