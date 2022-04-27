Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B213F51152B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 12:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C4610E90D;
	Wed, 27 Apr 2022 10:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596CF10E442;
 Wed, 27 Apr 2022 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651056593; x=1682592593;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=AiKFU50Ok4B6l1aBJjy3nAAFqQSnrzFUSuHQVujapuk=;
 b=KTgnBTnAL1WfyolWene5ZOkVCHKSbglZoZrdy6Yo9zrhmoXPfLIHjc4m
 5bG+B9D3wNaa8RNma2FaXvbo9u08zrGmiXsDExBizfxNm7moneMTGJWSa
 FtSsE7ZKvF/ueEW0m1SYA9AHKDjrbrBE/uRHt13I/7MByEijuhwl26JD/
 nUucuvupKMIsWPTY5pbNOWTsWkz1e+gS/mMGHaZxR9fz14lfGgCWYMhXE
 t1LC9/EWZZOCvYRh4ppKdqrAYmiOWAhb4igQCmR6KNHgUdBXwmDR3Se71
 GIan4WX52r3D1/sOcuiFV9RLtrlYYgcBj0GyzI+wZbQA/I8Mz6w+cGxNw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="247819623"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="247819623"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 03:49:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="617451248"
Received: from jmwalsh-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.205.227])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 03:49:49 -0700
Date: Wed, 27 Apr 2022 11:49:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <Ymkfy8FjsG2JrodK@tursulin-mobl2>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave, Daniel,

Here goes the first drm-intel-gt-next PR towards 5.19.

A lot of stuff here across the board in terms of new features, new platform
support and bug fixes. For bug fixes the most interesting are:

 * a fix for out of bounds kernel access in mmap ops due incorrect object bound
   checking;
 * a fix for a GPU hang triggered by usage, of multiple media engines on
   Tigerlake and above;
 * correcting the sequence for doing engine resets on Tigerlake;
 * fix for split frame workloads in GuC mode;
 * fix for mmap of prime imported local memory objects;
 * fix for a VM refcounting bug;
 * fix fbdev setup to avoid potential out of bounds access.

Another two nice user visible improvements are one in frame buffer pinning logic
which enables Weston to reach 60fps on 8K displays and resurrection of the
ability to monitor per client GPU usage using intel_gpu_top (consuming data
exported via proc fdinfo). The latter contains a common DRM format specification
and is hopeful of gaining more wide spread adoption in the future.

GuC backend has finally achieved feature parity in terms of being able to
provide error capture state after GPU hangs. The captured data is compatible
with existing error parsing tools (IGT and Mesa) and also contains a new GuC
log segment which does not currently have an open source parser.

Also in the GuC area there was a bunch of refactoring to prepare for new
firmware API and also lay the ground work for supporting new platforms like DG2.

For the latter a buch of GuC based workarounds were added, together with support
for small PCI BAR setups, eviction of compressed objects and general platform
bring-up like code refactoring to deal with steered register writes.

DG2 also needs two new bits of UAPI. One is the hwconfig query which is a new
way of obtaining a binary table describing the GPU configuration directly from
the firmware blob. Second is a new query enabling query of geometry subslices
needed to support the fact geometry and compute slice configuration is no longer
uniform.

Also on the UAPI front there is sysfs support for multi-tile platforms which
exports the existing controls such as frequency and similar but duplicated for
each tile.

Graphics System Controller (GSC) support was added for discrete platforms as
well, which is required both for firmware management and protected media path.
Access to this is via the existing MEI character device.

Work has also started refactoring the codebase to allow driver builds outside
x86.

Finally, there were two drm-next backmerges to unblock feature development.

Regards,

Tvrtko

drm-intel-gt-next-2022-04-27:
UAPI Changes:

- GuC hwconfig support and query (John Harrison, Rodrigo Vivi, Tvrtko Ursulin)
- Sysfs support for multi-tile devices (Andi Shyti, Sujaritha Sundaresan)
- Per client GPU utilisation via fdinfo (Tvrtko Ursulin, Ashutosh Dixit)
- Add DRM_I915_QUERY_GEOMETRY_SUBSLICES (Matt Atwood)

Cross-subsystem Changes:

