Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB038B2A1
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B066B6F46F;
	Thu, 20 May 2021 15:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD986E1BE;
 Thu, 20 May 2021 15:10:37 +0000 (UTC)
IronPort-SDR: 9A2OdeO428MBsTBm5sBbloT5C0WYCPdgeIr4/Xy7m9TIILsXEt5hzBOturoATGRBgDn6LpAoLs
 4PDrzJ6UAP/A==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="222341175"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="222341175"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:09:58 -0700
IronPort-SDR: x8aKiyZUKX9l8am38RHwyh2yiIG/zv5XG2QeGRprwCoI+/qptOsOcKJLwvqFuPCVzA6OTSYT0M
 VBN8PC8lMGsg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395728141"
Received: from cbjoerns-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.247])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:09:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/5] Core TTM changes for i915 TTM enabling
Date: Thu, 20 May 2021 17:09:42 +0200
Message-Id: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is mainly a pre-check that the core TTM changes for the initial
i915 TTM patch series look reasonably ok.

Main thing is we add the new page-based iomem memcpy util to TTM, and
for some speed the copy-from-wc-x86-only prefetching memcpy to core drm.
Note that the legacy memcpy path is largely untested. Perhaps can give
it some testing on vmwgfx.

A bugfix and some minor optimization for the ttm_bo_pipeline_gutting()
idle case

Finally allow the frequently-pinning i915 driver to block swapping of
pinned memory that is still on the LRU.

If OK, I'd like to include these as a part of the i915 series.

Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Thomas Hellström (5):
  drm/ttm: Add a generic TTM memcpy move for page-based iomem
  drm, drm/i915: Move the memcpy_from_wc functionality to core drm
  drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
  drm/ttm: Document and optimize ttm_bo_pipeline_gutting()
  drm/ttm, drm/amdgpu: Allow the driver some control over swapping

 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   4 +
 drivers/gpu/drm/drm_drv.c                     |   2 +
 .../drm/{i915/i915_memcpy.c => drm_memcpy.c}  |  31 +-
 drivers/gpu/drm/i915/Makefile                 |   1 -
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   5 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  11 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   4 +-
 drivers/gpu/drm/i915/i915_drv.c               |   2 -
 drivers/gpu/drm/i915/i915_gpu_error.c         |   8 +-
 drivers/gpu/drm/i915/i915_memcpy.h            |  34 --
 .../drm/i915/selftests/intel_memory_region.c  |   7 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  61 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 547 ++++++++++++------
 drivers/gpu/drm/ttm/ttm_tt.c                  |   9 +
 include/drm/drm_memcpy.h                      |  41 ++
 include/drm/ttm/ttm_bo_driver.h               |  94 +++
 include/drm/ttm/ttm_tt.h                      |  10 +
 20 files changed, 614 insertions(+), 270 deletions(-)
 rename drivers/gpu/drm/{i915/i915_memcpy.c => drm_memcpy.c} (84%)
 delete mode 100644 drivers/gpu/drm/i915/i915_memcpy.h
 create mode 100644 include/drm/drm_memcpy.h

-- 
2.31.1

