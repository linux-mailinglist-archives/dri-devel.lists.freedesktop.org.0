Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314A3976E3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 17:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE726E906;
	Tue,  1 Jun 2021 15:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EFD6E906
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 15:39:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q5so4190064wrm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z/ysYleRM2YWzX9orexLMMrJ25j/bIHTJa7Myg7V+/g=;
 b=eu9MiLEbQyakIhjEXcMmgjSRv78Ba7G/e1UOLBHnzFW/YA+RyANkoF4bC/6/K0B/hU
 3vzKx00aYuV61b3NWUWl+Sruw4cWGJK9FdTT0O9uLhRged5Tx49j2vUbmETZQiZ3pYHB
 IA4NGuTOYCEjOJf0RiCqhil8b3s/w6/5+Kh9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Z/ysYleRM2YWzX9orexLMMrJ25j/bIHTJa7Myg7V+/g=;
 b=cOaNlybeaenQujPrBTgYjm9G7cViQ0+oi6KY0juqqKddn/EmbK7QhE30BFjqks1JTm
 69nX0+9LqHLtFLPC1ZobDIsfndHc2ifIEIqlXLR+3eSqtLDcxnSjcNQieUXbhtThuSza
 OraH71lpLq9plMY4AXZNEcDKZCqOlpvkEQ0HVgqopISyTra+F2UPze8dea17udN3BzID
 6wN9yansWITWvVgobCYcTClJ5fMkPm+0aIajtLL6Fyk9ANy/gXeL7zyWFZ8STjpmGu0Z
 0kyYs5CI9ZtuvE7akTyCY1SdoKENkjCLqWOQpSKGpc1bqQnVU7WXJpFov081a1X4eplt
 3k6g==
X-Gm-Message-State: AOAM530eA8Mk+4Z38JlCAHfqIc3xbJIINpuPIbNzypNoLoLInzUwxnbU
 qmGAHYI0vQv2dGeYxU3O2mcV8A==
X-Google-Smtp-Source: ABdhPJyWk8xbTDu5kyBta0mIR4LHfdyYJ1fyzR7WqhCo0hJxT1KtDnyJ8ajPu2j2FMjyD1tm65qN0Q==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr16440710wre.402.1622561967210; 
 Tue, 01 Jun 2021 08:39:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 62sm3894313wrm.1.2021.06.01.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:39:26 -0700 (PDT)
Date: Tue, 1 Jun 2021 17:39:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] fb_defio: Remove custom address_space_operations
Message-ID: <YLZUrEjVJWBGGMxf@phenom.ffwll.local>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-fbdev@vger.kernel.org,
 linux-mm@kvack.org, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 William Kucharski <william.kucharski@oracle.com>,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210310185530.1053320-1-willy@infradead.org>
 <YLPjwUUmHDRjyPpR@Ryzen-9-3900X.localdomain>
 <YLQALv2YENIDh77N@casper.infradead.org>
 <YLY/2O16fAjriZGQ@phenom.ffwll.local>
 <YLZEhv0cpZp8uVE3@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLZEhv0cpZp8uVE3@casper.infradead.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-fbdev@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, Ian Campbell <ijc@hellion.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaya Kumar <jayakumar.lkml@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 03:30:30PM +0100, Matthew Wilcox wrote:
> On Tue, Jun 01, 2021 at 04:10:32PM +0200, Daniel Vetter wrote:
> > On Sun, May 30, 2021 at 10:14:22PM +0100, Matthew Wilcox wrote:
> > > On Sun, May 30, 2021 at 12:13:05PM -0700, Nathan Chancellor wrote:
> > > > Hi Matthew,
> > > > 
> > > > On Wed, Mar 10, 2021 at 06:55:30PM +0000, Matthew Wilcox (Oracle) wrote:
> > > > > There's no need to give the page an address_space.  Leaving the
> > > > > page->mapping as NULL will cause the VM to handle set_page_dirty()
> > > > > the same way that it's handled now, and that was the only reason to
> > > > > set the address_space in the first place.
> > > > > 
> > > > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > > > 
> > > > This patch in mainline as commit ccf953d8f3d6 ("fb_defio: Remove custom
> > > > address_space_operations") causes my Hyper-V based VM to no longer make
> > > > it to a graphical environment.
> > > 
> > > Hi Nathan,
> > > 
> > > Thanks for the report.  I sent Daniel a revert patch with a full
> > > explanation last week, which I assume he'll queue up for a pull soon.
> > > You can just git revert ccf953d8f3d6 for yourself until that shows up.
> > > Sorry for the inconvenience.
> > 
> > Uh that patch didn't get cc'ed to any list so I've ignored it. I've found
> > it now, but lack of lore link is awkward. Can you pls resubmit with
> > dri-devel on cc? fbdev list is dead, I don't look there.
> 
> How about I just attach it here?

Thanks, that worked with Link: and everything and no choking of my script
:-)

