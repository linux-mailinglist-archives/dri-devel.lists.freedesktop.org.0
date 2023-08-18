Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E109D780617
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA9510E46A;
	Fri, 18 Aug 2023 07:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-36.mta0.migadu.com (out-36.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7A10E46A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:05:31 +0000 (UTC)
Message-ID: <a1ad6a41-edd0-1201-c537-68693d5b70e6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692342329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jv+O91aJKOY8Oa1uiqnwHLxjtat+AR7MEL0TnmE0b24=;
 b=t2VAUZ/03p433tyvzSI/43v6e2AbSGWAj8MxYeOybMl7YnRaVl2x7cj/71xMqWMRKgtL5v
 gDTi48YCNm6X+Zx7LdxDdJqLYzdh7lfvVT1qlpkHtDEsYVQFpWK4DfMUfninCzwp/lvXbw
 99BmTYaes3N1P4mgadXNBtLHpTk2S6Q=
Date: Fri, 18 Aug 2023 15:05:14 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] scatterlist: Add sg_set_folio()
To: Matthew Wilcox <willy@infradead.org>
References: <20230621164557.3510324-1-willy@infradead.org>
 <20230621164557.3510324-4-willy@infradead.org>
 <a2a2180c-62ac-452f-0737-26f01f228c79@linux.dev>
 <ZMZHH5Xc507OZA1O@casper.infradead.org>
 <40a3ab47-da3e-0d08-b3fa-b4663f3e727d@linux.dev>
 <ZMbZVjMaIeI1DSj9@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <ZMbZVjMaIeI1DSj9@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2023/7/31 5:42, Matthew Wilcox 写道:
> On Sun, Jul 30, 2023 at 09:57:06PM +0800, Zhu Yanjun wrote:
>> 在 2023/7/30 19:18, Matthew Wilcox 写道:
>>> On Sun, Jul 30, 2023 at 07:01:26PM +0800, Zhu Yanjun wrote:
>>>> Does the following function have folio version?
>>>>
>>>> "
>>>> int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
>>>> 		struct page **pages, unsigned int n_pages, unsigned int offset,
>>>> 		unsigned long size, unsigned int max_segment,
>>>> 		unsigned int left_pages, gfp_t gfp_mask)
>>>> "
>>> No -- I haven't needed to convert anything that uses
>>> sg_alloc_append_table_from_pages() yet.  It doesn't look like it should
>>> be _too_ hard to add a folio version.
>> In many places, this function is used. So this function needs the folio
>> version.
> It's not used in very many places.  But the first one that I see it used
> (drivers/infiniband/core/umem.c), you can't do a straightforward folio
> conversion:
>
>                  pinned = pin_user_pages_fast(cur_base,
>                                            min_t(unsigned long, npages,
>                                                  PAGE_SIZE /
>                                                  sizeof(struct page *)),
>                                            gup_flags, page_list);
> ...
>                  ret = sg_alloc_append_table_from_pages(
>                          &umem->sgt_append, page_list, pinned, 0,
>                          pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
>                          npages, GFP_KERNEL);
>
> That can't be converted to folios.  The GUP might start in the middle of
> the folio, and we have no way to communicate that.
>
> This particular usage really needs the phyr work that Jason is doing so
> we can efficiently communicate physically contiguous ranges from GUP
> to sg.

Hi, Matthew

Thanks. To the following function, it seems that no folio function 
replace vmalloc_to_page.

vmalloc_to_page calls virt_to_page to get page. Finally the followings 
will be called.

"
(mem_map + ((pfn) - ARCH_PFN_OFFSET))

"

And I do not find the related folio functions with vmalloc_to_page.

And no folio function replaces dma_map_page.

dma_map_page will call dma_map_page_attrs.

Or these 2 function should not be replaced with folio functions?

int irdma_map_vm_page_list(struct irdma_hw *hw, void *va, dma_addr_t 
*pg_dma,

                            u32 pg_cnt)
{
         struct page *vm_page;
         int i;
         u8 *addr;

         addr = (u8 *)(uintptr_t)va;
         for (i = 0; i < pg_cnt; i++) {
                 vm_page = vmalloc_to_page(addr);
                 if (!vm_page)
                         goto err;

                 pg_dma[i] = dma_map_page(hw->device, vm_page, 0, PAGE_SIZE,
                                          DMA_BIDIRECTIONAL);
                 if (dma_mapping_error(hw->device, pg_dma[i]))
                         goto err;

                 addr += PAGE_SIZE;
         }

         return 0;

err:
         irdma_unmap_vm_page_list(hw, pg_dma, i);
         return -ENOMEM;

}

Thanks,

Zhu Yanjun


>> Another problem, after folio is used, I want to know the performance after
>> folio is implemented.
>>
>> How to make tests to get the performance?
> You know what you're working on ... I wouldn't know how best to test
> your code.
