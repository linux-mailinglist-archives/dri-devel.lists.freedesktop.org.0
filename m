Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9D65B158
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 12:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64E710E0FC;
	Mon,  2 Jan 2023 11:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A4710E0FC;
 Mon,  2 Jan 2023 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672659771; x=1704195771;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=CjdPnWrP4bYOBQEgF6A4krUnZv7zbiEIpHAaYuWioII=;
 b=DyTsQHMZ2sYnsFJXa7TBDt+YXMIPGKT1Jx5Fqk5NmLRjiJkc5aGZ48xO
 WkJLx3MlDsD6jPXOw1PTBTRmY+KP/XmBQUC1glQdfvTGBQA7Nsggxe+F5
 YfRqMHIX1DAW6rtGUmrO9w4G+ZF5ODRfz2NnVSNZWXeaNuL4E6DymE5C+
 +SqsdOrrN0pM8KpiTM3XQnnXLoozJ+uaRTs1QJVFttBKQLPsLDwucBIzU
 djfufHdEkDfBT79lt4GZlIZV5tozVB7pDM8gJsKtzzvhXhG6o2K5Z7Z6+
 hXx1EALPsCKGnBbYbKez30mtVDf7QMkc7LlfMsbVk+3/xMT7xGKkv72eM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="309239827"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; d="scan'208";a="309239827"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 03:42:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="743174737"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; d="scan'208";a="743174737"
Received: from shoey-mobl.ger.corp.intel.com (HELO localhost) ([10.252.9.185])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 03:42:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Matthew Brost
 <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 00/20] Initial Xe driver submission
In-Reply-To: <8c0a1792-c2bd-375f-fa56-747e34b085f4@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <8c0a1792-c2bd-375f-fa56-747e34b085f4@suse.de>
Date: Mon, 02 Jan 2023 13:42:46 +0200
Message-ID: <87cz7xyxft.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 02 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 22.12.22 um 23:21 schrieb Matthew Brost:
>> Hello,
>>=20
>> This is a submission for Xe, a new driver for Intel GPUs that supports b=
oth
>> integrated and discrete platforms starting with Tiger Lake (first platfo=
rm with
>> Intel Xe Architecture). The intention of this new driver is to have a fr=
esh base
>> to work from that is unencumbered by older platforms, whilst also taking=
 the
>> opportunity to rearchitect our driver to increase sharing across the drm
>> subsystem, both leveraging and allowing us to contribute more towards ot=
her
>> shared components like TTM and drm/scheduler. The memory model is based =
on VM
>> bind which is similar to the i915 implementation. Likewise the execbuf
>> implementation for Xe is very similar to execbuf3 in the i915 [1].
>
> After Xe has stabilized, will i915 loose the ability to drive this=20
> hardware (and possibly other)?  I'm specfically thinking of the i915=20
> code that requires TTM. Keeping that dependecy within Xe only might=20
> benefit DRM as a whole.

There's going to be a number of platforms supported by both drivers, and
from purely a i915 standpoint dropping any currently supported platforms
or that dependency from i915 would be a regression.

>>=20
>> The code is at a stage where it is already functional and has experiment=
al
>> support for multiple platforms starting from Tiger Lake, with initial su=
pport
>> implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), a=
s well
>> as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
>> implementation will be released publicly early next year. We also have a=
 suite
>> of IGTs for XE that will appear on the IGT list shortly.
>>=20
>> It has been built with the assumption of supporting multiple architectur=
es from
>> the get-go, right now with tests running both on X86 and ARM hosts. And =
we
>> intend to continue working on it and improving on it as part of the kern=
el
>> community upstream.
>>=20
>> The new Xe driver leverages a lot from i915 and work on i915 continues a=
s we
>> ready Xe for production throughout 2023.
>>=20
>> As for display, the intent is to share the display code with the i915 dr=
iver so
>> that there is maximum reuse there. Currently this is being done by compi=
ling the
>> display code twice, but alternatives to that are under consideration and=
 we want
>> to have more discussion on what the best final solution will look like o=
ver the
>> next few months. Right now, work is ongoing in refactoring the display c=
odebase
>> to remove as much as possible any unnecessary dependencies on i915 speci=
fic data
>> structures there..
>
> Could both drivers reside in a common parent directory and share=20
> something like a DRM Intel helper module with the common code? This=20
> would fit well with the common design of DRM helpers.

