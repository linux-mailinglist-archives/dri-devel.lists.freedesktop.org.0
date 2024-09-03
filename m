Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE59969D5B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFA210E567;
	Tue,  3 Sep 2024 12:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlUzCwRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C9B10E567;
 Tue,  3 Sep 2024 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725366012; x=1756902012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PjpRzBVdqH9o2cr56yjQTWGhHVWK8eeFoc6N8Cay3GQ=;
 b=PlUzCwRc2WlVug2u20iPT3yLX/FBMncQs/APp8dEEAetQ/j7qCmfuVFE
 6BKV/+J2JYBzcKSgaMPlNZz2q6KmG9J3MbVH3qHP0gJNbuWqZpjHCQ8DF
 6riqYYcX1lO54aPGA335xJr7/1512kPrlrp2Z0HodnL4bHb3fCLG4dfr1
 4SggMk1mE27y3RMGV2VaO+2pyB2Gn1zwRv51bCj/VmrcDzKSb/1jWk4Xs
 Gfgl0HSbj4BmQtdCRcZ2/HeRAbbTy0J0bJLL7hslHLCrOvVhYyqw3DeD8
 MMUCB467EhKF/GqkyNuXRfSGUZ5YxDhXzE0BMULT1UMre8nCrWAG3Mhpx Q==;
X-CSE-ConnectionGUID: SDLUy6MXTZG64Y7bY8I62A==
X-CSE-MsgGUID: 6kxz85qeTTilggFU4SCrNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27752830"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27752830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:20:12 -0700
X-CSE-ConnectionGUID: YYGYk7emSfeuGZcy3NQypw==
X-CSE-MsgGUID: FHZYpAnFTK2zFXxkrEnv6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64569545"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:20:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/ttm: Really use a separate LRU list for swapped-
 and pinned objects
Date: Tue,  3 Sep 2024 14:19:56 +0200
Message-ID: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
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

Resources of swapped objects were never moved off their LRU list
when swapped, and also resources of pinned objects might remain on
their LRU list unless the driver moved them to the device pinned list
after pinning.

Rename the device "pinned" list to "unevictable" and ensure that resources
of objects that are pinned or swapped are moved to that list.

RFC: Should we instead of a device-wide unevictable list, introduce an
unevictable priority so that all objects remain with their resource's
respective manager?

Patch 1/2 deals with swapped objects and also handles the problem of
moving objects back to their manager's LRU list when populating.

Patch 2/2 deals with pinned objects.

v2:
- Address review comments by Christian König.
- Make TTM KUNIT tests build.

v3:
- Fix a couple of NULL pointer dereferences (Intel CI).

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (2):
  drm/ttm: Move swapped objects off the manager's LRU list
  drm/ttm: Move pinned objects off LRU lists when pinning

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |  4 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  6 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 69 +++++++++++++++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c            | 15 ++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +
 drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
 include/drm/ttm/ttm_bo.h                      |  2 +
 include/drm/ttm/ttm_device.h                  |  5 +-
 include/drm/ttm/ttm_tt.h                      |  5 ++
 15 files changed, 102 insertions(+), 30 deletions(-)

-- 
2.46.0

