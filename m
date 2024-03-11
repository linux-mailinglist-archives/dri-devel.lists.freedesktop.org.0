Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B690878051
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A74C11214A;
	Mon, 11 Mar 2024 13:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD08211214A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 13:11:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C64B7FEC;
 Mon, 11 Mar 2024 06:12:08 -0700 (PDT)
Received: from [10.57.49.244] (unknown [10.57.49.244])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD6CB3F64C;
 Mon, 11 Mar 2024 06:11:30 -0700 (PDT)
Message-ID: <fbaed280-74bb-431c-8bc4-7b0c570a39b3@arm.com>
Date: Mon, 11 Mar 2024 13:11:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 kernel test robot <lkp@intel.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
 <87il1tt4f6.fsf@intel.com> <20240311124634.2ee63052@collabora.com>
 <87frwxt2cb.fsf@intel.com> <20240311125259.6bf317a5@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20240311125259.6bf317a5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2024-03-11 11:52 am, Boris Brezillon wrote:
> On Mon, 11 Mar 2024 13:49:56 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
>> On Mon, 11 Mar 2024, Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>> On Mon, 11 Mar 2024 13:05:01 +0200
>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>   
>>>> This breaks the config for me:
>>>>
>>>>    SYNC    include/config/auto.conf.cmd
>>>>    GEN     Makefile
>>>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
>>>> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
>>>> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
>>>> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
>>>> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
>>>> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
>>>> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
>>>> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
>>>> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
>>>> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
>>>> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
>>>> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
>>>> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
>>>> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
>>>
>>> Uh, I guess we want a "depends on IOMMU_SUPPORT" instead of "select
>>> IOMMU_SUPPORT" in panthor then.
>>
>> That works for me.
> 
> Let's revert the faulty commit first. We'll see if Steve has a
> different solution for the original issue.

FWIW, the reasoning in the offending commit seems incredibly tenuous. 
There are far more practical reasons for building an arm/arm64 kernel 
without PM - for debugging or whatever, and where one may even still 
want a usable GPU, let alone just a non-broken build - than there are 
for building this driver for x86. Using pm_ptr() is trivial, and if you 
want to support COMPILE_TEST then there's really no justifiable excuse 
not to.

Thanks,
Robin.
