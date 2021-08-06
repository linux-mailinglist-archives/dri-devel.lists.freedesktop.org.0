Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3A3E2808
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 12:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD26589BDB;
	Fri,  6 Aug 2021 10:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E74D899FF;
 Fri,  6 Aug 2021 10:06:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="214327096"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; d="scan'208";a="214327096"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 03:06:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; d="scan'208";a="503949474"
Received: from imccann-mobl.ger.corp.intel.com (HELO localhost) ([10.252.9.82])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 03:06:19 -0700
Date: Fri, 6 Aug 2021 13:06:17 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <YQ0JmYiXhGskNcrI@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave & Daniel,

Sorry for the big PR in advance. Had the summer vacations and did not
notice until tool late how many patches were in already before leaving.

As requested, there is a lot of refactoring to increase the use of TTM
allocator and prep for DRM scheduler. Note that at times the patches trade
simplicity for performance and revert optimizations not seen as critical.
So some performance regressions are expected.

As an example is dropping of faster GPU relocation path for older platforms,
which should be mitigated by updating to the latest UMD versions to regain
the perf.

This PR drops various bits of uAPI where userspace has dropped the ball after reviews
have been completed on both sides (Thanks Jason for doing the due-diligence!). [1]
Due to the complexity of tracing back who used what, I think we could do better in the
future to avoid such situations to begin with. See below for my suggestion [2].

In addition to the refactoring and uAPI cleanup there is preliminay code for
ADL-P/XeHP and DG2 platforms. Fixes for ADL-S and removal of CNL code.
A couple of fixes that have been Cc: stable already. Removing unnecessary
workarounds per stepping and adding missing for Gen12 iGFX.

I915_MMAP_OFFSET_FIXED is also added to to align with the static/fixed caching
mode per BO instead of per-mapping mode (for dGFX only). There is GuC firmware
interface update and backend code major rework that unblock enabling GuC on Gen11
(not on by default). Then there is the addition of the GuCRC power management
feature which can be enabled for Gen12+ when submission is enabled.

Then there is finally the drm-next backmerge and 3 topic branch merges.

I think that is mostly all. I tried to summarize much in the tag description so
it should hopefully not be horribly long...

Regards, Joonas

[1] Given that Jason is only human and there is no way to automate this analysis, we
may have to bring something back as fixes if we find breakage (like with the MMAP IOCTL).

[2] As we first require to merge the kernel code, should we introduce some further rules
that the userspace has to land their code before the final kernel version release? If
that is not followed through, we would neuter the new uAPI with as small patch as possible
in the final release candidate and then remove it in next release. Thoughts?

***

drm-intel-gt-next-2021-08-06-1:

UAPI Changes:

- Add I915_MMAP_OFFSET_FIXED

  On devices with local memory `I915_MMAP_OFFSET_FIXED` is the only valid
  type. On devices without local memory, this caching mode is invalid.

  As caching mode when specifying `I915_MMAP_OFFSET_FIXED`, WC or WB will
  be used, depending on the object placement on creation. WB will be used
  when the object can only exist in system memory, WC otherwise.

  Userspace: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11888

- Reinstate the mmap ioctl for (already released) integrated Gen12 platforms

  Rationale: Otherwise media driver breaks eg. for ADL-P. Long term goal is
  still to sunset the IOCTL even for integrated and require using mmap_offset.

- Reject caching/set_domain IOCTLs on discrete

  Expected to become immutable property of the BO

- Disallow changing context parameters after first use on Gen12 and earlier
- Require setting context parameters at creation on platforms after Gen12

  Rationale (for both): Allow less dynamic changes to the context to simplify
  the implementation and avoid user shooting theirselves in the foot.

- Drop I915_CONTEXT_PARAM_RINGSIZE

  Userspace PR for compute-driver has not been merged

- Drop I915_CONTEXT_PARAM_NO_ZEROMAP

  Userspace PR for libdrm / Beignet was never landed

- Drop CONTEXT_CLONE API

  Userspace PR for Mesa was never landed

- Drop getparam support for I915_CONTEXT_PARAM_ENGINES

  Only existed for symmetry wrt. setparam, never used.

- Disallow bonding of virtual engines

  Drop the prep work, no hardware has been released needing it.

- (Implicit) Disable gpu relocations

  Media userspace was the last userspace to still use them. They
  have converted so performance can be regained with an update.

Core Changes:

- Merge topic branch 'topic/i915-ttm-2021-06-11' (from Maarten)
- Merge topic branch 'topic/revid_steppings' (from Matt R)
- Merge topic branch 'topic/xehp-dg2-definitions-2021-07-21' (from Matt R)
- Backmerges drm-next (Rodrigo)

Driver Changes:

- Initial workarounds for ADL-P (Clint)
- Preliminary code for XeHP/DG2 (Stuart, Umesh, Matt R, Prathap, Ram,
  Venkata, Akeem, Tvrtko, John, Lucas)
