Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360384266D1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64646E0BE;
	Fri,  8 Oct 2021 09:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A4F6E0BE;
 Fri,  8 Oct 2021 09:27:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249831232"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="249831232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:27:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="459107076"
Received: from sorenthe-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.254.96])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:27:18 -0700
Date: Fri, 8 Oct 2021 12:27:15 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <YWAO80MB2eyToYoy@jlahtine-mobl.ger.corp.intel.com>
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

Here goes the first PR towards 5.16.

As for the big things, this adds encrypted PXP (Protected Xe Path)
support for Gen12 integrated. Take a look at the "drm/i915/pxp: add
PXP documentation" for further details and the Mesa changes for how
the uAPI will look like.

Then adds DG1 PCI IDs (GuC is enabled by default) still behind
force_probe, but not anymore behind the FAKE_LMEM compile time
protection. There is of course immensive amount of rework and new
code that lead to this.

Suspend timeout is increased by factor of 2.5 to account for GuC
submission added overhead. Ultimately this should lead to simpler
kernel scheduler code that will converge towards drm/sched.

Then there are the many of the other changes that trade previously made
code (micro-)optimizations for code simplicity, so some performance
regressions are expected.

Removes ADL-S force_probe protection. Enables transparent hugepages when
IOMMU is enabled (and then only), to offset the perf hit caused by
IOMMU. That is greater than some of the perf hit from THP itself. Keeps
adding support for Xe HP/Xe HP SDV.

Backmerges drm-next at 5.15-rc1 and merges the tip/locking/wwmutex branch.
Also includes patches for the MEI subsystem that go together with the PXP
changes.

Regards, Joonas

***

drm-intel-gt-next-2021-10-08:

UAPI Changes:

- Add uAPI for using PXP protected objects

  Mesa changes: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/8064

- Add PCI IDs and LMEM discovery/placement uAPI for DG1

  Mesa changes: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11584

- Disable engine bonding on Gen12+ except TGL, RKL and ADL-S

Cross-subsystem Changes:

- Merges 'tip/locking/wwmutex' branch (core kernel tip)
- "mei: pxp: export pavp client to me client bus"

Core Changes:

- Update ttm_move_memcpy for async use (Thomas)

Driver Changes:

- Add PXP (Protected Xe Path) support for Gen12 integrated (Daniele,
  Sean, Anshuman)
  See "drm/i915/pxp: add PXP documentation" for details!
- Enable GuC submission by default on DG1 (Matt B)
- Remove force_probe protection for ADL-S (Raviteja)
- Add base support for XeHP/XeHP SDV (Matt R, Stuart, Lucas)
- Handle DRI_PRIME=1 on Intel igfx + Intel dgfx hybrid graphics setup (Tvrtko)
- Use Transparent Hugepages when IOMMU is enabled (Tvrtko, Chris)
- Implement LMEM backup and restore for suspend / resume (Thomas)
- Report INSTDONE_GEOM values in error state for DG2 (Matt R)
- Add DG2-specific shadow register table (Matt R)
- Update Gen11/Gen12/XeHP shadow register tables (Matt R)
- Maintain backward-compatible nested batch behavior on TGL+ (Matt R)
- Add new LRI reg offsets for DG2 (Akeem)
- Initialize unused MOCS entries to device specific values (Ayaz)
- Track and use the correct UC MOCS index on Gen12 (Ayaz)
- Add separate MOCS table for Gen12 devices other than TGL/RKL (Ayaz)
- Simplify the locking and eliminate some RCU usage (Daniel)
- Add some flushing for the 64K GTT path (Matt A)
- Mark GPU wedging on driver unregister unrecoverable (Janusz)

