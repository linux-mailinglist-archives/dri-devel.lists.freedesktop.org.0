Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7550E7EC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 20:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D483010E3FE;
	Mon, 25 Apr 2022 18:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE3610E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2K4QOkawoSGCjOb1vC5dw6hWcQiE+jC0ZAz05u1wIEI=;
 b=tTeTa0WsRyBf4OIQ3JdJ7fOaBmjGANsKkpmzBO/YDPe18/roUVg0iBHCMBMdQV887dzEjiqbPxrj2
 RwL/25sioXeVCrPjAegz1zcfr8BeeSvh6A+6exKGWcRYweZeras7YlQeEwGyXDNGWspWuPn6w7yyas
 7ZZ46oAM7hKJKcRftSFWCwZGwL5a/rAvPeyIgxNXImh64jX37JSTVgOwROVQzLxPMJ1dlnsNBBloMM
 xDoGho2AcyWtBIGMWaNmlbyRT90ld3fPlIozkr8qT8sqJxcK59dPw0ebR1Y4tNr2+i4ZGXUGhRH4WX
 2SCeCpin0e6d4K7H6iZcWiPLbbtoyNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2K4QOkawoSGCjOb1vC5dw6hWcQiE+jC0ZAz05u1wIEI=;
 b=Rs0oVdc6Gn1jeFE1o5xs3yvqKKfbWbJ/xzhbVLaG4+3RHn5wVQ6jlnLe33UyaNaW+7ToO/DqOA+bC
 b/SoWu0DQ==
X-HalOne-Cookie: 0dabd4daaee9d1531632014b0275df18740c4087
X-HalOne-ID: eb9ab30c-c4c3-11ec-be69-d0431ea8bb03
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id eb9ab30c-c4c3-11ec-be69-d0431ea8bb03;
 Mon, 25 Apr 2022 18:17:09 +0000 (UTC)
Date: Mon, 25 Apr 2022 20:17:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] fbdev: Track deferred-I/O pages in pageref struct
Message-ID: <Ymblo7nqB2i2SP7L@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425112751.25985-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

a little ramblings below. Just my thoughts while trying to understand
the code - especially since I looked at it before.

	Sam

