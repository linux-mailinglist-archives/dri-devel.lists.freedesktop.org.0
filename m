Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13124E680
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374876E43F;
	Sat, 22 Aug 2020 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id 527A16EAB5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 09:14:05 +0000 (UTC)
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 21 Aug 2020 18:14:02 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 0634C18006E;
 Fri, 21 Aug 2020 18:14:03 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Fri, 21 Aug 2020 18:14:03 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
 by kinkan.css.socionext.com (Postfix) with ESMTP id BBB8B1A0508;
 Fri, 21 Aug 2020 18:14:02 +0900 (JST)
Received: from [10.212.1.43] (unknown [10.212.1.43])
 by yuzu.css.socionext.com (Postfix) with ESMTP id 30198120137;
 Fri, 21 Aug 2020 18:14:02 +0900 (JST)
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To: John Stultz <john.stultz@linaro.org>
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
 <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
 <CALAqxLVzUnc5CH_pA7h3ygXFPRz05KtNZx+_M3eAXXrm7hhGBQ@mail.gmail.com>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <377e6e65-0b44-ecd0-cfc5-6fbc82be35d5@socionext.com>
Date: Fri, 21 Aug 2020 18:14:01 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLVzUnc5CH_pA7h3ygXFPRz05KtNZx+_M3eAXXrm7hhGBQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/08/01 4:38, John Stultz wrote:
> On Fri, Jul 31, 2020 at 2:32 AM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
>> On 2020/07/29 4:17, John Stultz wrote:
>>> Do you have a upstream driver that you plan to make use this new call?
>>
>> Unfortunately I don't have an upstream driver using this call.
>>
>> This call is called from dma-buf heaps "importer" or "customer",
>> and I only made an example (do nothing) importer driver
>> to test the call.
>>
>>> We want to have in-tree users of code added.
>>
>> I think this is a generic way to use non-default CMA heaps, however,
>> we need in-tree "importer" drivers to want to use non-default CMA heaps.
>> I don't find it from now.
>>
> 
> Yea, I and again, I do agree this is functionality that will be
> needed. But we'll need to wait for a user (camera driver, etc which
> would utilize the reserved cma region) before we can merge it
> upstream. :(  Do let me know if you have an out of tree driver that
> would make use of it, and we can see what can be done to help upstream
> things.

Sorry for late.
Before I prepare or find a user driver as "importer",
I think something is different in this patch.

This patch makes it possible to treat non-default CMA connected to
"importer" device with memory-region as dma-buf heaps.

However, the allocated memory from this dma-buf heaps can be used
for "any" devices, and the "importer" can treat memories from other
dma-buf heaps.

So, the "importer" and the non-default CMA aren't directly related,
and I think an "exporter" for the non-default CMA should be enabled.

In paticular, the kernel initializer (as an "exporter") calls
dma_heap_add_cma() for all CMAs defined in Devicetree, and
the device files associated with each CMA appear under "/dev/dma_heap/".
For example:

    /dev/dma_heap/linux,cma@10000000
    /dev/dma_heap/linux,cma@11000000
    /dev/dma_heap/linux,cma@12000000
    ...

All of these device files can be fairly allocated to any "importer" device.

Actually I think that the kernel should executes dma_heap_add_cma()
for ALL defined reserved-memory nodes.

If this idea hasn't been discussed yet and this is reasonable,
I'll prepare RFC patches.

Thank you,

---
Best Regards
Kunihiko Hayashi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
