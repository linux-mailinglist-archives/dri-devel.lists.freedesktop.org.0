Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046FBCCBE63
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0357B10E3F5;
	Thu, 18 Dec 2025 13:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DbQ31GKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700410E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 805E060128;
 Thu, 18 Dec 2025 13:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF0FC4CEFB;
 Thu, 18 Dec 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766062922;
 bh=5DO6RDJonvikBIJmz3ENuqZ6dln+OBwoslWDMriPCxQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DbQ31GKBFd/oztUBucHbc47Na0LxGXTFx7Pw4Xxwv9sS8M3jt2HPGOLVZmnDoFXAg
 1lPYxdNXc+mmQETjuJltJAr1vJF0j6466kUMAy5JlN/ZRkJuuZTJxDosJqMv5o4x/C
 eAJP5rOyEf3PcneZlw0xvV4NbTNPYx7udhFIC8ULB7ljmJrtcZRllxeWEmmiPI0d2y
 +UagdKor2Ki0nJNKW8wuhmcBpqor2QAHEsRtwemp4FqRFPvBvqLNpC9wbtCxqDW7jr
 9eSKdG7Xx2CrWyI0COT932fUrYy+93xJaTzkw9EndpEjK9NhLzeOqQulfJ3HHxAsYT
 Y8VRgutX7DOfw==
Message-ID: <e7c8478b-1ce4-4a15-a185-de9d9121438c@kernel.org>
Date: Thu, 18 Dec 2025 14:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Uladzislau Rezki <urezki@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>
References: <20251215053050.11599-1-21cnbao@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251215053050.11599-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/15/25 06:30, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> In many cases, the pages passed to vmap() may include high-order
> pages allocated with __GFP_COMP flags. For example, the systemheap
> often allocates pages in descending order: order 8, then 4, then 0.
> Currently, vmap() iterates over every page individually—even pages
> inside a high-order block are handled one by one.
> 
> This patch detects high-order pages and maps them as a single
> contiguous block whenever possible.
> 
> An alternative would be to implement a new API, vmap_sg(), but that
> change seems to be large in scope.
> 
> When vmapping a 128MB dma-buf using the systemheap, this patch
> makes system_heap_do_vmap() roughly 17× faster.
> 
> W/ patch:
> [   10.404769] system_heap_do_vmap took 2494000 ns
> [   12.525921] system_heap_do_vmap took 2467008 ns
> [   14.517348] system_heap_do_vmap took 2471008 ns
> [   16.593406] system_heap_do_vmap took 2444000 ns
> [   19.501341] system_heap_do_vmap took 2489008 ns
> 
> W/o patch:
> [    7.413756] system_heap_do_vmap took 42626000 ns
> [    9.425610] system_heap_do_vmap took 42500992 ns
> [   11.810898] system_heap_do_vmap took 42215008 ns
> [   14.336790] system_heap_do_vmap took 42134992 ns
> [   16.373890] system_heap_do_vmap took 42750000 ns
> 

That's quite a speedup.

> Cc: David Hildenbrand <david@kernel.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   * diff with rfc:
>   Many code refinements based on David's suggestions, thanks!
>   Refine comment and changelog according to Uladzislau, thanks!
>   rfc link:
>   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> 
>   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 41dd01e8430c..8d577767a9e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>   	return err;
>   }
>   
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride, unsigned int max_steps, unsigned int idx)
> +{
> +	int nr_pages = 1;

unsigned int, maybe

Why are you initializing nr_pages when you overwrite it below?

> +
> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.

I don't know the code so realizing how we go from page_shift to stride 
too me a second. Maybe only talk about stride here?

OTOH, is "stride" really the right terminology?

we calculate it as

	stride = 1U << (page_shift - PAGE_SHIFT);

page_shift - PAGE_SHIFT should give us an "order". So is this a 
"granularity" in nr_pages?

Again, I don't know this code, so sorry for the question.

> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	nr_pages = compound_nr(pages[idx]);
> +	if (nr_pages == 1)
> +		return 0;
> +	if (max_steps < nr_pages)
> +		return 0;

Might combine these simple checks

if (nr_pages == 1 || max_steps < nr_pages)
	return 0;


-- 
Cheers

David