- Major rework in the GuC codebase, simplify locking and add docs (Matt B)
- Add DG1 GuC/HuC firmwares (Daniele, Matt B)
- Remember to call i915_sw_fence_fini on guc_state.blocked (Matt A)
- Use "gt" forcewake domain name for error messages instead of "blitter" (Matt R)
- Drop now duplicate LMEM uAPI RFC kerneldoc section (Daniel)
- Fix early tracepoints for requests (Matt A)
- Use locked access to ctx->engines in set_priority (Daniel)
- Convert gen6/gen7/gen8 read operations to fwtable (Matt R)
- Drop gen11/gen12 specific mmio write handlers (Matt R)
- Drop gen11 specific mmio read handlers (Matt R)
- Use designated initializers for init/exit table (Kees)
- Fix syncmap memory leak (Matt B)
- Add pretty printing for buddy allocator state debug (Matt A)
- Fix potential error pointer dereference in pinned_context() (Dan)
- Remove IS_ACTIVE macro (Lucas)
- Static code checker fixes (Nathan)
- Clean up disabled warnings (Nathan)
- Increase timeout in i915_gem_contexts selftests 5x for GuC submission (Matt B)
- Ensure wa_init_finish() is called for ctx workaround list (Matt R)
- Initialize L3CC table in mocs init (Sreedhar, Ayaz, Ram)
- Get PM ref before accessing HW register (Vinay)
- Move __i915_gem_free_object to ttm_bo_destroy (Maarten)
- Deduplicate frequency dump on debugfs (Lucas)
- Make wa list per-gt (Venkata)
- Do not define dummy vma in stack (Venkata)
- Take pinning into account in __i915_gem_object_is_lmem (Matt B, Thomas)
- Do not report currently active engine when describing objects (Tvrtko)
- Fix pdfdocs build error by removing nested grid from GuC docs (Akira)
- Remove false warning from the rps worker (Tejas)
- Flush buffer pools on driver remove (Janusz)
- Fix runtime pm handling in i915_gem_shrink (Maarten)
- Rework TTM object initialization slightly (Thomas)
- Use fixed offset for PTEs location (Michal Wa)
- Verify result from CTB (de)register action and improve error messages (Michal Wa)
- Fix bug in user proto-context creation that leaked contexts (Matt B)

- Re-use Gen11 forcewake read functions on Gen12 (Matt R)
- Make shadow tables range-based (Matt R)
- Ditch the i915_gem_ww_ctx loop member (Thomas, Maarten)
- Use NULL instead of 0 where appropriate (Ville)
- Rename pci/debugfs functions to respect file prefix (Jani, Lucas)
- Drop guc_communication_enabled (Daniele)
- Selftest fixes (Thomas, Daniel, Matt A, Maarten)
- Clean up inconsistent indenting (Colin)
- Use direction definition DMA_BIDIRECTIONAL instead of
  PCI_DMA_BIDIRECTIONAL (Cai)
- Add "intel_" as prefix in set_mocs_index() (Ayaz)

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-10-08

for you to fetch changes up to 1a839e016e4964b5c8384e5d82e5e5ac02a23f52:

  drm/i915: remove IS_ACTIVE (2021-10-07 11:04:05 -0700)

----------------------------------------------------------------
UAPI Changes:

- Add uAPI for using PXP protected objects

  Mesa changes: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/8064

- Add PCI IDs and LMEM discovery/placement uAPI for DG1

  Mesa changes: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11584

- Disable engine bonding on Gen12+ except TGL, RKL and ADL-S

Cross-subsystem Changes:

- Merges 'tip/locking/wwmutex' branch (core kernel tip)
- "mei: pxp: export pavp client to me client bus"

Core Changes:

- Update ttm_move_memcpy for async use (Thomas)

Driver Changes:

- Enable GuC submission by default on DG1 (Matt B)
- Add PXP (Protected Xe Path) support for Gen12 integrated (Daniele,
  Sean, Anshuman)
  See "drm/i915/pxp: add PXP documentation" for details!
