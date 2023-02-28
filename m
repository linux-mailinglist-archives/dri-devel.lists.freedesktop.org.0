Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23E6A510D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 03:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC8810E488;
	Tue, 28 Feb 2023 02:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C97D10E47F;
 Tue, 28 Feb 2023 02:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677550912; x=1709086912;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=coidPbNyh4kKl/gNL/XBc8Yx1IDRtEureySGm88LhVM=;
 b=cefKtVPaTWB8TdOsFX0R+HLdAOA3BlkDlQpZr6wHNNbcFvrBC29Or91t
 fr43eWsNYZZ79hRpdZ4EOL8I9wcmkHErrpjIZenfzHyUf5owxU5io5cmC
 X26QGAf+qX6kqD4FSQpQHFRd0u4ExFnG4aVkzcJoDKpuWWxujxc9pfikI
 wuPtPiRhqD56ElQugAfs9NRHqp5w3jo/UsnPmEprXimD0Iu0sBNd6G+zL
 9nypcja5/soztkDSZ9GgSdKC/roUrW4LQqHFVx4QegIa1uYZ5r3QmcmRo
 m9ykZxr/Miyb1+qtqyVDeAMcxYwoW1QPByCt3kz8OIEMDd4MNqT+l3txZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334070722"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="334070722"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 18:21:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919601716"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="919601716"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 18:21:51 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/8] drm/i915/pxp: Add MTL PXP Support
Date: Mon, 27 Feb 2023 18:21:42 -0800
Message-Id: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
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

Alan Previn (8):
  drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
  drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
  drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
  drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
  drm/i915/pxp: Add ARB session creation and cleanup
  drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
  drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
  drm/i915/pxp: Enable PXP with MTL-GSC-CS

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   3 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 108 ++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  76 ++++
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  96 ++++-
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  25 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |  11 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 358 ++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  37 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  24 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |   3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h     |  27 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  25 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |   2 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  20 +
 18 files changed, 787 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h

-- 
2.39.0

