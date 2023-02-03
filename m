Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A36893D9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 10:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3142510E60E;
	Fri,  3 Feb 2023 09:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F0B10E204;
 Fri,  3 Feb 2023 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675416850; x=1706952850;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lD7oSSRofIqXsWOTqg3W9n3eJ2CdBBqnJIZvkqZb5aQ=;
 b=aC65koGkUyQ2nzD0x3iaH8uELzJCMh/3po335LtJIc6OBRkzfN+umDod
 7aHTJ9mzB5tc51JxoZrTqYhejRKPYEn+JJdFuvsVW7aS7C4I5u8nI11lD
 7v7OikYhzkVFzA+0unLJmw1bbRHa8pEL5b6rTvh6jeRxIdg3YwtJcewdA
 BF1zx2pI3e8vJtcFVLRHK/r7JtEppBrC2iT1XDGePxEBVfinyT7gUEnil
 xEIrpW4pQzIu0ZpbokqKXKmBYPL80N5FMhSxFnC64MLEI16PLebZfrsst
 Qbb7Awjsvbf/X3XoNX2yTVkENAS3g9nS2DqTppY1mt7sWfjcnWxcgQQ42 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312359639"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="312359639"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 01:34:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="729207325"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729207325"
Received: from cciobanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.96])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 01:34:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 00/19] fix DRM_USE_DYNAMIC_DEBUG regression
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230125203743.564009-1-jim.cromie@gmail.com>
Date: Fri, 03 Feb 2023 11:34:02 +0200
Message-ID: <87a61v14ad.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Jan 2023, Jim Cromie <jim.cromie@gmail.com> wrote:
> Hi everyone,
>
> In v6.1 DRM_USE_DYNAMIC_DEBUG=y has a regression enabling drm.debug in
> drivers at modprobe.

I realize we haven't actually addressed the regression in any way yet,
and any distro enabling DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE will have
DRM_USE_DYNAMIC_DEBUG=y by default, and we're hitting the issue with
trying to gather logs from users on v6.1 or later. It hampers debugging
pretty badly.

I appreciate the effort in fixing the problem properly here, but we'll
need a fix that we can backport to stable kernels.

Maybe just Ville's idea of

 config DRM_USE_DYNAMIC_DEBUG
        bool "use dynamic debug to implement drm.debug"
-       default y
+       default n
+       depends on BROKEN
        depends on DRM
        depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE

but we'll need that as a patch and merged and backported ASAP.

In the mean time, is there a workaround that the user could enable, say,
on the kernel command line, to enable drm debugs on driver kernel
modules, all the way from boot?


BR,
Jani.




