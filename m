Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0DA457E1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328DB10E880;
	Wed, 26 Feb 2025 08:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MHWcqHs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9004F10E87C;
 Wed, 26 Feb 2025 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=btlP+/Ibje/j/a2g04gbUyuwIMhivKCpTZS695eGk34=; b=MHWcqHs6MhB/0xrpSr3iOGigaY
 1gEZX+Gdtt+TVTvJwU7bq1bnXbwbS0x2te1I5gmYW8KVUb7mK42Zkd4zJ5Zg3+hcEyPJFKz2OQW1U
 bdpdI51Uh2uLXb09hvqVptQ1dR/r1OGCungSlksAfTmoCd5ujGnuZaFmmVs6z9yTmtGR6FzQ2ZGkt
 utIaQWcifk9BT57IecwOjRsVsxZFyCOddOw/54rfsGgoYvGJIohg59f+JsWCaACnhR/1EU96gJOdI
 T7IqyZ7WJgKyII2KiOBlPHWJSQARDIMiUxSjp3lQb91rd/tPV5Tp3NLzLYReJFkWSx/pPksCCxwPY
 MX38r0+w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnCXp-000pv2-TN; Wed, 26 Feb 2025 09:13:35 +0100
Date: Wed, 26 Feb 2025 08:13:34 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <Z77NLt2mR7SqxJ4u@linux>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave, Sima,

Here comes the main pull request for 6.15.

New sysfs UAPI for configuring the GuC power profiles is probably the most
interesting addition. Other than that, there is one performance workaround
for Gen12 platforms and a bunch of fixes, mostly around the GuC code. PMU
code was consolidated to use kernel facility for CPU hotplug handling which
required a merge during the development window.

Other than those just a collection of cleanups and selftest fixes.

Regards,

Tvrtko

drm-intel-gt-next-2025-02-26:
UAPI Changes:

- Add sysfs for SLPC power profiles [slpc] (Vinay Belgaumkar)

Driver Changes:

Fixes/improvements/new stuff:

- Fix zero delta busyness issue [pmu] (Umesh Nerlige Ramappa)
- Fix page cleanup on DMA remap failure (Brian Geffon)
- Debug print LRC state entries only if the context is pinned [guc] (Daniele Ceraolo Spurio)
- Drop custom hotplug code [pmu] (Lucas De Marchi)
- Use spin_lock_irqsave() in interruptible context [guc] (Krzysztof Karas)
- Add wait on depth stall done bit handling [gen12] (Juha-Pekka Heikkila)

Miscellaneous:

- Change throttle criteria for rps [selftest] (Raag Jadav)
- Add debug print about hw config table size (John Harrison)
- Include requested frequency in slow firmware load messages [uc] (John Harrison)
- Remove i915_pmu_event_event_idx() [pmu] (Lucas De Marchi)
- Remove unused live_context_for_engine (Dr. David Alan Gilbert)
- Add Wa_22010465259 in its respective WA list (Ranu Maurya)
- Correct frequency handling in RPS power measurement [selftests] (Sk Anirban)
- Add helper function slpc_measure_power [guc/slpc] (Sk Anirban)
- Revert "drm/i915/gt: Log reason for setting TAINT_WARN at reset" [gt] (Sebastian Brzezinka)
- Avoid using uninitialized context [selftests] (Krzysztof Karas)
- Use struct_size() helper in kmalloc() (luoqing)
- Use prandom in selftest [selftests] (Markus Theil)
- Replace kmap with its safer kmap_local_page counterpart [gt] (Andi Shyti)

Merges:

- Merge drm/drm-next into drm-intel-gt-next (Tvrtko Ursulin)
The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-02-26

for you to fetch changes up to 7ded94bd11d47a8ddef051aef1d1a42d8191e09f:

  drm/i915/gt: add wait on depth stall done bit handling (2025-02-18 12:37:04 +0100)

----------------------------------------------------------------
UAPI Changes:

- Add sysfs for SLPC power profiles [slpc] (Vinay Belgaumkar)

Driver Changes:

Fixes/improvements/new stuff:

