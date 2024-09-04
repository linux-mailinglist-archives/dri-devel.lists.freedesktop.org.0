Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040D96B25A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE4410E67D;
	Wed,  4 Sep 2024 07:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiEDoYIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828A710E67D;
 Wed,  4 Sep 2024 07:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725433701; x=1756969701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fka45zhAe2nP7DuIOF0IITVl3TZIS5bkfGfuEPepCi4=;
 b=NiEDoYIe/pM9ELwM52WhVp17ArWfGzmz/gbUKP0MUrf7wEddsocZE9S4
 7H0lv/Uv5BxmlChyZ6BWpKCmumARDE295sbg6lkPGLdoMIO22Q+kPxEtB
 K2E392LcbFQapdw3+nsTq86QNgNZCHwVTqdW/pf+yiLwaJNEx+UQmYcd5
 Pxlh7KCIKZUSHTulcmiCqQZLMOY3Eioulxsru6fC0ez7d3k42iRMzEbIj
 pyv2BwUaBCdaKsCRLm2zz9Yf2RAvpkDp3FiAF+LIoR1y1RYhQd8Uv3HP0
 uQiMSwIM9JVkdZH/61SlPTCqgd65miHvQmCtt7sQUIL0bFlgrrkWWROlL w==;
X-CSE-ConnectionGUID: 1IQhsegQRgaWTnXbTuzgCg==
X-CSE-MsgGUID: 5a3JgICNQcCajkVDs3BY7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13362995"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="13362995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:08:20 -0700
X-CSE-ConnectionGUID: wzri+JFMTG+46D2cfwL6dw==
X-CSE-MsgGUID: qx2/xgF4QGeHqVLBn26iXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65165810"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.93])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:08:18 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/ttm: Really use a separate LRU list for swapped-
 and pinned objects
Date: Wed,  4 Sep 2024 09:08:06 +0200
Message-ID: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_resource.c            | 15 +++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
 drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
 include/drm/ttm/ttm_bo.h                      |  2 +
 include/drm/ttm/ttm_device.h                  |  5 +-
 include/drm/ttm/ttm_tt.h                      |  5 ++
 15 files changed, 101 insertions(+), 30 deletions(-)

-- 
2.46.0