I think it's too early to tell.

For one thing, setting that up would be a lot of up front infrastructure
work. I'm not sure how to even pull that off when Xe is still
out-of-tree and i915 development plunges on upstream as ever.

For another, realistically, the overlap between supported platforms is
going to end at some point, and eventually new platforms are only going
to be supported with Xe. That's going to open up new possibilities for
refactoring also the display code. I think it would be premature to lock
in to a common directory structure or a common helper module at this
point.

I'm not saying no to the idea, and we've contemplated it before, but I
think there are still too many moving parts to decide to go that way.


BR,
Jani.


>
> Best regards
> Thomas
>
>>=20
>> We currently have 2 submission backends, execlists and GuC. The execlist=
 is
>> meant mostly for testing and is not fully functional while GuC backend i=
s fully
>> functional. As with the i915 and GuC submission, in Xe the GuC firmware =
is
>> required and should be placed in /lib/firmware/xe.
>>=20
>> The GuC firmware can be found in the below location:
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.=
git/tree/i915
>>=20
>> The easiest way to setup firmware is:
>> cp -r /lib/firmware/i915 /lib/firmware/xe
>>=20
>> The code has been organized such that we have all patches that touch are=
as
>> outside of drm/xe first for review, and then the actual new driver in a =
separate
>> commit. The code which is outside of drm/xe is included in this RFC while
>> drm/xe is not due to the size of the commit. The drm/xe is code is avail=
able in
>> a public repo listed below.
>>=20
>> Xe driver commit:
>> https://cgit.freedesktop.org/drm/drm-xe/commit/?h=3Ddrm-xe-next&id=3D9cb=
016ebbb6a275f57b1cb512b95d5a842391ad7
>>=20
>> Xe kernel repo:
>> https://cgit.freedesktop.org/drm/drm-xe/
>>=20
>> There's a lot of work still to happen on Xe but we're very excited about=
 it and
