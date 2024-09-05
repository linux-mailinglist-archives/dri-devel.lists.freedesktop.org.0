Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045B96CFA4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 08:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CFF10E09B;
	Thu,  5 Sep 2024 06:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P92z3Xjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897CF10E09B;
 Thu,  5 Sep 2024 06:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725518765; x=1757054765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1tUb2cHnHCI1UfWFjh4d2NZFIgqCgIzAE1MSmJGIGGk=;
 b=P92z3XjjSDotPDB4LkDn0SuS3hXxncQFD9qL+njc6cSGUhECsNyul+wT
 nNovC8rF5p5O/nXKjM4wq370vkXx0Dr0b9JqVvtLOGEvBO0BL5UDckTz3
 1CSv27xKDL9kPSBkx8eHC0sPNYDNAG5qCrjdtiNoaISQ+04L31F3oV0Pl
 izpE+xmmVemBlKflixykf/EOYp8q7DjiGjNcjszbn3ksKzkIFqbCGWus1
 eWm7ArPZ6ejWJsImJcXj51DOquxqKiRHw52BtHtE0ro8akk94YXjXWrUD
 6gtBmfmJih9hiVDOlg7mXCjJFNU/fjDN2pt7nl89Hyb85esPk3v46ExEb Q==;
X-CSE-ConnectionGUID: jfMvy0QqSUqWTna5unmYqg==
X-CSE-MsgGUID: nb4NLEA/TCOckEsGXVfSCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41719296"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="41719296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 23:46:05 -0700
X-CSE-ConnectionGUID: 5s9NxvsAQGKcVE7xCxWBLA==
X-CSE-MsgGUID: RGmeaQq1Qa+KH7QmT/0whw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70325974"
Received: from unknown (HELO fedora..) ([10.245.245.247])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 23:46:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] drm/ttm: Really use a separate LRU list for swapped-
 and pinned objects
Date: Thu,  5 Sep 2024 08:45:50 +0200
Message-ID: <20240905064552.5102-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_resource.c            | 29 ++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
 drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
 include/drm/ttm/ttm_bo.h                      |  2 +
 include/drm/ttm/ttm_device.h                  |  5 +-
 include/drm/ttm/ttm_tt.h                      |  5 ++
 15 files changed, 115 insertions(+), 30 deletions(-)

-- 
2.46.0