- Add GSC as a MEI auxiliary device (Tomas Winkler, Alexander Usyskin)

Core Changes:

- Document fdinfo format specification (Tvrtko Ursulin)

Driver Changes:

- Fix prime_mmap to work when using LMEM (Gwan-gyeong Mun)
- Fix vm open count and remove vma refcount (Thomas Hellström)
- Fixup setting screen_size (Matthew Auld)
- Opportunistically apply ALLOC_CONTIGIOUS (Matthew Auld)
- Limit where we apply TTM_PL_FLAG_CONTIGUOUS (Matthew Auld)
- Drop aux table invalidation on FlatCCS platforms (Matt Roper)
- Add missing boundary check in vm_access (Mastan Katragadda)
- Update topology dumps for Xe_HP (Matt Roper)
- Add support for steered register writes (Matt Roper)
- Add steering info to GuC register save/restore list (Daniele Ceraolo Spurio)
- Small PCI BAR enabling (Matthew Auld, Akeem G Abodunrin, CQ Tang)
- Add preemption changes for Wa_14015141709 (Akeem G Abodunrin)
- Add logical mapping for video decode engines (Matthew Brost)
- Don't evict unmappable VMAs when pinning with PIN_MAPPABLE (v2) (Vivek Kasireddy)
- GuC error capture support (Alan Previn, Daniele Ceraolo Spurio)
- avoid concurrent writes to aux_inv (Fei Yang)
- Add Wa_22014226127 (José Roberto de Souza)
- Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL (Matt Roper)
- Evict and restore of compressed objects (Ramalingam C)
- Update to GuC version 70.1.1 (John Harrison)
- Add Wa_22011802037 force cs halt (Tilak Tangudu)
- Enable Wa_22011802037 for gen12 GuC based platforms (Umesh Nerlige Ramappa)
- GuC based workarounds for DG2 (Vinay Belgaumkar, John Harrison, Matthew Brost, José Roberto de Souza)
- consider min_page_size when migrating (Matthew Auld)

- Prep work for next GuC firmware release (John Harrison)
- Support platforms with CCS engines but no RCS (Matt Roper, Stuart Summers)
- Don't overallocate subslice storage (Matt Roper)
- Reduce stack usage in debugfs due to SSEU (John Harrison)
- Report steering details in debugfs (Matt Roper)
- Refactor some x86-ism out to prepare for non-x86 builds (Michael Cheng)
- add lmem_size modparam (CQ Tang)
- Refactor for non-x86 driver builds (Casey Bowman)
- Centralize computation of freq caps (Ashutosh Dixit)

- Update dma_buf_ops.unmap_dma_buf callback to use drm_gem_unmap_dma_buf() (Gwan-gyeong Mun)
- Limit the async bind to bind_async_flags (Matthew Auld)
- Stop checking for NULL vma->obj (Matthew Auld)
- Reduce overzealous alignment constraints for GGTT (Matthew Auld)
- Remove GEN12_SFC_DONE_MAX from register defs header (Matt Roper)
- Fix renamed struct field (Lucas De Marchi)
- Do not return '0' if there is nothing to return (Andi Shyti)
- fix i915_reg_t initialization (Jani Nikula)
- move the migration sanity check (Matthew Auld)
- handle more rounding in selftests (Matthew Auld)
- Perf and i915 query kerneldoc updates (Matt Roper)
- Use i915_probe_error instead of drm_err (Vinay Belgaumkar)
- sanity check object size in the buddy allocator (Matthew Auld)
- fixup selftests min_alignment usage (Matthew Auld)
- tweak selftests misaligned_case (Matthew Auld)
The following changes since commit c54b39a565227538c52ead2349eb17d54aadd6f7:

  Merge tag 'drm-intel-next-2022-04-13-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-04-14 12:03:09 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-04-27

for you to fetch changes up to f15856d7de914595d0daa2c706f53a693b48e228:

  drm/i915/dg2: add gsc with special gsc bar offsets (2022-04-21 11:34:39 -0700)

----------------------------------------------------------------
UAPI Changes:

