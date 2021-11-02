Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10230442BA7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 11:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936FD6FCA6;
	Tue,  2 Nov 2021 10:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0778D6FCA4;
 Tue,  2 Nov 2021 10:28:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="229949833"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="229949833"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:28:42 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="467652448"
Received: from vanderss-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.234])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:28:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/3] drm/i915: Prepare error capture for asynchronous
 migration
Date: Tue,  2 Nov 2021 11:28:24 +0100
Message-Id: <20211102102827.442902-1-thomas.hellstrom@linux.intel.com>
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

The first patch introduces vma state snapshots that record the vma state
at request submission time.
It also takes additional measures to make sure that
the capture list and request is not disappearing from under us while
capturing. The latter may otherwise happen if a heartbeat triggered parallel
capture is running during a manual reset which retires the request.

The second patch changes the allocation mode during capture to reflect that
capturing is typically done in the fence signalling critical path. More
details on the patch itself.

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

Thomas Hellström (3):
  drm/i915: Update error capture code to avoid using the current vma
    state
  drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code
  drm/i915: Initial introduction of vma resources

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 137 ++++++++++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 180 ++++++++++-----
 drivers/gpu/drm/i915/i915_request.c           |  63 ++++--
 drivers/gpu/drm/i915/i915_request.h           |  20 +-
 drivers/gpu/drm/i915/i915_vma.c               | 206 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  20 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 131 +++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 ++++++++++
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  98 +++++----
 13 files changed, 837 insertions(+), 146 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

