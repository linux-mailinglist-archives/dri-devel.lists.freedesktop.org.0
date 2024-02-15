Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A853E855E46
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544A10E54C;
	Thu, 15 Feb 2024 09:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD11510E54C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:35:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 851A31FB;
 Thu, 15 Feb 2024 01:35:39 -0800 (PST)
Received: from [10.1.39.40] (e122027.cambridge.arm.com [10.1.39.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52C693F766;
 Thu, 15 Feb 2024 01:34:55 -0800 (PST)
Message-ID: <39438e11-b5c0-47af-9f09-66fb0621844e@arm.com>
Date: Thu, 15 Feb 2024 09:34:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] drm/panthor: Add the heap logical block
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-10-boris.brezillon@collabora.com>
 <e43ec7bb-1104-40b4-a031-3b6fa7be1eb4@arm.com>
 <20240214183339.1f690c9d@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240214183339.1f690c9d@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 14/02/2024 17:33, Boris Brezillon wrote:
> On Mon, 12 Feb 2024 11:40:55 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 22/01/2024 16:30, Boris Brezillon wrote:
>>> Tiler heap growing requires some kernel driver involvement: when the
>>> tiler runs out of heap memory, it will raise an exception which is
>>> either directly handled by the firmware if some free heap chunks are
>>> available in the heap context, or passed back to the kernel otherwise.
>>> The heap helpers will be used by the scheduler logic to allocate more
>>> heap chunks to a heap context, when such a situation happens.
>>>
>>> Heap context creation is explicitly requested by userspace (using
>>> the TILER_HEAP_CREATE ioctl), and the returned context is attached to a
>>> queue through some command stream instruction.
>>>
>>> All the kernel does is keep the list of heap chunks allocated to a
>>> context, so they can be freed when TILER_HEAP_DESTROY is called, or
>>> extended when the FW requests a new chunk.
>>>
>>> v4:
>>> - Rework locking to allow concurrent calls to panthor_heap_grow()
>>> - Add a helper to return a heap chunk if we couldn't pass it to the
>>>   FW because the group was scheduled out
>>>
>>> v3:
>>> - Add a FIXME for the heap OOM deadlock
>>> - Use the panthor_kernel_bo abstraction for the heap context and heap
>>>   chunks
>>> - Drop the panthor_heap_gpu_ctx struct as it is opaque to the driver
>>> - Ensure that the heap context is aligned to the GPU cache line size
>>> - Minor code tidy ups
>>>
>>> Co-developed-by: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
>>
>> It looks fine, but there's a confusing FIXME comment:
>>
>>> +	/* FIXME: panthor_alloc_heap_chunk() triggers a kernel BO creation, which
>>> +	 * relies on blocking allocations (both for the BO itself, and backing
>>> +	 * memory), which might cause a deadlock because we're called from a context
>>> +	 * where we hold the panthor scheduler lock, thus preventing job cleanups
>>> +	 * that could free up some memory. The jobs themselves will timeout, but
>>> +	 * we'll still be blocked there. The only solution here is to implement
>>> +	 * something similar to shmem_sg_alloc_table() in i915, so we can do
>>> +	 * non-blocking allocations, and just kill the job when we run out-of-memory
>>> +	 * for the tiler context.
>>> +	 */  
>>
>> Whereas at the call site (group_process_tiler_oom()) there's the comment:
>>
>>> 		/* We do the allocation without holding the scheduler lock to avoid
>>> 		 * blocking the scheduling.
>>> 		 */  
>>
>> AFAICT that FIXME comment can just be deleted now. Assuming you agree
>> then with that change:
> 
> The FIXME is no longer accurate indeed, but I'd like to keep a FIXME
> here to reflect the fact the solution we have is not the one we want, as
> it prevents the GPU from immediately falling back to the user provided
> OOM exception handler, or killing the job if there's no way it can
> reclaim tiler memory.
> 
> How about:
> 
> FIXME: panthor_alloc_heap_chunk() triggers a kernel BO creation, which
> goes through the blocking allocation path. Ultimately, we want
> a non-blocking allocation, so we can immediately report to the FW when
> the system is running out of memory. In that case, the FW can call a
> user-provided exception handler, which might try to free some tiler
> memory by issuing an intermediate fragment job. If the exception handler
> can't do anything, it will flag the queue as faulty so the job that
> triggered this tiler chunk allocation and all further jobs in this
> queue fail immediately instead of having to wait for the job
> timeout.

Sounds good - it was mostly the talk of deadlock that worried me. The
code as it stands is good enough for merging (as it's not going to
deadlock the kernel) but we can obviously look to improve the low-memory
behaviour in future.

Steve

>>
>> Reviewed-by: Steven Price <steven.price@arm.com>

