Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3584D449B53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 19:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A26389613;
	Mon,  8 Nov 2021 18:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECB989561;
 Mon,  8 Nov 2021 18:01:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="213021802"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="213021802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 09:46:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="503127304"
Received: from yiwenfan-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 09:46:01 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/4] drm/i915: Prepare error capture for asynchronous
 migration
Date: Mon,  8 Nov 2021 18:45:43 +0100
Message-Id: <20211108174547.979714-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series prepares error capture for asynchronous migration,
where the vma pages may not reflect the pages the GPU is currently
executing from but may be several migrations ahead.

The first patch gets rid of some contigous memory allocations that may
blow up due to the change of allocation mode introduced in patch 2/4

The third patch introduces vma state snapshots that record the vma state
at request submission time.
It also takes additional measures to make sure that
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

v2:
- Mostly Fixes for selftests and rebinding. See patch 3. 
v3:
- Honor the unbind fence also when evicting for suspend on gen6.
- Minor cleanups on patch 3.
v4:
- Break out patch 2 from patch 1.
v5:
- Ditch a patch from the since it's already commited.
- Use __GFP_KSWAPD_RECLAIM rather than GFP_NOWAIT in patch 2.
v6:
- Reorder patches and introduce patch 1/4 which gets rid of some
  contiguous allocations that are likely to fail after introduction of
  patch 2/4.
- Use #if IS_ENABLED() rather than #ifdef similar to the rest of the
  driver

Thomas Hellström (4):
  drm/i915: Avoid allocating a page array for the gpu coredump
  drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code
  drm/i915: Update error capture code to avoid using the current vma
    state
  drm/i915: Initial introduction of vma resources

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 137 +++++++++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 228 ++++++++++++------
 drivers/gpu/drm/i915/i915_gpu_error.h         |   4 +-
 drivers/gpu/drm/i915/i915_request.c           |  63 +++--
 drivers/gpu/drm/i915/i915_request.h           |  20 +-
 drivers/gpu/drm/i915/i915_vma.c               | 206 +++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  20 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 131 ++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 +++++++++
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  98 +++++---
 14 files changed, 865 insertions(+), 171 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