On Mon, Apr 25, 2022 at 01:27:50PM +0200, Thomas Zimmermann wrote:
> Store the per-page state for fbdev's deferred I/O in struct
> fb_deferred_io_pageref. Maintain a list of pagerefs for the pages
> that have to be written back to video memory. Update all affected
> drivers.
> 
> As with pages before, fbdev acquires a pageref when an mmaped page
> of the framebuffer is being written to. It holds the pageref in a
> list of all currently written pagerefs until it flushes the written
> pages to video memory. Writeback occurs periodically. After writeback
> fbdev releases all pagerefs and builds up a new dirty list until the
> next writeback occurs.
> 
> Using pagerefs has a number of benefits.
> 
> For pages of the framebuffer, the deferred I/O code used struct
> page.lru as an entry into the list of dirty pages. The lru field is
> owned by the page cache, which makes deferred I/O incompatible with
> some memory pages (e.g., most notably DRM's GEM SHMEM allocator).
> struct fb_deferred_io_pageref now provides an entry into a list of
> dirty framebuffer pages, freeing lru for use with the page cache.
> 
> Drivers also assumed that struct page.index is the page offset into
> the framebuffer. This is not true for DRM buffers, which are located
> at various offset within a mapped area. struct fb_deferred_io_pageref
> explicitly stores an offset into the framebuffer. struct page.index
> is now only the page offset into the mapped area.
> 
> These changes will allow DRM to use fbdev deferred I/O without an
> intermediate shadow buffer.
> 
> v2:
> 	* minor fixes in commit message
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---


> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> index 02a4a4fa3da3..db02e17e12b6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> @@ -322,12 +322,13 @@ static void vmw_deferred_io(struct fb_info *info,
>  	struct vmw_fb_par *par = info->par;
>  	unsigned long start, end, min, max;
>  	unsigned long flags;
> -	struct page *page;
> +	struct fb_deferred_io_pageref *pageref;
>  	int y1, y2;
>  
>  	min = ULONG_MAX;
>  	max = 0;
> -	list_for_each_entry(page, pagelist, lru) {
> +	list_for_each_entry(pageref, pagelist, list) {
> +		struct page *page = pageref->page;
>  		start = page->index << PAGE_SHIFT;
>  		end = start + PAGE_SIZE - 1;
>  		min = min(min, start);

This is the same change in all deferred_io drivers like above.
We now traverse pageref->list where pagelist points to the head.

It took me a while to understand that pagelist points to a list of
fb_deferred_io_pageref and not a list of pages.
I had been helped, had this been renamed to s/pagelist/pagereflist/.

If you see no point in this then just ignore my comment, I have not
stared at kernel code for a while and is thus easy to confuse.

> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index 6924d489a289..a03b9c64fc61 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -36,6 +36,60 @@ static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs
>  	return page;
>  }
>  
> +static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
> +								 unsigned long offset,
> +								 struct page *page)
> +{
> +	struct fb_deferred_io *fbdefio = info->fbdefio;
> +	struct list_head *pos = &fbdefio->pagelist;
> +	unsigned long pgoff = offset >> PAGE_SHIFT;
> +	struct fb_deferred_io_pageref *pageref, *cur;
> +
> +	if (WARN_ON_ONCE(pgoff >= info->npagerefs))
> +		return NULL; /* incorrect allocation size */
> +
> +	/* 1:1 mapping between pageref and page offset */
> +	pageref = &info->pagerefs[pgoff];
> +
> +	/*
> +	 * This check is to catch the case where a new process could start
> +	 * writing to the same page through a new PTE. This new access
> +	 * can cause a call to .page_mkwrite even if the original process'
> +	 * PTE is marked writable.
> +	 */
> +	if (!list_empty(&pageref->list))
> +		goto pageref_already_added;
> +
> +	pageref->page = page;
> +	pageref->offset = pgoff << PAGE_SHIFT;
> +
> +	if (unlikely(fbdefio->sort_pagelist)) {
> +		/*
> +		 * We loop through the list of pagerefs before adding, in
> +		 * order to keep the pagerefs sorted. This has significant
> +		 * overhead of O(n^2) with n being the number of written
> +		 * pages. If possible, drivers should try to work with
> +		 * unsorted page lists instead.
> +		 */
> +		list_for_each_entry(cur, &info->fbdefio->pagelist, list) {
> +			if (cur > pageref)
> +				break;
> +		}
> +		pos = &cur->list;
> +	}
> +
> +	list_add_tail(&pageref->list, pos);
> +
> +pageref_already_added:
> +	return pageref;
> +}
> +
> +static void fb_deferred_io_pageref_put(struct fb_deferred_io_pageref *pageref,
> +				       struct fb_info *info)
> +{
> +	list_del_init(&pageref->list);
> +}
> +
>  /* this is to find and return the vmalloc-ed fb pages */
>  static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>  {
> @@ -59,7 +113,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>  		printk(KERN_ERR "no mapping available\n");
>  
>  	BUG_ON(!page->mapping);
> -	page->index = vmf->pgoff;
> +	page->index = vmf->pgoff; /* for page_mkclean() */
>  
>  	vmf->page = page;
>  	return 0;
> @@ -95,7 +149,11 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	struct page *page = vmf->page;
>  	struct fb_info *info = vmf->vma->vm_private_data;
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
> -	struct list_head *pos = &fbdefio->pagelist;
> +	struct fb_deferred_io_pageref *pageref;
> +	unsigned long offset;
> +	vm_fault_t ret;
> +
> +	offset = (vmf->address - vmf->vma->vm_start);
>  
>  	/* this is a callback we get when userspace first tries to
>  	write to the page. we schedule a workqueue. that workqueue
> @@ -112,6 +170,12 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
>  		fbdefio->first_io(info);
>  
> +	pageref = fb_deferred_io_pageref_get(info, offset, page);
Compared to the old code we now do all the sorting and stuff without
the page locked, which seem like a big change.


> +	if (WARN_ON_ONCE(!pageref)) {
> +		ret = VM_FAULT_OOM;
> +		goto err_mutex_unlock;
> +	}
> +
>  	/*
>  	 * We want the page to remain locked from ->page_mkwrite until
>  	 * the PTE is marked dirty to avoid page_mkclean() being called
> @@ -120,47 +184,17 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	 * Do this by locking the page here and informing the caller
>  	 * about it with VM_FAULT_LOCKED.
>  	 */
> -	lock_page(page);
> -
> -	/*
> -	 * This check is to catch the case where a new process could start
> -	 * writing to the same page through a new PTE. This new access
> -	 * can cause a call to .page_mkwrite even if the original process'
> -	 * PTE is marked writable.
> -	 *
> -	 * TODO: The lru field is owned by the page cache; hence the name.
> -	 *       We dequeue in fb_deferred_io_work() after flushing the
> -	 *       page's content into video memory. Instead of lru, fbdefio
> -	 *       should have it's own field.
> -	 */
> -	if (!list_empty(&page->lru))
> -		goto page_already_added;
> -
> -	if (unlikely(fbdefio->sort_pagelist)) {
> -		/*
> -		 * We loop through the pagelist before adding in order to
> -		 * keep the pagelist sorted. This has significant overhead
> -		 * of O(n^2) with n being the number of written pages. If
> -		 * possible, drivers should try to work with unsorted page
> -		 * lists instead.
> -		 */
> -		struct page *cur;
> -
> -		list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> -			if (cur->index > page->index)
> -				break;
> -		}
> -		pos = &cur->lru;
> -	}
> -
> -	list_add_tail(&page->lru, pos);
> +	lock_page(pageref->page);
>  
> -page_already_added:
>  	mutex_unlock(&fbdefio->lock);
>  
>  	/* come back after delay to process the deferred IO */
>  	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
>  	return VM_FAULT_LOCKED;
> +
> +err_mutex_unlock:
> +	mutex_unlock(&fbdefio->lock);
> +	return ret;
>  }
>  
>  static const struct vm_operations_struct fb_deferred_io_vm_ops = {
> @@ -186,15 +220,14 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_mmap);
>  /* workqueue callback */
>  static void fb_deferred_io_work(struct work_struct *work)
>  {
> -	struct fb_info *info = container_of(work, struct fb_info,
> -						deferred_work.work);
> -	struct list_head *node, *next;
> -	struct page *cur;
> +	struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
> +	struct fb_deferred_io_pageref *pageref, *next;
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
>  
>  	/* here we mkclean the pages, then do all deferred IO */
>  	mutex_lock(&fbdefio->lock);
> -	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> +	list_for_each_entry(pageref, &fbdefio->pagelist, list) {
> +		struct page *cur = pageref->page;
>  		lock_page(cur);
>  		page_mkclean(cur);
>  		unlock_page(cur);
> @@ -204,30 +237,48 @@ static void fb_deferred_io_work(struct work_struct *work)
>  	fbdefio->deferred_io(info, &fbdefio->pagelist);
>  
>  	/* clear the list */
> -	list_for_each_safe(node, next, &fbdefio->pagelist) {
> -		list_del_init(node);
> -	}
> +	list_for_each_entry_safe(pageref, next, &fbdefio->pagelist, list)
> +		fb_deferred_io_pageref_put(pageref, info);
> +
>  	mutex_unlock(&fbdefio->lock);
>  }
>  
> -void fb_deferred_io_init(struct fb_info *info)
> +int fb_deferred_io_init(struct fb_info *info)
>  {
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
> -	struct page *page;
> -	unsigned int i;
> +	struct fb_deferred_io_pageref *pagerefs;
> +	unsigned long npagerefs, i;
> +	int ret;
>  
>  	BUG_ON(!fbdefio);
> +
> +	if (WARN_ON(!info->fix.smem_len))
> +		return -EINVAL;
> +
>  	mutex_init(&fbdefio->lock);
>  	INIT_DELAYED_WORK(&info->deferred_work, fb_deferred_io_work);
>  	INIT_LIST_HEAD(&fbdefio->pagelist);
>  	if (fbdefio->delay == 0) /* set a default of 1 s */
>  		fbdefio->delay = HZ;
>  
> -	/* initialize all the page lists one time */
> -	for (i = 0; i < info->fix.smem_len; i += PAGE_SIZE) {
> -		page = fb_deferred_io_page(info, i);
> -		INIT_LIST_HEAD(&page->lru);
> +	npagerefs = DIV_ROUND_UP(info->fix.smem_len, PAGE_SIZE);
> +
> +	/* alloc a page ref for each page of the display memory */
> +	pagerefs = kvcalloc(npagerefs, sizeof(*pagerefs), GFP_KERNEL);
> +	if (!pagerefs) {
> +		ret = -ENOMEM;
> +		goto err;
>  	}
> +	for (i = 0; i < npagerefs; ++i)
> +		INIT_LIST_HEAD(&pagerefs[i].list);
> +	info->npagerefs = npagerefs;
> +	info->pagerefs = pagerefs;
> +
> +	return 0;
> +
> +err:
> +	mutex_destroy(&fbdefio->lock);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_init);
>  
> @@ -254,6 +305,7 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>  		page->mapping = NULL;
>  	}
>  
> +	kvfree(info->pagerefs);
>  	mutex_destroy(&fbdefio->lock);
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);

> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index f95da1af9ff6..a332590c0fae 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -201,6 +201,13 @@ struct fb_pixmap {
>  };
>  
>  #ifdef CONFIG_FB_DEFERRED_IO
> +struct fb_deferred_io_pageref {
> +	struct page *page;
> +	unsigned long offset;
> +	/* private */
> +	struct list_head list;
This is the list of pages - so this could be named pagelist...

> +};
> +
>  struct fb_deferred_io {
>  	/* delay between mkwrite and deferred handler */
>  	unsigned long delay;
> @@ -468,6 +475,8 @@ struct fb_info {
>  #endif
>  #ifdef CONFIG_FB_DEFERRED_IO
>  	struct delayed_work deferred_work;
> +	unsigned long npagerefs;
> +	struct fb_deferred_io_pageref *pagerefs;
>  	struct fb_deferred_io *fbdefio;
>  #endif
>  
> @@ -661,7 +670,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
>  
>  /* drivers/video/fb_defio.c */
>  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
> -extern void fb_deferred_io_init(struct fb_info *info);
> +extern int  fb_deferred_io_init(struct fb_info *info);
>  extern void fb_deferred_io_open(struct fb_info *info,
>  				struct inode *inode,
>  				struct file *file);
> -- 
> 2.36.0
