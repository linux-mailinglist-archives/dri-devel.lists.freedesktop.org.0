Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62B30BF01
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 14:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576826E176;
	Tue,  2 Feb 2021 13:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CFA6E128;
 Tue,  2 Feb 2021 13:06:36 +0000 (UTC)
IronPort-SDR: 2yOmFB3+rQzkjjanrj13V1PLlWxyZkptZXhE4m9qnqW36C8iTlcyrCVe33ca6Nr4Prvol5+rHC
 C1vovEqtRqiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160614612"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="160614612"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 05:06:28 -0800
IronPort-SDR: CwygyQfovBWhBWnsFwL8nvmTmTDt3mhxjEYnWqQLzPGDMPr+rgp+mLowuYyv7WEpqqa1LtFGU7
 w3KDUwORfUZQ==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="391456560"
Received: from amishuti-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.46.139])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 05:06:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, chris@chris-wilson.co.uk
Subject: Re: [PATCH v6 0/5] drm: Move struct drm_device.pdev to legacy
In-Reply-To: <20210128133127.2311-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210128133127.2311-1-tzimmermann@suse.de>
Date: Tue, 02 Feb 2021 15:06:21 +0200
Message-ID: <87v9bafwky.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Jan 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> V6 of the patchset fixes i915/selftests to do the assigment of pdev
> in a later patch. This was forgotten in v5.
>
> The pdev field in struct drm_device points to a PCI device structure and
> goes back to UMS-only days when all DRM drivers were for PCI devices.
> Meanwhile we also support USB, SPI and platform devices. Each of those
> uses the generic device stored in struct drm_device.dev.
>
> To reduce duplication and remove the special case of PCI, this patchset
> converts all modesetting drivers from pdev to dev and makes pdev a field
> for legacy UMS drivers.
>
> For PCI devices, the pointer in struct drm_device.dev can be upcasted to
> struct pci_device; or tested for PCI with dev_is_pci(). In several places
> the code can use the dev field directly.
>
> After converting all drivers and the DRM core, the pdev fields becomes
> only relevant for legacy drivers. In a later patchset, we may want to
> convert these as well and remove pdev entirely.

Pushed patches 1-3 to topic branch topic/drm-device-pdev, and merged it
to drm-intel-next [1]. Joonas will merge it to drm-intel-gt-next. Let's
sort out patches 4-5 after the merge window.

Thanks for the patches.

BR,
Jani.


[1] http://lore.kernel.org/r/87y2g6fxxv.fsf@intel.com



>
> v6:
> 	* also remove assignment in i915/selftests in later patch (Chris)
> v5:
> 	* remove assignment in later patch (Chris)
> v4:
> 	* merged several patches
> 	* moved core changes into separate patch
> 	* vmwgfx build fix
> v3:
> 	* merged several patches
> 	* fix one pdev reference in nouveau (Jeremy)
> 	* rebases
> v2:
> 	* move whitespace fixes into separate patches (Alex, Sam)
> 	* move i915 gt/ and gvt/ changes into separate patches (Joonas)
>
> Thomas Zimmermann (5):
>   drm/i915: Remove references to struct drm_device.pdev
>   drm/i915/gt: Remove references to struct drm_device.pdev
>   drm/i915/gvt: Remove references to struct drm_device.pdev
>   drm/i915: Don't assign to struct drm_device.pdev
>   drm: Move struct drm_device.pdev to legacy section
>
>  drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++++++-------
>  drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
>  .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +++--
>  drivers/gpu/drm/i915/display/intel_opregion.c |  6 +++---
>  drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    |  4 ++--
>  drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
>  drivers/gpu/drm/i915/display/intel_vga.c      |  8 ++++----
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +++---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +++++-----
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  8 ++++----
>  drivers/gpu/drm/i915/gt/intel_reset.c         |  6 +++---
>  drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 +++--
>  drivers/gpu/drm/i915/gvt/firmware.c           | 10 +++++-----
>  drivers/gpu/drm/i915/gvt/gtt.c                | 12 +++++------
>  drivers/gpu/drm/i915/gvt/gvt.c                |  6 +++---
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 ++--
>  drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
>  drivers/gpu/drm/i915/i915_drv.c               | 20 +++++++++----------
>  drivers/gpu/drm/i915/i915_drv.h               |  2 +-
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  5 ++---
>  drivers/gpu/drm/i915/i915_getparam.c          |  5 +++--
>  drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
>  drivers/gpu/drm/i915/i915_irq.c               |  6 +++---
>  drivers/gpu/drm/i915/i915_pmu.c               |  2 +-
>  drivers/gpu/drm/i915/i915_suspend.c           |  4 ++--
>  drivers/gpu/drm/i915/i915_switcheroo.c        |  4 ++--
>  drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
>  drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
>  drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
>  drivers/gpu/drm/i915/intel_uncore.c           |  4 ++--
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
>  include/drm/drm_device.h                      |  6 +++---
>  43 files changed, 100 insertions(+), 101 deletions(-)
>
>
> base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> --
> 2.30.0
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
