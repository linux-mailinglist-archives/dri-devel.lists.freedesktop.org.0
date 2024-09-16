Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0097A474
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507E310E3A0;
	Mon, 16 Sep 2024 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhQY9JDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57BE10E39E;
 Mon, 16 Sep 2024 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726498301; x=1758034301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FrYAi9W4teu1K/0ca57cpxeNQUL902+m6VbfE+3Qn6U=;
 b=jhQY9JDiTgPnJnWeNGv3Ry8sLrZ/lfmc4nYZmB/fcIpbY7UBlGsB5KkP
 p77M59TNVGGbJyGfPWq7gT1cYLMF865TQkiqXDcIgZrs3PV7XHHkTMAzq
 z7sz1822Q+8u6a7535l6hHKbnDssGMByiiOB4xEo6YqcIBEs4EH45cri1
 RunE1fNtMYG7/45BSk9fC6342jDc9ZIz1f3DooXIHSphR4xygt2gPSuyg
 iW+NaUvWrSerRcL9nEhUEFe3+klHia6WW6qPHcoOLARCQaerZjWadnne8
 syWvRxSJKePCdCfwxBXZixsrBgx4FYiyFHOrN8vyDFc+yhPa+aWDn7VGH Q==;
X-CSE-ConnectionGUID: K9T4WFEXSg6YNe+o1uoCpQ==
X-CSE-MsgGUID: LUySR3ZZRSen12ASonMhJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25259453"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25259453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:51:41 -0700
X-CSE-ConnectionGUID: eWbwQ0RgRqemewIlh1Jc+A==
X-CSE-MsgGUID: zW1MAwWTRtO8gqFvXqFGFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68572928"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.45])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:51:39 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v10 0/7] TTM shrinker helpers and xe buffer object shrinker 
Date: Mon, 16 Sep 2024 16:51:05 +0200
Message-ID: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series implements TTM shrinker / eviction helpers and an xe bo
shrinker. It builds on a previous series, *and obsoletes that one*.

https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/

Where the comment about layering
https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

now addressed, and this version also implements shmem objects for backup
rather than direct swap-cache insertions, which was used in the previuos
series. It turns out that with per-page backup / shrinking, shmem objects
appears to work just as well as direct swap-cache insertions with the
added benefit that was introduced in the previous TTM shrinker series to
avoid running out of swap entries isn't really needed.

The series earlier consisted of a LRU traversal part and the current part.
The LRU traversal part is merged, but is still mentioned in the history
below.

Patch 1 balances ttm_resource_cursor_fini() with an init function. It
makes patch 5 more straightforward.

Patch 2 could in theory be skipped but introduces a possibility to easily
add or test multiple backup backends, like the direct swap-cache
insertion or even files into fast dedicated nvme storage for for example.

Patch 3 introduces helpers in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed, since that tends
to be a bit delayed when left to kswapd.

Patch 4 Adds a simple error injection to the above code to help increase
test coverage.

Patch 5 Implements a shrinker helper in TTM, and a macro for LRU iteration.

Patch 6 Implements the xe bo shrinker.

Patch 7 Increases (removes) the XE_PL_TT watermark.

v2:
- Squash obsolete revision history in the patch commit messages.
- Fix a couple of review comments by Christian
- Don't store the mem_type in the TTM managers but in the
  resource cursor.
- Rename introduced TTM *back_up* function names to *backup*
- Add ttm pool recovery fault injection.
- Shrinker xe kunit test
- Various bugfixes

v3:
- Address some review comments from Matthew Brost and Christian König.
- Use the restartable LRU walk for TTM swapping and eviction.
- Provide a POC drm_exec locking implementation for exhaustive
  eviction. (Christian König).

v4:
- Remove the RFC exhaustive eviction part. While the path to exhaustive
  eviction is pretty clear and demonstrated in v3, there is still some
  drm_exec work that needs to be agreed and implemented.
- Add shrinker power management. On some hw we need to wake when shrinking.
- Fix the lru walker helper for -EALREADY errors.
- Add drm/xe: Increase the XE_PL_TT watermark.

v5:
- Update also TTM kunit tests
- Handle ghost- and zombie objects in the shrinker.
- A couple of compile- and UAF fixes reported by Kernel Build Robot and
  Dan Carpenter.

v6:
- Address review comments from Matthew Brost on the
  restartable LRU traversal path.

v7:
- Split out TTM restartable LRU traversal path and merge that.
- Adapt the review comments on that series.

v8:
- Address review comments from Matthew Brost as detailed in the
  respective patches.

v9:
- Rebase and fix compilation errors

v10:
- Use a LRU iteration macro rather than a function with a callback.
- Rebasing and cleanups
- Address some additional review comments from Matt Brost.
- Drop the shrinker selftest. It was already merged as a swapout
  self-test.

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (7):
  drm/ttm: Balance ttm_resource_cursor_init() and
    ttm_resource_cursor_fini()
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm: Add a shrinker helper and a macro to perform LRU iteration
  drm/xe: Add a shrinker for xe bos
  drm/xe: Increase the XE_PL_TT watermark

 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c      | 207 +++++++++++-
 drivers/gpu/drm/ttm/ttm_pool.c         | 419 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     |  35 ++-
 drivers/gpu/drm/ttm/ttm_tt.c           |  37 +++
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c       |   6 +-
 drivers/gpu/drm/xe/xe_bo.c             | 195 +++++++++++-
 drivers/gpu/drm/xe/xe_bo.h             |  36 +++
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 248 +++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c    |   3 +-
 include/drm/ttm/ttm_backup.h           | 137 ++++++++
 include/drm/ttm/ttm_bo.h               |  88 ++++++
 include/drm/ttm/ttm_pool.h             |   6 +
 include/drm/ttm/ttm_resource.h         |  11 +-
 include/drm/ttm/ttm_tt.h               |  30 ++
 21 files changed, 1576 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.46.0

