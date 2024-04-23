Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C68AE175
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 11:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6538510FB70;
	Tue, 23 Apr 2024 09:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="p6fHOGvL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZIDmakrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96EB10FB70
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 09:55:45 +0000 (UTC)
Date: Tue, 23 Apr 2024 11:55:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713866143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Nx8yqSMqk6NdlHtzGLr2MTDXlYiWPZXvaqNERsKydY=;
 b=p6fHOGvLuVoHHVptkxTjdyLfrBv/WEUM0rlQrTqhpX36rDzQgjzSH+hNseUJgQJw3RlhBd
 f8lnqsFU+t9HaTzU2cRZx0NlRwQTQjjto9V8iSC2ceGA2EnsuZxnbO/V0z9R8CiLrLHKxq
 jlRjQ/8rtKy5Lz7nCFi7ocnZdCgUWcGNv8i5PlIh/Wl4HVOiS5NwPbnMpfkAG3UPkAT0Rm
 8cOBxJ/omnplMWI7TJtQRCYsndrmztP0kllxBqvnpFtww9Z/+QM+dTzWYv6UFVIFhIT7WZ
 Cnw2VgLBbSqBu61KpWwpUuHDxV5nollqMpd5HxiTdAlityU74JEbrmhGRlQ2Eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713866143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Nx8yqSMqk6NdlHtzGLr2MTDXlYiWPZXvaqNERsKydY=;
 b=ZIDmakrXTzr5H1pBUDD/Ih1wjrZUweXTIe9y3xeNQ8KsXbLpFS48/EwqhFaTi1uw3a1skv
 ZD1y/oO8yHSofBAg==
From: Nam Cao <namcao@linutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tiwai@suse.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: fix incorrect address computation in deferred IO
Message-ID: <20240423095538.m79ML6a0@linutronix.de>
References: <20240419190032.40490-1-namcao@linutronix.de>
 <666d986e-5227-4b6d-829c-95ff16115488@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <666d986e-5227-4b6d-829c-95ff16115488@suse.de>
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

On Tue, Apr 23, 2024 at 10:37:41AM +0200, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for following through with the bug and sending the patch
> 
> Am 19.04.24 um 21:00 schrieb Nam Cao:
> > With deferred IO enabled, a page fault happens when data is written to the
> > framebuffer device. Then driver determines which page is being updated by
> > calculating the offset of the written virtual address within the virtual
> > memory area, and uses this offset to get the updated page within the
> > internal buffer. This page is later copied to hardware (thus the name
> > "deferred IO").
> > 
> > This calculation is only correct if the virtual memory area is mapped to
> > the beginning of the internal buffer. Otherwise this is wrong. For example,
> > if users do:
> >      mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
> > 
> > Then the virtual memory area will mapped at offset 0xff000 within the
> > internal buffer. This offset 0xff000 is not accounted for, and wrong page
> > is updated. This will lead to wrong pixels being updated on the device.
> > 
> > However, it gets worse: if users do 2 mmap to the same virtual address, for
> > example:
> > 
> >      int fd = open("/dev/fb0", O_RDWR, 0);
> >      char *ptr = (char *) 0x20000000ul;
> >      mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
> >      *ptr = 0; // write #1
> >      mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);
> >      *ptr = 0; // write #2
> > 
> > In this case, both write #1 and write #2 apply to the same virtual address
> > (0x20000000ul), and the driver mistakenly thinks the same page is being
> > written to. When the second write happens, the driver thinks this is the
> > same page as the last time, and reuse the page from write #1. The driver
> > then lock_page() an incorrect page, and returns VM_FAULT_LOCKED with the
> > correct page unlocked. It is unclear what will happen with memory
> > management subsystem after that, but likely something terrible.
> 
> Please tone down the drama. :)

Sorry, that wasn't intentional. Writing is hard :(

Let me just cut this out, this info is not really needed to justify the
changes.

> 
> > 
> > Fix this by taking the mapping offset into account.
> > 
> > Reported-and-tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > Closes: https://lore.kernel.org/linux-fbdev/271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com
> > Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> >   drivers/video/fbdev/core/fb_defio.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> > index dae96c9f61cf..d5d6cd9e8b29 100644
> > --- a/drivers/video/fbdev/core/fb_defio.c
> > +++ b/drivers/video/fbdev/core/fb_defio.c
> > @@ -196,7 +196,8 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
> >    */
> >   static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
> >   {
> > -	unsigned long offset = vmf->address - vmf->vma->vm_start;
> > +	unsigned long offset = vmf->address - vmf->vma->vm_start
> > +			+ (vmf->vma->vm_pgoff << PAGE_SHIFT);
> 
> The page-fault handler at [1] use vm_fault.pgoff to retrieve the page
> structure. Can we do the same here and avoid that computation?

Yes, thanks for the suggestion.

It will change things a bit: offset will not be the exact value anymore,
but will be rounded down to multiple of PAGE_SIZE. But that doesn't matter,
because it will only be used to calculate the page offset later on.

We can clean this up and rename this "offset" to "pg_offset". But that's
for another day.

Best regards,
Nam
