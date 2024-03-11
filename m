Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61699877F56
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157311242C;
	Mon, 11 Mar 2024 11:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5Nkehqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B48E11242C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710157911; x=1741693911;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=S8SFqwQcCSsSd6iPyFm2G8fl0Me2jLRYG3txTdX5Lr0=;
 b=M5NkehqvzhtDpmBCLAqS5OdgEcBqqywdy8o39I2avzCALRmqA+29JzmH
 ItLEJbhaesN2sggtimuMzKrIIKOyJuyIfgvIyV427+FCAcBODc40BPymL
 H20nO2M6xl+aZo71qTXKU7QZ2Vnd/JeJvpA05kI8g4y9I4eQrv0nZ9bgZ
 vzvwDUo17JrCh4ILAY3HKGGPb0BO4KfapSDe8qbtSHB6SERlBjRef2UQz
 dfq5/rIhSJNP6oW9X8ZAJVXjBvJJRsreX+rDW05DXXg+CyiE9A9uIk+v4
 bezpHmBW0ggbEQyeDoxMT+f6aQm/LnDJlgyN86/AmM62FUIzDKff2uRge A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8568987"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8568987"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="42123527"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:51:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
In-Reply-To: <20240311124826.44cc69ba@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240311111619.249776-1-jani.nikula@intel.com>
 <20240311124826.44cc69ba@collabora.com>
Date: Mon, 11 Mar 2024 13:51:46 +0200
Message-ID: <87cys1t299.fsf@intel.com>
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

On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> On Mon, 11 Mar 2024 13:16:19 +0200
> Jani Nikula <jani.nikula@intel.com> wrote:
>
>> This reverts commit 674dc7f61aefea81901c21402946074927e63f1a.
>> 
>> The commit causes a recursive dependency in kconfig:
>> 
>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
>> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
>> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
>> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
>> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
>> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
>> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
>> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
>> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
>> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
>> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
>> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
>> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
>> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
>> For a resolution refer to Documentation/kbuild/kconfig-language.rst
>> subsection "Kconfig recursive dependency limitations"
>> 
>> Fixes: 674dc7f61aef ("drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue")
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Steven Price <steven.price@arm.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

Your suggestion select -> depends on IOMMU_SUPPORT seems to also work,
at least for me. Want to send a patch for that instead of me merging the
revert?

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/panthor/Kconfig          | 1 -
>>  drivers/gpu/drm/panthor/panthor_device.c | 2 ++
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
>> index fdce7c1b2310..55b40ad07f3b 100644
>> --- a/drivers/gpu/drm/panthor/Kconfig
>> +++ b/drivers/gpu/drm/panthor/Kconfig
>> @@ -6,7 +6,6 @@ config DRM_PANTHOR
>>  	depends on ARM || ARM64 || COMPILE_TEST
>>  	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
>>  	depends on MMU
>> -	depends on PM
>>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>>  	select DRM_EXEC
>>  	select DRM_GEM_SHMEM_HELPER
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 083888b48591..69deb8e17778 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -402,6 +402,7 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>>  	return 0;
>>  }
>>  
>> +#ifdef CONFIG_PM
>>  int panthor_device_resume(struct device *dev)
>>  {
>>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
>> @@ -546,3 +547,4 @@ int panthor_device_suspend(struct device *dev)
>>  	mutex_unlock(&ptdev->pm.mmio_lock);
>>  	return ret;
>>  }
>> +#endif
>

-- 
Jani Nikula, Intel
