Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C1D08024
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E066610E854;
	Fri,  9 Jan 2026 08:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ncrqaahl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01E410E853;
 Fri,  9 Jan 2026 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948990; x=1799484990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gRxHw48bD462cqAVwKFIuwepAHDh7+rUaQCf8hIMZj0=;
 b=NcrqaahlAgyI3wIDw76PTPlKjOG/hR1L0DVIabAO9fniOcrlMf/kCG2H
 XGGuiucOgpAFYjW38zkxs8kesDOiTxIQ8Q+6iy9Yi4GnTnaiPQRn9WFy5
 gpRNhO2AIYuQIZy2W/JIEbrWuain5Zhvjrdv3N6XXr1WzTcea8k28Wn+e
 v7ns/bHpL9PteVRJhGfCWMlHw5MMwjTdrADf6rzzj8nyoikKUIz/L7vAV
 ejdg0rJuI7LeykKDdxV6KCa/b8th3IZAXginztjBb9Db6No0avbzjSdfC
 FQZjUkQKcNQXhUdeRXOhFXEQWj9XmgfUerePi46JKVWQLamcc1lzo6t8i g==;
X-CSE-ConnectionGUID: lUlu9Vx2RayRdLoLYlfzgQ==
X-CSE-MsgGUID: PmyjmYsKTM2xiEpdoH9nyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79625964"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79625964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:30 -0800
X-CSE-ConnectionGUID: b+tOVyMMQ0GIjF2GCbfphw==
X-CSE-MsgGUID: Gonu7iQ2QnSdmhMUrpUTEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202538574"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:29 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 0/7] Enable THP support in drm_pagemap
Date: Fri,  9 Jan 2026 09:54:20 +0100
Message-ID: <20260109085605.443316-1-francois.dugast@intel.com>
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
- rebase on top of multi-device SVM
- add drm_pagemap_cpages() with temporary patch
- address other feedback from Matt Brost on v1

v3:
The major change is to remove the dependency to the mm/huge_memory
helper migrate_device_split_page() that was called explicitely when
a 2M buddy allocation backed by a large folio would be later reused
for a smaller allocation (4K or 64K). Instead, the first 3 patches
provided by Matthew Brost ensure large folios are split at the time
of freeing.

Francois Dugast (3):
  drm/pagemap: Unlock and put folios when possible
  drm/pagemap: Add helper to access zone_device_data
  drm/pagemap: Enable THP support for GPU memory migration

Matthew Brost (4):
  mm: Add folio_split_unref helper
  fs/dax: Use folio_split_unref helper
  mm: Split device-private and coherent folios before freeing
  drm/pagemap: Correct cpages calculation for migrate_vma_setup

 drivers/gpu/drm/drm_gpusvm.c  |   7 +-
 drivers/gpu/drm/drm_pagemap.c | 154 ++++++++++++++++++++++++++++------
 fs/dax.c                      |  25 +-----
 include/drm/drm_pagemap.h     |  15 ++++
 include/linux/huge_mm.h       |   1 +
 mm/huge_memory.c              |  39 +++++++++
 mm/memremap.c                 |   2 +
 7 files changed, 190 insertions(+), 53 deletions(-)

-- 
2.43.0