- GuC hwconfig support and query (John Harrison, Rodrigo Vivi, Tvrtko Ursulin)
- Sysfs support for multi-tile devices (Andi Shyti, Sujaritha Sundaresan)
- Per client GPU utilisation via fdinfo (Tvrtko Ursulin, Ashutosh Dixit)
- Add DRM_I915_QUERY_GEOMETRY_SUBSLICES (Matt Atwood)

Cross-subsystem Changes:

- Add GSC as a MEI auxiliary device (Tomas Winkler, Alexander Usyskin)

Core Changes:

- Document fdinfo format specification (Tvrtko Ursulin)

Driver Changes:

- Fix prime_mmap to work when using LMEM (Gwan-gyeong Mun)
- Fix vm open count and remove vma refcount (Thomas Hellström)
- Fixup setting screen_size (Matthew Auld)
- Opportunistically apply ALLOC_CONTIGIOUS (Matthew Auld)
- Limit where we apply TTM_PL_FLAG_CONTIGUOUS (Matthew Auld)
- Drop aux table invalidation on FlatCCS platforms (Matt Roper)
- Add missing boundary check in vm_access (Mastan Katragadda)
- Update topology dumps for Xe_HP (Matt Roper)
- Add support for steered register writes (Matt Roper)
- Add steering info to GuC register save/restore list (Daniele Ceraolo Spurio)
- Small PCI BAR enabling (Matthew Auld, Akeem G Abodunrin, CQ Tang)
- Add preemption changes for Wa_14015141709 (Akeem G Abodunrin)
- Add logical mapping for video decode engines (Matthew Brost)
- Don't evict unmappable VMAs when pinning with PIN_MAPPABLE (v2) (Vivek Kasireddy)
- GuC error capture support (Alan Previn, Daniele Ceraolo Spurio)
- avoid concurrent writes to aux_inv (Fei Yang)
- Add Wa_22014226127 (José Roberto de Souza)
- Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL (Matt Roper)
- Evict and restore of compressed objects (Ramalingam C)
- Update to GuC version 70.1.1 (John Harrison)
- Add Wa_22011802037 force cs halt (Tilak Tangudu)
- Enable Wa_22011802037 for gen12 GuC based platforms (Umesh Nerlige Ramappa)
- GuC based workarounds for DG2 (Vinay Belgaumkar, John Harrison, Matthew Brost, José Roberto de Souza)
- consider min_page_size when migrating (Matthew Auld)

- Prep work for next GuC firmware release (John Harrison)
- Support platforms with CCS engines but no RCS (Matt Roper, Stuart Summers)
- Don't overallocate subslice storage (Matt Roper)
- Reduce stack usage in debugfs due to SSEU (John Harrison)
- Report steering details in debugfs (Matt Roper)
- Refactor some x86-ism out to prepare for non-x86 builds (Michael Cheng)
- add lmem_size modparam (CQ Tang)
- Refactor for non-x86 driver builds (Casey Bowman)
- Centralize computation of freq caps (Ashutosh Dixit)

- Update dma_buf_ops.unmap_dma_buf callback to use drm_gem_unmap_dma_buf() (Gwan-gyeong Mun)
- Limit the async bind to bind_async_flags (Matthew Auld)
- Stop checking for NULL vma->obj (Matthew Auld)
- Reduce overzealous alignment constraints for GGTT (Matthew Auld)
- Remove GEN12_SFC_DONE_MAX from register defs header (Matt Roper)
- Fix renamed struct field (Lucas De Marchi)
- Do not return '0' if there is nothing to return (Andi Shyti)
- fix i915_reg_t initialization (Jani Nikula)
- move the migration sanity check (Matthew Auld)
- handle more rounding in selftests (Matthew Auld)
- Perf and i915 query kerneldoc updates (Matt Roper)
- Use i915_probe_error instead of drm_err (Vinay Belgaumkar)
- sanity check object size in the buddy allocator (Matthew Auld)
- fixup selftests min_alignment usage (Matthew Auld)
- tweak selftests misaligned_case (Matthew Auld)

----------------------------------------------------------------
Akeem G Abodunrin (2):
      drm/i915/stolen: don't treat small BAR as an error
      drm/i915/dg2: Add preemption changes for Wa_14015141709