- Fix ADL-S DMA mask size to 39 bits (Tejas)
- Remove code for CNL (Lucas)
- Add ADL-P GuC/HuC firmwares (John)
- Update HuC to 7.9.3 for TGL/ADL-S/RKL (John)
- Fix -EDEADLK handling regression (Ville)
- Implement Wa_1508744258 for DG1 and Gen12 iGFX (Jose)
- Extend Wa_1406941453 to ADL-S (Jose)
- Drop unnecessary workarounds per stepping for SKL/BXT/ICL (Matt R)
- Use fuse info to enable SFC on Gen12 (Venkata)
- Unconditionally flush the pages on acquire on EHL/JSL (Matt A)
- Probe existence of backing struct pages upon userptr creation (Chris, Matt A)

- Add an intermediate GEM proto-context to delay real context creation (Jason)
- Implement SINGLE_TIMELINE with a syncobj (Jason)
- Set the watchdog timeout directly in intel_context_set_gem (Jason)
- Disallow userspace from creating contexts with too many engines (Jason)
- Revert "drm/i915/gem: Asynchronous cmdparser" (Jason)
- Revert "drm/i915: Propagate errors on awaiting already signaled fences" (Jason)
- Revert "drm/i915: Skip over MI_NOOP when parsing" (Jason)
- Revert "drm/i915: Shrink the GEM kmem_caches upon idling" (Daniel)
- Always let TTM handle object migration (Jason)
- Correct the locking and pin pattern for dma-buf (Thomas H, Michael R, Jason)
- Migrate to system at dma-buf attach time (Thomas, Michael R)

- MAJOR refactoring of the GuC backend code to allow for enabling on Gen11+
  (Matt B, John, Michal Wa., Fernando, Daniele, Vinay)
- Update GuC firmware interface to v62.0.0 (John, Michal Wa., Matt B)
- Add GuCRC feature to hand over the control of HW RC6 to the GuC on
  Gen12+ when GuC submission is enabled (Vinay, Sujaritha, Daniele,
  John, Tvrtko)
- Use the correct IRQ during resume and eliminate DRM IRQ midlayer (Thomas Z)
- Add pipelined page migration and clearing (Chris, Thomas H)
- Use TTM for system memory on discrete (Thomas H)
- Implement object migration for display vs. dma-buf (Thomas H)
- Perform execbuffer object locking as a separate step (Thomas H)
- Add support for explicit L3BANK steering (Matt, Daniele)
- Remove duplicated call to ops->pread (Daniel)
- Fix pagefault disabling in the first execbuf slowpath (Daniel)
- Simplify userptr locking (Thomas H)
- Improvements to the GuC CTB code (Matt B, John)
- Make GT workaround upper bounds exclusive (Matt R)
- Check for nomodeset in i915_init() first (Daniel)
- Delete now unused gpu reloc code (Daniel)

- Document RFC plans for GuC submission, DRM scheduler and new parallel
  submit uAPI (Matt B)
- Reintroduce buddy allocator this time with TTM (Matt A)
- Support forcing page size with LMEM (Matt A)
- Add i915_sched_engine to abstract a submission queue between backends (Matt B)
- Use accelerated move in TTM (Ram)
- Fix memory leaks from TTM backend (Thomas H)
- Introduce WW transaction helper (Thomas H)
- Improve debug Kconfig texts a bit (Daniel)
- Unify user object creation code (Jason)
- Use a table for i915_init/exit (Jason)
- Move slabs to module init/exit (Daniel)
- Remove now unused i915_globals (Daniel)
- Extract i915_module.c (Daniel)

- Consistently use adl-p/adl-s in WA comments (Jose)
- Finish INTEL_GEN and friends conversion (Lucas)
- Correct variable/function namings (Lucas)
- Code checker fixes (Wan, Matt A)
- Tracepoint improvements (Matt B)
- Kerneldoc improvements (Tvrtko, Jason, Matt A, Maarten)
- Selftest improvements (Chris, Matt A, Tejas, Thomas H, John, Matt B,
  Rahul, Vinay)
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-08-06-1

for you to fetch changes up to 927dfdd09d8c03ba100ed0c8c3915f8e1d1f5556:

  drm/i915/dg2: Add SQIDI steering (2021-08-05 08:07:25 -0700)

----------------------------------------------------------------
UAPI Changes:

- Add I915_MMAP_OFFSET_FIXED

  On devices with local memory `I915_MMAP_OFFSET_FIXED` is the only valid
  type. On devices without local memory, this caching mode is invalid.

  As caching mode when specifying `I915_MMAP_OFFSET_FIXED`, WC or WB will
  be used, depending on the object placement on creation. WB will be used
  when the object can only exist in system memory, WC otherwise.

  Userspace: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11888

- Reinstate the mmap ioctl for (already released) integrated Gen12 platforms

  Rationale: Otherwise media driver breaks eg. for ADL-P. Long term goal is
  still to sunset the IOCTL even for integrated and require using mmap_offset.

