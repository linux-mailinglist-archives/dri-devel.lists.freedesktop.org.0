Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B62CD6185
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 14:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9710E674;
	Mon, 22 Dec 2025 13:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UwOgjuZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6A810E673
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 13:09:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-596ba07504dso3552839e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 05:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766408939; x=1767013739; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TqkA3QTeqvfIHTaFJmrTviJUHc15iycYlD6ucgB4o6w=;
 b=UwOgjuZMyRVsCbOrJs9RlDwT6qCyqUuAqU/btLj8YRlnA0yfSpd7f85cpcY6vcHGcE
 Y6btryGGx8bRXDYMckUG8QWoOYjM0PcLe8KhHL/nop+Y84LNI4/UZb25dhIbgGCeK3oT
 zg9fQuWrY7ShwOf620H/XesC2Z+YO+Bcyb5mRBi1Hx0Q6jzStfEVMReQv2DnzTR/ytAq
 qVr8znnUS9dkxMET/hvPoUY0g8PR3ydyhex9Om6Z1w6UXI++I7/CzanfTFKjxEvb24/X
 s+sipnMlspbtRYMnt521LjRr3WlwIpJ8a8APGKx3tWzRLPYvtu+/rRHACwmsXZvARJ8R
 Pj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766408939; x=1767013739;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TqkA3QTeqvfIHTaFJmrTviJUHc15iycYlD6ucgB4o6w=;
 b=wGo3Junj60aHFUwRS1ViJiQXobJH51TeSLvEBvoTE/C3ZfN8nbkg48ltIjJdikO9Ob
 Rkm8EX0APd+fzvWVw+4dpl8qSQvSOjG5RyijqGjJ4onKO3eGe2hddHv9+SOJQHIHksxa
 rPNvWgqYLsiNO08NOl0pFLa56buF12gRCUB6A3bd57nMItgCeWQez/eCxwZZqCoVZMKT
 cHszotWehJE/SInO+lDCQ/JrmmVOWuG+btXBRP15+2ZytoyXckslXRoJNzc9nIDfJAgB
 lKBH2xHo5eXYL5LxeI1F9wOGv+6+kcmfJoAByHFqtikDnEkIHHjlH/7G5iEwRJco+X5m
 8Wdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCe8/R1jJ/pSPwwGuYOifGSk7NGQUpCuPQNLF9lrm3v1jmDyZ8Eo3kgttGddUh2DoJAgyDiqlHxYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOEFwlTTS5mj5X4bIT+oTJNhnaiuAo+sO101VKKk84+fjy6XZd
 6ysHIvHMnZaGdq9nNA4jl41qgdQDLAlDpwm4a9/a9fsyoX9g5Hp5z/aa
X-Gm-Gg: AY/fxX6tr1wpD8cUGU0w0zvGreCBYOMO9gnZ/FXrXtKqoco9/hY/cQAYLTnAP2xxq4Y
 WQaK/99I0o3ZKTz+9Srcv1NoTaBe7idQBd3Rx5r25f9z9aH5vCWV3tLzFs0kNwarl0dUP51fvFB
 oD9XqYK0ZxvtmBPeeH35+RgRg+3m8U+m7gMIRblitBowQOaMO5vHgZEXxQhueFeCORj56hUhOWl
 y63DbBevuE+Q/fqJNe5jz5g5u3B7YXLVPRgxXC6g7GIhHUQkqT4X0HhtqXoaVuOikJSaZ3TBFFI
 V06eB1ABXD2R/oo/GOghxMHeoGJvx7UYyHX2DLuT3aG1jZoATPFCAunoBmLcbxFZmw2TyTgjA66
 FOOhwigMx56372jYfcXwLFyuVDN1kg9p2dUuLsSZKYrhG+HT84C8G
X-Google-Smtp-Source: AGHT+IEoHaD9txNltw8AYIh3bvKWbd6Ld21Uc2hEUyNiNte2MbtG2FdcMNsmNf298a2tH2qY7Uf5Kw==
X-Received: by 2002:a05:6512:3f1a:b0:598:e39b:d628 with SMTP id
 2adb3069b0e04-59a17d7271amr3858414e87.5.1766408939248; 
 Mon, 22 Dec 2025 05:08:59 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f4e4sm3115532e87.83.2025.12.22.05.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 05:08:58 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 22 Dec 2025 14:08:56 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: urezki@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, mripard@kernel.org,
 sumit.semwal@linaro.org, v-songbaohua@oppo.com, zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aUlC6N1jmDbMDPc5@milan>
References: <aUQHss6K8b_esvpw@milan> <20251218212436.17142-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218212436.17142-1-21cnbao@gmail.com>
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

