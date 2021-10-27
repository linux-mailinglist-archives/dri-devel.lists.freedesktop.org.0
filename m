Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00D43C81A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 12:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22A189AC3;
	Wed, 27 Oct 2021 10:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDC389AAE;
 Wed, 27 Oct 2021 10:52:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217043353"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="217043353"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 03:52:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="572869961"
Received: from djustese-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.205])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 03:52:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 0/3] Prepare error capture for asynchronous migration
Date: Wed, 27 Oct 2021 12:52:08 +0200
Message-Id: <20211027105211.485125-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series prepares error capture for asynchronous migration,
where the vma pages may not reflect the pages the GPU is currently
executing from but may be several migrations ahead.

The first patch deals with refcounting sg-list so that they don't
disappear under the capture code, which typically otherwise happens at
put_pages() time.

The second patch introduces vma state snapshots that record the vma state
at request submission time. It also updates the memory allocation mode to
reflect that error capture may and will happen in the dma-fence signalling
critical path, and finally takes additional measures to make sure that
the capture list and request is not disappearing from under us while
capturing. The latter may otherwise happen if a heartbeat triggered parallel
capture is running during a manual reset which retires the request.

Finally the last patch is more of a POC patch and not strictly needed yet,
but will be (or at least something very similar) soon for async unbinding.
It will make sure that unbinding doesn't complete or signal completion
before capture is done. Async reuse of memory can't happen until unbinding
signals complete and without waiting for capture done, we might capture
contents of reused memory.
Before the last patch the vma active is instead still keeping the vma alive,
but that will not work with async unbinding anymore, and also it is still
not clear how we guarantee keeping the vma alive long enough to even
grab an active reference during capture.

v2: Mostly Fixes for selftests and rebinding. See patch 3. 

Thomas Hellström (3):
  drm/i915: Introduce refcounted sg-tables
  drm/i915: Update error capture code to avoid using the current vma
    state
  drm/i915: Initial introduction of vma resources

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 137 +++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 188 +++++++++-------
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 180 +++++++++++-----
 drivers/gpu/drm/i915/i915_request.c           |  63 ++++--
 drivers/gpu/drm/i915/i915_request.h           |  18 +-
 drivers/gpu/drm/i915/i915_scatterlist.c       |  62 ++++--
 drivers/gpu/drm/i915/i915_scatterlist.h       |  76 ++++++-
 drivers/gpu/drm/i915/i915_vma.c               | 201 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  20 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 131 ++++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 ++++++++++
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |  15 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   5 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  99 +++++----
 drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
 22 files changed, 1093 insertions(+), 265 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

