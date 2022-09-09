Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A745B3637
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49A10E009;
	Fri,  9 Sep 2022 11:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15AE10E009;
 Fri,  9 Sep 2022 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662722442; x=1694258442;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Px1eJiOFYbJEgbFjGUcx5/qxK/82YytbDllANuS3q6A=;
 b=KfMUdpnJNz09/dg9YjzaZ2o8ei1B+5GN8sidycrGd5xQpE2XwFWF9kCD
 20JElWSmIhI242NcsWOFGZjYUWqxyseo6uQnHoyOQWQutwBsJOAO/b72y
 DM5eo8+z1ce3gNd1itDWTp8RInZfCxQPPR1N79n3NBkhJEplZnkgUU41H
 eyT7qdjP2gdty/4OCUnURhgwxQVviaouj8lgqFaH1/dJ2T5Z8rZ0SVqYY
 cQsTxp2SGTQMNhxPtjJ07LdWKfcH06Y9lyySFPhhXkQOdHhI6Qlh7qj2U
 lyqCB4j9VhpWhucUNcM9jjogyAa6NMiTq7n63sFm7etlUyHyCV5QcXbI+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298256014"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="298256014"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:20:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="677123999"
Received: from fjkilken-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.15.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:20:32 -0700
Date: Fri, 9 Sep 2022 14:20:30 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YxshfqUN+vDe92Zn@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes second drm-intel-gt-next PR towards 6.1.

As the top item we're now aligning the GuC/HuC firmware versioning
to meet the expectations recorded under firmware-usage-guidelines.rst.
A revert of a previous (incorrect) userspace register removal for DG2
and addition of new DG2 workaround. Reject suspend on DG2 on low
system memory condition.

Fix for Gitlab #6639 h264 hardware video decoding regression, GuC SLPC
improvements, PXP fix, ATS-M thread tuning settings and tiny bit of
Meteorlake enabling, 

Regards, Joonas

PS. Still not the top of drm-intel-gt-next as need your comments on
fixing(?) the Acked-by's on the MEI/GSC patches.

***

drm-intel-gt-next-2022-09-09:

UAPI Changes:

- Revert "drm/i915/dg2: Add preemption changes for Wa_14015141709"

  The intent of Wa_14015141709 was to inform us that userspace can no
  longer control object-level preemption as it has on past platforms
  (i.e., by twiddling register bit CS_CHICKEN1[0]).  The description of
  the workaround in the spec wasn't terribly well-written, and when we
  requested clarification from the hardware teams we were told that on the
  kernel side we should also probably stop setting
  FF_SLICE_CS_CHICKEN1[14], which is the register bit that directs the
  hardware to honor the settings in per-context register CS_CHICKEN1.  It
  turns out that this guidance about FF_SLICE_CS_CHICKEN1[14] was a
  mistake; even though CS_CHICKEN1[0] is non-operational and useless to
  userspace, there are other bits in the register that do still work and
  might need to be adjusted by userspace in the future (e.g., to implement
  other workarounds that show up).  If we don't set
  FF_SLICE_CS_CHICKEN1[14] in i915, then those future workarounds would
  not take effect.

  Even more details at:

  https://lists.freedesktop.org/archives/intel-gfx/2022-September/305478.html

Driver Changes:

- Align GuC/HuC firmware versioning scheme to kernel practices (John)
- Fix #6639: h264 hardware video decoding broken in 5.19 on Intel(R)
  Celeron(R) N3060 (Nirmoy)
- Meteorlake (MTL) enabling (Matt R)
- GuC SLPC improvements (Vinay, Rodrigo)
- Add thread execution tuning setting for ATS-M (Matt R)
- Don't start PXP without mei_pxp bind (Juston)
- Remove leftover verbose debug logging from GuC error capture (John)
- Abort suspend on low system memory conditions (Nirmoy, Matt A, Chris)
- Add DG2 Wa_16014892111 (Matt R)

- Rename ggtt_view as gtt_view (Niranjana)
- Consider HAS_FLAT_CCS() in needs_ccs_pages (Matt A)
- Don't try to disable host RPS when this was never enabled. (Rodrigo)
- Clear stalled GuC CT request after a reset (Daniele)
- Remove runtime info printing from GuC time stamp logging (Jani)
- Skip Bit12 fw domain reset for gen12+ (Sushma, Radhakrishna)

- Make GuC log sizes runtime configurable (John)
- Selftest improvements (Daniele, Matt B, Andrzej)