On Fri, Dec 19, 2025 at 05:24:36AM +0800, Barry Song wrote:
> On Thu, Dec 18, 2025 at 9:55 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Thu, Dec 18, 2025 at 02:01:56PM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 12/15/25 06:30, Barry Song wrote:
> > > > From: Barry Song <v-songbaohua@oppo.com>
> > > >
> > > > In many cases, the pages passed to vmap() may include high-order
> > > > pages allocated with __GFP_COMP flags. For example, the systemheap
> > > > often allocates pages in descending order: order 8, then 4, then 0.
> > > > Currently, vmap() iterates over every page individually—even pages
> > > > inside a high-order block are handled one by one.
> > > >
> > > > This patch detects high-order pages and maps them as a single
> > > > contiguous block whenever possible.
> > > >
> > > > An alternative would be to implement a new API, vmap_sg(), but that
> > > > change seems to be large in scope.
> > > >
> > > > When vmapping a 128MB dma-buf using the systemheap, this patch
> > > > makes system_heap_do_vmap() roughly 17× faster.
> > > >
> > > > W/ patch:
> > > > [   10.404769] system_heap_do_vmap took 2494000 ns
> > > > [   12.525921] system_heap_do_vmap took 2467008 ns
> > > > [   14.517348] system_heap_do_vmap took 2471008 ns
> > > > [   16.593406] system_heap_do_vmap took 2444000 ns
> > > > [   19.501341] system_heap_do_vmap took 2489008 ns
> > > >
> > > > W/o patch:
> > > > [    7.413756] system_heap_do_vmap took 42626000 ns
> > > > [    9.425610] system_heap_do_vmap took 42500992 ns
> > > > [   11.810898] system_heap_do_vmap took 42215008 ns
> > > > [   14.336790] system_heap_do_vmap took 42134992 ns
> > > > [   16.373890] system_heap_do_vmap took 42750000 ns
> > > >
> > >
> > > That's quite a speedup.
> > >
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Uladzislau Rezki <urezki@gmail.com>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: John Stultz <jstultz@google.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > > ---
> > > >   * diff with rfc:
> > > >   Many code refinements based on David's suggestions, thanks!
> > > >   Refine comment and changelog according to Uladzislau, thanks!
> > > >   rfc link:
> > > >   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> > > >
> > > >   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
> > > >   1 file changed, 39 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > index 41dd01e8430c..8d577767a9e5 100644
> > > > --- a/mm/vmalloc.c
> > > > +++ b/mm/vmalloc.c
> > > > @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > > >     return err;
> > > >   }
> > > > +static inline int get_vmap_batch_order(struct page **pages,
> > > > +           unsigned int stride, unsigned int max_steps, unsigned int idx)
> > > > +{
> > > > +   int nr_pages = 1;
> > >
> > > unsigned int, maybe
> 
> Right
> 
> > >
> > > Why are you initializing nr_pages when you overwrite it below?
> 
> Right, initializing nr_pages can be dropped.
> 
> > >
> > > > +
> > > > +   /*
> > > > +    * Currently, batching is only supported in vmap_pages_range
> > > > +    * when page_shift == PAGE_SHIFT.
> > >
> > > I don't know the code so realizing how we go from page_shift to stride too
> > > me a second. Maybe only talk about stride here?
> > >
> > > OTOH, is "stride" really the right terminology?
> > >
> > > we calculate it as
> > >
> > >       stride = 1U << (page_shift - PAGE_SHIFT);
> > >
> > > page_shift - PAGE_SHIFT should give us an "order". So is this a
> > > "granularity" in nr_pages?
> 
> This is the case where vmalloc() may realize that it has
> high-order pages and therefore calls
> vmap_pages_range_noflush() with a page_shift larger than
> PAGE_SHIFT. For vmap(), we take a pages array, so
> page_shift is always PAGE_SHIFT.
> 
> > >
> > > Again, I don't know this code, so sorry for the question.
> > >
> > To me "stride" also sounds unclear.
> 
> Thanks, David and Uladzislau. On second thought, this stride may be
> redundant, and it should be possible to drop it entirely. This results
> in the code below:
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 41dd01e8430c..3962bdcb43e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,20 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int max_steps, unsigned int idx)
> +{
> +	unsigned int nr_pages	 = compound_nr(pages[idx]);
> +
> +	if (nr_pages == 1 || max_steps < nr_pages)
> +		return 0;
> +
> +	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> +		return compound_order(pages[idx]);
> +	return 0;
> +}
> +
>



>  /*
>   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
>   * flush caches.
> @@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> +	/*
> +	 * For vmap(), users may allocate pages from high orders down to
> +	 * order 0, while always using PAGE_SHIFT as the page_shift.
> +	 * We first check whether the initial page is a compound page. If so,
> +	 * there may be an opportunity to batch multiple pages together.
> +	 */
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> +			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>  		return vmap_small_pages_range_noflush(addr, end, prot, pages);
Hm.. If first few pages are order-0 and the rest are compound
then we do nothing.

>  
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> +	for (i = 0; i < nr; ) {
> +		unsigned int shift = page_shift;
>  		int err;
>  
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> +		/*
> +		 * For vmap() cases, page_shift is always PAGE_SHIFT, even
> +		 * if the pages are physically contiguous, they may still
> +		 * be mapped in a batch.
> +		 */
> +		if (page_shift == PAGE_SHIFT)
> +			shift += get_vmap_batch_order(pages, nr - i, i);
> +		err = vmap_range_noflush(addr, addr + (1UL << shift),
>  					page_to_phys(pages[i]), prot,
> -					page_shift);
> +					shift);
>  		if (err)
>  			return err;
>  
> -		addr += 1UL << page_shift;
> +		addr += 1UL  << shift;
> +		i += 1U << shift;
>  	}
>  
>  	return 0;
> 
> Does this look clearer?
> 
The concern is we mix it with a huge page mapping path. If we want to batch
v-mapping for page_shift == PAGE_SHIFT case, where "pages" array may contain 
compound pages(folio)(corner case to me), i think we should split it.

--
Uladzislau Rezki
