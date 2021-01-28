Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B99307124
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7C16E96B;
	Thu, 28 Jan 2021 08:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A07789467
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:12:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A9F81042;
 Wed, 27 Jan 2021 20:12:33 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754453F66B;
 Wed, 27 Jan 2021 20:12:29 -0800 (PST)
Subject: Re: [PATCH v1 2/2] mm: simplify free_highmem_page() and
 free_reserved_page()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20210126182113.19892-1-david@redhat.com>
 <20210126182113.19892-3-david@redhat.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6e3b29cd-fbf8-2b58-e61e-9d378b095263@arm.com>
Date: Thu, 28 Jan 2021 09:42:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126182113.19892-3-david@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: linux-fbdev@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/21 11:51 PM, David Hildenbrand wrote:
> adjust_managed_page_count() as called by free_reserved_page() properly
> handles pages in a highmem zone, so we can reuse it for
> free_highmem_page().
> 
> We can now get rid of totalhigh_pages_inc() and simplify
> free_reserved_page().
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  include/linux/highmem-internal.h |  5 -----
>  include/linux/mm.h               | 16 ++--------------
>  mm/page_alloc.c                  | 11 -----------
>  3 files changed, 2 insertions(+), 30 deletions(-)
> 
> diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
> index 1bbe96dc8be6..7902c7d8b55f 100644
> --- a/include/linux/highmem-internal.h
> +++ b/include/linux/highmem-internal.h
> @@ -127,11 +127,6 @@ static inline unsigned long totalhigh_pages(void)
>  	return (unsigned long)atomic_long_read(&_totalhigh_pages);
>  }
>  
> -static inline void totalhigh_pages_inc(void)
> -{
> -	atomic_long_inc(&_totalhigh_pages);
> -}
> -
>  static inline void totalhigh_pages_add(long count)
>  {
>  	atomic_long_add(count, &_totalhigh_pages);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a5d618d08506..494c69433a34 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2303,32 +2303,20 @@ extern void free_initmem(void);
>  extern unsigned long free_reserved_area(void *start, void *end,
>  					int poison, const char *s);
>  
> -#ifdef	CONFIG_HIGHMEM
> -/*
> - * Free a highmem page into the buddy system, adjusting totalhigh_pages
> - * and totalram_pages.
> - */
> -extern void free_highmem_page(struct page *page);
> -#endif
> -
>  extern void adjust_managed_page_count(struct page *page, long count);
>  extern void mem_init_print_info(const char *str);
>  
>  extern void reserve_bootmem_region(phys_addr_t start, phys_addr_t end);
>  
>  /* Free the reserved page into the buddy system, so it gets managed. */
> -static inline void __free_reserved_page(struct page *page)
> +static inline void free_reserved_page(struct page *page)
>  {
>  	ClearPageReserved(page);
>  	init_page_count(page);
>  	__free_page(page);
> -}
> -
> -static inline void free_reserved_page(struct page *page)
> -{
> -	__free_reserved_page(page);
>  	adjust_managed_page_count(page, 1);
>  }
> +#define free_highmem_page(page) free_reserved_page(page)
>  
>  static inline void mark_page_reserved(struct page *page)
>  {
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index b031a5ae0bd5..b2e42f10d4d4 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7711,17 +7711,6 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
>  	return pages;
>  }
>  
> -#ifdef	CONFIG_HIGHMEM
> -void free_highmem_page(struct page *page)
> -{
> -	__free_reserved_page(page);
> -	totalram_pages_inc();
> -	atomic_long_inc(&page_zone(page)->managed_pages);
> -	totalhigh_pages_inc();
> -}
> -#endif
> -
> -
>  void __init mem_init_print_info(const char *str)
>  {
>  	unsigned long physpages, codesize, datasize, rosize, bss_size;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