Cheers, Daniel

> From e88921d0775d87323a8688af37dfd7cdebdde5a9 Mon Sep 17 00:00:00 2001
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Tue, 25 May 2021 08:37:33 -0400
> Subject: [PATCH] Revert "fb_defio: Remove custom address_space_operations"
> 
> Commit ccf953d8f3d6 makes framebuffers which use deferred I/O stop
> displaying updates after the first one.  This is because the pages
> handled by fb_defio no longer have a page_mapping().  That prevents
> page_mkclean() from marking the PTEs as clean, and so writes are only
> noticed the first time.
> 
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  drivers/video/fbdev/core/fb_defio.c | 35 +++++++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c    |  4 ++++
>  include/linux/fb.h                  |  3 +++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index b292887a2481..a591d291b231 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -52,6 +52,13 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>  		return VM_FAULT_SIGBUS;
>  
>  	get_page(page);
> +
> +	if (vmf->vma->vm_file)
> +		page->mapping = vmf->vma->vm_file->f_mapping;
> +	else
> +		printk(KERN_ERR "no mapping available\n");
> +
> +	BUG_ON(!page->mapping);
>  	page->index = vmf->pgoff;
>  
>  	vmf->page = page;
> @@ -144,6 +151,17 @@ static const struct vm_operations_struct fb_deferred_io_vm_ops = {
>  	.page_mkwrite	= fb_deferred_io_mkwrite,
>  };
>  
> +static int fb_deferred_io_set_page_dirty(struct page *page)
> +{
> +	if (!PageDirty(page))
> +		SetPageDirty(page);
> +	return 0;
> +}
> +
> +static const struct address_space_operations fb_deferred_io_aops = {
> +	.set_page_dirty = fb_deferred_io_set_page_dirty,
> +};
> +
>  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  {
>  	vma->vm_ops = &fb_deferred_io_vm_ops;
> @@ -194,12 +212,29 @@ void fb_deferred_io_init(struct fb_info *info)
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_init);
>  
> +void fb_deferred_io_open(struct fb_info *info,
> +			 struct inode *inode,
> +			 struct file *file)
> +{
> +	file->f_mapping->a_ops = &fb_deferred_io_aops;
> +}
> +EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> +
>  void fb_deferred_io_cleanup(struct fb_info *info)
>  {
>  	struct fb_deferred_io *fbdefio = info->fbdefio;
> +	struct page *page;
> +	int i;
>  
>  	BUG_ON(!fbdefio);
>  	cancel_delayed_work_sync(&info->deferred_work);
> +
> +	/* clear out the mapping that we setup */
> +	for (i = 0 ; i < info->fix.smem_len; i += PAGE_SIZE) {
> +		page = fb_deferred_io_page(info, i);
> +		page->mapping = NULL;
> +	}
> +
>  	mutex_destroy(&fbdefio->lock);
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 072780b0e570..98f193078c05 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1415,6 +1415,10 @@ __releases(&info->lock)
>  		if (res)
>  			module_put(info->fbops->owner);
>  	}
> +#ifdef CONFIG_FB_DEFERRED_IO
> +	if (info->fbdefio)
> +		fb_deferred_io_open(info, inode, file);
> +#endif
>  out:
>  	unlock_fb_info(info);
>  	if (res)
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index a8dccd23c249..ecfbcc0553a5 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -659,6 +659,9 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
>  /* drivers/video/fb_defio.c */
>  int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
>  extern void fb_deferred_io_init(struct fb_info *info);
> +extern void fb_deferred_io_open(struct fb_info *info,
> +				struct inode *inode,
> +				struct file *file);
>  extern void fb_deferred_io_cleanup(struct fb_info *info);
>  extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>  				loff_t end, int datasync);
> -- 
> 2.30.2
> 


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