- Reject caching/set_domain IOCTLs on discrete

  Expected to become immutable property of the BO

- Disallow changing context parameters after first use on Gen12 and earlier
- Require setting context parameters at creation on platforms after Gen12

  Rationale (for both): Allow less dynamic changes to the context to simplify
  the implementation and avoid user shooting theirselves in the foot.

- Drop I915_CONTEXT_PARAM_RINGSIZE

  Userspace PR for compute-driver has not been merged

- Drop I915_CONTEXT_PARAM_NO_ZEROMAP

  Userspace PR for libdrm / Beignet was never landed

- Drop CONTEXT_CLONE API

  Userspace PR for Mesa was never landed

- Drop getparam support for I915_CONTEXT_PARAM_ENGINES

  Only existed for symmetry wrt. setparam, never used.

- Disallow bonding of virtual engines

  Drop the prep work, no hardware has been released needing it.

- (Implicit) Disable gpu relocations

  Media userspace was the last userspace to still use them. They
  have converted so performance can be regained with an update.

Core Changes:

- Merge topic branch 'topic/i915-ttm-2021-06-11' (from Maarten)
- Merge topic branch 'topic/revid_steppings' (from Matt R)
- Merge topic branch 'topic/xehp-dg2-definitions-2021-07-21' (from Matt R)
- Backmerges drm-next (Rodrigo)

Driver Changes:

- Initial workarounds for ADL-P (Clint)
- Preliminary code for XeHP/DG2 (Stuart, Umesh, Matt R, Prathap, Ram,
  Venkata, Akeem, Tvrtko, John, Lucas)
- Fix ADL-S DMA mask size to 39 bits (Tejas)
- Remove code for CNL (Lucas)
- Add ADL-P GuC/HuC firmwares (John)
- Update HuC to 7.9.3 for TGL/ADL-S/RKL (John)
- Fix -EDEADLK handling regression (Ville)
- Implement Wa_1508744258 for DG1 and Gen12 iGFX (Jose)
- Extend Wa_1406941453 to ADL-S (Jose)
- Drop unnecessary workarounds per stepping for SKL/BXT/ICL (Matt R)
- Use fuse info to enable SFC on Gen12 (Venkata)
- Unconditionally flush the pages on acquire on EHL/JSL (Matt A)
- Probe existence of backing struct pages upon userptr creation (Chris, Matt A)

- Add an intermediate GEM proto-context to delay real context creation (Jason)
- Implement SINGLE_TIMELINE with a syncobj (Jason)
- Set the watchdog timeout directly in intel_context_set_gem (Jason)
- Disallow userspace from creating contexts with too many engines (Jason)
- Revert "drm/i915/gem: Asynchronous cmdparser" (Jason)
- Revert "drm/i915: Propagate errors on awaiting already signaled fences" (Jason)
- Revert "drm/i915: Skip over MI_NOOP when parsing" (Jason)
- Revert "drm/i915: Shrink the GEM kmem_caches upon idling" (Daniel)
- Always let TTM handle object migration (Jason)
- Correct the locking and pin pattern for dma-buf (Thomas H, Michael R, Jason)
- Migrate to system at dma-buf attach time (Thomas, Michael R)

- MAJOR refactoring of the GuC backend code to allow for enabling on Gen11+
  (Matt B, John, Michal Wa., Fernando, Daniele, Vinay)
- Update GuC firmware interface to v62.0.0 (John, Michal Wa., Matt B)
- Add GuCRC feature to hand over the control of HW RC6 to the GuC on
  Gen12+ when GuC submission is enabled (Vinay, Sujaritha, Daniele,
  John, Tvrtko)
- Use the correct IRQ during resume and eliminate DRM IRQ midlayer (Thomas Z)
- Add pipelined page migration and clearing (Chris, Thomas H)
- Use TTM for system memory on discrete (Thomas H)
- Implement object migration for display vs. dma-buf (Thomas H)
- Perform execbuffer object locking as a separate step (Thomas H)
- Add support for explicit L3BANK steering (Matt, Daniele)
- Remove duplicated call to ops->pread (Daniel)
- Fix pagefault disabling in the first execbuf slowpath (Daniel)
- Simplify userptr locking (Thomas H)
- Improvements to the GuC CTB code (Matt B, John)
- Make GT workaround upper bounds exclusive (Matt R)
- Check for nomodeset in i915_init() first (Daniel)
- Delete now unused gpu reloc code (Daniel)

- Document RFC plans for GuC submission, DRM scheduler and new parallel
  submit uAPI (Matt B)
