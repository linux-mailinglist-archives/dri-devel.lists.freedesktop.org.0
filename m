Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B0421A33
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01826E239;
	Mon,  4 Oct 2021 22:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60556E210;
 Mon,  4 Oct 2021 22:39:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225916233"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="225916233"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="477392607"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 04 Oct 2021 15:39:06 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v12 00/15] Introduce PXP Test
Date: Mon,  4 Oct 2021 15:39:34 -0700
Message-Id: <20211004223949.2138370-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds gem_pxp tests for the new PXP subsystem currently
being reviewed at https://patchwork.freedesktop.org/series/90503/.
This series currently includes 4 groups of tests addressing the
features and restrictions described by Daniele's series :
   1. test i915 interfaces for allocation of protected bo's
      and contexts and enforcement of UAPI rule disallowing the
      modification of parameters after it's been created.
   2. verify PXP subsystem protected sessions generate encrypted
      content on protected output buffers and decrypt protected
      inputs buffers.
   3. verify i915 PXP auto-teardown succeeds on suspend-resume
      cycles and gem-exec of stale protected assets fail. Ensure
      protected-contexts adhere to stricter invalidation
      enforcement upon teardown event.
   4. Ensure that display plane decryption works as expected with
      protected buffers.

NOTE: This series is on the tenth revision. All R-v-b's have been
received except UAPI patch which will be dropped at merge time (after
kernel patches gets merged and igt's drm UAPI gets sync'd).

Changes from prior rev1 to now:
   v12:
      - Rebase on latest igt and updated the UAPI changes to align
        with commits from kernel side.
   v11:
      - When detecting hw support, retry pxp context creation
        multiple times a timeout as per HW SLA.
      - initialize bo or ctx handles to zero before calling
        creation ioctl wrapper.
   v10:
      - In patch #2, reuse existing gem_create_ext wrapper.
      - In patch #10, kernel side changed the debugfs file name
        (but no difference in behavior / usage).
      - Removed patch #14 from Rev9 as decision on kernel side
        was to drop the usage of RESET_STATS IOCTL to track
        invalidated pxp contexts.
   v9:
      - Remove patch #2 from rev7 as it was duplicating
        an existing ioctl wrapper helper
      - Fix the false-negative warnings when triggering
        auto-suspend-resume (remove checking if we are
        suspending after the system has already resumed).
   v8:
      - Nothing - mistaken detection from patchwork
   v7:
      - In prior rev, Patches #11->13 was testing expected results
        from calling gem_execbuf with stale pxp-context, pxp-buffer
        or combinations of them (including an opt-out usage). All
        of them used a single suspend-resume power state cycles to
        trigger the PXP teardown event. These patches have been
        combined into patch #14 that continues to carry the prior rev
        Rvb.
      - In its place, the new patches of #11->#13 do the identical
        set of tests as before (results from gem_execbuf with various
        combinations of stale pxp context and buffer), but this time
        using a debugfs file handle that triggers the same code path
        taken when the HW triggers the pxp teardown. That said, the
        code is nearly identical as v6 but I did not keep the Rvb's.
      - In patch #15, RESET_STAT now reports invalidated / banned
        pxp contexts via the existing batch_active's lost count.
   v6:
      - Addressed rev5 review comments for patch #1, #7, #14
        and #17.
      - For #17, I'm using Rodrigo's Rv-b because offline 
        discussions concluded that we couldn't use those
        test sequences with HDCP and so it was removed it.
      - Added Rv-b into all patches that received it.
      - Modified the test requirement from a list of device
        ids to checking if runtime PXP interface succeeds
        due to kernel's build config dependency.
   v5:
      - Addressed all rev4 review comments. No changes to
        overall flow and logic compared to the last rev.
   v4:
      - Addressed all rev3 review comments. NOTE: that all
        test cases and code logic are the same but a decent
        amount of refactoring has occured due to address
        v3 comments to break out subtests into separate
        functions while combining certain checks into the same
        function to reduce test time by minimizing number of
        suspend-resume power cycles.
   v3:
      - Addressed all rev2 review comments.
      - In line with one of the rev2 comments, a thorough fixup
        of all line-breaks in function calls was made for a more
        consistent styling.
      - Rebased on igt upstream repo and updated to latest kernel
        UAPI that added GEM_CREATE_EXT.
   v2: 
      - Addressed all rev1 review comments except these:
           1.Chris Wilson : "...have the caller do 1-3 once for its protected
             context. Call it something like intel_bb_enable_pxp(),
             intel_bb_set_pxp if it should be reversible.".
             -  This couldn't be implemented because [1] HW needs different
             instruction sequences for enabling/disabling PXP depending
             on the engine class and [2] the pair of "pxp-enable" and "pxp-
             disable" instructions need to be contained within the same batch
             that is dispatched to the hardware. That said, implementing
             internal intel_batchbuffer funtionality for this would conflict
             with how rendercopy_gen9 uses batch buffer memory by repositioing
             the pointer and consuming unused portions of the batch buffer as
             3d state offsets that batchbuffer has no visibility.
          
      - Added these additional subtests:
           1. verify that buffer sharing works across testing pxp context.
           2. verify teardown bans contexts via DRM_IOCTL_I915_GET_RESET_STAT.
           3. verify display plane decryption of protected buffers.

Alan Previn (14):
  i915_drm.h sync
  Add basic PXP testing of buffer and context alloc
  Perform a regular 3d copy as a control checkpoint
  Add PXP attribute support in batchbuffer and buffer_ops libs
  Add MI_SET_APPID instruction definition
  Enable protected session cmd in gen12_render_copyfunc
  Add subtest to copy raw source to protected dest
  Add test where both src and dest are protected
  Verify PXP teardown occurred through suspend-resume
  Verify execbuf fails with stale PXP context after teardown
  Verify execbuf fails with stale PXP buffer after teardown
  Verify execbuf ok with stale PXP buf in opt-out use
  Verify execution behavior with stale PXP assets through suspend-resume
  Verify protected surfaces are dma buffer sharable

Karthik B S (1):
  tests/i915_pxp: CRC validation for display tests.

 include/drm-uapi/i915_drm.h |   94 +++
 lib/intel_batchbuffer.c     |   23 +-
 lib/intel_batchbuffer.h     |   31 +
 lib/intel_bufops.h          |   15 +
 lib/intel_reg.h             |    8 +
 lib/rendercopy_gen9.c       |   57 ++
 tests/i915/gem_pxp.c        | 1283 +++++++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 8 files changed, 1511 insertions(+), 1 deletion(-)
 create mode 100644 tests/i915/gem_pxp.c

-- 
2.25.1