- Remove force_probe protection for ADL-S (Raviteja)
- Add base support for XeHP/XeHP SDV (Matt R, Stuart, Lucas)
- Handle DRI_PRIME=1 on Intel igfx + Intel dgfx hybrid graphics setup (Tvrtko)
- Use Transparent Hugepages when IOMMU is enabled (Tvrtko, Chris)
- Implement LMEM backup and restore for suspend / resume (Thomas)
- Report INSTDONE_GEOM values in error state for DG2 (Matt R)
- Add DG2-specific shadow register table (Matt R)
- Update Gen11/Gen12/XeHP shadow register tables (Matt R)
- Maintain backward-compatible nested batch behavior on TGL+ (Matt R)
- Add new LRI reg offsets for DG2 (Akeem)
- Initialize unused MOCS entries to device specific values (Ayaz)
- Track and use the correct UC MOCS index on Gen12 (Ayaz)
- Add separate MOCS table for Gen12 devices other than TGL/RKL (Ayaz)
- Simplify the locking and eliminate some RCU usage (Daniel)
- Add some flushing for the 64K GTT path (Matt A)
- Mark GPU wedging on driver unregister unrecoverable (Janusz)

- Major rework in the GuC codebase, simplify locking and add docs (Matt B)
- Add DG1 GuC/HuC firmwares (Daniele, Matt B)
- Remember to call i915_sw_fence_fini on guc_state.blocked (Matt A)
- Use "gt" forcewake domain name for error messages instead of "blitter" (Matt R)
- Drop now duplicate LMEM uAPI RFC kerneldoc section (Daniel)
- Fix early tracepoints for requests (Matt A)
- Use locked access to ctx->engines in set_priority (Daniel)
- Convert gen6/gen7/gen8 read operations to fwtable (Matt R)
- Drop gen11/gen12 specific mmio write handlers (Matt R)
- Drop gen11 specific mmio read handlers (Matt R)
- Use designated initializers for init/exit table (Kees)
- Fix syncmap memory leak (Matt B)
- Add pretty printing for buddy allocator state debug (Matt A)
- Fix potential error pointer dereference in pinned_context() (Dan)
- Remove IS_ACTIVE macro (Lucas)
- Static code checker fixes (Nathan)
- Clean up disabled warnings (Nathan)
- Increase timeout in i915_gem_contexts selftests 5x for GuC submission (Matt B)
- Ensure wa_init_finish() is called for ctx workaround list (Matt R)
- Initialize L3CC table in mocs init (Sreedhar, Ayaz, Ram)
- Get PM ref before accessing HW register (Vinay)
- Move __i915_gem_free_object to ttm_bo_destroy (Maarten)
- Deduplicate frequency dump on debugfs (Lucas)
- Make wa list per-gt (Venkata)
- Do not define dummy vma in stack (Venkata)
- Take pinning into account in __i915_gem_object_is_lmem (Matt B, Thomas)
- Do not report currently active engine when describing objects (Tvrtko)
- Fix pdfdocs build error by removing nested grid from GuC docs (Akira)
- Remove false warning from the rps worker (Tejas)
- Flush buffer pools on driver remove (Janusz)
- Fix runtime pm handling in i915_gem_shrink (Maarten)
- Rework TTM object initialization slightly (Thomas)
- Use fixed offset for PTEs location (Michal Wa)
- Verify result from CTB (de)register action and improve error messages (Michal Wa)
- Fix bug in user proto-context creation that leaked contexts (Matt B)

- Re-use Gen11 forcewake read functions on Gen12 (Matt R)
- Make shadow tables range-based (Matt R)
- Ditch the i915_gem_ww_ctx loop member (Thomas, Maarten)
- Use NULL instead of 0 where appropriate (Ville)
- Rename pci/debugfs functions to respect file prefix (Jani, Lucas)
- Drop guc_communication_enabled (Daniele)
- Selftest fixes (Thomas, Daniel, Matt A, Maarten)
- Clean up inconsistent indenting (Colin)
- Use direction definition DMA_BIDIRECTIONAL instead of
  PCI_DMA_BIDIRECTIONAL (Cai)
- Add "intel_" as prefix in set_mocs_index() (Ayaz)

----------------------------------------------------------------
Akeem G Abodunrin (1):
      drm/i915/dg2: Add new LRI reg offsets

Akira Yokosawa (1):
      drm/i915/guc, docs: Fix pdfdocs build error by removing nested grid

Anshuman Gupta (2):
      drm/i915/pxp: Add plane decryption support
      drm/i915/pxp: black pixels on pxp disabled