- Reintroduce buddy allocator this time with TTM (Matt A)
- Support forcing page size with LMEM (Matt A)
- Add i915_sched_engine to abstract a submission queue between backends (Matt B)
- Use accelerated move in TTM (Ram)
- Fix memory leaks from TTM backend (Thomas H)
- Introduce WW transaction helper (Thomas H)
- Improve debug Kconfig texts a bit (Daniel)
- Unify user object creation code (Jason)
- Use a table for i915_init/exit (Jason)
- Move slabs to module init/exit (Daniel)
- Remove now unused i915_globals (Daniel)
- Extract i915_module.c (Daniel)

- Consistently use adl-p/adl-s in WA comments (Jose)
- Finish INTEL_GEN and friends conversion (Lucas)
- Correct variable/function namings (Lucas)
- Code checker fixes (Wan, Matt A)
- Tracepoint improvements (Matt B)
- Kerneldoc improvements (Tvrtko, Jason, Matt A, Maarten)
- Selftest improvements (Chris, Matt A, Tejas, Thomas H, John, Matt B,
  Rahul, Vinay)

----------------------------------------------------------------
Anusha Srivatsa (1):
      drm/i915/step: s/<platform>_revid_tbl/<platform>_revids

Chris Wilson (8):
      drm/i915/selftests: Reorder tasklet_disable vs local_bh_disable
      drm/i915/gt: Add an insert_entry for gen8_ppgtt
      drm/i915/gt: Add a routine to iterate over the pagetables of a GTT
      drm/i915/gt: Export the pinned context constructor and destructor
      drm/i915/gt: Pipelined page migration
      drm/i915/gt: Pipelined clear
      drm/i915/gt: Setup a default migration context on the GT
      drm/i915/userptr: Probe existence of backing struct pages upon creation

Clint Taylor (1):
      drm/i915/adl_p: Add initial ADL_P Workarounds

Daniel Vetter (17):
      drm/i915/gem: Remove duplicated call to ops->pread
      drm/i915/eb: Fix pagefault disabling in the first slowpath
      drm/i915: Improve debug Kconfig texts a bit
      drm/i915: Ditch i915 globals shrink infrastructure
      drm/i915: Check for nomodeset in i915_init() first
      drm/i915: move i915_active slab to direct module init/exit
      drm/i915: move i915_buddy slab to direct module init/exit
      drm/i915: move intel_context slab to direct module init/exit
      drm/i915: move gem_context slab to direct module init/exit
      drm/i915: move gem_objects slab to direct module init/exit
      drm/i915: move request slabs to direct module init/exit
      drm/i915: move scheduler slabs to direct module init/exit
      drm/i915: move vma slab to direct module init/exit
      drm/i915: Remove i915_globals
      drm/i915: Extract i915_module.c
      drm/i915: Disable gpu relocations
      drm/i915: delete gpu reloc code

Daniele Ceraolo Spurio (3):
      drm/i915: extract steered reg access to common function
      drm/i915/guc: Unblock GuC submission on Gen11+
      drm/i915/xehp: handle new steering options

Jason Ekstrand (46):
      drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
      drm/i915: Stop storing the ring size in the ring pointer (v3)
      drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
      drm/i915/gem: Set the watchdog timeout directly in intel_context_set_gem (v2)
      drm/i915/gem: Return void from context_apply_all
      drm/i915: Drop the CONTEXT_CLONE API (v2)
      drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)
      drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES
      drm/i915/gem: Disallow bonding of virtual engines (v3)
      drm/i915/gem: Remove engine auto-magic with FENCE_SUBMIT (v2)
      drm/i915/request: Remove the hook from await_execution
      drm/i915/gem: Disallow creating contexts with too many engines
      drm/i915: Stop manually RCU banging in reset_stats_ioctl (v2)
      drm/i915/gem: Add a separate validate_priority helper
      drm/i915: Add gem/i915_gem_context.h to the docs
      drm/i915/gem: Add an intermediate proto_context struct (v5)
      drm/i915/gem: Rework error handling in default_engines
      drm/i915/gem: Optionally set SSEU in intel_context_set_gem
      drm/i915: Add an i915_gem_vm_lookup helper
      drm/i915/gem: Make an alignment check more sensible
      drm/i915/gem: Use the proto-context to handle create parameters (v5)
      drm/i915/gem: Return an error ptr from context_lookup
      drm/i915/gt: Drop i915_address_space::file (v2)
      drm/i915/gem: Delay context creation (v3)
      drm/i915/gem: Don't allow changing the VM on running contexts (v4)
      drm/i915/gem: Don't allow changing the engine set on running contexts (v3)
      drm/i915/selftests: Take a VM in kernel_context()
      i915/gem/selftests: Assign the VM at context creation in igt_shared_ctx_exec
      drm/i915/gem: Roll all of context creation together
      drm/i915: Finalize contexts in GEM_CONTEXT_CREATE on version 13+
      drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
      Revert "drm/i915: Propagate errors on awaiting already signaled fences"
      drm/i915: Remove allow_alloc from i915_gem_object_get_sg*
      drm/i915: Drop error handling from dma_fence_work
      Revert "drm/i915: Skip over MI_NOOP when parsing"
      drm/i915: Correct the docs for intel_engine_cmd_parser
      drm/i915: Call i915_globals_exit() after i915_pmu_exit()
      drm/i915: Call i915_globals_exit() if pci_register_device() fails
      drm/i915: Use a table for i915_init/exit (v2)
      drm/i915: Make the kmem slab for i915_buddy_block a global
      drm/i915/gem: Check object_can_migrate from object_migrate
      drm/i915/gem: Refactor placement setup for i915_gem_object_create* (v2)
      drm/i915/gem: Call i915_gem_flush_free_objects() in i915_gem_dumb_create()
      drm/i915/gem: Unify user object creation (v3)
      drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
      drm/i915/gem: Always call obj->ops->migrate unless can_migrate fails

