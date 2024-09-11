Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED2B9751CC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 14:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249410E995;
	Wed, 11 Sep 2024 12:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T83EroQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE1210E036;
 Wed, 11 Sep 2024 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726057153; x=1757593153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/NWXkQA4OGmwW45SacDdPMICAG2cc4lOM5YMmxsUxfM=;
 b=T83EroQUo3v2BQ5Vl1aHg6cA0t+8VKx7HlxcbFx2C0Ge6sLPPdiiyyzC
 yBGd7RfMhbSmIVmcYcgDe6exZFm7fcGj9AbsuVS7IPCQX2AskYN9fSl52
 vZnD7VdSsK53+HtsMH7tkiqO37PSiQeAmypVjQu5zuSmckFqXPRSSJTaB
 3fzEmGEzTS8WlsnoA81UnppTtEM78AC7UVhAd8LR5MDGKw/vc21BdadoH
 qPsq0cGK0oDno09R8GvbM9CPfToa3OgWXmdLNyabAnURyZ0OkS/8z4sol
 0Fo8C8W+JUxH7rvdM9iL3tq+GoScPodoT1aA3RpbkJy4ygPVxmLfNZRe4 A==;
X-CSE-ConnectionGUID: 9bhqwWTtRgO1TNME+utusA==
X-CSE-MsgGUID: AbPn4ndgTsK7XsbZ040NLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27773771"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="27773771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:19:12 -0700
X-CSE-ConnectionGUID: zAhwQe+wRNGfHVCxirQGFg==
X-CSE-MsgGUID: MNlKiTSNRnmNofu+WINmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72121271"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:19:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/2] drm/ttm: Really use a separate LRU list for swapped-
 and pinned objects
Date: Wed, 11 Sep 2024 14:18:57 +0200
Message-ID: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
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

v4:
- Fix even more NULL pointer dereferences (Intel CI).
  The bulk move handling appears pretty fragile...

v5:
- Fix resources created for readback of swapped bos
  ending up on the unevictable list (Intel CI)

v6:
- Move a lockdep assert.
- Tabify a line.

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
 drivers/gpu/drm/ttm/ttm_bo.c                  | 67 +++++++++++++++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c            | 28 ++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
 drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
 include/drm/ttm/ttm_bo.h                      |  2 +
 include/drm/ttm/ttm_device.h                  |  5 +-
 include/drm/ttm/ttm_tt.h                      |  5 ++
 15 files changed, 114 insertions(+), 30 deletions(-)

-- 
2.46.0

