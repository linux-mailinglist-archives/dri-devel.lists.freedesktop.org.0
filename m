Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2166D9F0E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B2B10EC67;
	Thu,  6 Apr 2023 17:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3703510E0F6;
 Thu,  6 Apr 2023 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803066; x=1712339066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zBzAhBrLOCBh5WvA2yROebl8UftVD8SCWQ+PGhJMRBE=;
 b=bDAjlN6/52RNVXj10aakT/GQhRsKv91BfpIKxWaZbGX3x7L81MqB1tXS
 DOfcg73ba5M52ipCJJAFzrJYQgeE6epE7ecMOO49m5tvBZ1ztxPlfOzaS
 T5JzfqiYhEhS+nWir7H1p1mkTxgeodG7o5eno4VnDBLyxf6xeffKu7oZv
 YtTs0781aOudvyxO54sgnMqAVXVr7GCiCgJmRVb7jvE02sCAj2Dfh/EEl
 ujze0Ptw6NDWJac/Feg+735J1ZoK/iqogtBAE2UpEnN0DpcrsPuF9xC4C
 qs8dL1FJw4zhF9D9wyC9as6VOsXw0x7/n6tDkjWZhGK8P51hKxo0pLimF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345432436"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="345432436"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680757334"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680757334"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 10:44:24 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 0/8] drm/i915/pxp: Add MTL PXP Support
Date: Thu,  6 Apr 2023 10:44:11 -0700
Message-Id: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Juston Li <justonli@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series enables PXP on MTL. On ADL/TGL platforms, we rely on
the mei driver via the i915-mei PXP component interface to establish
a connection to the security firmware via the HECI device interface.
That interface is used to create and teardown the PXP ARB session.
PXP ARB session is created when protected contexts are created.

In this series, the front end behaviors and interfaces (uapi) remain
the same. We add backend support for MTL but with MTL we directly use
the GSC-CS engine on the MTL GPU device to send messages to the PXP
(a.k.a. GSC a.k.a graphics-security) firmware. With MTL, the format
of the message is slightly different with a 2-layer packetization
that is explained in detail in Patch #3. Also, the second layer
which is the actual PXP firmware packet is now rev'd to version 4.3
for MTL that is defined in Patch #5.

Take note that Patch #4 adds the buffer allocation and gsccs-send-
message without actually being called by the arb-creation code
which gets added in Patch #5. Additionally, a seperate series being
reviewed is introducing a change for session teardown (in pxp front-
end layer that will need backend support by both legacy and gsccs).
If we squash all of these together (buffer-alloc, send-message,
arb-creation and, in future, session-termination), the single patch
will be rather large. That said, we are keeping Patch #4 and #5
separate for now, but at merge time, we can squash them together
if maintainer requires it.

