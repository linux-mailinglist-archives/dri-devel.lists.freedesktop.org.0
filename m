Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F990CF332B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 12:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0156210E188;
	Mon,  5 Jan 2026 11:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0/hNGOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75E10E188;
 Mon,  5 Jan 2026 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767612016; x=1799148016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=snSGAUdoOhn41S+snOPJ8VDGB0xZ0Uox/IrCa869pX8=;
 b=E0/hNGOA77dauObK24DWpw7z1id7XLi0qxOOPKEGWE5Ox8jFIjN0wy3U
 WYi+TvDugUaIwENN91mL1TMYTxCOJItujqJncKfvf2fik+UgyEXFnsPKv
 AYj6JhmEqT2Edt6RJ46AFA4n8KfRu9PDcLWQ+JDZ2p/aHIBG9ICyrOzqD
 QLxAEgeDqjn+nfq/Y7rOwS1WWMnsCgM2rwYoeCrJJDi7dQ35r19LQfm4w
 lv3IJqu+T50roU3ag4G6bcrj1Y/aztC4Lhvedi1D1oS0ed5/onsZSyxan
 yD0++wBHGqQtZDEy5Gf6m83a3hJ99R5dZuaIP3BGIluM2JWfMtydtmbgu A==;
X-CSE-ConnectionGUID: 3gULp2cKTf2GCEbpc5ROUQ==
X-CSE-MsgGUID: kv2GoF5bT3W8MzFt9bS6eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80095641"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80095641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:15 -0800
X-CSE-ConnectionGUID: 4dEadgnFRB6WUpRcjI9ijQ==
X-CSE-MsgGUID: voQprAs4SEWBGOhafImNfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201996910"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:14 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 0/5] Enable THP support in drm_pagemap
Date: Mon,  5 Jan 2026 12:18:23 +0100
Message-ID: <20260105111945.73292-1-francois.dugast@intel.com>
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

v2:
- rebase on top of multi-device SVM support
- add Matt Brost's drm_pagemap_cpages() with temporary patch
- address other feedback from Matt Brost on v1

Francois Dugast (4):
  drm/pagemap: Unlock and put folios when possible
  drm/pagemap: Add helper to access zone_device_data
  DONOTMERGE drm/pagemap: Add drm_pagemap_cpages
  drm/pagemap: Enable THP support for GPU memory migration

Matthew Brost (1):
  mm/migrate: Add migrate_device_split_page

 drivers/gpu/drm/drm_gpusvm.c  |   7 +-
 drivers/gpu/drm/drm_pagemap.c | 160 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_svm.c   |   4 +
 include/drm/drm_pagemap.h     |  18 ++++
 include/linux/huge_mm.h       |   3 +
 include/linux/migrate.h       |   1 +
 mm/huge_memory.c              |   6 +-
 mm/migrate_device.c           |  49 +++++++++++
 8 files changed, 216 insertions(+), 32 deletions(-)

-- 
2.43.0