John Harrison (19):
      drm/i915/huc: Update TGL and friends to HuC 7.9.3
      drm/i915/adlp: Add ADL-P GuC/HuC firmware files
      drm/i915/guc: Module load failure test for CT buffer creation
      drm/i915/selftests: Allow for larger engine counts
      drm/i915/xehp: Extra media engines - Part 1 (engine definitions)
      drm/i915/xehp: Extra media engines - Part 2 (interrupts)
      drm/i915/xehp: Extra media engines - Part 3 (reset)
      drm/i915/guc: Make hangcheck work with GuC virtual engines
      drm/i915/guc: Provide mmio list to be saved/restored on engine reset
      drm/i915/guc: Don't complain about reset races
      drm/i915/guc: Enable GuC engine reset
      drm/i915/guc: Fix for error capture after full GPU reset with GuC
      drm/i915/guc: Hook GuC scheduling policies up
      drm/i915/guc: Connect reset modparam updates to GuC policy flags
      drm/i915/guc: Include scheduling policies in the debugfs state dump
      drm/i915/guc: Add golden context to GuC ADS
      drm/i915/selftest: Better error reporting from hangcheck selftest
      drm/i915/selftest: Fix hangcheck self test for GuC submission
      drm/i915/selftest: Bump selftest timeouts for hangcheck

Joonas Lahtinen (1):
      Merge tag 'topic/i915-ttm-2021-06-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-intel-gt-next

José Roberto de Souza (4):
      drm/i915: Settle on "adl-x" in WA comments
      drm/i915: Implement Wa_1508744258
      drm/i915/adl_s: Extend Wa_1406941453
      drm/i915: Extend Wa_1406941453 to adl-p

Lucas De Marchi (14):
      drm/i915/gt: finish INTEL_GEN and friends conversion
      drm/i915: do not abbreviate version in debugfs
      drm/i915: Add release id version
      drm/i915: Add XE_HP initial definitions
      drm/i915/xehpsdv: add initial XeHP SDV definitions
      drm/i915/gt: fix platform prefix
      drm/i915/gt: nuke unused legacy engine hw_id
      drm/i915/gt: rename legacy engine->hw_id to engine->gen6_hw_id
      drm/i915/gt: nuke gen6_hw_id
      drm/i915/gt: remove explicit CNL handling from intel_mocs.c
      drm/i915/gt: remove explicit CNL handling from intel_sseu.c
      drm/i915/gt: rename CNL references in intel_engine.h
      drm/i915/gt: remove GRAPHICS_VER == 10
      drm/i915/xehp: Fix missing sentinel on mcr_ranges_xehp

Maarten Lankhorst (2):
      drm/i915: Fix missing docbook chapters for i915 uapi.
      drm/i915: Add TTM offset argument to mmap.

Matt Roper (29):
      drm/i915: Add GT support for multiple types of multicast steering
      drm/i915: Add support for explicit L3BANK steering
      drm/i915: Make pre-production detection use direct revid comparison
      drm/i915/skl: Use revid->stepping tables
      drm/i915/kbl: Drop pre-production revision from stepping table
      drm/i915/bxt: Use revid->stepping tables
      drm/i915/glk: Use revid->stepping tables
      drm/i915/icl: Use revid->stepping tables
      drm/i915/jsl_ehl: Use revid->stepping tables
      drm/i915/rkl: Use revid->stepping tables
      drm/i915/dg1: Use revid->stepping tables
      drm/i915/cnl: Drop all workarounds
      drm/i915/icl: Drop workarounds that only apply to pre-production steppings
      Merge branch 'topic/revid_steppings' into drm-intel-gt-next
      drm/i915: Fix application of WaInPlaceDecompressionHang
      drm/i915/icl: Drop a couple unnecessary workarounds
      drm/i915: Program DFR enable/disable as a GT workaround
      drm/i915: Make GT workaround upper bounds exclusive
      drm/i915/dg2: add DG2 platform info
      Merge branch 'topic/xehp-dg2-definitions-2021-07-21' into drm-intel-gt-next
      drm/i915/xehp: Define multicast register ranges
      drm/i915/xehp: Xe_HP forcewake support
      drm/i915/xehpsdv: Correct parameters for IS_XEHPSDV_GT_STEP()
      drm/i915/dg2: Add forcewake table
      drm/i915/xehpsdv: Add maximum sseu limits
      drm/i915/dg2: DG2 uses the same sseu limits as XeHP SDV
      drm/i915/xehpsdv: Define steering tables
      drm/i915/dg2: Update steering tables
      drm/i915/dg2: Add SQIDI steering