Ayaz A Siddiqui (6):
      drm/i915/gt: Add support of mocs propagation
      drm/i915/gt: Set CMD_CCTL to UC for Gen12 Onward
      drm/i915/gt: Set BLIT_CCTL reg to un-cached
      drm/i915/gt: Initialize unused MOCS entries with device specific values
      drm/i915/gt: Add separate MOCS table for Gen12 devices other than TGL/RKL
      drm/i915/gt: Add "intel_" as prefix in set_mocs_index()

Cai Huoqing (1):
      drm/i915: Use direction definition DMA_BIDIRECTIONAL instead of PCI_DMA_BIDIRECTIONAL

Colin Ian King (1):
      drm/i915: clean up inconsistent indenting

Dan Carpenter (1):
      drm/i915/gt: Potential error pointer dereference in pinned_context()

Daniel Vetter (14):
      drm/doc/rfc: drop lmem uapi section
      drm/i915: Use locked access to ctx->engines in set_priority
      drm/i915: Actually delete gpu reloc selftests
      drm/i915: Release i915_gem_context from a worker
      drm/i915: Release ctx->syncobj on final put, not on ctx close
      drm/i915: Keep gem ctx->vm alive until the final put
      drm/i915: Drop code to handle set-vm races from execbuf
      drm/i915: Rename i915_gem_context_get_vm_rcu to i915_gem_context_get_eb_vm
      drm/i915: Use i915_gem_context_get_eb_vm in ctx_getparam
      drm/i915: Add i915_gem_context_is_full_ppgtt
      drm/i915: Use i915_gem_context_get_eb_vm in intel_context_set_gem
      drm/i915: Drop __rcu from gem_context->vm
      drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
      drm/i915: Stop rcu support for i915_address_space

Daniele Ceraolo Spurio (12):
      drm/i915/guc: drop guc_communication_enabled
      drm/i915/guc: put all guc objects in lmem when available
      drm/i915/guc: Add DG1 GuC / HuC firmware defs
      drm/i915/pxp: Define PXP component interface
      drm/i915/pxp: define PXP device flag and kconfig
      drm/i915/pxp: allocate a vcs context for pxp usage
      drm/i915/pxp: set KCR reg init
      drm/i915/pxp: interfaces for using protected objects
      drm/i915/pxp: start the arb session on demand
      drm/i915/pxp: add pxp debugfs
      drm/i915/pxp: add PXP documentation
      drm/i915/pxp: enable PXP for integrated Gen12

Huang, Sean Z (5):
      drm/i915/pxp: Implement funcs to create the TEE channel
      drm/i915/pxp: Create the arbitrary session after boot
      drm/i915/pxp: Implement arb session teardown
      drm/i915/pxp: Implement PXP irq handler
      drm/i915/pxp: Enable PXP power management

Jani Nikula (1):
      drm/i915/pci: rename functions to have i915_pci prefix

Janusz Krzysztofik (2):
      drm/i915: Mark GPU wedging on driver unregister unrecoverable
      drm/i915: Flush buffer pools on driver remove

Joonas Lahtinen (2):
      Merge drm/drm-next into drm-intel-gt-next
      Merge remote-tracking branch 'tip/locking/wwmutex' into drm-intel-gt-next

Kees Cook (1):
      drm/i915: Use designated initializers for init/exit table

Lucas De Marchi (8):
      drm/i915/xehpsdv: factor out function to read RP_STATE_CAP
      drm/i915/dg1: remove __maybe_unused leftover
      drm/i915/xehpsdv: Define MOCS table for XeHP SDV
      drm/i915: rename debugfs_gt files
      drm/i915: rename debugfs_engines files
      drm/i915: rename debugfs_gt_pm files
      drm/i915: deduplicate frequency dump on debugfs
      drm/i915: remove IS_ACTIVE

Maarten Lankhorst (5):
      drm/i915: Add pci ids and uapi for DG1
      drm/i915: Add mmap lock around vma_lookup() in the mman selftest.
      drm/i915: Move __i915_gem_free_object to ttm_bo_destroy
      kernel/locking: Add context to ww_mutex_trylock()
      drm/i915: Fix runtime pm handling in i915_gem_shrink