Alan Previn (13):
      drm/i915/guc: Update GuC ADS size for error capture lists
      drm/i915/guc: Add XE_LP static registers for GuC error capture.
      drm/i915/guc: Add XE_LP steered register lists support
      drm/i915/guc: Add DG2 registers for GuC error state capture.
      drm/i915/guc: Add Gen9 registers for GuC error state capture.
      drm/i915/guc: Add GuC's error state capture output structures.
      drm/i915/guc: Update GuC-log relay function names
      drm/i915/guc: Add capture region into intel_guc_log
      drm/i915/guc: Check sizing of guc_capture output
      drm/i915/guc: Extract GuC error capture lists on G2H notification.
      drm/i915/guc: Pre-allocate output nodes for extraction
      drm/i915/guc: Plumb GuC-capture into gpu_coredump
      drm/i915/guc: Print the GuC error capture output register list.

Alexander Usyskin (2):
      mei: gsc: setup char driver alive in spite of firmware handshake failure
      mei: gsc: retrieve the firmware version

Andi Shyti (6):
      drm/i915: Rename INTEL_REGION_LMEM with INTEL_REGION_LMEM_0
      drm/i915/gt: add gt_is_root() helper
      drm/i915/gt: create per-tile sysfs interface
      drm/i915/gt: Create per-tile RC6 sysfs interface
      drm/i915/gt: Create per-tile RPS sysfs interfaces
      drm/i915/debugfs: Do not return '0' if there is nothing to return

Ashutosh Dixit (2):
      drm/i915/rps: Centralize computation of freq caps
      drm/i915: Don't show engine information in fdinfo with GuC submission

CQ Tang (2):
      drm/i915/display: Check mappable aperture when pinning preallocated vma
      drm/i915: add lmem_size modparam

Casey Bowman (2):
      drm/i915/gt: Split intel-gtt functions by arch
      drm/i915: Require INTEL_GTT to depend on X86

Daniele Ceraolo Spurio (2):
      drm/i915/guc: add steering info to GuC register save/restore list
      drm/i915/guc: Correctly free guc capture struct on error

Fei Yang (1):
      drm/i915: avoid concurrent writes to aux_inv

Gwan-gyeong Mun (2):
      drm/i915/dmabuf: Update dma_buf_ops.unmap_dma_buf callback to use drm_gem_unmap_dma_buf()
      drm/i915/dmabuf: Fix prime_mmap to work when using LMEM

Jani Nikula (1):
      drm/i915/gt: fix i915_reg_t initialization

John Harrison (13):
      drm/i915/guc: Do not conflate lrc_desc with GuC id for registration
      drm/i915/guc: Add an explicit 'submission_initialized' flag
      drm/i915/guc: Better name for context id limit
      drm/i915/guc: Split guc_lrc_desc_pin apart
      drm/i915/guc: Move lrc desc setup to where it is needed
      drm/i915/guc: Rename desc_idx to ctx_id
      drm/i915/guc: Drop obsolete H2G definitions
      drm/i915/guc: Fix potential invalid pointer dereferences when decoding G2Hs
      drm/i915: Reduce stack usage in debugfs due to SSEU
      drm/i915/guc: Add fetch of hwconfig blob
      drm/i915/guc: Update to GuC version 70.1.1
      drm/i915/guc: Enable GuC based workarounds for DG2
      drm/i915/dg2: Enable Wa_22012727170/Wa_22012727685

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

José Roberto de Souza (2):
      drm/i915/dg2: Add Wa_22014226127
      drm/i915/dg2: Add workaround 18019627453

Lucas De Marchi (1):
      drm/i915: Fix renamed struct field

Mastan Katragadda (1):
      drm/i915/gem: add missing boundary check in vm_access

Matt Atwood (1):
      drm/i915/uapi: Add DRM_I915_QUERY_GEOMETRY_SUBSLICES

