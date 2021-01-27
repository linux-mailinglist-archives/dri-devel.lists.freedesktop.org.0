Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E852330710C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E76E924;
	Thu, 28 Jan 2021 08:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE2C89850
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 11:53:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 684A9ACBA;
 Wed, 27 Jan 2021 11:53:44 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:53:41 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] video: fbdev: acornfb: remove free_unused_pages()
Message-ID: <20210127115341.GB28728@linux>
References: <20210126182113.19892-1-david@redhat.com>
 <20210126182113.19892-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126182113.19892-2-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 07:21:12PM +0100, David Hildenbrand wrote:
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

Reviewed-by: Oscar Salvador <osalvador@suse.de>

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
> -- 
> 2.29.2
> 

-- 
Oscar Salvador
SUSE L3
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
