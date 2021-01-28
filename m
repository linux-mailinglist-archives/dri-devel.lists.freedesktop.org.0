Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D499F30711A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD26E927;
	Thu, 28 Jan 2021 08:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D5BF6E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:54:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FFD11042;
 Wed, 27 Jan 2021 19:54:01 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271A43F66E;
 Wed, 27 Jan 2021 19:53:55 -0800 (PST)
Subject: Re: [PATCH v1 1/2] video: fbdev: acornfb: remove free_unused_pages()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20210126182113.19892-1-david@redhat.com>
 <20210126182113.19892-2-david@redhat.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <292c749e-427e-0a8d-c163-9f739af873a8@arm.com>
Date: Thu, 28 Jan 2021 09:24:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126182113.19892-2-david@redhat.com>
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/21 11:51 PM, David Hildenbrand wrote:
> This function is never used and it is one of the last remaining user of
> __free_reserved_page(). Let's just drop it.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

There is no other reference for free_unused_pages() in the tree.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  drivers/video/fbdev/acornfb.c | 34 ----------------------------------
>  1 file changed, 34 deletions(-)
> 
> diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
> index bcc92aecf666..1b72edc01cfb 100644
> --- a/drivers/video/fbdev/acornfb.c
> +++ b/drivers/video/fbdev/acornfb.c
> @@ -921,40 +921,6 @@ static int acornfb_detect_monitortype(void)
>  	return 4;
>  }
>  
> -/*
> - * This enables the unused memory to be freed on older Acorn machines.
> - * We are freeing memory on behalf of the architecture initialisation
> - * code here.
> - */
> -static inline void
> -free_unused_pages(unsigned int virtual_start, unsigned int virtual_end)
> -{
> -	int mb_freed = 0;
> -
> -	/*
> -	 * Align addresses
> -	 */
> -	virtual_start = PAGE_ALIGN(virtual_start);
> -	virtual_end = PAGE_ALIGN(virtual_end);
> -
> -	while (virtual_start < virtual_end) {
> -		struct page *page;
> -
> -		/*
> -		 * Clear page reserved bit,
> -		 * set count to 1, and free
> -		 * the page.
> -		 */
> -		page = virt_to_page(virtual_start);
> -		__free_reserved_page(page);
> -
> -		virtual_start += PAGE_SIZE;
> -		mb_freed += PAGE_SIZE / 1024;
> -	}
> -
> -	printk("acornfb: freed %dK memory\n", mb_freed);
> -}
> -
>  static int acornfb_probe(struct platform_device *dev)
>  {
>  	unsigned long size;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
