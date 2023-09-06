Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5185A793A6D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A359610E5FA;
	Wed,  6 Sep 2023 10:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 876FD10E5FB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:55:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B9A81063;
 Wed,  6 Sep 2023 03:56:13 -0700 (PDT)
Received: from [10.57.93.3] (unknown [10.57.93.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 287893F7F4;
 Wed,  6 Sep 2023 03:55:33 -0700 (PDT)
Message-ID: <f41019ef-ab68-3b4b-6f92-e3127e57c221@arm.com>
Date: Wed, 6 Sep 2023 11:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/15] drm/panthor: Add uAPI
To: Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-3-boris.brezillon@collabora.com>
 <20230901181039.417c9753@collabora.com>
 <fe1bd580-2c3e-555a-0c1f-34a9ac4bdf9a@arm.com>
 <20230904112609.2e0466a5@collabora.com>
 <6f49ff37-0c39-35b3-f78b-02b69a3dcbd0@arm.com>
 <20230904181634.5871dfa3@collabora.com>
 <50a9bd68-2446-0cd4-f4dd-b3257af1ed8e@arm.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <50a9bd68-2446-0cd4-f4dd-b3257af1ed8e@arm.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/09/2023 17:25, Robin Murphy wrote:
> On 2023-09-04 17:16, Boris Brezillon wrote:
>> On Mon, 4 Sep 2023 16:22:19 +0100
>> Steven Price <steven.price@arm.com> wrote:
>>
>>> On 04/09/2023 10:26, Boris Brezillon wrote:
>>>> On Mon, 4 Sep 2023 08:42:08 +0100
>>>> Steven Price <steven.price@arm.com> wrote:
>>>>   
>>>>> On 01/09/2023 17:10, Boris Brezillon wrote:
>>>>>> On Wed,  9 Aug 2023 18:53:15 +0200
>>>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>>>     
>>>>>>> +/**
>>>>>>> + * DOC: MMIO regions exposed to userspace.
>>>>>>> + *
>>>>>>> + * .. c:macro:: DRM_PANTHOR_USER_MMIO_OFFSET
>>>>>>> + *
>>>>>>> + * File offset for all MMIO regions being exposed to userspace.
>>>>>>> Don't use
>>>>>>> + * this value directly, use DRM_PANTHOR_USER_<name>_OFFSET
>>>>>>> values instead.
>>>>>>> + *
>>>>>>> + * .. c:macro:: DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET
>>>>>>> + *
>>>>>>> + * File offset for the LATEST_FLUSH_ID register. The Userspace
>>>>>>> driver controls
>>>>>>> + * GPU cache flushling through CS instructions, but the flush
>>>>>>> reduction
>>>>>>> + * mechanism requires a flush_id. This flush_id could be queried
>>>>>>> with an
>>>>>>> + * ioctl, but Arm provides a well-isolated register page
>>>>>>> containing only this
>>>>>>> + * read-only register, so let's expose this page through a
>>>>>>> static mmap offset
>>>>>>> + * and allow direct mapping of this MMIO region so we can avoid the
>>>>>>> + * user <-> kernel round-trip.
>>>>>>> + */
>>>>>>> +#define DRM_PANTHOR_USER_MMIO_OFFSET        (0x1ull << 56)
>>>>>>
>>>>>> I'm playing with a 32-bit kernel/userspace, and this is problematic,
>>>>>> because vm_pgoff is limited to 32-bit there, meaning we can only
>>>>>> map up
>>>>>> to (1ull << (PAGE_SHIFT + 32)) - 1. Should we add a DEV_QUERY to let
>>>>>> userspace set the mmio range?
>>>>>
>>>>> Hmm, I was rather hoping we could ignore 32 bit these days ;) But
>>>>> while
>>>>> I can't see why anyone would be running a 32 bit kernel, I guess 32
>>>>> bit
>>>>> user space is likely to still be needed.
>>>>
>>>> Uh, I just hit a new problem with 32-bit kernels: the io-pgtable
>>>> interface (io_pgtable_ops) passes device VAs as unsigned longs, meaning
>>>> the GPU VA space is limited to 4G on a 32-bit build :-(. Robin, any
>>>> chance you could advise me on what to do here?
>>>>
>>>> 1. assume this limitation is here for a good reason, and limit the GPU
>>>> VA space to 32-bits on 32-bit kernels
>>>>
>>>> or
>>>>
>>>> 2. update the interface to make iova an u64
>>>
>>> I'm not sure I can answer the question from a technical perspective,
>>> hopefully Robin will be able to.
>>
>> Had a quick chat with Robin, and he's recommending going for #1 too.
>>
>>>
>>> But why do we care about 32-bit kernels on a platform which is new
>>> enough to have a CSF-GPU (and by extension a recent 64-bit CPU)?
>>
>> Apparently the memory you save by switching to a 32-bit kernel matters
>> to some people. To clarify, the CPU is aarch64, but they want to use it
>> in 32-bit mode.
>>
>>>
>>> Given the other limitations present in a 32-bit kernel I'd be tempted to
>>> say '1' just for simplicity. Especially since apparently we've lived
>>> with this for panfrost which presumably has the same limitation (even
>>> though all Bifrost/Midgard GPUs have at least 33 bits of VA space).
>>
>> Well, Panfrost is simpler in that you don't have this kernel VA range,
>> and, IIRC, we are using the old format that naturally limits the GPU VA
>> space to 4G.
> 
> FWIW the legacy pagetable format itself should be fine going up to
> however many bits the GPU supports, however there were various ISA
> limitations around crossing 4GB boundaries, and the easiest way to avoid
> having to think about those was to just not use more than 4GB of VA at
> all (minus chunks at the ends for similar weird ISA reasons).

Exactly right. The legacy pagetable format supports the full range of
VA. Indeed kbase used the legacy format for a long time.

However the ISA has special handling for addresses where bits 31:12 are
all 0 or all 1, so we have to avoid executable code landing on these
regions. kbase has a modified version of 'unmapped_area_topdown'[1] to
handle these additional restrictions.

Steve

[1] kbase_unmapped_area_topdown()
https://android.googlesource.com/kernel/google-modules/gpu/+/refs/tags/android-12.0.0_r0.42/mali_kbase/thirdparty/mali_kbase_mmap.c#97
