Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9489B908F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 12:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591C310E057;
	Fri,  1 Nov 2024 11:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfPQQlXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AD810E057;
 Fri,  1 Nov 2024 11:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730461655; x=1761997655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9qdmt6/Ki+39tn/10rI3XWqMGVQp98ZBcv96FvsghqE=;
 b=HfPQQlXY5RHKbahmH3vPRQi/b9b1ftXa2gb1Drjjt7oheySwBhuP7r/n
 9H/2mGXCQeZoy4JstUuaeYCBwzglu/wljNOa8+JYQuxTUCvPtN85cA64E
 AJYIeq7RzIYpJ9l8VaZyDEz3jbDQbrKOZJehKLrtYnGFcSSelCXAsU9gg
 69cMWRCFlflfdtwgsdodY4rDmihWCmhtWGvaBDzF84uoO/gjMLcl4WnAr
 c6wMwmfOrj3ivYKnJvb9ZAkHtWL7ifGJWWBWiwaay2yW2/11qM7AQkv+3
 6HtqQ31zOHMAspOZLm/ERzg/VcpcIA6Kz8N8redzUE3m0Se2cdPUKrcU2 Q==;
X-CSE-ConnectionGUID: YCsHEEikS+ijAe13YNMl/Q==
X-CSE-MsgGUID: h/tyQe5xS+qmFT3CIFogMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41324523"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41324523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 04:47:35 -0700
X-CSE-ConnectionGUID: Z32fVoD1RNmEtMuSMQQgag==
X-CSE-MsgGUID: cbCsKJgySZWIgnPqwl2ZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="82626522"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.239])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 04:47:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v12 0/8] TTM shrinker helpers and xe buffer object shrinker
Date: Fri,  1 Nov 2024 12:47:11 +0100
Message-ID: <20241101114719.3225-1-thomas.hellstrom@linux.intel.com>
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

Patch 2 could in theory be skipped but introduces a possibility to easily
add or test multiple backup backends, like the direct swap-cache
insertion or even files into fast dedicated nvme storage for for example.

Patch 3 introduces functionality in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed.

Patch 4 Adds a simple error injection to the above code to help increase
test coverage.

Patch 5 Implements a macro for LRU iteration.

Patch 6 Introduces driver-facing helpers for shrinking.

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

v11:
- Move more core interaction to additional TTM helpers.
- Don't back up without __GFP_FS, and don't start writeback without __GFP_IO.
- Rebase.

v12:
- Fix an indentation flaw
- Rebase

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (8):
  drm/ttm: Balance ttm_resource_cursor_init() and
    ttm_resource_cursor_fini()
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm: Add a macro to perform LRU iteration
  drm/ttm: Add helpers for shrinking
  drm/xe: Add a shrinker for xe bos
  drm/xe: Increase the XE_PL_TT watermark

 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 162 ++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c      | 238 +++++++++++++-
 drivers/gpu/drm/ttm/ttm_pool.c         | 419 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     |  35 ++-
 drivers/gpu/drm/ttm/ttm_tt.c           |  37 +++
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c       |   6 +-
 drivers/gpu/drm/xe/xe_bo.c             | 194 +++++++++++-
 drivers/gpu/drm/xe/xe_bo.h             |  36 +++
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 258 +++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c    |   3 +-
 include/drm/ttm/ttm_backup.h           | 139 ++++++++
 include/drm/ttm/ttm_bo.h               |  92 ++++++
 include/drm/ttm/ttm_pool.h             |   6 +
 include/drm/ttm/ttm_resource.h         |  11 +-
 include/drm/ttm/ttm_tt.h               |  30 ++
 21 files changed, 1644 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.46.2

