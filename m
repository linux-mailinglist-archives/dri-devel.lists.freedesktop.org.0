Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0B1C1154
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 13:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178826EC44;
	Fri,  1 May 2020 11:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 659086EC44
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 11:08:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF4A30E;
 Fri,  1 May 2020 04:08:53 -0700 (PDT)
Received: from [10.57.39.240] (unknown [10.57.39.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7C0A3F73D;
 Fri,  1 May 2020 04:08:50 -0700 (PDT)
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
To: Brian Starkey <brian.starkey@arm.com>, John Stultz <john.stultz@linaro.org>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
Date: Fri, 1 May 2020 12:08:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, nd@arm.com,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm@kvack.org, Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-01 11:21 am, Brian Starkey wrote:
> Hi John,
> 
> On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
>> This patch reworks the cma_heap initialization so that
>> we expose both the default CMA region and any CMA regions
>> tagged with "linux,cma-heap" in the device-tree.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Andrew F. Davis" <afd@ti.com>
>> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> Cc: Liam Mark <lmark@codeaurora.org>
>> Cc: Pratik Patel <pratikp@codeaurora.org>
>> Cc: Laura Abbott <labbott@redhat.com>
>> Cc: Brian Starkey <Brian.Starkey@arm.com>
>> Cc: Chenbo Feng <fengc@google.com>
>> Cc: Alistair Strachan <astrachan@google.com>
>> Cc: Sandeep Patil <sspatil@google.com>
>> Cc: Hridya Valsaraju <hridya@google.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: John Stultz <john.stultz@linaro.org>
>> ---
>>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>> index 626cf7fd033a..dd154e2db101 100644
>> --- a/drivers/dma-buf/heaps/cma_heap.c
>> +++ b/drivers/dma-buf/heaps/cma_heap.c
>> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
>>   {
>>   	struct cma_heap *cma_heap;
>>   	struct dma_heap_export_info exp_info;
>> +	struct cma *default_cma = dev_get_cma_area(NULL);
>> +
>> +	/* We only add the default heap and explicitly tagged heaps */
>> +	if (cma != default_cma && !cma_dma_heap_enabled(cma))
>> +		return 0;
> 
> Thinking about the pl111 thread[1], I'm wondering if we should also
> let drivers call this directly to expose their CMA pools, even if they
> aren't tagged for dma-heaps in DT. But perhaps that's too close to
> policy.

That sounds much like what my first thoughts were - apologies if I'm 
wildly off-base here, but as far as I understand:

- Device drivers know whether they have their own "memory-region" or not.
- Device drivers already have to do *something* to participate in dma-buf.
- Device drivers know best how they make use of both the above.
- Therefore couldn't it be left to drivers to choose whether to register 
their CMA regions as heaps, without having to mess with DT at all?

Robin.

> 
> Cheers,
> -Brian
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2020-April/264358.html
> 
>>   
>>   	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
>>   	if (!cma_heap)
>> @@ -162,16 +167,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
>>   	return 0;
>>   }
>>   
>> -static int add_default_cma_heap(void)
>> +static int cma_heaps_init(void)
>>   {
>> -	struct cma *default_cma = dev_get_cma_area(NULL);
>> -	int ret = 0;
>> -
>> -	if (default_cma)
>> -		ret = __add_cma_heap(default_cma, NULL);
>> -
>> -	return ret;
>> +	cma_for_each_area(__add_cma_heap, NULL);
>> +	return 0;
>>   }
>> -module_init(add_default_cma_heap);
>> +module_init(cma_heaps_init);
>>   MODULE_DESCRIPTION("DMA-BUF CMA Heap");
>>   MODULE_LICENSE("GPL v2");
>> -- 
>> 2.17.1
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
