Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92C9565AE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384D210E1F7;
	Mon, 19 Aug 2024 08:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ng7r8wXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C9810E1F7;
 Mon, 19 Aug 2024 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724056506; x=1755592506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c0qFKlS03VDyeVt3DNQwW/+PbbHy4qoh3ixE8iW7spg=;
 b=ng7r8wXUbI7xc0iUYjEt75vxja/M/QfxcAY1XC03gh47dehAWLpU3m6m
 Fcdf0Iy6S8B1aIZI+xV0lOO8DpfzFKBIjDXAbgOfe8KXVuAuBQMRZY5XT
 jbKmIHZKYgTBzQ3sGNH2+Rbh706tcsKkv626pEgug5DQruUdyYfrAjfWO
 q4thYqPnwZ+kIcdFiLtfWws91+MWf1zoXfJZXYkHJUTio5E5z3OGzk4i8
 YW20ApFpflxMHuzqb5GfuMyWU6yiWlL1Th+pvSsOgKqWXLAlv4BnDacR4
 IkYYygnQsVdnC8GDlEwXFvaVh1fcHbOOnucqGXTtlq+hWp2AGGtaOqJ4K g==;
X-CSE-ConnectionGUID: ImUKlc+GRaOUZA7JauiboA==
X-CSE-MsgGUID: PcZJerljSA6cFkiZS2EcCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32958448"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="32958448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:35:06 -0700
X-CSE-ConnectionGUID: 6wq02ukiQwurMrVrxbI2fg==
X-CSE-MsgGUID: cu5AM+q3TVioWLMv54GNSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="59962227"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.132])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:35:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/6] TTM shrinker helpers and xe buffer object shrinker
Date: Mon, 19 Aug 2024 10:34:43 +0200
Message-ID: <20240819083449.56701-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Patch 1 could in theory be skipped but introduces a possibility to easily
add or test multiple backup backends, like the direct swap-cache
insertion or even files into fast dedicated nvme storage for for example.

Patch 2 introduces helpers in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed, since that tends
to be a bit delayed when left to kswapd.

Patch 3 Adds a simple error injection to the above code to help increase
test coverage.

Patch 4 Implements a shrinker helper in TTM, and exports the LRU walker.

Patch 5 Implements the xe bo shrinker.

Patch 6 Increases (removes) the XE_PL_TT watermark.

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
- Adapt the review comments on that seires.

v8:
- Address review comments from Matthew Brost as detailed in the
  respective patches.

v9:
- Rebase and fix compilation errors

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (6):
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm: Add a shrinker helper and export the LRU walker for driver
    use
  drm/xe: Add a shrinker for xe bos
  drm/xe: Increase the XE_PL_TT watermark

 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 ++++++++
 drivers/gpu/drm/ttm/ttm_bo_util.c      |  65 ++++
 drivers/gpu/drm/ttm/ttm_pool.c         | 419 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c           |  37 +++
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c       | 224 +++++++++++++
 drivers/gpu/drm/xe/xe_bo.c             | 166 +++++++++-
 drivers/gpu/drm/xe/xe_bo.h             |  36 +++
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 289 +++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c    |   3 +-
 include/drm/ttm/ttm_backup.h           | 137 ++++++++
 include/drm/ttm/ttm_bo.h               |  17 +
 include/drm/ttm/ttm_pool.h             |   6 +
 include/drm/ttm/ttm_tt.h               |  30 ++
 18 files changed, 1567 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

