Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005909CE71F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68810E879;
	Fri, 15 Nov 2024 15:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsGQ/mU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A2E10E879;
 Fri, 15 Nov 2024 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731682893; x=1763218893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MpHcFIQFjHG6qLRFw0IFIAxn1BAe5AFHslexo/BRT0s=;
 b=gsGQ/mU3HeKufZSzJRPPTR0CfR0/w9OTdQB2Z+fgMTfNd1J45hq/jExx
 j1eUEAceoRLN29WDPLWP0HszKKz2QGEFSnrs5LHeUOSM2G4/wlo17RYAh
 b4pdXz4D8WyyEcRaYpt7SE3aV9CWNw24Grg88lspDwoLW/pO+aP87vdoZ
 rM3IkrSvAic0Fd162NLzB3MMWABQxFFXq3sZEUbUKy2L1paWXI7P1F4bV
 KLIRdSAKDYtibfpegJhnClj/miQ2z0K8eRMGpQflZA7F79/SsStU8ORHG
 vMJvu7QhqqX7STCxn5JiEi3U5ckCoJLkmsr9z1qpnuwHUkSyMzBfbiQE+ A==;
X-CSE-ConnectionGUID: P2e2eiOjR/OGmdKnH+A7Lw==
X-CSE-MsgGUID: M7HKNVSkRiueY6fuOHwu3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="34563279"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="34563279"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 07:01:32 -0800
X-CSE-ConnectionGUID: K+i8wO6vTcy5+/meNoV+XQ==
X-CSE-MsgGUID: SKl2Y0NgQiifg4s1csFwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88690248"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 07:01:30 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v14 0/8] TTM shrinker helpers and xe buffer object shrinker
Date: Fri, 15 Nov 2024 16:01:12 +0100
Message-ID: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
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

Patch 2 introduces a backup implemententaion.

Patch 3 introduces functionality in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed.

Patch 4 Adds a simple error injection to the above code to help increase
test coverage.

Patch 5 Implements a macro for LRU iteration.

Patch 6 Introduces driver-facing helpers for shrinking.

Patch 7 Implements the xe bo shrinker.

Patch 8 Increases (removes) the XE_PL_TT watermark.

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

v11:
- Move more core interaction to additional TTM helpers.
- Don't back up without __GFP_FS, and don't start writeback without __GFP_IO.
- Rebase.

v12:
- Fix an indentation flaw.
- Rebase

v13:
- Remove the backup base-class, and use direct calls for ttm_backup
  (Christian König).
- Rebase on the ttm_backup changes.
- Move shrunken bos from the LRU list to the unevictable list.
- Provide an accessor function with sanity checks to set the
- ttm_tt::backup field.
- Update documentation.

v14:
- Update documentation of ttm_backup_bytes_avail().
- Work around converting between struct file * and struct ttm-backup *.
- Don't set up backup for imported buffers.

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (8):
  drm/ttm: Balance ttm_resource_cursor_init() and
    ttm_resource_cursor_fini()
  drm/ttm: Provide a shmem backup implementation
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm: Add a macro to perform LRU iteration
  drm/ttm: Add helpers for shrinking
  drm/xe: Add a shrinker for xe bos
  drm/xe: Increase the XE_PL_TT watermark

 drivers/gpu/drm/ttm/Makefile         |   2 +-
 drivers/gpu/drm/ttm/ttm_backup.c     | 204 +++++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c         |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c    | 250 +++++++++++++++-
 drivers/gpu/drm/ttm/ttm_pool.c       | 421 ++++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c   |  35 ++-
 drivers/gpu/drm/ttm/ttm_tt.c         |  66 +++++
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     |   6 +-
 drivers/gpu/drm/xe/xe_bo.c           | 195 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  36 +++
 drivers/gpu/drm/xe/xe_device.c       |   8 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 258 ++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h     |  18 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |   3 +-
 include/drm/ttm/ttm_backup.h         |  74 +++++
 include/drm/ttm/ttm_bo.h             |  92 ++++++
 include/drm/ttm/ttm_pool.h           |   6 +
 include/drm/ttm/ttm_resource.h       |  11 +-
 include/drm/ttm/ttm_tt.h             |  34 ++-
 21 files changed, 1668 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.46.2

