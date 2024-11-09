Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5799C2EBD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5023210E35B;
	Sat,  9 Nov 2024 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaMWhOiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC55910E357;
 Sat,  9 Nov 2024 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173354; x=1762709354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kmUTL9ywgoawm3U5pWRQDkqZBi/vTeLjGHEWwlUK+JY=;
 b=RaMWhOiXdq2QVIT4N3WN/YTmUALO3+F7l6qFkPHZbg6vngCC+/YCmBY+
 Ugg+IxlAyB+5ZEmYbdfnJ0jNA/aqSAVoGYU980o7NlOvAcBJi6CqlgryD
 52DnVGsfv0MtUTBCO84dHX8FgCJnTkkC0fTg6pYcyOu64z1l9Hpw37ZLu
 Ulj4RQozyTVx1Q1rGq2fwfPHS2T5c2ZoTEzuLo3dyhwAjfOd9EABa2Y+g
 6YHa9AHipqdLIe4n8s9AoMGnXRv9PAx9MZDZzsThfgDbkNNFZwt0mKFdN
 9NZyBmi0Dz+RZ/Ws/HE+AHblJBUuKAPCGjnrQZ2BpFtz5/rbdwrz7csAC w==;
X-CSE-ConnectionGUID: ITDYJ68YTTitSZmoWhOYEA==
X-CSE-MsgGUID: G+q6SLo2TXC7VuLUB5gsSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600098"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:13 -0800
X-CSE-ConnectionGUID: MmyXyTzUSZeeiHLqUldCIg==
X-CSE-MsgGUID: /a2nbqS9Rgiqm1kBWQ9DlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499484"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 mihail.atanassov@arm.com, steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 0/6] Common preempt fences and semantics
Date: Sat,  9 Nov 2024 09:29:36 -0800
Message-Id: <20241109172942.482630-1-matthew.brost@intel.com>
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

The motivation for this series comes from pending UMD submission work by
AMD [1], ARM [3], and the Xe team, who are also beginning to look at
this. Sima has suggested [4] some common driver preemptive fences and
semantics, which we all agree on. This is the first attempt to implement
them, based on Xe's existing long-running preemptive fences.

The semantics are fairly simple: preemptive fences attached to a
dma-resv must wait to enable signaling (and thus preempt device
execution) until all fences in other slots have been signaled. These
semantics are necessary to avoid deadlocks when preempting a device
while a user submission is pending, and resuming device execution
depends on the user submission completing. The semantics align with
Christian's view [5], which I also arrived at independently (with a
little help from Sima).

Implemented via the new dma-resv slot DMA_RESV_USAGE_PREEMPT, a common
embedded base preemptive fence class with driver operations, and updates
to the scheduler to adhere to these semantics. 

The current Xe long-running preemptive fences have been converted to the
new common code, and UMD submission is expected to follow (hopefully)
shortly thereafter in a subsequent series.

Not intended to be presented as the final solution, but rather to
kickstart serious discussions on this topic.

Matt

[1] https://patchwork.freedesktop.org/series/113675/
[2] https://patchwork.freedesktop.org/series/114385/
[3] https://patchwork.freedesktop.org/series/137924/
[4] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011577
[5] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011853

Matthew Brost (6):
  dma-resv: Add DMA_RESV_USAGE_PREEMPT
  drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
  dma-fence: Add dma_fence_preempt base class
  drm/sched: Teach scheduler about dma_fence_prempt type
  drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
  drm/xe: Use dma_fence_preempt base class

 drivers/dma-buf/Makefile                    |   2 +-
 drivers/dma-buf/dma-fence-preempt.c         | 102 ++++++++++++++++++++
 drivers/dma-buf/dma-resv.c                  |  43 ++++++---
 drivers/dma-buf/st-dma-resv.c               |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c    |  29 +++++-
 drivers/gpu/drm/scheduler/sched_main.c      |  50 +++++++---
 drivers/gpu/drm/xe/xe_bo.c                  |  22 +----
 drivers/gpu/drm/xe/xe_guc_submit.c          |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c     |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   4 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c       |  81 +++++-----------
 drivers/gpu/drm/xe/xe_preempt_fence.h       |   2 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h |  11 +--
 drivers/gpu/drm/xe/xe_pt.c                  |  12 +--
 drivers/gpu/drm/xe/xe_vm.c                  |  22 +----
 include/drm/gpu_scheduler.h                 |  15 +++
 include/linux/dma-fence-preempt.h           |  54 +++++++++++
 include/linux/dma-fence.h                   |   1 +
 include/linux/dma-resv.h                    |  24 +++--
 19 files changed, 326 insertions(+), 157 deletions(-)
 create mode 100644 drivers/dma-buf/dma-fence-preempt.c
 create mode 100644 include/linux/dma-fence-preempt.h

-- 
2.34.1