>> wanted to share it early and welcome feedback and discussion.
>>=20
>> Cheers,
>> Matthew Brost
>>=20
>> [1] https://patchwork.freedesktop.org/series/105879/
>> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418
>>=20
>> Maarten Lankhorst (12):
>>    drm/amd: Convert amdgpu to use suballocation helper.
>>    drm/radeon: Use the drm suballocation manager implementation.
>>    drm/i915: Remove gem and overlay frontbuffer tracking
>>    drm/i915/display: Neuter frontbuffer tracking harder
>>    drm/i915/display: Add more macros to remove all direct calls to uncore
>>    drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
>>    drm/i915: Rename find_section to find_bdb_section
>>    drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
>>    drm/i915/display: Fix a use-after-free when intel_edp_init_connector
>>      fails
>>    drm/i915/display: Remaining changes to make xe compile
>>    sound/hda: Allow XE as i915 replacement for sound
>>    mei/hdcp: Also enable for XE
>>=20
>> Matthew Brost (5):
>>    drm/sched: Convert drm scheduler to use a work queue rather than
>>      kthread
>>    drm/sched: Add generic scheduler message interface
>>    drm/sched: Start run wq before TDR in drm_sched_start
>>    drm/sched: Submit job before starting TDR
>>    drm/sched: Add helper to set TDR timeout
>>=20
>> Thomas Hellstr=C3=B6m (3):
>>    drm/suballoc: Introduce a generic suballocation manager
>>    drm: Add a gpu page-table walker helper
>>    drm/ttm: Don't print error message if eviction was interrupted
>>=20
>>   drivers/gpu/drm/Kconfig                       |   5 +
>>   drivers/gpu/drm/Makefile                      |   4 +
>>   drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  12 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  23 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        | 320 +-----------------
>>   drivers/gpu/drm/drm_pt_walk.c                 | 159 +++++++++
>>   drivers/gpu/drm/drm_suballoc.c                | 301 ++++++++++++++++
>>   drivers/gpu/drm/i915/Makefile                 |   2 +-
>>   drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
>>   drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
>>   .../gpu/drm/i915/display/intel_atomic_plane.c |  25 +-
>>   .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
>>   drivers/gpu/drm/i915/display/intel_bios.c     |  71 ++--
>>   drivers/gpu/drm/i915/display/intel_bw.c       |  36 +-
>>   drivers/gpu/drm/i915/display/intel_cdclk.c    |  68 ++--
>>   drivers/gpu/drm/i915/display/intel_color.c    |   1 +
>>   drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
>>   drivers/gpu/drm/i915/display/intel_cursor.c   |  14 +-
>>   drivers/gpu/drm/i915/display/intel_de.h       |  38 +++
>>   drivers/gpu/drm/i915/display/intel_display.c  | 155 +++++++--
>>   drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
>>   .../gpu/drm/i915/display/intel_display_core.h |   5 +-
>>   .../drm/i915/display/intel_display_debugfs.c  |   8 +
>>   .../drm/i915/display/intel_display_power.c    |  40 ++-
>>   .../drm/i915/display/intel_display_power.h    |   6 +
>>   .../i915/display/intel_display_power_map.c    |   7 +
>>   .../i915/display/intel_display_power_well.c   |  24 +-
>>   .../drm/i915/display/intel_display_reg_defs.h |   4 +
>>   .../drm/i915/display/intel_display_trace.h    |   6 +
>>   .../drm/i915/display/intel_display_types.h    |  32 +-
>>   drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
>>   drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
>>   drivers/gpu/drm/i915/display/intel_dp_aux.c   |   6 +
>>   drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
>>   drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 +
>>   drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
>>   drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
>>   drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
>>   drivers/gpu/drm/i915/display/intel_dsb.c      | 124 +++++--
>>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 +-
>>   drivers/gpu/drm/i915/display/intel_fb.c       | 108 ++++--
>>   drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
>>   drivers/gpu/drm/i915/display/intel_fbc.c      |  49 ++-
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 +++++-
>>   .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 +-----
>>   .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +---
>>   drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
>>   drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
>>   drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 -
>>   .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
>>   .../drm/i915/display/intel_modeset_setup.c    |  11 +-
>>   drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
>>   drivers/gpu/drm/i915/display/intel_overlay.c  |  14 -
>>   .../gpu/drm/i915/display/intel_pch_display.h  |  16 +
>>   .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
>>   drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
>>   .../drm/i915/display/intel_plane_initial.c    |   3 +-
>>   drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
>>   drivers/gpu/drm/i915/display/intel_sprite.c   |  21 ++
>>   drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
>>   drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
>>   drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
>>   .../drm/i915/display/skl_universal_plane.c    |  52 ++-
>>   drivers/gpu/drm/i915/display/skl_watermark.c  |  25 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 -
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 --
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 --
>>   drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
>>   drivers/gpu/drm/i915/i915_driver.c            |   1 +
>>   drivers/gpu/drm/i915/i915_gem.c               |   8 -
>>   drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
>>   drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
>>   drivers/gpu/drm/i915/i915_vma.c               |  12 -
>>   drivers/gpu/drm/radeon/radeon.h               |  55 +--
>>   drivers/gpu/drm/radeon/radeon_ib.c            |  12 +-
>>   drivers/gpu/drm/radeon/radeon_object.h        |  25 +-
>>   drivers/gpu/drm/radeon/radeon_sa.c            | 314 ++---------------
>>   drivers/gpu/drm/radeon/radeon_semaphore.c     |   6 +-
>>   drivers/gpu/drm/scheduler/sched_main.c        | 182 +++++++---
>>   drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
>>   drivers/misc/mei/hdcp/Kconfig                 |   2 +-
>>   drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
>>   include/drm/drm_pt_walk.h                     | 161 +++++++++
>>   include/drm/drm_suballoc.h                    | 112 ++++++
>>   include/drm/gpu_scheduler.h                   |  41 ++-
>>   sound/hda/hdac_i915.c                         |  17 +-
>>   sound/pci/hda/hda_intel.c                     |  56 +--
>>   sound/soc/intel/avs/core.c                    |  13 +-
>>   sound/soc/sof/intel/hda.c                     |   7 +-
>>   98 files changed, 2076 insertions(+), 1325 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>>   create mode 100644 include/drm/drm_pt_walk.h
>>   create mode 100644 include/drm/drm_suballoc.h
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