- Fix zero delta busyness issue [pmu] (Umesh Nerlige Ramappa)
- Fix page cleanup on DMA remap failure (Brian Geffon)
- Debug print LRC state entries only if the context is pinned [guc] (Daniele Ceraolo Spurio)
- Drop custom hotplug code [pmu] (Lucas De Marchi)
- Use spin_lock_irqsave() in interruptible context [guc] (Krzysztof Karas)
- Add wait on depth stall done bit handling [gen12] (Juha-Pekka Heikkila)

Miscellaneous:

- Change throttle criteria for rps [selftest] (Raag Jadav)
- Add debug print about hw config table size (John Harrison)
- Include requested frequency in slow firmware load messages [uc] (John Harrison)
- Remove i915_pmu_event_event_idx() [pmu] (Lucas De Marchi)
- Remove unused live_context_for_engine (Dr. David Alan Gilbert)
- Add Wa_22010465259 in its respective WA list (Ranu Maurya)
- Correct frequency handling in RPS power measurement [selftests] (Sk Anirban)
- Add helper function slpc_measure_power [guc/slpc] (Sk Anirban)
- Revert "drm/i915/gt: Log reason for setting TAINT_WARN at reset" [gt] (Sebastian Brzezinka)
- Avoid using uninitialized context [selftests] (Krzysztof Karas)
- Use struct_size() helper in kmalloc() (luoqing)
- Use prandom in selftest [selftests] (Markus Theil)
- Replace kmap with its safer kmap_local_page counterpart [gt] (Andi Shyti)

Merges:

- Merge drm/drm-next into drm-intel-gt-next (Tvrtko Ursulin)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Replace kmap with its safer kmap_local_page counterpart

Brian Geffon (1):
      drm/i915: Fix page cleanup on DMA remap failure

Daniele Ceraolo Spurio (1):
      drm/i915/guc: Debug print LRC state entries only if the context is pinned

Dr. David Alan Gilbert (1):
      drm/i915: Remove unused live_context_for_engine

John Harrison (2):
      drm/i915: Add debug print about hw config table size
      drm/i915/uc: Include requested frequency in slow firmware load messages

Juha-Pekka Heikkila (1):
      drm/i915/gt: add wait on depth stall done bit handling

Krzysztof Karas (2):
      drm/i915/selftests: avoid using uninitialized context
      drm/i915/gt: Use spin_lock_irqsave() in interruptible context

Lucas De Marchi (2):
      drm/i915/pmu: Remove i915_pmu_event_event_idx()
      drm/i915/pmu: Drop custom hotplug code

Markus Theil (1):
      drm/i915/selftests: use prandom in selftest

Raag Jadav (1):
      drm/i915/selftest: Change throttle criteria for rps

Ranu Maurya (1):
      drm/i915: Add Wa_22010465259 in its respective WA list

Sebastian Brzezinka (1):
      Revert "drm/i915/gt: Log reason for setting TAINT_WARN at reset"

Sk Anirban (2):
      drm/i915/selftests: Correct frequency handling in RPS power measurement
      drm/i915/guc/slpc: Add helper function slpc_measure_power

Tvrtko Ursulin (1):
      Merge drm/drm-next into drm-intel-gt-next

Umesh Nerlige Ramappa (1):
      drm/i915/pmu: Fix zero delta busyness issue

Vinay Belgaumkar (1):
      drm/i915/slpc: Add sysfs for SLPC power profiles

luoqing (1):
      selftests: i915: Use struct_size() helper in kmalloc()

 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   6 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |  38 -------
 drivers/gpu/drm/i915/gem/selftests/mock_context.h  |   3 -
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  47 ++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c              |   6 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   4 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  19 ++--
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  13 +--
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  17 ++-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |   8 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  65 +++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  40 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  12 ++-
 drivers/gpu/drm/i915/i915_module.c                 |   2 -
 drivers/gpu/drm/i915/i915_pmu.c                    | 120 +--------------------
 drivers/gpu/drm/i915/i915_pmu.h                    |  11 --
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   7 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   4 +-
 26 files changed, 228 insertions(+), 227 deletions(-)