Matt Roper (21):
      drm/i915: correct name of GT forcewake domain in error messages
      drm/i915: Re-use gen11 forcewake read functions on gen12
      drm/i915: Make shadow tables range-based
      drm/i915/gen11: Update shadowed register table
      drm/i915/gen12: Update shadowed register table
      drm/i915/xehp: Xe_HP shadowed registers are a strict superset of gen12
      drm/i915/xehp: Loop over all gslices for INSTDONE processing
      drm/i915/dg2: Report INSTDONE_GEOM values in error state
      drm/i915/xehpsdv: Read correct RP_STATE_CAP register
      drm/i915/dg2: Maintain backward-compatible nested batch behavior
      drm/i915: Ensure wa_init_finish() is called for ctx workaround list
      drm/i915/dg2: Define MOCS table for DG2
      drm/i915/xehp: Check new fuse bits for SFC availability
      drm/i915: Check SFC fusing before recording/dumping SFC_DONE
      drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
      drm/i915/uncore: Associate shadow table with uncore
      drm/i915/uncore: Replace gen8 write functions with general fwtable
      drm/i915/uncore: Drop gen11/gen12 mmio write handlers
      drm/i915/uncore: Drop gen11 mmio read handlers
      drm/i915/dg2: Add DG2-specific shadow register table
      drm/i915/uncore: fwtable read handlers are now used on all forcewake platforms

Matthew Auld (7):
      drm/i915/buddy: add some pretty printing
      drm/i915/debugfs: hook up ttm_resource_manager_debug
      drm/i915/gtt: add some flushing for the 64K GTT path
      drm/i915/selftests: fixup igt_shrink_thp
      drm/i915/request: fix early tracepoints
      drm/i915/selftests: exercise shmem_writeback with THP
      drm/i915: remember to call i915_sw_fence_fini

Matthew Brost (29):
      drm/i915: Disable bonding on gen12+ platforms
      drm/i915: Fix syncmap memory leak
      drm/i915/selftests: Increase timeout in i915_gem_contexts selftests
      drm/i915/guc: Fix blocked context accounting
      drm/i915/guc: Fix outstanding G2H accounting
      drm/i915/guc: Unwind context requests in reverse order
      drm/i915/guc: Don't drop ce->guc_active.lock when unwinding context
      drm/i915/guc: Process all G2H message at once in work queue
      drm/i915/guc: Workaround reset G2H is received after schedule done G2H
      Revert "drm/i915/gt: Propagate change in error status to children on unhold"
      drm/i915/guc: Kick tasklet after queuing a request
      drm/i915/guc: Don't enable scheduling on a banned context, guc_id invalid, not registered
      drm/i915/guc: Copy whole golden context, set engine state size of subset
      drm/i915/selftests: Add initial GuC selftest for scrubbing lost G2H
      drm/i915/guc: Take context ref when cancelling request
      drm/i915/guc: Don't touch guc_state.sched_state without a lock
      drm/i915/guc: Reset LRC descriptor if register returns -ENODEV
      drm/i915/guc: Release submit fence from an irq_work
      drm/i915/guc: Move guc_blocked fence to struct guc_state
      drm/i915/guc: Rework and simplify locking
      drm/i915/guc: Proper xarray usage for contexts_lookup
      drm/i915/guc: Drop pin count check trick between sched_disable and re-pin
      drm/i915/guc: Move GuC priority fields in context under guc_active
      drm/i915/guc: Move fields protected by guc->contexts_lock into sub structure
      drm/i915/guc: Drop guc_active move everything into guc_state
      drm/i915/guc: Add GuC kernel doc
      drm/i915/guc: Enable GuC submission by default on DG1
      drm/i915: Take pinning into account in __i915_gem_object_is_lmem
      drm/i915: Fix bug in user proto-context creation that leaked contexts