Matthew Auld (25):
      drm/i915/ttm: add ttm_buddy_man
      drm/i915/ttm: add i915_sg_from_buddy_resource
      drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
      drm/i915/ttm: remove node usage in our naming
      drm/i915/ttm: switch over to ttm_buddy_man
      drm/i915/ttm: restore min_page_size behaviour
      drm/i915/ttm: remove unused function
      drm/i915/selftests: add back the selftest() hook for the buddy
      drm/i915/ttm: fix static warning
      drm/i915/gem: Introduce a selftest for the gem object migrate functionality
      drm/i915: support forcing the page size with lmem
      drm/i915/gtt: ignore min_page_size for paging structures
      drm/i915/selftests: fix smatch warning in igt_check_blocks
      drm/i915/selftests: fix smatch warning in mock_reserve
      drm/i915: use consistent CPU mappings for pin_map users
      drm/i915/uapi: convert drm_i915_gem_caching to kernel doc
      drm/i915/uapi: convert drm_i915_gem_set_domain to kernel doc
      drm/i915/gtt: drop the page table optimisation
      drm/i915/uapi: reject caching ioctls for discrete
      drm/i915/uapi: convert drm_i915_gem_userptr to kernel doc
      drm/i915/uapi: reject set_domain for discrete
      drm/i915: document caching related bits
      drm/i915/ehl: unconditionally flush the pages on acquire
      drm/i915/selftests: prefer the create_user helper
      drm/i915/xehp: Changes to ss/eu definitions

Matthew Brost (52):
      drm/i915: Move priolist to new i915_sched_engine object
      drm/i915: Add i915_sched_engine_is_empty function
      drm/i915: Reset sched_engine.no_priolist immediately after dequeue
      drm/i915: Move active tracking to i915_sched_engine
      drm/i915: Move engine->schedule to i915_sched_engine
      drm/i915: Add kick_backend function to i915_sched_engine
      drm/i915: Update i915_scheduler to operate on i915_sched_engine
      drm/i915: Move submission tasklet to i915_sched_engine
      drm/doc/rfc: i915 GuC submission / DRM scheduler
      drm/doc/rfc: i915 new parallel submission uAPI plan
      drm/i915/guc: Relax CTB response timeout
      drm/i915/guc: Improve error message for unsolicited CT response
      drm/i915/guc: Increase size of CTB buffers
      drm/i915/guc: Add non blocking CTB send function
      drm/i915/guc: Add stall timer to non blocking CTB send function
      drm/i915/guc: Optimize CTB writes and reads
      drm/i915/guc: Add new GuC interface defines and structures
      drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor
      drm/i915/guc: Add LRC descriptor context lookup array
      drm/i915/guc: Implement GuC submission tasklet
      drm/i915/guc: Add bypass tasklet submission path to GuC
      drm/i915/guc: Implement GuC context operations for new inteface
      drm/i915/guc: Insert fence on context when deregistering
      drm/i915/guc: Defer context unpin until scheduling is disabled
      drm/i915/guc: Disable engine barriers with GuC during unpin
      drm/i915/guc: Extend deregistration fence to schedule disable
      drm/i915: Disable preempt busywait when using GuC scheduling
      drm/i915/guc: Ensure request ordering via completion fences
      drm/i915/guc: Disable semaphores when using GuC scheduling
      drm/i915/guc: Ensure G2H response has space in buffer
      drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
      drm/i915/guc: Update GuC debugfs to support new GuC
      drm/i915/guc: Add trace point for GuC submit
      drm/i915: Add intel_context tracing
      drm/i915/guc: GuC virtual engines
      drm/i915: Hold reference to intel_context over life of i915_request
      drm/i915/guc: Disable bonding extension with GuC submission
      drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs
      drm/i915: Add i915_sched_engine destroy vfunc
      drm/i915: Move active request tracking to a vfunc
      drm/i915/guc: Reset implementation for new GuC interface
      drm/i915: Reset GPU immediately if submission is disabled
      drm/i915/guc: Add disable interrupts to guc sanitize
      drm/i915/guc: Suspend/resume implementation for new interface
      drm/i915/guc: Handle context reset notification
      drm/i915/guc: Handle engine reset failure notification
      drm/i915/guc: Enable the timer expired interrupt for GuC
      drm/i915/guc: Capture error state on context reset
      drm/i915/guc: Implement banned contexts for GuC submission
      drm/i915/guc: Support request cancellation
      drm/i915/selftest: Increase some timeouts in live_requests
      drm/i915/guc: Implement GuC priority management