The following changes since commit 5ece208ab05e4042c80ed1e6fe6d7ce236eee89b:

  drm/i915/guc: Use streaming loads to speed up dumping the guc log (2022-08-17 10:07:03 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-09-09

for you to fetch changes up to 04f7eb3d4582a0a4da67c86e55fda7de2df86d91:

  drm/i915: Set correct domains values at _i915_vma_move_to_active (2022-09-08 11:06:35 +0100)

----------------------------------------------------------------
UAPI Changes:

- Revert "drm/i915/dg2: Add preemption changes for Wa_14015141709"

  The intent of Wa_14015141709 was to inform us that userspace can no
  longer control object-level preemption as it has on past platforms
  (i.e., by twiddling register bit CS_CHICKEN1[0]).  The description of
  the workaround in the spec wasn't terribly well-written, and when we
  requested clarification from the hardware teams we were told that on the
  kernel side we should also probably stop setting
  FF_SLICE_CS_CHICKEN1[14], which is the register bit that directs the
  hardware to honor the settings in per-context register CS_CHICKEN1.  It
  turns out that this guidance about FF_SLICE_CS_CHICKEN1[14] was a
  mistake; even though CS_CHICKEN1[0] is non-operational and useless to
  userspace, there are other bits in the register that do still work and
  might need to be adjusted by userspace in the future (e.g., to implement
  other workarounds that show up).  If we don't set
  FF_SLICE_CS_CHICKEN1[14] in i915, then those future workarounds would
  not take effect.

  Even more details at:

  https://lists.freedesktop.org/archives/intel-gfx/2022-September/305478.html

Driver Changes:

- Align GuC/HuC firmware versioning scheme to kernel practices (John)
- Fix #6639: h264 hardware video decoding broken in 5.19 on Intel(R)
  Celeron(R) N3060 (Nirmoy)
- Meteorlake (MTL) enabling (Matt R)
- GuC SLPC improvements (Vinay, Rodrigo)
- Add thread execution tuning setting for ATS-M (Matt R)
- Don't start PXP without mei_pxp bind (Juston)
- Remove leftover verbose debug logging from GuC error capture (John)
- Abort suspend on low system memory conditions (Nirmoy, Matt A, Chris)
- Add DG2 Wa_16014892111 (Matt R)

- Rename ggtt_view as gtt_view (Niranjana)
- Consider HAS_FLAT_CCS() in needs_ccs_pages (Matt A)
- Don't try to disable host RPS when this was never enabled. (Rodrigo)
- Clear stalled GuC CT request after a reset (Daniele)
- Remove runtime info printing from GuC time stamp logging (Jani)
- Skip Bit12 fw domain reset for gen12+ (Sushma, Radhakrishna)

- Make GuC log sizes runtime configurable (John)
- Selftest improvements (Daniele, Matt B, Andrzej)

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915/selftests: allow misaligned_pin test work with unmappable memory

Daniele Ceraolo Spurio (2):
      drm/i915/guc: skip scrub_ctbs selftest if reset is disabled
      drm/i915/guc: clear stalled request after a reset

Jani Nikula (1):
      drm/i915/guc: remove runtime info printing from time stamp logging

John Harrison (4):
      drm/i915/guc: Make GuC log sizes runtime configurable
      drm/i915/guc: Reduce spam from error capture
      drm/i915/uc: Support for version reduced and multiple firmware files
      drm/i915/uc: Add patch level version number support

Joonas Lahtinen (1):
      drm/i915/guc: Remove log size module parameters

Juston Li (1):
      drm/i915/pxp: don't start pxp without mei_pxp bind

Matt Roper (5):
      drm/i915/mtl: MMIO range is now 4MB
      drm/i915/mtl: Don't mask off CCS according to DSS fusing
      drm/i915/dg2: Incorporate Wa_16014892111 into DRAW_WATERMARK tuning
      Revert "drm/i915/dg2: Add preemption changes for Wa_14015141709"
      drm/i915/ats-m: Add thread execution tuning setting

Matthew Auld (2):
      Revert "drm/i915/guc: Add delay to disable scheduling after pin count goes to zero"
      drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages

Matthew Brost (2):
      drm/i915/selftests: Use correct selfest calls for live tests
      drm/i915/guc: Add delay to disable scheduling after pin count goes to zero

Niranjana Vishwanathapura (1):
      drm/i915: Rename ggtt_view as gtt_view

Nirmoy Das (2):
      drm/i915/ttm: Abort suspend on i915_ttm_backup failure
      drm/i915: Set correct domains values at _i915_vma_move_to_active

Radhakrishna Sripada (1):
      drm/i915: Skip Bit12 fw domain reset for gen12+

Rodrigo Vivi (3):
      drm/i915/slpc: Fix inconsistent locked return
      drm/i915/slpc: Let's fix the PCODE min freq table setup for SLPC
      drm/i915: Don't try to disable host RPS when this was never enabled.

Vinay Belgaumkar (1):
      drm/i915/guc/slpc: Allow SLPC to use efficient frequency

 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  18 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   7 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   2 +
 drivers/gpu/drm/i915/gt/intel_llc.c                |  19 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  21 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  60 ++-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  13 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |   9 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  55 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |  81 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         | 175 +++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |  42 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  86 +---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  17 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 462 ++++++++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  39 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |   8 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |   3 +
 drivers/gpu/drm/i915/i915_debugfs.c                |  56 +--
 drivers/gpu/drm/i915/i915_drv.h                    |   7 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   6 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  16 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   1 +
 drivers/gpu/drm/i915/i915_vma.c                    |  43 +-
 drivers/gpu/drm/i915/i915_vma.h                    |  18 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |  42 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |   3 +
 drivers/gpu/drm/i915/intel_uncore.c                |  18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |  15 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   4 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |  70 ++--
 53 files changed, 937 insertions(+), 555 deletions(-)
