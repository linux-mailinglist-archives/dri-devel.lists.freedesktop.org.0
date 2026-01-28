Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMM2F/hceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4599BB9D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7683110E5E0;
	Wed, 28 Jan 2026 00:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kACxfDVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999FF10E5DA;
 Wed, 28 Jan 2026 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561328; x=1801097328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GSmVERaQj0ngdCVZ2PIvfqkVQNDMvY5d6l/2GaPSKBc=;
 b=kACxfDVmJ4VFq2rIZd5TRnu4fR9oUmLBW6mkthCyNTKvbOOA1VPxZsvn
 qEY7QsGBj+QymThveaYaBVF23UfC+axLGpzQVBN1w7t7GENlWU7PRhY/b
 3syL/OFghMqkKxi75Zlyc/YloNDY9zkJczMtAk+BsnvYqddEbo/i/azcI
 thUZP7DKYMD0o0AAZA/sd3c45wwsvZW67v9yx0Fkky5V0iBQrh6fLmsor
 WF/22gP2oLoIPbT2xNW5Nfoa6cLhtrVL8DyKCuev8Aj2+5uTYKxz8W6Ka
 5MrG7LWlJpxFfZtrUX95MZcT/idByObhscnRNvd9r3UGEwuH1avX6Z67q Q==;
X-CSE-ConnectionGUID: YQSSHTvES9ugnES4D5DncA==
X-CSE-MsgGUID: XjkzWqGxTBKOLc1OiOfJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427502"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:47 -0800
X-CSE-ConnectionGUID: b8pYwTrJQqy+JV+KQ2xdDw==
X-CSE-MsgGUID: jOwupUI1SMCOzDcZHkq0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822634"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 00/11] Use new dma-map IOVA alloc, link,
 and sync API in GPU SVM and DRM pagemap
Date: Tue, 27 Jan 2026 16:48:30 -0800
Message-Id: <20260128004841.2436896-1-matthew.brost@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 0D4599BB9D
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use dma-map IOVA alloc, link, and sync APIs for GPU SVM and DRM page,
which mappings between the CPU and GPU.

Initial results are promising.

Baseline CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 552.36049107142857142857, .71943789893868318799
Average migrate 64K cpu time (us, percentage): 24.97767857142857142857, .34789908128526791960

After patch 4 in this series CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 224.81808035714285714286, .51412827364772602557
Average migrate 64K cpu time (us, percentage): 14.65625000000000000000, .25659463050529524405

After patch 5 in this series CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 158.52901785714285714286, .42740093699505625280
Average migrate 64K cpu time (us, percentage): 14.00000000000000000000, .23276613905846987437

- Patches 2-4 implement dma-map IOVA API for system pages

- Patch 5 optimizes this a bit but questionable if we need if this
  needed if 2M pages are enabled

- Patches 6-11 implement a IOVA API for multi-GPU PoC. I'm told drivers
  shouldn't call dma-map IOVA API for multi-device but including it as
  reference for a design we'd like to get to with high-speed fabrics in
  mind.

Still an RFC as patches 6-11 may not be able to merged in there current
form, the series can be split if needed to merge eariler patches.

Matt

v2:
 - Include missing basline patch for CI
v3:
 - Fix memory corruption
 - PoC IOVA alloc for multi-GPU

Francois Dugast (1):
  drm/pagemap: Add helper to access zone_device_data

Matthew Brost (10):
  drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
  drm/pagemap: Split drm_pagemap_migrate_map_pages into device / system
  drm/pagemap: Use dma-map IOVA alloc, link, and sync API for DRM
    pagemap
  drm/pagemap: Reduce number of IOVA link calls
  drm/pagemap: Add IOVA interface to DRM pagemap
  drm/xe: Stub out DRM pagemap IOVA alloc implementation
  drm/pagemap: Use device-to-device IOVA alloc, link, and sync API for
    DRM pagemap
  drm/xe: Drop BO dma-resv lock during SVM migrate-to-device
  drm/xe: Implement DRM pagemap IOVA vfuncs
  drm/gpusvm: Use device-to-device IOVA alloc, link, and sync API in GPU
    SVM

 drivers/gpu/drm/drm_gpusvm.c  | 196 ++++++++++++++++---
 drivers/gpu/drm/drm_pagemap.c | 351 +++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.c   | 143 +++++++++++++-
 include/drm/drm_gpusvm.h      |   5 +
 include/drm/drm_pagemap.h     | 101 ++++++++++
 5 files changed, 693 insertions(+), 103 deletions(-)

-- 
2.34.1