Matt Roper (11):
      drm/i915/xehp: Support platforms with CCS engines but no RCS
      drm/i915/xehp: Drop aux table invalidation on FlatCCS platforms
      drm/i915/gt: Remove GEN12_SFC_DONE_MAX from register defs header
      drm/i915/sseu: Don't overallocate subslice storage
      drm/i915/xehp: Update topology dumps for Xe_HP
      drm/i915: Report steering details in debugfs
      drm/i915: Add support for steered register writes
      drm/i915: Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL
      drm/i915/doc: Convert drm_i915_query_topology_info comment to kerneldoc
      drm/i915/doc: Convert perf UAPI comments to kerneldoc
      drm/i915/doc: Link query items to their uapi structs

Matthew Auld (17):
      drm/i915/fbdev: fixup setting screen_size
      drm/i915: limit the async bind to bind_async_flags
      drm/i915: stop checking for NULL vma->obj
      drm/i915/gtt: reduce overzealous alignment constraints for GGTT
      drm/i915: opportunistically apply ALLOC_CONTIGIOUS
      drm/i915/lmem: don't treat small BAR as an error
      drm/i915/stolen: consider I915_BO_ALLOC_GPU_ONLY
      drm/i915: add i915_gem_object_create_region_at()
      drm/i915/ttm: wire up the object offset
      drm/i915: fixup the initial fb base on DGFX
      drm/i915/ttm: limit where we apply TTM_PL_FLAG_CONTIGUOUS
      drm/i915/migrate: move the sanity check
      drm/i915/selftests: handle more rounding
      drm/i915: consider min_page_size when migrating
      drm/i915/buddy: sanity check the size
      drm/i915/selftests: fixup min_alignment usage
      drm/i915/selftests: tweak the misaligned_case

Matthew Brost (2):
      drm/i915: Add logical mapping for video decode engines
      drm/i915/dg2: Enable Wa_14014475959 - RCS / CCS context exit

Michael Cheng (5):
      drm/i915/gt: Re-work intel_write_status_page
      drm/i915/gt: Drop invalidate_csb_entries
      drm/i915/gt: Re-work reset_csb
      drm/i915/: Re-work clflush_write32
      drm/i915/gt: replace cache_clflush_range

Ramalingam C (9):
      drm/i915/gt: use engine instance directly for offset
      drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj on graphics ver 12+
      drm/i915/gt: Optimize the migration and clear loop
      drm/i915/gt: Pass the -EINVAL when emit_pte doesn't update any PTE
      drm/i915/gt: Clear compress metadata for Flat-ccs objects
      drm/i915/selftest_migrate: Consider the possible roundup of size
      drm/i915/selftest_migrate: Check CCS meta data clear
      drm/i915/gem: Add extra pages in ttm_tt for ccs data
      drm/i915/migrate: Evict and restore the flatccs capable lmem obj

Rodrigo Vivi (3):
      drm/i915/uapi: Add query for hwconfig blob
      drm/i915/hwconfig: Add DG2 support
      Merge drm/drm-next into drm-intel-gt-next

Stuart Summers (1):
      drm/i915: Add RCS mask to GuC ADS params

Sujaritha Sundaresan (1):
      drm/i915/gt: Add sysfs throttle frequency interfaces

Thomas Hellström (3):
      drm/i915: Remove the vm open count
      drm/i915: Remove the vma refcount
      drm/i915/gem: Remove some unnecessary code

Tilak Tangudu (1):
      drm/i915: Add Wa_22011802037 force cs halt

Tomas Winkler (4):
      drm/i915/gsc: add gsc as a mei auxiliary device
      mei: add support for graphics system controller (gsc) devices
      mei: gsc: add runtime pm handlers
      drm/i915/dg2: add gsc with special gsc bar offsets

Tvrtko Ursulin (11):
      drm/i915: Prepare for multiple GTs
      drm/i915/uapi: Document DRM_I915_QUERY_HWCONFIG_BLOB
      drm/i915: Explicitly track DRM clients
      drm/i915: Make GEM contexts track DRM clients
      drm/i915: Track runtime spent in closed and unreachable GEM contexts
      drm/i915: Track all user contexts per client
      drm/i915: Track context current active time
      drm: Document fdinfo format specification
      drm/i915: Count engine instances per uabi class
      drm/i915: Expose client engine utilisation via fdinfo
      drm/i915: Fixup kerneldoc in struct i915_gem_context