Michal Wajdeczko (5):
      drm/i915: Use fixed offset for PTEs location
      drm/i915/guc: Verify result from CTB (de)register action
      drm/i915/guc: Print error name on CTB (de)registration failure
      drm/i915/guc: Print error name on CTB send failure
      drm/i915/guc: Move and improve error message for missed CTB reply

Nathan Chancellor (5):
      drm/i915/selftest: Fix use of err in igt_reset_{fail, nop}_engine()
      drm/i915/selftests: Do not use import_obj uninitialized
      drm/i915/selftests: Always initialize err in igt_dmabuf_import_same_driver_lmem()
      drm/i915: Enable -Wsometimes-uninitialized
      drm/i915: Clean up disabled warnings

Sreedhar Telukuntla (1):
      drm/i915/gt: Initialize L3CC table in mocs init

Stuart Summers (1):
      drm/i915/xehpsdv: Add compute DSS type

Tejas Upadhyay (1):
      drm/i915: Remove warning from the rps worker

Thomas Hellström (13):
      drm/i915: Ditch the i915_gem_ww_ctx loop member
      drm/i915/ttm: Reorganize the ttm move code somewhat
      drm/ttm, drm/i915: Update ttm_move_memcpy for async use
      drm/i915/gem: Fix the mman selftest
      drm/i915/gem: Fix a lockdep warning the __i915_gem_is_lmem() function
      drm/i915/ttm: Implement a function to copy the contents of two TTM-based objects
      drm/i915/gem: Implement a function to process all gem objects of a region
      drm/i915/gt: Increase suspend timeout
      drm/i915 Implement LMEM backup and restore for suspend / resume
      drm/i915/gt: Register the migrate contexts with their engines
      drm/i915: Don't back up pinned LMEM context images and rings during suspend
      drm/i915: Reduce the number of objects subject to memcpy recover
      drm/i915/ttm: Rework object initialization slightly

Tvrtko Ursulin (3):
      drm/i915: Use Transparent Hugepages when IOMMU is enabled
      drm/i915/debugfs: Do not report currently active engine when describing objects
      drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics setup

Venkata Sandeep Dhanalakota (2):
      drm/i915: Make wa list per-gt
      drm/i915: Do not define vma on stack

Ville Syrjälä (1):
      drm/i915: s/0/NULL/

Vinay Belgaumkar (1):
      drm/i915: Get PM ref before accessing HW register

Vitaly Lubart (1):
      mei: pxp: export pavp client to me client bus

