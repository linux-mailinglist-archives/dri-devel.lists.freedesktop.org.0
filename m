Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF73686579
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 12:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56F810E3F6;
	Wed,  1 Feb 2023 11:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65810E2C1;
 Wed,  1 Feb 2023 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675251416; x=1706787416;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Qs4AFgD9CqQ4MZyD32jzjmRt16g3MWyCHCVafKrDiX0=;
 b=LrJB1Ao/W3+s4uZkPEbfPgJXob8M5oSkvRbvkhlzP3oaen2IbZRB6C8l
 1taGcxoocI+7uRmcMgkVFAGgMuIjTDhXdPx4c635BBsEmQC9gZbHmXSxs
 Zt4HJro/eM4RoJDuNBsYC0+C11ih/rB8lpyKrwvu/QfwoEwPI7oO8BVrX
 xomzQm8Ax0EnwOP36o+8PWCSl6aiuXhuNOJh9V49MmrYFDpTnq3PeASVI
 j8TA+Wr5iROBVqat+cSVtPOl97zm02UMDsWVR9sDeeE069ZvG5foCpffj
 wRAmqbm4eIWMkH6UGGqbDWKT0fGtW4pRzxJ6VZOtVcjzhGLIkhxLfjw23 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355451580"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="355451580"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:36:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="733528467"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="733528467"
Received: from jazminsx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.218.124])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:36:53 -0800
Date: Wed, 1 Feb 2023 11:36:51 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <Y9pOsq7VKnq7rgnW@tursulin-desk>
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

Hi Dave, Daniel,

Here goes the final pull request for 6.3.

Aside a few fixes, the reset is split between refactoring of the
workarounds code and correcting some workaround placement to correctly
align for new platforms, and converting the GuC code to use dedicated
logging macros, as was done for the whole of the GT in the previous pull.

Some minor random future platform prep as well, and a back merge to fix
a conflict between drm-intel-next and drm-intel-gt-next.

Regards,

Tvrtko

drm-intel-gt-next-2023-02-01:
Driver Changes:

Fixes/improvements/new stuff:

- Fix bcs default context on Meteorlake (Lucas De Marchi)
- GAM registers don't need to be re-applied on engine resets (Matt Roper)
- Correct implementation of Wa_18018781329 (Matt Roper)
- Avoid potential vm use-after-free (Rob Clark)
- GuC error capture fixes (John Harrison)
- Fix potential bit_17 double-free (Rob Clark)
- Don't complain about missing regs on MTL (John Harrison)

Future platform enablement:

- Convert PSS_MODE2 to multicast register (Gustavo Sousa)
- Move/adjust register definitions related to Wa_22011450934 (Matt Roper)
- Move LSC_CHICKEN_BIT* workarounds to correct function (Gustavo Sousa)
- Document where to implement register workarounds (Gustavo Sousa)
- Use uabi engines for the default engine map (Tvrtko Ursulin)
- Flush all tiles on test exit (Tvrtko Ursulin)
- Annotate a couple more workaround registers as MCR (Matt Roper)

Driver refactors:

- Add and use GuC oriented print macros (Michal Wajdeczko)

Miscellaneous:

- Fix intel_selftest_modify_policy argument types (Arnd Bergmann)

Backmerges:

Merge drm/drm-next into drm-intel-gt-next (for conflict resolution) (Tvrtko Ursulin)
The following changes since commit 045e8d102f44ad75dca0b0ec9eede15ea89da673:

  Merge tag 'drm-intel-gt-next-2023-01-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-01-24 16:20:43 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-02-01

for you to fetch changes up to 003e11ed2ef4af01b808f0f193eaa5a32f32383b:

  drm/i915/mtl: Wa_22011802037: don't complain about missing regs on MTL (2023-01-31 15:17:30 -0800)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Fix bcs default context on Meteorlake (Lucas De Marchi)