Michal Wajdeczko (3):
      drm/i915/guc: Introduce unified HXG messages
      drm/i915/guc: Update firmware to v62.0.0
      drm/i915/doc: Include GuC ABI documentation

Prathap Kumar Valsan (1):
      drm/i915/xehp: New engine context offsets

Rahul Kumar Singh (2):
      drm/i915/selftest: Fix workarounds selftest for GuC submission
      drm/i915/selftest: Fix MOCS selftest for GuC submission

Ramalingam C (1):
      drm/i915/ttm: accelerated move implementation

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-gt-next

Stuart Summers (1):
      drm/i915/xehp: Handle new device context ID format

Tejas Upadhyay (2):
      drm/i915/selftest: Extend ctx_timestamp ICL workaround to GEN11
      drm/i915/adl_s: Fix dma_mask_size to 39 bit

Thomas Hellström (18):
      drm/i915: Simplify userptr locking
      drm/i915/ttm: Fix memory leaks
      drm/i915/ttm: Calculate the object placement at get_pages time
      drm/i915: Reference objects on the ww object list
      drm/i915: Break out dma_resv ww locking utilities to separate files
      drm/i915: Introduce a ww transaction helper
      drm/i915/gem: Zap the client blt code
      drm/i915/gem: Zap the i915_gem_object_blt code
      drm/i915: Perform execbuffer object locking as a separate step
      drm/i915/ttm: Fix incorrect assumptions about ttm_bo_validate() semantics
      drm/i915: Update object placement flags to be mutable
      drm/i915/ttm: Adjust gem flags and caching settings after a move
      drm/i915/ttm: Use TTM for system memory
      drm/i915: Reinstate the mmap ioctl for some platforms
      drm/i915/gem: Implement object migration
      drm/i915/display: Migrate objects to LMEM if possible for display
      drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
      drm/i915/gem: Migrate to system at dma-buf attach time (v7)

Thomas Zimmermann (2):
      drm/i915: Use the correct IRQ during resume
      drm/i915: Drop all references to DRM IRQ midlayer

Tvrtko Ursulin (3):
      drm/i915: Fix busy ioctl commentary
      drm/i915: Document the Virtual Engine uAPI
      drm/i915/xehp: VDBOX/VEBOX fusing registers are enable-based

Venkata Sandeep Dhanalakota (1):
      drm/i915/gen12: Use fuse info to enable SFC

Ville Syrjälä (1):
      drm/i915/gt: Fix -EDEADLK handling regression

Vinay Belgaumkar (14):
      drm/i915/guc/slpc: Initial definitions for SLPC
      drm/i915/guc/slpc: Gate Host RPS when SLPC is enabled
      drm/i915/guc/slpc: Adding SLPC communication interfaces
      drm/i915/guc/slpc: Allocate, initialize and release SLPC
      drm/i915/guc/slpc: Enable SLPC and add related H2G events
      drm/i915/guc/slpc: Remove BUG_ON in guc_submission_disable
      drm/i915/guc/slpc: Add methods to set min/max frequency
      drm/i915/guc/slpc: Add get max/min freq hooks
      drm/i915/guc/slpc: Add debugfs for SLPC info
      drm/i915/guc/slpc: Enable ARAT timer interrupt
      drm/i915/guc/slpc: Cache platform frequency limits
      drm/i915/guc/slpc: Sysfs hooks for SLPC
      drm/i915/guc/slpc: Add SLPC selftest
      drm/i915/guc/rc: Setup and enable GuCRC feature