ravitejax (1):
      drm/i915/adl_s: Remove require_force_probe protection

 Documentation/gpu/i915.rst                         |  10 +
 drivers/gpu/drm/drm_modeset_lock.c                 |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |  11 +
 drivers/gpu/drm/i915/Makefile                      |  28 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  34 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   6 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  49 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 298 +++----
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  42 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |  75 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  26 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  33 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  44 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  28 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  30 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |  91 ++
 drivers/gpu/drm/i915/gem/i915_gem_pm.h             |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |  70 ++
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |  37 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 195 +++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  14 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         | 206 +++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h         |  26 +
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |  22 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  41 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  36 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   7 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   | 190 -----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  28 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |   5 +-
 drivers/gpu/drm/i915/gt/debugfs_engines.h          |  14 -
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h            |  14 -
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |   2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   7 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h               |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |  20 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |  88 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   6 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  84 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  23 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  24 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  10 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  23 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |   2 -
 .../i915/gt/{debugfs_gt.c => intel_gt_debugfs.c}   |  18 +-
 .../i915/gt/{debugfs_gt.h => intel_gt_debugfs.h}   |  14 +-
 ...ebugfs_engines.c => intel_gt_engines_debugfs.c} |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h |  14 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   7 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  22 +-
 .../gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c}  | 153 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      |  16 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  12 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   9 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  11 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  88 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |   2 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               | 176 +++-
 drivers/gpu/drm/i915/gt/intel_mocs.h               |   1 +
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |  13 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   4 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |   3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   5 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  29 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  65 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |  11 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |  10 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 262 ++++--
 drivers/gpu/drm/i915/gt/intel_workarounds.h        |   2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   2 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  10 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   2 +-
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |  10 +-
 .../i915/gt/uc/abi/guc_communication_mmio_abi.h    |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  75 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  36 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |  18 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 916 +++++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  93 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   9 +
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          | 127 +++
 drivers/gpu/drm/i915/gvt/gtt.c                     |  17 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   4 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   2 +-
 drivers/gpu/drm/i915/i915_buddy.c                  |  45 +
 drivers/gpu/drm/i915/i915_buddy.h                  |   8 +
 drivers/gpu/drm/i915/i915_config.c                 |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                | 242 +-----
 drivers/gpu/drm/i915/i915_drv.c                    |   8 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  13 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   2 -
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   4 +-
 drivers/gpu/drm/i915/i915_gem_ww.h                 |  25 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  42 +-
 drivers/gpu/drm/i915/i915_module.c                 |   4 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  10 +-
 drivers/gpu/drm/i915/i915_pci.h                    |  12 +-
 drivers/gpu/drm/i915/i915_query.c                  |   3 -
 drivers/gpu/drm/i915/i915_reg.h                    |  84 +-
 drivers/gpu/drm/i915/i915_request.c                |  25 +-
 drivers/gpu/drm/i915/i915_request.h                |  26 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  14 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  20 +-
 drivers/gpu/drm/i915/i915_utils.h                  |  13 -
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_memory_region.c         |  12 +
 drivers/gpu/drm/i915/intel_memory_region.h         |   4 +
 drivers/gpu/drm/i915/intel_uncore.c                | 375 ++++-----
 drivers/gpu/drm/i915/intel_uncore.h                |  13 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               | 299 +++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |  64 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c           | 141 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h           |  15 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |  78 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h       |  21 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           | 101 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h           |  32 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |  46 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |  24 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       | 175 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h       |  15 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           | 172 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h           |  17 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h |  36 +
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |  83 ++
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   8 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |   1 +
 drivers/gpu/drm/i915/selftests/i915_vma.c          |   4 +-
 .../drm/i915/selftests/intel_scheduler_helpers.c   |  12 +
 .../drm/i915/selftests/intel_scheduler_helpers.h   |   2 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |  34 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  19 +-
 drivers/misc/mei/Kconfig                           |   2 +
 drivers/misc/mei/Makefile                          |   1 +
 drivers/misc/mei/pxp/Kconfig                       |  13 +
 drivers/misc/mei/pxp/Makefile                      |   7 +
 drivers/misc/mei/pxp/mei_pxp.c                     | 229 ++++++
 drivers/misc/mei/pxp/mei_pxp.h                     |  18 +
 drivers/regulator/core.c                           |   2 +-
 include/drm/i915_component.h                       |   1 +
 include/drm/i915_pxp_tee_interface.h               |  42 +
 include/drm/ttm/ttm_bo_driver.h                    |   2 +-
 include/linux/dma-resv.h                           |   2 +-
 include/linux/ww_mutex.h                           |  15 +-
 include/uapi/drm/i915_drm.h                        |  97 +++
 kernel/locking/mutex.c                             |  41 +
 kernel/locking/test-ww_mutex.c                     |  86 +-
 kernel/locking/ww_rt_mutex.c                       |  25 +
 lib/locking-selftest.c                             |   2 +-
 168 files changed, 5515 insertions(+), 1967 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.h
 delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.h
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
 rename drivers/gpu/drm/i915/gt/{debugfs_gt.c => intel_gt_debugfs.c} (67%)
 rename drivers/gpu/drm/i915/gt/{debugfs_gt.h => intel_gt_debugfs.h} (71%)
 rename drivers/gpu/drm/i915/gt/{debugfs_engines.c => intel_gt_engines_debugfs.c} (70%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h
 rename drivers/gpu/drm/i915/gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c} (83%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_types.h
 create mode 100644 drivers/misc/mei/pxp/Kconfig
 create mode 100644 drivers/misc/mei/pxp/Makefile
 create mode 100644 drivers/misc/mei/pxp/mei_pxp.c
 create mode 100644 drivers/misc/mei/pxp/mei_pxp.h
 create mode 100644 include/drm/i915_pxp_tee_interface.h
