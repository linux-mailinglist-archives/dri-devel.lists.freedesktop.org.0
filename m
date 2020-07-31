Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A423A0DB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D710589BB3;
	Mon,  3 Aug 2020 08:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id A030E6EA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:32:44 +0000 (UTC)
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 31 Jul 2020 18:32:42 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 4118360060;
 Fri, 31 Jul 2020 18:32:42 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP;
 Fri, 31 Jul 2020 18:32:42 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
 by iyokan.css.socionext.com (Postfix) with ESMTP id 1A69A40327;
 Fri, 31 Jul 2020 18:32:42 +0900 (JST)
Received: from [10.212.6.48] (unknown [10.212.6.48])
 by yuzu.css.socionext.com (Postfix) with ESMTP id 79B53120498;
 Fri, 31 Jul 2020 18:32:41 +0900 (JST)
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To: John Stultz <john.stultz@linaro.org>
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
Date: Fri, 31 Jul 2020 18:32:41 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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

Hi John,
Thank you for your comment.

On 2020/07/29 4:17, John Stultz wrote:
> On Thu, Jul 16, 2020 at 6:10 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
>>
>> Current dma-buf heaps can handle only default CMA. This introduces
>> dma_heap_add_cma() function to attach CMA heaps that belongs to a device.
>>
>> At first, the driver calls of_reserved_mem_device_init() to set
>> memory-region property associated with reserved-memory defined as CMA
>> to the device. And when the driver calls this dma_heap_add_cma(),
>> the CMA will be added to dma-buf heaps.
>>
>> For example, prepare CMA node named "linux,cma@10000000" and
>> specify the node for memory-region property. After the above calls
>> in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
>> associated with the CMA become available as dma-buf heaps.
>>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>>   drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++++
>>   include/linux/dma-heap.h         |  9 +++++++++
>>   2 files changed, 21 insertions(+)
> 
> Hey! Sorry for the slow response on this! I just realized I never replied!

I waited but no problem.

> 
>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>> index 626cf7f..5d2442e 100644
>> --- a/drivers/dma-buf/heaps/cma_heap.c
>> +++ b/drivers/dma-buf/heaps/cma_heap.c

[snip]

>> --
>> 2.7.4
> 
> Looks sane to me.  Being able to expose different multiple CMA heaps
> is needed, and I agree this way (as opposed to my earlier dts
> appraoch) is probably the best approach. The only bit I'm so-so on is
> adding the CMA heap specific call in the dma-heap.h, but at the same
> time I can't justify adding a whole new header for a single function.

I'm also a little worried about whether "CMA specific" call is in
the dma-heap.h, however I can't find another solution.

> Do you have a upstream driver that you plan to make use this new call?

Unfortunately I don't have an upstream driver using this call.

This call is called from dma-buf heaps "importer" or "customer",
and I only made an example (do nothing) importer driver
to test the call.

> We want to have in-tree users of code added.

I think this is a generic way to use non-default CMA heaps, however,
we need in-tree "importer" drivers to want to use non-default CMA heaps.
I don't find it from now.

> But if so, feel free to add my:
>    Acked-by: John Stultz <john.stultz@linaro.org>
> To this patch when you submit the driver changes.

Thank you,

---
Best Regards
Kunihiko Hayashi

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
