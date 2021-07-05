Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAD3BBDDB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 15:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A109A89804;
	Mon,  5 Jul 2021 13:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAE7289804
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 13:50:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB88AD6E;
 Mon,  5 Jul 2021 06:50:51 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36B133F694;
 Mon,  5 Jul 2021 06:50:48 -0700 (PDT)
Subject: Re: [PATCH v2] drm/panfrost:report the full raw fault information
 instead
To: Chunyou Tang <tangchunyou@163.com>
References: <20210617062054.1864-1-tangchunyou@163.com>
 <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
 <20210619111852.00003e52@163.com>
 <23f675e9-698d-840d-104f-33aa594dcb96@arm.com>
 <20210622094000.00004f7e@163.com>
 <04bc1306-f8a3-2e3c-b55d-030d1448fad2@arm.com>
 <20210625174937.0000183f@163.com>
 <14b2a3c8-4bc2-c8f9-627b-9ac5840cad11@arm.com>
 <20210629110453.00007ace@163.com>
 <3fe0e553-ac73-0d97-4404-c597fd4993a0@arm.com>
 <20210702094023.00006ba3@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3c68f653-708a-5de9-4227-2a8abc88dc74@arm.com>
Date: Mon, 5 Jul 2021 14:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702094023.00006ba3@163.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 02:40, Chunyou Tang wrote:
> Hi Steve,
>> You didn't answer my previous question:
>>
>>> Is this device working with the kbase/DDK proprietary driver?
> 
> I don't know whether I used kbase/DDK,I only know I used the driver of
> panfrost in linux 5.11.

kbase is the Linux kernel driver for Arm's proprietary driver. The
proprietary driver from Arm is often called "the [Mali] DDK" by Arm (or
"the blob" by others). I guess "libmali.so" is the closest it has to a
real name.

>> What you are describing sounds like a hardware integration issue, so
>> it would be good to check that the hardware is working with the
>> proprietary driver to rule that out. And perhaps there is something
>> in the kbase for this device that is setting a chicken bit to 'fix'
>> the coherency?
> 
> I don't have the proprietary driver,I only used driver in linux 5.11.

Interesting - I would have expected the initial hardware bring up to
have happened with the proprietary driver from Arm. And my first step
would be to check whether any workarounds for integration issues were
applied in the kernel.

I think we'd need some input from the people who did the hardware
integration, and hopefully they would have access to the proprietary
driver from Arm.

Steve

> Thinks very much!
> 
> Chunyou.
> 
> 
> ÓÚ Thu, 1 Jul 2021 11:15:14 +0100
> Steven Price <steven.price@arm.com> Ð´µÀ:
> 
>> On 29/06/2021 04:04, Chunyou Tang wrote:
> 
> 
>>> Hi Steve,
>>> 	thinks for your reply.
>>> 	I set the pte in arm_lpae_prot_to_pte(),
>>> ***********************************************************************
>>> 	/*
>>> 	 * Also Mali has its own notions of shareability wherein its
>>> Inner
>>> 	 * domain covers the cores within the GPU, and its Outer
>>> domain is
>>> 	 * "outside the GPU" (i.e. either the Inner or System
>>> domain in CPU
>>> 	 * terms, depending on coherency).
>>> 	 */
>>> 	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
>>> 		pte |= ARM_LPAE_PTE_SH_IS;
>>> 	else
>>> 		pte |= ARM_LPAE_PTE_SH_OS;
>>> ***********************************************************************
>>> I set pte |= ARM_LPAE_PTE_SH_NS.
>>>
>>> 	If I set pte to ARM_LPAE_PTE_SH_OS or
>>> 	ARM_LPAE_PTE_SH_IS,whether I use singel core GPU or multi
>>> core GPU,it will occur GPU Fault.
>>> 	if I set pte to ARM_LPAE_PTE_SH_NS,whether I use singel core
>>> 	GPU or multi core GPU,it will not occur GPU Fault.
>>
>> Hi,
>>
>> So this is a difference between Panfrost and kbase. Panfrost (well
>> technically the IOMMU framework) enables the inner-shareable bit for
>> all memory, whereas kbase only enables it for some memory types (the
>> BASE_MEM_COHERENT_LOCAL flag in the UABI controls it). However this
>> should only be a performance/power difference (and AFAIK probably an
>> irrelevant one) and it's definitely required that "inner shareable"
>> (i.e. within the GPU) works for communication between the different
>> units of the GPU.
>>
>> You didn't answer my previous question:
>>
>>> Is this device working with the kbase/DDK proprietary driver?
>>
>> What you are describing sounds like a hardware integration issue, so
>> it would be good to check that the hardware is working with the
>> proprietary driver to rule that out. And perhaps there is something
>> in the kbase for this device that is setting a chicken bit to 'fix'
>> the coherency?
>>
>> Steve
> 
> 