Changes from prior revs:
   v1 : - fixed when building with CONFIG_PXP disabled.
        - more alignment with gsc_mtl_header structure from the HDCP
   v2 : - (all following changes as per reviews from Daniele)
        - squashed Patch #1 from v1 into the next one.
        - replaced unnecessary "uses_gsccs" boolean in the pxp
          with "HAS_ENGINE(pxp->ctrl_gt, GSC0)".
        - moved the stashing of gsccs resources from a dynamically
          allocated opaque handle to an explicit sub-struct in
          'struct intel_pxp'.
        - moved the buffer object allocations from Patch #1 of this
          series to Patch #5 (but keep the context allocation in
          Patch #1).
        - used the kernel default ppgtt for the gsccs context.
        - optimized the buffer allocation and deallocation code
          and drop the need to stash the drm_i915_gem_object.
        - use a macro with the right mmio reg base (depending
          on root-tile vs media-tile) along with common relative
          offset to access all KCR registers thus minimizing
          changes to the KCR register access codes.
        - fixed bugs in the heci packet request submission code
          in Patch #3 (of this series)
        - add comments in the mtl-gsc-heci-header regarding the
          host-session-handle.
        - re-use tee-mutex instead of introducing a gsccs specific
          cmd mutex.
        - minor cosmetic improvements in Patch #5.
	- before creating arb session, ensure intel_pxp_start
          first ensures the GSC FW is up and running.
        - use 2 second timeout for the pending-bit scenario when
          sending command to GSC-FW as per specs.
        - simplify intel_pxp_get_irq_gt with addition comments
        - redo Patch #7 to minimize the changes without introducing
          a common  abstraction helper for suspend/resume/init/fini
          codes that have to change the kcr power state.
   v3 : - rebase onto latest drm-tip with the updated firmware
          session invalidation flow
        - on Patch#1: move 'mutex_init(&pxp->tee_mutex)' to a common
          init place in intel_pxp_init since its needed everywhere
          (Daniele)
        - on Patch#1: remove unneccasary "ce->vm = i915_vm_get(vm);"
          (Daniele)
        - on Patch#2: move the introduction of host_session_handle to
          Patch#4 where it starts getting used.
        - on Patch#4: move host-session-handle initialization to the
          allocate-resources during gsccs-init (away from Patch#5)
          and add the required call to PXP-firmware to cleanup the
          host-session-handle in destroy-resources during gsccs-fini
        - on Patch#5: add dispatching of arb session termination
          firmware cmd during session teardown (as per latest
          upstream flows)
   v4 : - Added proper initialization and cleanup of host-session-handle
          that the gsc firmware expects.
        - Fix the stream-session-key invalidation instruction for MTL.
   v5 : - In Patch #4, move the tee_mutex locking to after we check for
          valid vma allocations.
        - In Patch #5, wait for intel_huc_is_authenticated instead of
          intel_uc_fw_is_running(gsc-fw) before starting ARB session.
        - In Patch #5, increase the necessary timeouts at the top-level
          (PXP arb session creation / termination) to accomodate SLA of
          GSC firmware when busy with pending-bit responses.
        - In Patch #5, remove redundant host_session_handle init as
          we need a single handle that is already initialized during
          execution_resource init in Patch #4.
        - In Patch #8, increase the wait timeout for termination to
          align with the same SLA.
   v6 : - (multiple patches) always name variables of type struct
          gsccs_session_resources * as 'exec_res'. (Daniele).
        - In gsccs_allocate_execution_resource, always put and take the
          contexts vm to enforce its the default pxp->ctrl_gt->vm.
          (Daniele)
        - In Patch #3: Rebase with the upstream-merged version of the
          intel_gsc_uc_heci_cmd_submit.* files that was part of the hdcp
          merge (adding only the difference of the non-priv submision).
          Fix the non-priv submission helper to use the ww-aware versions
          of request creation + submission (some re-ordeing and calling
          i915_gem_ww_ctx_init and intel_context_pin_ww). (Alan)
        - In Patch #4: Misc coding styling improvements (Daniele).
          Replace PXP43_MAX_HECI_IN_SIZE and PXP43_MAX_HECI_OUT_SIZE
          with PXP43_MAX_HECI_INOUT_SIZE to simplify the size checking.
          Clear the MTL-GSC-HECI header's validity marker of the output
          packet before submission to avoid stale values (Daniele).
          Fix a bug with the gsccs_allocate_execution_resource error
          condition bailing out when out of mem (Daniele).
        - In Patch #5: Add intel_gsc_uc_fw_proxy_init_done when starting
          arb session (in front-end code) when called on platforms with GSC
          engine (Daniele). Update the fw-response-error reporting to
          match what is being merged upstream for the ADL case (Daniele).
        - Old Patch #6: Remove this patch completely. We don't need to
          use the root-gt's uncore to handle KCR irq / power registers.
          (Daniele).
        - New Patch #6: Update the documentation in i915 UAPI for PXP
          context creation to include additional error meanings that was
          always there in upstream code but just never documented. (Alan).
          Add a GET_PARAM for PXP support so that UMDs won't have to create
          a PXP context to know if it's available since that method would
          suffer a longer delay if called too early in kernel startup
          because of the additional dependencies on devices with GSC engine.
          (Tvrtko, Alan, Rodrigo, Lionel).
        - Patch #7: Move intel_pxp_init_hw into backend code to be
          consistent with legacy mei-pxp based tee transport. (Daniele).
        - Patch #8: With 3 places now being aware of mei-pxp vs gsccs-pxp
          difference in timeouts for round trip delays when communicating
          with pxp firmware (getting fw commands sent and receiving the
          reply), add a helper for this. (Daniele)

Alan Previn (8):
  drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
  drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
  drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
  drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
  drm/i915/pxp: Add ARB session creation and cleanup
  drm/i915/uapi/pxp: Fix UAPI spec comments and add GET_PARAM for PXP
  drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
  drm/i915/pxp: Enable PXP with MTL-GSC-CS

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  10 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |   1 +
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 102 ++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  26 +-
 drivers/gpu/drm/i915/i915_getparam.c          |   5 +
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  82 +++-
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |   1 +
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  24 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 444 ++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  39 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |   3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h     |  27 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  25 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |   2 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  20 +
 include/uapi/drm/i915_drm.h                   |  22 +
 20 files changed, 806 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h


base-commit: fbadfcf137737f02425a35bf3ae17a1492301f21
-- 
2.39.0