Wan Jiabing (1):
      drm/i915: Remove duplicate include of intel_region_lmem.h

 Documentation/gpu/i915.rst                         |   15 +
 Documentation/gpu/rfc/i915_parallel_execbuf.h      |  122 +
 Documentation/gpu/rfc/i915_scheduler.rst           |  148 +
 Documentation/gpu/rfc/index.rst                    |    4 +
 drivers/gpu/drm/drm_gem.c                          |    9 -
 drivers/gpu/drm/i915/Kconfig.debug                 |    6 +
 drivers/gpu/drm/i915/Makefile                      |   14 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    5 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    6 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |  355 ---
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.h     |   21 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 2920 +++++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |    6 +
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  196 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |  188 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   58 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   11 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  699 +----
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  160 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   12 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  107 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  350 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   69 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |  461 ---
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h     |   39 -
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  255 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   54 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   23 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   30 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  965 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   49 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  117 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   23 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |    4 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    8 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  114 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  127 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  190 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |    4 +
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |  243 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  164 +-
 .../drm/i915/gem/selftests/i915_gem_object_blt.c   |  597 ----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c |    3 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |   67 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.h  |    4 +-
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c            |   10 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   17 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   73 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h        |   16 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c            |   88 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   56 +-
 drivers/gpu/drm/i915/gt/intel_context_param.c      |   63 -
 drivers/gpu/drm/i915/gt/intel_context_param.h      |    6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   64 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   87 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  420 +--
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   74 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h   |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   93 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |    6 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  604 ++--
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |   12 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    6 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    2 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  197 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   10 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   10 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   13 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   11 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |   21 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h        |    9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   37 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   20 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   18 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  117 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h            |    3 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  688 +++++
 drivers/gpu/drm/i915/gt/intel_migrate.h            |   65 +
 drivers/gpu/drm/i915/gt/intel_migrate_types.h      |   15 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   49 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    7 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.h        |    1 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |   56 +-
 drivers/gpu/drm/i915/gt/intel_ring.h               |    1 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   70 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  209 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   10 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  126 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |   10 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |    8 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  498 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c              |   51 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |   10 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   22 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.h    |    2 +
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |    4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  307 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  330 ++-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |    6 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  669 +++++
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   52 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |    2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  311 +++
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |    2 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  162 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |  129 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |  235 ++
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |  127 +-
 .../i915/gt/uc/abi/guc_communication_mmio_abi.h    |   65 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |  213 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  206 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  119 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  487 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h         |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  703 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |   36 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |   47 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  167 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |   80 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h          |   31 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  626 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   42 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |   29 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 2895 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   18 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  126 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |   15 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   27 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    7 +-
 drivers/gpu/drm/i915/i915_active.c                 |   37 +-
 drivers/gpu/drm/i915/i915_active.h                 |    3 +
 drivers/gpu/drm/i915/i915_buddy.c                  |  421 +++
 drivers/gpu/drm/i915/i915_buddy.h                  |  135 +
 drivers/gpu/drm/i915/i915_cmd_parser.c             |  203 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |   32 +
 drivers/gpu/drm/i915/i915_drv.c                    |    9 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  228 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   63 +-
 drivers/gpu/drm/i915/i915_gem.h                    |   12 -
 drivers/gpu/drm/i915/i915_gem_evict.c              |    1 +
 drivers/gpu/drm/i915/i915_gem_ww.c                 |   63 +
 drivers/gpu/drm/i915/i915_gem_ww.h                 |   50 +
 drivers/gpu/drm/i915/i915_getparam.c               |    7 +-
 drivers/gpu/drm/i915/i915_globals.c                |  160 --
 drivers/gpu/drm/i915/i915_globals.h                |   37 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   27 +-
 drivers/gpu/drm/i915/i915_module.c                 |  113 +
 drivers/gpu/drm/i915/i915_pci.c                    |  129 +-
 drivers/gpu/drm/i915/i915_pci.h                    |    8 +
 drivers/gpu/drm/i915/i915_perf.c                   |   36 +-
 drivers/gpu/drm/i915/i915_perf.h                   |    2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    6 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |    4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   48 +-
 drivers/gpu/drm/i915/i915_request.c                |  307 +-
 drivers/gpu/drm/i915/i915_request.h                |   38 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |   80 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |    5 +
 drivers/gpu/drm/i915/i915_scheduler.c              |  220 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |   54 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h        |  111 +
 drivers/gpu/drm/i915/i915_sw_fence_work.c          |    5 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h          |    2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |   83 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  201 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  258 ++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |   56 +
 drivers/gpu/drm/i915/i915_vma.c                    |   34 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    3 +
 drivers/gpu/drm/i915/intel_device_info.c           |   16 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   12 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   63 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   30 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   22 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |  150 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |   23 +-
 drivers/gpu/drm/i915/intel_step.c                  |  134 +-
 drivers/gpu/drm/i915/intel_step.h                  |    5 +
 drivers/gpu/drm/i915/intel_uncore.c                |  422 ++-
 drivers/gpu/drm/i915/intel_uncore.h                |   20 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        |  787 ++++++
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |    5 +-
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |    2 +-
 .../gpu/drm/i915/selftests/i915_perf_selftests.h   |    2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |    4 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |    4 +-
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |    2 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |    2 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.c          |   25 +-
 drivers/gpu/drm/i915/selftests/igt_mmap.h          |   12 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  257 +-
 .../drm/i915/selftests/intel_scheduler_helpers.c   |   88 +
 .../drm/i915/selftests/intel_scheduler_helpers.h   |   33 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    3 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |    1 -
 drivers/gpu/drm/i915/selftests/mock_region.c       |   29 +-
 include/drm/drm_vma_manager.h                      |    2 +-
 include/uapi/drm/i915_drm.h                        |  498 +++-
 214 files changed, 18965 insertions(+), 8462 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_client_blt.h
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm.h
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
 delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h
 delete mode 100644 drivers/gpu/drm/i915/i915_globals.c
 delete mode 100644 drivers/gpu/drm/i915/i915_globals.h
 create mode 100644 drivers/gpu/drm/i915/i915_module.c
 create mode 100644 drivers/gpu/drm/i915/i915_pci.h
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
 create mode 100644 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
 create mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
