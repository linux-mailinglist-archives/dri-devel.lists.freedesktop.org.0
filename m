Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDE3B74F3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 17:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A9B6E898;
	Tue, 29 Jun 2021 15:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6207C6E898;
 Tue, 29 Jun 2021 15:12:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195318909"
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="195318909"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 08:12:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; d="scan'208";a="408203383"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 08:12:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/3] drm/i915/gem: Introduce a migrate interface
Date: Tue, 29 Jun 2021 17:12:00 +0200
Message-Id: <20210629151203.209465-1-thomas.hellstrom@linux.intel.com>
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

We want to be able to explicitly migrate objects between gem memory
regions, initially for display and dma-buf, but there might be more
use-cases coming up.

Introduce a gem migrate interface, add a selftest and use it for
display fb pinning and dma-buf mapping.

This series should make accelerated desktop work on DG1 with DG1-enabled
OpenGL.

v2:
- Address review comments by Matthew Auld on patch 1/5. More details on
  the patch commit message.
- Address a dma-buf locking issue pointed out by Michael Ruhl, and
  add a selftest to catch that issue moving forward.
- Rebase the dma-buf migration patch on the above-mentioned fix.

v3:
- Fix i915_gem_object_can_migrate() to return true if object is already in
  the correct region, even if the object ops doesn't have a migrate()
  callback.
- Update typo in commit message.

v4:
- Ditch dma-buf patches for now.
- Improve documentation (Suggested by Mattew Auld and Michael Ruhl)
- Always assume TTM migration hits a TTM move and unsets the pages through
  move_notify. (Reported by Matthew Auld)
- Add a dma_fence_might_wait() annotation to
  i915_gem_object_wait_migration() (Suggested by Daniel Vetter)
- Selftest updates (See specifics on that patch).
- Added R-Bs
v5:
- Re-add might_sleep() annotation to i915_gem_object_wait_migration()
- Added R-B.

Matthew Auld (1):
  drm/i915/gem: Introduce a selftest for the gem object migrate
    functionality

Thomas Hellström (2):
  drm/i915/gem: Implement object migration
  drm/i915/display: Migrate objects to LMEM if possible for display

 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  21 --
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 113 ++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  77 +++++-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  19 ++
 .../drm/i915/gem/selftests/i915_gem_migrate.c | 258 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 10 files changed, 481 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c

-- 
2.31.1

