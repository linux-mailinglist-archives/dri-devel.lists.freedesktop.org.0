Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7C51B816
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 08:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF32310F546;
	Thu,  5 May 2022 06:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907C910ED4A;
 Thu,  5 May 2022 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651732751; x=1683268751;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=LRtidhkFoeMe979maRU4nA4nTyJP0f6J+A0xVOjsyTQ=;
 b=G7hhA62AJCPXpVhQ8M5tUXLdwUilJSskVimbJCq95YwqjQo2vOWOYy0F
 6Jy9OhtbDyXsl0xQl/xtCE8emvJ1eIwF2SGAhhYx89OLpj8U4NxOkL1+a
 qw5VoyTBElkp0dkvIGRDr3jfr1PgE83/6LobFABHucJ1wvk/KHlwPv8Cu
 2VWy3e9nQ6r4dWi+93w6LJ9futaBiD1QplS0dZ7VIjp/fg94CylgTQAl2
 /VNim3e6tqHPLc61TgJQsaaiXpcTCiaGLSf+1Jeg7l8SrFKQ/O/uqa+D5
 S0S7ONhVeKBrqvLWzlh5pGGqXOh7u4hcA3rjTtJWWshwqvkTrcpRj/81z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="331007701"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="331007701"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 23:39:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="563099482"
Received: from mrbroom-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.206.41])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 23:39:08 -0700
Date: Thu, 5 May 2022 07:39:06 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YnNxCm1pyflu3taj@tursulin-mobl2>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave, Daniel,

Here goes the final drm-intel-gt-next PR towards 5.19.

A fix for a security issue affecting Tigerlake onwards and a plain fix for
a race in VMA handling have landed since the previous pull.

Also last two bits of DG2 enablement are included - GuC firmware version
has been defined and compute command streamers have been exposed to
userspace.

Else just a handful of small cleanups and selftest fixes. There are
initial Ponte Vecchio definitions but no impact oustside development
branch management.

Regards,

Tvrtko

drm-intel-gt-next-2022-05-05:
UAPI Changes:

- Add kerneldoc for engine class enum (Matt Roper)
- Add compute engine ABI (Matt Roper)

Driver Changes:

- Define GuC firmware version for DG2 (John Harrison)
- Clear SET_PREDICATE_RESULT prior to executing the ring (Chris Wilson)
- Fix race in __i915_vma_remove_closed (Karol Herbst)

- Add register for compute engine's MMIO-based TLB invalidation (Matt Roper)
- Xe_HP SDV and DG2 have up to 4 CCS engines (Daniele Ceraolo Spurio)
- Add initial Ponte Vecchio definitions (Stuart Summers)
- Document the eviction of the Flat-CCS objects (Ramalingam C)

- Use existing uncore helper to read gpm_timestamp (Umesh Nerlige Ramappa)
- Fix issue with LRI relative addressing (Akeem G Abodunrin)
- Skip poisoning SET_PREDICATE_RESULT on dg2 (Chris Wilson)
- Optimize the ccs_sz calculation per chunk (Ramalingam C)
- Remove superfluous string helper include (Jani Nikula)
- Fix assert in i915_ggtt_pin (Tvrtko Ursulin)
- Use IOMEM_ERR_PTR() directly (Kefeng Wang)
The following changes since commit f15856d7de914595d0daa2c706f53a693b48e228:

  drm/i915/dg2: add gsc with special gsc bar offsets (2022-04-21 11:34:39 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-05-05

for you to fetch changes up to 1df1c79cbb7ac9bf148930be3418973c76ba8dde:

  drm/i915: Fix race in __i915_vma_remove_closed (2022-05-04 16:22:13 +0100)

----------------------------------------------------------------
UAPI Changes:

- Add kerneldoc for engine class enum (Matt Roper)
- Add compute engine ABI (Matt Roper)

Driver Changes:

- Define GuC firmware version for DG2 (John Harrison)
- Clear SET_PREDICATE_RESULT prior to executing the ring (Chris Wilson)
- Fix race in __i915_vma_remove_closed (Karol Herbst)

- Add register for compute engine's MMIO-based TLB invalidation (Matt Roper)
- Xe_HP SDV and DG2 have up to 4 CCS engines (Daniele Ceraolo Spurio)
- Add initial Ponte Vecchio definitions (Stuart Summers)
- Document the eviction of the Flat-CCS objects (Ramalingam C)

- Use existing uncore helper to read gpm_timestamp (Umesh Nerlige Ramappa)
- Fix issue with LRI relative addressing (Akeem G Abodunrin)
- Skip poisoning SET_PREDICATE_RESULT on dg2 (Chris Wilson)
- Optimize the ccs_sz calculation per chunk (Ramalingam C)
- Remove superfluous string helper include (Jani Nikula)
- Fix assert in i915_ggtt_pin (Tvrtko Ursulin)
- Use IOMEM_ERR_PTR() directly (Kefeng Wang)

----------------------------------------------------------------
Akeem G Abodunrin (1):
      drm/i915/xehpsdv/dg1/tgl: Fix issue with LRI relative addressing

Chris Wilson (2):
      drm/i915/selftests: Skip poisoning SET_PREDICATE_RESULT on dg2
      drm/i915/gt: Clear SET_PREDICATE_RESULT prior to executing the ring

Daniele Ceraolo Spurio (1):
      drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines

Jani Nikula (1):
      drm/i915: remove superfluous string helper include

John Harrison (1):
      drm/i915/dg2: Define GuC firmware version for DG2

Karol Herbst (1):
      drm/i915: Fix race in __i915_vma_remove_closed

Kefeng Wang (1):
      drm/i915: use IOMEM_ERR_PTR() directly

Matt Roper (3):
      drm/i915/uapi: Add kerneldoc for engine class enum
      drm/i915/xehp: Add register for compute engine's MMIO-based TLB invalidation
      drm/i915/xehp: Add compute engine ABI

Ramalingam C (2):
      drm/i915/gt: optimize the ccs_sz calculation per chunk
      drm/i915/gt: Document the eviction of the Flat-CCS objects

Stuart Summers (1):
      drm/i915/pvc: add initial Ponte Vecchio definitions

Tvrtko Ursulin (1):
      drm/i915: Fix assert in i915_ggtt_pin

Umesh Nerlige Ramappa (1):
      drm/i915/pmu: Use existing uncore helper to read gpm_timestamp

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           | 54 ++++++++++++++++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |  7 ++
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |  2 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   | 15 +++--
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |  2 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 75 ++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_lrc.h                |  5 ++
 drivers/gpu/drm/i915/gt/intel_migrate.c            | 59 ++++++++---------
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  2 -
 drivers/gpu/drm/i915/gt/selftest_lrc.c             | 53 ++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 19 ++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  1 +
 drivers/gpu/drm/i915/i915_drm_client.c             |  1 +
 drivers/gpu/drm/i915/i915_drm_client.h             |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  2 +
 drivers/gpu/drm/i915/i915_pci.c                    | 27 +++++++-
 drivers/gpu/drm/i915/i915_vma.c                    | 19 +++---
 drivers/gpu/drm/i915/i915_vma.h                    |  1 -
 drivers/gpu/drm/i915/intel_device_info.c           |  1 +
 drivers/gpu/drm/i915/intel_device_info.h           |  1 +
 include/uapi/drm/i915_drm.h                        | 62 ++++++++++++++++--
 24 files changed, 319 insertions(+), 95 deletions(-)
