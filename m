Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C819F4E98
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F2110E9BA;
	Tue, 17 Dec 2024 14:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxyjaRed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66A210E9AC;
 Tue, 17 Dec 2024 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734447550; x=1765983550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jfUNnBVAafUb24td8bCkulrGl2xGCOlVnNXT7/5R234=;
 b=MxyjaRedlDX7qMG2o0Y8jkt7Uaq1HRrzZBjO8sAT7qGzP+pMYh80vAIE
 QoszsHfqW7oK3ad8XGFJdTUvOh0mqAcyNCant2syrTcJVGNHXCyBkx53P
 qD8YJlfYNHyd0IMXljWQRdmiuuH9ev2H3DFZFYc6dzYII9V7hTzl/gpNC
 Jwpdgubh772ndwBwqg3Rd13oX8Qbd+cUQs/nCByiEP8C6UWiGW1c9yyjV
 Z8RZjv1t/mFKPwbTAnEP2VPjh+DTNczFqAfpTwkqxBMbzdtVThArMzS9l
 XoBWEMYSahJvXEc1XXS1Fc1G15KiIZiNg0HxMg39lLWqFrAHMKwP/b98t g==;
X-CSE-ConnectionGUID: KFlMEQWpRiWl8ZRHoIvJOQ==
X-CSE-MsgGUID: TwzREGieQaubAOI3OGlRQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34914416"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34914416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:10 -0800
X-CSE-ConnectionGUID: oTd018DIQpicoNclpWyMnw==
X-CSE-MsgGUID: v1LT6yUyTxmoS8e5CSi/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101694280"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.49])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v15 0/9] TTM shrinker helpers and xe buffer object shrinker
Date: Tue, 17 Dec 2024 15:58:43 +0100
Message-ID: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Patch 3 reworks the structure of ttm_pool_alloc in preparation for patch 4.

Patch 4 introduces functionality in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed.

Patch 5 Adds a simple error injection to the above code to help increase
test coverage.

Patch 6 Implements a macro for LRU iteration.

Patch 7 Introduces driver-facing helpers for shrinking.

Patch 8 Implements the xe bo shrinker.

Patch 9 Increases (removes) the XE_PL_TT watermark.

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

v15:
- ttm_backup return value change. (Christian König)
- ttm_pool restore/alloc implementation rework (Christian König)
- Documentation update.
- Remove cond_resched (Christian König)

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (9):
  drm/ttm: Balance ttm_resource_cursor_init() and
    ttm_resource_cursor_fini()
  drm/ttm: Provide a shmem backup implementation
  drm/ttm/pool: Restructure the pool allocation code
  drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm: Add a macro to perform LRU iteration
  drm/ttm: Add helpers for shrinking
  drm/xe: Add a shrinker for xe bos
  drm/xe: Increase the XE_PL_TT watermark

 drivers/gpu/drm/ttm/Makefile         |   2 +-
 drivers/gpu/drm/ttm/ttm_backup.c     | 207 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c         |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c    | 250 +++++++++-
 drivers/gpu/drm/ttm/ttm_pool.c       | 718 +++++++++++++++++++++++----
 drivers/gpu/drm/ttm/ttm_resource.c   |  35 +-
 drivers/gpu/drm/ttm/ttm_tt.c         |  83 ++++
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c     |   6 +-
 drivers/gpu/drm/xe/xe_bo.c           | 202 +++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  36 ++
 drivers/gpu/drm/xe/xe_device.c       |   8 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 258 ++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h     |  18 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |   3 +-
 include/drm/ttm/ttm_backup.h         |  74 +++
 include/drm/ttm/ttm_bo.h             |  93 ++++
 include/drm/ttm/ttm_pool.h           |   8 +
 include/drm/ttm/ttm_resource.h       |  11 +-
 include/drm/ttm/ttm_tt.h             |  69 ++-
 21 files changed, 1935 insertions(+), 152 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.47.1

