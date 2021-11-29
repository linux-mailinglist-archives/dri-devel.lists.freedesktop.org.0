Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A051346172C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB21D6ED9E;
	Mon, 29 Nov 2021 13:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3266EB2C;
 Mon, 29 Nov 2021 13:57:17 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/16] drm/i915: Remove short term pins from execbuf.
Date: Mon, 29 Nov 2021 14:47:19 +0100
Message-Id: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.0
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

New version of the series, with feedback from previous series added.

First 11 patches are clean, some small fixes might required still for all to pass.

Maarten Lankhorst (16):
  drm/i915: Remove unused bits of i915_vma/active api
  drm/i915: Change shrink ordering to use locking around unbinding.
  drm/i915: Remove pages_mutex and intel_gtt->vma_ops.set/clear_pages
    members, v2.
  drm/i915: Take object lock in i915_ggtt_pin if ww is not set
  drm/i915: Force ww lock for i915_gem_object_ggtt_pin_ww
  drm/i915: Ensure gem_contexts selftests work with unbind changes.
  drm/i915: Take trylock during eviction, v2.
  drm/i915: Pass trylock context to callers
  drm/i915: Ensure i915_vma tests do not get -ENOSPC with the locking
    changes.
  drm/i915: Make i915_gem_evict_vm work correctly for already locked
    objects
  drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to prevent new ENOSPC
    errors
  drm/i915: Add i915_vma_unbind_unlocked, and take obj lock for
    i915_vma_unbind
  drm/i915: Require object lock when freeing pages during destruction
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
 .../drm/i915/gem/selftests/i915_gem_context.c |  54 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   6 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 450 ++------------
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
 drivers/gpu/drm/i915/i915_gem.c               |  28 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         |  64 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   8 +-
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   4 +
 drivers/gpu/drm/i915/i915_vgpu.c              |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 580 +++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h               |   6 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  27 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  48 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  19 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
 40 files changed, 942 insertions(+), 841 deletions(-)

-- 
2.34.0

