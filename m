Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7498780D9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEAE112A87;
	Mon, 11 Mar 2024 13:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73535112A86
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 13:46:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F9DDFEC;
 Mon, 11 Mar 2024 06:46:59 -0700 (PDT)
Received: from [10.57.14.211] (unknown [10.57.14.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E0783F64C;
 Mon, 11 Mar 2024 06:46:21 -0700 (PDT)
Message-ID: <4f4552fe-e2b7-44d0-9d46-448be908472c@arm.com>
Date: Mon, 11 Mar 2024 13:46:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
Content-Language: en-GB
To: Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
 <87il1tt4f6.fsf@intel.com> <20240311124634.2ee63052@collabora.com>
 <87frwxt2cb.fsf@intel.com> <20240311125259.6bf317a5@collabora.com>
 <fbaed280-74bb-431c-8bc4-7b0c570a39b3@arm.com>
 <20240311142236.05139059@collabora.com>
 <6bb76bfe-2be8-4724-a5db-34a779e571ad@arm.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <6bb76bfe-2be8-4724-a5db-34a779e571ad@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/03/2024 13:36, Robin Murphy wrote:
> On 2024-03-11 1:22 pm, Boris Brezillon wrote:
>> On Mon, 11 Mar 2024 13:11:28 +0000
>> Robin Murphy <robin.murphy@arm.com> wrote:
>>
>>> On 2024-03-11 11:52 am, Boris Brezillon wrote:
>>>> On Mon, 11 Mar 2024 13:49:56 +0200
>>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>   
>>>>> On Mon, 11 Mar 2024, Boris Brezillon
>>>>> <boris.brezillon@collabora.com> wrote:
>>>>>> On Mon, 11 Mar 2024 13:05:01 +0200
>>>>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>>>     
>>>>>>> This breaks the config for me:
>>>>>>>
>>>>>>>     SYNC    include/config/auto.conf.cmd
>>>>>>>     GEN     Makefile
>>>>>>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
>>>>>>> drivers/iommu/Kconfig:14:    symbol IOMMU_SUPPORT is selected by
>>>>>>> DRM_PANTHOR
>>>>>>> drivers/gpu/drm/panthor/Kconfig:3:    symbol DRM_PANTHOR depends
>>>>>>> on PM
>>>>>>> kernel/power/Kconfig:183:    symbol PM is selected by PM_SLEEP
>>>>>>> kernel/power/Kconfig:117:    symbol PM_SLEEP depends on
>>>>>>> HIBERNATE_CALLBACKS
>>>>>>> kernel/power/Kconfig:35:    symbol HIBERNATE_CALLBACKS is
>>>>>>> selected by XEN_SAVE_RESTORE
>>>>>>> arch/x86/xen/Kconfig:67:    symbol XEN_SAVE_RESTORE depends on XEN
>>>>>>> arch/x86/xen/Kconfig:6:    symbol XEN depends on PARAVIRT
>>>>>>> arch/x86/Kconfig:781:    symbol PARAVIRT is selected by HYPERV
>>>>>>> drivers/hv/Kconfig:5:    symbol HYPERV depends on X86_LOCAL_APIC
>>>>>>> arch/x86/Kconfig:1106:    symbol X86_LOCAL_APIC depends on
>>>>>>> X86_UP_APIC
>>>>>>> arch/x86/Kconfig:1081:    symbol X86_UP_APIC prompt is visible
>>>>>>> depending on PCI_MSI
>>>>>>> drivers/pci/Kconfig:39:    symbol PCI_MSI is selected by AMD_IOMMU
>>>>>>> drivers/iommu/amd/Kconfig:3:    symbol AMD_IOMMU depends on
>>>>>>> IOMMU_SUPPORT
>>>>>>
>>>>>> Uh, I guess we want a "depends on IOMMU_SUPPORT" instead of "select
>>>>>> IOMMU_SUPPORT" in panthor then.
>>>>>
>>>>> That works for me.
>>>>
>>>> Let's revert the faulty commit first. We'll see if Steve has a
>>>> different solution for the original issue.
>>>
>>> FWIW, the reasoning in the offending commit seems incredibly tenuous.
>>> There are far more practical reasons for building an arm/arm64 kernel
>>> without PM - for debugging or whatever, and where one may even still
>>> want a usable GPU, let alone just a non-broken build - than there are
>>> for building this driver for x86. Using pm_ptr() is trivial, and if you
>>> want to support COMPILE_TEST then there's really no justifiable excuse
>>> not to.
>>
>> The problem is not just about using pm_ptr(), but also making sure
>> panthor_device_resume/suspend() are called called in the init/unplug
>> path when !PM, as I don't think the PM helpers automate that for us. I
>> was just aiming for a simple fix that wouldn't force me to test the !PM
>> case...
> Fair enough, at worst we could always have a runtime check and refuse to
> probe in conditions we don't think are worth the bother of implementing
> fully-functional support for. However if we want to make an argument for
> only supporting "realistic" configs at build time then that is an
> argument for dropping COMPILE_TEST as well.

Can we just replace the "depends on PM" with "select PM"? In my
(admittedly very limited) testing this works. Otherwise I think we need
to bite the bullet and support !PM in some way (maybe just as Robin
suggests with a runtime bail out).

Steve