Umesh Nerlige Ramappa (1):
      drm/i915/guc: Enable Wa_22011802037 for gen12 GuC based platforms

Vinay Belgaumkar (2):
      drm/i915/guc/slpc: Use i915_probe_error instead of drm_err
      drm/i915/guc: Apply Wa_16011777198

Vivek Kasireddy (1):
      drm/i915/gem: Don't evict unmappable VMAs when pinning with PIN_MAPPABLE (v2)

 Documentation/gpu/drm-usage-stats.rst              |  112 ++
 Documentation/gpu/i915.rst                         |   28 +
 Documentation/gpu/index.rst                        |    1 +
 MAINTAINERS                                        |    1 +
 drivers/gpu/drm/i915/Kconfig                       |    3 +-
 drivers/gpu/drm/i915/Makefile                      |   10 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   56 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   70 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    6 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   15 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   14 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   50 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |    7 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  144 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |    4 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   52 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |    1 +
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   12 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |    5 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |    2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  113 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |    4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   12 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   29 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   24 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   40 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   11 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   49 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  693 +-------
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   29 +
 drivers/gpu/drm/i915/gt/intel_gsc.c                |  224 +++
 drivers/gpu/drm/i915/gt/intel_gsc.h                |   37 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  223 ++-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   41 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    4 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   20 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h         |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c            |  654 ++++++++
 drivers/gpu/drm/i915/gt/intel_gt_gmch.h            |   46 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   13 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   18 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   40 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   21 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |  122 ++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |   34 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  601 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h        |   15 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   18 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   56 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   65 +-
 drivers/gpu/drm/i915/gt/intel_hwconfig.h           |   21 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   39 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |   27 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  390 ++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    8 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    7 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  126 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |    6 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |   15 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |   54 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |   50 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |   30 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   21 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   86 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   10 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  259 ++-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   14 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |    4 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |   15 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |  218 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   48 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   19 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  185 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     | 1657 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |   33 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |   92 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |  164 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  125 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   56 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  645 +++++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   30 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   12 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   37 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |  158 ++
 drivers/gpu/drm/i915/i915_drm_client.h             |   68 +
 drivers/gpu/drm/i915/i915_drv.h                    |   25 +
 drivers/gpu/drm/i915/i915_file_private.h           |    3 +
 drivers/gpu/drm/i915/i915_gem.c                    |   89 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  297 ++--
 drivers/gpu/drm/i915/i915_gpu_error.h              |   37 +-
 drivers/gpu/drm/i915/i915_params.c                 |    3 +
 drivers/gpu/drm/i915/i915_params.h                 |    1 +
 drivers/gpu/drm/i915/i915_pci.c                    |    4 +-
 drivers/gpu/drm/i915/i915_query.c                  |   94 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   18 +
 drivers/gpu/drm/i915/i915_reg_defs.h               |    2 -
 drivers/gpu/drm/i915/i915_sysfs.c                  |  310 +---
 drivers/gpu/drm/i915/i915_sysfs.h                  |    3 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    4 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   98 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   14 -
 drivers/gpu/drm/i915/i915_vma_resource.c           |    2 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |    6 +
 drivers/gpu/drm/i915/i915_vma_types.h              |    8 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    2 +
 drivers/gpu/drm/i915/intel_memory_region.c         |    2 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |    8 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |    7 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |    1 +
 drivers/gpu/drm/i915/intel_uncore.c                |   86 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    7 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   18 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   13 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |    4 +
 drivers/misc/mei/Kconfig                           |   14 +
 drivers/misc/mei/Makefile                          |    3 +
 drivers/misc/mei/bus-fixup.c                       |   25 +
 drivers/misc/mei/gsc-me.c                          |  259 +++
 drivers/misc/mei/hw-me.c                           |   29 +-
 drivers/misc/mei/hw-me.h                           |    2 +
 include/linux/mei_aux.h                            |   19 +
 include/uapi/drm/i915_drm.h                        |  291 +++-
 143 files changed, 8161 insertions(+), 2326 deletions(-)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gsc.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gsc.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_gmch.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_gmch.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
 create mode 100644 drivers/misc/mei/gsc-me.c
 create mode 100644 include/linux/mei_aux.h
