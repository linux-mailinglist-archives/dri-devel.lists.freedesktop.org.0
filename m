Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ADB273C5E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E977C6E180;
	Tue, 22 Sep 2020 07:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B98919D;
 Mon, 21 Sep 2020 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8o7GVAomh929Hvy+xaXufBwE8CQqTnicVvJhMbCZ9+k=; b=mehcTMqJtwQu3rPUjsEisC7ECq
 7+58K3Z4EekBFXZ3wYEUeQuCa/fWdcNhiPeHAeErok/v8ZUYK3e3gg5/B4dsAsGOOcHKMJll0ZrgT
 uIxyCNSUGOAg2UN4gsizGdkbduG7XDlLurQP7j3hPoeoUDi05V5iO3YFhaKjX5x3pQ8mdKFxJmqgA
 L9SsTOYSux1ZLBO0Whate1mY/A8G4ym2vhOpFFpaMiIWVUAzrHfwOrb8cuL3VnUqrmtLSbCIIumHR
 mHpwBBr1xVe0+QICrLKcrhz2TwTDJC2BnukZFO6wyPDyqecyMJcK7af7LQwFO3njp1VzvRCXlr6uE
 ADgc0Q1w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kKRED-0003Cg-2P; Mon, 21 Sep 2020 19:11:57 +0000
Date: Mon, 21 Sep 2020 20:11:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
Message-ID: <20200921191157.GX32101@casper.infradead.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918163724.2511-4-hch@lst.de>
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 06:37:21PM +0200, Christoph Hellwig wrote:
>  void shmem_unpin_map(struct file *file, void *ptr)
>  {
> +	long i = shmem_npages(file);
> +
>  	mapping_clear_unevictable(file->f_mapping);
> -	__shmem_unpin_map(file, ptr, shmem_npte(file));
> +	vunmap(ptr);
> +
> +	for (i = 0; i < shmem_npages(file); i++) {
> +		struct page *page;
> +
> +		page = shmem_read_mapping_page_gfp(file->f_mapping, i,
> +						   GFP_KERNEL);
> +		if (!WARN_ON(IS_ERR(page))) {
> +			put_page(page);
> +			put_page(page);
> +		}
> +	}
>  }

This is awkward.  I'd like it if we had a vfree() variant which called
put_page() instead of __free_pages().  I'd like it even more if we
used release_pages() instead of our own loop that called put_page().

Perhaps something like this ...

+++ b/mm/vmalloc.c
@@ -2262,7 +2262,7 @@ static void __vunmap(const void *addr, int deallocate_page
s)
 
        vm_remove_mappings(area, deallocate_pages);
 
-       if (deallocate_pages) {
+       if (deallocate_pages == 1) {
                int i;
 
                for (i = 0; i < area->nr_pages; i++) {
@@ -2271,8 +2271,12 @@ static void __vunmap(const void *addr, int deallocate_pages)
                        BUG_ON(!page);
                        __free_pages(page, 0);
                }
-               atomic_long_sub(area->nr_pages, &nr_vmalloc_pages);
+       } else if (deallocate_pages == 2) {
+               release_pages(area->pages, area->nr_pages);
+       }
 
+       if (deallocate_pages) {
+               atomic_long_sub(area->nr_pages, &nr_vmalloc_pages);
                kvfree(area->pages);
        }
@@ -2369,6 +2373,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+void vunmap_put_pages(const void *addr)
+{
+       BUG_ON(in_interrupt());
+       might_sleep();
+       if (addr)
+               __vunmap(addr, 2);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers

only with kernel-doc and so on.  I bet somebody has a better idea for a name.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