>
> It is due to a chicken-egg problem loading modules; on `modprobe
> i915`, drm is loaded 1st, and drm/parameters/debug is set.  When
> drm_debug_enabled() tested __drm_debug at runtime, this just worked.
>
> But with DRM_USE_DYNAMIC_DEBUG=y, the runtime test is replaced with a
> static_key for each drm_dbg/dyndbg callsite, enabled by dyndbg's
> kparam callback on __drm_debug.  So with drm.ko loaded and initialized
> before the dependent modules, their debug callsites aren't yet present
> to be enabled.
>
> STATUS - v3
>
> not quite ready.
> rebased on -rc5, hopefully applies to patchwork head 
> still has RFC patch -> CI_ONLY temporary, to avoid panics
> boots on my amdgpu box, drm.debug=0x3ff works at boot-time
> the "toggled" warning is repeatable with test_dynamic_debug*.ko
> it also occurs on amdgpu, so not just artificial.
> v2 is https://lore.kernel.org/lkml/20230113193016.749791-1-jim.cromie@gmail.com/
>
> OVERVIEW
>
> As Jani Nikula noted rather more gently, DECLARE_DYNDBG_CLASSMAP is
> error-prone enough to call broken: sharing of a common classmap
> required identical classmap definitions in all modules using DRM_UT_*,
> which is inherently error-prone.  IOW, it muddled the K&R distinction
> between a (single) definition, and multiple references.
>
> So patches 10-13 split it into:
>
> DYNDBG_CLASSMAP_DEFINE	used once per subsystem to define each classmap.
> DYNDBG_CLASSMAP_USE	declare dependence on a DEFINEd classmap.
>
> DYNDBG_CLASSMAP_DEFINE initializes the classmap, stores it into the
> (existing) __dyndbg_classes section, and exports the struct var
> (unlike DECLARE_DYNDBG_CLASSMAP).
>
> DYNDBG_CLASSMAP_USE initializes a class-ref struct, containing the
> user-module-name, and a ref to the exported classmap var.
>
> The distinction allows separate treatment of classmaps and
> classmap-refs, the latter getting additional behavior to propagate
> parent's kparam settings to USEr. (forex: drm.debug to drm-drivers) 
>
> . lookup the classmap defn being referenced, and its module
> . find the module's kernel-params using the classmap
> . propagate kparam vals into the prdgs in module being added.
>
> It also makes the weird coordinated-changes-by-identical-classmaps
> "feature" unnecessary.
>
> Patch-10 splits the DECLARE macro into DEFINE & USE, and updates uses.
>
> Patch-11 is the core of it; the separate treatment begins in
> ddebug_add_module().  It calls ddebug_attach_module_classes(1) to
> handle class-defns; this adds ddebug_attach_client_module_classes(2)
> to handle class-refs, as they are found while modprobing drm
> drivers. (2) calls ddebug_apply_parents_params(3) on each USEr's
> referred classmap definition.
>
> (3) scans kernel-params owned by the module DEFINEing the classmap,
> either builtin or loadable, calls ddebug_match_apply_kparam(4) on each.
>
> (4) looks for kparams which are wired to dyndbg's param-ops.  Those
> params have a struct ddebug_class_param attached, which has a classmap
> and a ref to a state-var (__drm_debug for DRM case).  If the kparam's
> classmap is the same as from (2), then apply its state-var to the
> client module by calling ddebug_apply_class_bitmap().
>
> Patch-12 cleans up DYNDBG_CLASSMAP_USE, dropping now unneeded args.
>
> Patch-13 improves DYNDBG_CLASSMAP_DEFINE, by accepting DRM_UT_*
> symbols directly, not "DRM_UT_*" (their strings).  It adds new
> include/linux/map.h to support this.
>
> Patches 1-9 are prep, refactor, cleanup, tighten interfaces
>
> Patches 15-18 extend test_dynamic_debug to recreate DRM's multi-module
> regression; it builds both test_dynamic_debug.ko and _submod.ko, with
> an ifdef to _DEFINE in the main module, and _USE in the submod.  This
> gives both modules identical set of prdbgs, which is helpful for
> comparing results.
>
> here it is, working properly:
>
> doing class DRM_UT_CORE -p
> [ 9904.961750] dyndbg: read 21 bytes from userspace
> [ 9904.962286] dyndbg: query 0: "class DRM_UT_CORE -p" mod:*
> [ 9904.962848] dyndbg: split into words: "class" "DRM_UT_CORE" "-p"
> [ 9904.963444] dyndbg: op='-' flags=0x0 maskp=0xfffffffe
> [ 9904.963945] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_CORE
> [ 9904.964781] dyndbg: good-class: drm.DRM_UT_CORE  module:drm nd:302 nc:1 nu:0
> [ 9904.966411] dyndbg: class-ref: drm_kms_helper.DRM_UT_CORE  module:drm_kms_helper nd:95 nc:0 nu:1
> [ 9904.967265] dyndbg: class-ref: drm_display_helper.DRM_UT_CORE  module:drm_display_helper nd:150 nc:0 nu:1
> [ 9904.968349] dyndbg: class-ref: i915.DRM_UT_CORE  module:i915 nd:1659 nc:0 nu:1
> [ 9904.969801] dyndbg: class-ref: amdgpu.DRM_UT_CORE  module:amdgpu nd:4425 nc:0 nu:1
> [ 9904.977079] dyndbg: class-ref: nouveau.DRM_UT_CORE  module:nouveau nd:103 nc:0 nu:1
> [ 9904.977830] dyndbg: processed 1 queries, with 507 matches, 0 errs
> doing class DRM_UT_DRIVER +p
> [ 9906.151761] dyndbg: read 23 bytes from userspace
> [ 9906.152241] dyndbg: query 0: "class DRM_UT_DRIVER +p" mod:*
> [ 9906.152793] dyndbg: split into words: "class" "DRM_UT_DRIVER" "+p"
> [ 9906.153388] dyndbg: op='+' flags=0x1 maskp=0xffffffff
> [ 9906.153896] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_DRIVER
> [ 9906.154746] dyndbg: good-class: drm.DRM_UT_DRIVER  module:drm nd:302 nc:1 nu:0
> [ 9906.155433] dyndbg: class-ref: drm_kms_helper.DRM_UT_DRIVER  module:drm_kms_helper nd:95 nc:0 nu:1
> [ 9906.156267] dyndbg: class-ref: drm_display_helper.DRM_UT_DRIVER  module:drm_display_helper nd:150 nc:0 nu:1
> [ 9906.157365] dyndbg: class-ref: i915.DRM_UT_DRIVER  module:i915 nd:1659 nc:0 nu:1
> [ 9906.163848] dyndbg: class-ref: amdgpu.DRM_UT_DRIVER  module:amdgpu nd:4425 nc:0 nu:1
> [ 9906.178963] dyndbg: class-ref: nouveau.DRM_UT_DRIVER  module:nouveau nd:103 nc:0 nu:1
> [ 9906.179934] dyndbg: processed 1 queries, with 1286 matches, 0 errs
>
>
> Patch-19 is a *workaround* for a panic: __jump_label_patch can "crash
> the box" when the jump-entry is in the wrong state.  The current code
> makes no distinction between a well-formed "toggled" state and an
> "insane" state.  Not for keeps.
>
> It fixes mis-initialization problems like this:
>
> [ 1594.032504] dyndbg: query 0: "class D2_DRIVER -p" mod:*
> [ 1594.032823] dyndbg: split into words: "class" "D2_DRIVER" "-p"
> [ 1594.033183] dyndbg: op='-' flags=0x0 maskp=0xfffffffe
> [ 1594.033507] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=D2_DRIVER
> [ 1594.034014] dyndbg: good-class: test_dynamic_debug.D2_DRIVER  module:test_dynamic_debug nd:32 nc:4 nu:0
> [ 1594.034695] dyndbg: changed lib/test_dynamic_debug.c:156 [test_dynamic_debug]do_cats p => _
> [ 1594.035304] dyndbg: class-ref: test_dynamic_debug_submod.D2_DRIVER  module:test_dynamic_debug_submod nd:32 nc:0 nu:4
> [ 1594.036052] jump_label: found toggled op at do_cats+0x16/0x180 [test_dynamic_debug_submod] [00000000ff2582ac] (0f 1f 44 00 00 != e9 e1 00 00 00)) size:5 type:0
> [ 1594.037036] dyndbg: changed lib/test_dynamic_debug.c:156 [test_dynamic_debug_submod]do_cats p => _
> [ 1594.037604] dyndbg: processed 1 queries, with 2 matches, 0 errs
> [ 1594.037968] dyndbg: bit_1: 2 matches on class: D2_DRIVER -> 0x0
>
> These errors are reliably reproduced by a shell-func which modprobes
> (with the right args) the test mod & submod.ko (in the commit message).
>
> So this isnt really ready for inclusion, but Id like to send the whole
> set to the CI-gym for a workout.  The RFC/for-TESTING patch will
> mitigate panics, and still be detectable.
>
> Besides, Murphys law requires I publish some error before I can make progress.
>
>
> Jim Cromie (19):
>   test-dyndbg: fixup CLASSMAP usage error
>   test-dyndbg: show that DEBUG enables prdbgs at compiletime
>   dyndbg: replace classmap list with a vector
>   dyndbg: make ddebug_apply_class_bitmap more selective
>   dyndbg: split param_set_dyndbg_classes to inner/outer fns
>   dyndbg: drop NUM_TYPE_ARRAY
>   dyndbg: reduce verbose/debug clutter
>   dyndbg: tighten ddebug_class_name() 1st arg
>   dyndbg: constify ddebug_apply_class_bitmap args
>   dyndbg-API: split DECLARE_(DYNDBG_CLASSMAP) to $1(_DEFINE|_USE)
>   dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
>   dyndbg-API: DYNDBG_CLASSMAP_USE drop extra args
>   dyndbg-API: DYNDBG_CLASSMAP_DEFINE() improvements
>   drm_print: fix stale macro-name in comment
>   test-dyndbg: build test_dynamic_debug_submod
>   test-dyndbg: rename DD_SYS_WRAP to DYNDBG_CLASSMAP_PARAM
>   test-dyndbg: disable WIP dyndbg-trace params
>   test-dyndbg: tune sub-module behavior
>   jump_label: RFC / temporary for CI - tolerate toggled state
>
>  arch/x86/kernel/jump_label.c            |  24 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  14 +-
>  drivers/gpu/drm/display/drm_dp_helper.c |  14 +-
>  drivers/gpu/drm/drm_crtc_helper.c       |  14 +-
>  drivers/gpu/drm/drm_print.c             |  22 +-
>  drivers/gpu/drm/i915/i915_params.c      |  14 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  14 +-
>  include/asm-generic/vmlinux.lds.h       |   1 +
>  include/drm/drm_print.h                 |   6 +-
>  include/linux/dynamic_debug.h           |  57 ++++--
>  include/linux/map.h                     |  55 +++++
>  kernel/module/main.c                    |   3 +
>  lib/Makefile                            |   3 +-
>  lib/dynamic_debug.c                     | 258 ++++++++++++++++++------
>  lib/test_dynamic_debug.c                | 118 +++++++----
>  lib/test_dynamic_debug_submod.c         |  10 +
>  16 files changed, 437 insertions(+), 190 deletions(-)
>  create mode 100644 include/linux/map.h
>  create mode 100644 lib/test_dynamic_debug_submod.c

-- 
Jani Nikula, Intel Open Source Graphics Center
