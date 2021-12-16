Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E566C477484
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B669A1122C3;
	Thu, 16 Dec 2021 14:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CD510FD18;
 Thu, 16 Dec 2021 14:28:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/17] drm/i915: Remove short term pins from execbuf by
 requiring lock to unbind.
Date: Thu, 16 Dec 2021 15:27:32 +0100
Message-Id: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, short term pinning in execbuf was required because i915_vma was
effectively independent from objects, and has its own refcount, locking,
lifetime rules and pinning.

This series removes the separate locking, by requiring vma->obj->resv to be
held when pinning and unbinding. This will also be required for VM_BIND work.

With pinning required for pinning and unbinding, the lock is enough to prevent
unbinding when trying to pin with the lock held, for example in execbuf.

This makes binding/unbinding similar to ttm_bo_validate()'s use, which just
cares that an object is in a certain place, without pinning it in place.

Having the VMA part of gem bo removes a lot of the vma refcounting, and makes
i915_vma more a part of the bo, instead of its own floating object that just
happens to be part of a bo. This is also required to make it more compatible
with TTM, and migration in general.

For future work, it makes things a lot simpler and clear. We want to end up
with i915_vma just being a specific mapping of the BO, just like is the
case in other drivers. i915_vma->active removal is the next step there,
and makes it when object is destroyed, the bindings are destroyed (after idle),
instead of object being destroyed when bindings are idle. 

---
This is version 3, I changed the ordering of the patches slightly to be more
natural, and divided up some commits in different ways.

In particular, I added the ww ctx to trylock first, then converted
i915_gem_evict_vm(), the shrinker, and the other eviction functions all
in separate commits. Functionally the same, but easier to review and bisect.

In theory, it was already reviewed, but leaving those r-b's out as they're
technically different patches now.

The first patches prepare for vma->obj->resv requirement, by ensuring that we
unbind as needed, and take the ww lock in some places where they're required,
including when freeing the object.

After that we convert the shrinker, eviction functions, and then we can start
requiring the object lock for i915_vma_unbind.

Now that the conversion and requirement is added, we can remove ther special
case of assert_object_held_shared, which was added because we didn't always
require the object lock.

As last step we can remove the short term pins from execbuf. We still pin when
evicting the entire VM, but if it turns out to be an issue, it can be removed,
and replaced with unpinning the entire VM.

Maarten Lankhorst (17):
  drm/i915: Remove unused bits of i915_vma/active api
  drm/i915: Change shrink ordering to use locking around unbinding.
  drm/i915: Remove pages_mutex and intel_gtt->vma_ops.set/clear_pages
    members, v3.
  drm/i915: Take object lock in i915_ggtt_pin if ww is not set
  drm/i915: Force ww lock for i915_gem_object_ggtt_pin_ww, v2.
  drm/i915: Ensure gem_contexts selftests work with unbind changes, v2.
  drm/i915: Ensure i915_vma tests do not get -ENOSPC with the locking
    changes.
  drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to prevent new ENOSPC
    errors
  drm/i915: Trylock the object when shrinking
  drm/i915: Require object lock when freeing pages during destruction
  drm/i915: Add ww ctx to i915_gem_object_trylock
  drm/i915: Add locking to i915_gem_evict_vm()
  drm/i915: Add object locking to i915_gem_evict_for_node and
    i915_gem_evict_something
  drm/i915: Add i915_vma_unbind_unlocked, and take obj lock for
    i915_vma_unbind, v2.
  drm/i915: Remove assert_object_held_shared
  drm/i915: Remove support for unlocked i915_vma unbind
  drm/i915: Remove short-term pins from execbuf, v5.

 drivers/gpu/drm/i915/display/intel_dpt.c      |   2 -
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 250 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  44 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  59 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   6 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 454 ++------------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |   1 -
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  13 -
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 -
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  12 -
 drivers/gpu/drm/i915/gt/mock_engine.c         |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |   2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   2 +-
 drivers/gpu/drm/i915/i915_active.c            |  28 +-
 drivers/gpu/drm/i915/i915_active.h            |  17 +-
 drivers/gpu/drm/i915/i915_drv.h               |  12 +-
 drivers/gpu/drm/i915/i915_gem.c               |  32 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         |  64 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   8 +-
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   4 +
 drivers/gpu/drm/i915/i915_vgpu.c              |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 579 +++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h               |   6 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  27 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  50 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  19 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
 40 files changed, 951 insertions(+), 846 deletions(-)

-- 
2.34.1