- GAM registers don't need to be re-applied on engine resets (Matt Roper)
- Correct implementation of Wa_18018781329 (Matt Roper)
- Avoid potential vm use-after-free (Rob Clark)
- GuC error capture fixes (John Harrison)
- Fix potential bit_17 double-free (Rob Clark)
- Don't complain about missing regs on MTL (John Harrison)

Future platform enablement:

- Convert PSS_MODE2 to multicast register (Gustavo Sousa)
- Move/adjust register definitions related to Wa_22011450934 (Matt Roper)
- Move LSC_CHICKEN_BIT* workarounds to correct function (Gustavo Sousa)
- Document where to implement register workarounds (Gustavo Sousa)
- Use uabi engines for the default engine map (Tvrtko Ursulin)
- Flush all tiles on test exit (Tvrtko Ursulin)
- Annotate a couple more workaround registers as MCR (Matt Roper)

Driver refactors:

- Add and use GuC oriented print macros (Michal Wajdeczko)

Miscellaneous:

- Fix intel_selftest_modify_policy argument types (Arnd Bergmann)

Backmerges:

Merge drm/drm-next into drm-intel-gt-next (for conflict resolution) (Tvrtko Ursulin)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/i915/selftest: fix intel_selftest_modify_policy argument types

Gustavo Sousa (3):
      drm/i915/doc: Document where to implement register workarounds
      drm/i915/gt: Move LSC_CHICKEN_BIT* workarounds to correct function
      drm/i915/gt: Convert PSS_MODE2 to multicast register

John Harrison (9):
      drm/i915/guc: Fix locking when searching for a hung request
      drm/i915: Fix request ref counting during error capture & debugfs dump
      drm/i915: Fix up locking around dumping requests lists
      drm/i915: Allow error capture without a request
      drm/i915: Allow error capture of a pending request
      drm/i915/guc: Look for a guilty context when an engine reset fails
      drm/i915/guc: Add a debug print on GuC triggered reset
      drm/i915/guc: Rename GuC register state capture node to be more obvious
      drm/i915/mtl: Wa_22011802037: don't complain about missing regs on MTL

Lucas De Marchi (1):
      drm/i915/mtl: Fix bcs default context

Matt Roper (4):
      drm/i915: Move/adjust register definitions related to Wa_22011450934
      drm/i915/xehp: GAM registers don't need to be re-applied on engine resets
      drm/i915/mtl: Correct implementation of Wa_18018781329
      drm/i915/xehp: Annotate a couple more workaround registers as MCR

Michal Wajdeczko (8):
      drm/i915/guc: Add GuC oriented print macros
      drm/i915/guc: Update GuC messages in intel_guc.c
      drm/i915/guc: Update GuC messages in intel_guc_ads.c
      drm/i915/guc: Update GuC messages in intel_guc_ct.c
      drm/i915/guc: Update GuC messages in intel_guc_fw.c
      drm/i915/guc: Update GuC messages in intel_guc_log.c
      drm/i915/guc: Update GuC messages in intel_guc_submission.c
      drm/i915/guc: Update GT/GuC messages in intel_uc.c

Rob Clark (2):
      drm/i915: Avoid potential vm use-after-free
      drm/i915: Fix potential bit_17 double-free

Tvrtko Ursulin (3):
      drm/i915: Use uabi engines for the default engine map
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915/selftests: Flush all tiles on test exit

 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  23 ++-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  79 +++++-----
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |   1 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  27 ++++
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |   4 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  17 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  43 +-----
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 172 +++++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  31 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  23 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  17 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  38 ++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h       |  48 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  96 +++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  80 +++++-----
 drivers/gpu/drm/i915/i915_drv.h                    |   4 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |  92 +++++------
 drivers/gpu/drm/i915/i915_gpu_error.h              |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   4 -
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |  28 ++--
 .../drm/i915/selftests/intel_scheduler_helpers.c   |   3 +-
 27 files changed, 491 insertions(+), 377 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
