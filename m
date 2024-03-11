Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38B877E97
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37B410EC50;
	Mon, 11 Mar 2024 11:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtQKSP92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F3310E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710155109; x=1741691109;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+0CFRTVCmdllSQEqlwPLJALRdHRM3FhUCth1fNwRTHg=;
 b=MtQKSP92mddW2wlHXY5IsJtF/Ujqd2a6bCRHmxdy17ZVrJDRGwTHvk7X
 xsTZxNCVy65W3Wa5IDniBc4Cnra3FGk8+fyStaC4aG+xPbAUwWy0u2Zj1
 wnAavBvQjHN1cD1uX85z0ANWyOjC9y7dobx+qqRve/4i7JeWyDS2Y+Ld9
 wcgMCbC7KOYMJz1OvgXv45iEDJhwyq5BArADfA8TTzzeFir93Y7PswfWI
 C0cRwIuD4e5uL/Ah89yDLsOcS+h1bitQYrZuGIemMpoUbOg97kE7Vn9G5
 gsGQ1K9gdQ1bvH1BrhKjsZ4C9QOpUt0WvleX4CXpOOFN/tQ2+8v/dmyDF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16212089"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="16212089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15776686"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:05:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
In-Reply-To: <20240304090812.3941084-4-boris.brezillon@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
Date: Mon, 11 Mar 2024 13:05:01 +0200
Message-ID: <87il1tt4f6.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> panthor_device_resume/suspend() are only compiled when CONFIG_PM is
> enabled but panthro_drv.c doesn't use the pm_ptr() macro to conditionally
> discard resume/suspend assignments, which causes undefined symbol
> errors at link time when !PM.
>
> We could fix that by using pm_ptr(), but supporting the !PM case makes
> little sense (the whole point of these embedded GPUs is to be low power,
> so proper PM is a basic requirement in that case). So let's just enforce
> the presence of CONFIG_PM with a Kconfig dependency instead.
>
> If someone needs to relax this dependency, it can be done in a follow-up.

This breaks the config for me:

  SYNC    include/config/auto.conf.cmd
  GEN     Makefile
drivers/iommu/Kconfig:14:error: recursive dependency detected!
drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"


BR,
Jani.


>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/Kconfig          | 1 +
>  drivers/gpu/drm/panthor/panthor_device.c | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> index 55b40ad07f3b..fdce7c1b2310 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -6,6 +6,7 @@ config DRM_PANTHOR
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
>  	depends on MMU
> +	depends on PM
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 68e467ee458a..efea29143a54 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -403,7 +403,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
>  int panthor_device_resume(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> @@ -548,4 +547,3 @@ int panthor_device_suspend(struct device *dev)
>  	mutex_unlock(&ptdev->pm.mmio_lock);
>  	return ret;
>  }
> -#endif

-- 
Jani Nikula, Intel
