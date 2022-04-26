Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5507650F70F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 11:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F118310E1E1;
	Tue, 26 Apr 2022 09:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF110E2A4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HWQTHkWU8hW14i6ySV7w2ecXhgpPLS3QmMd6XOLJyuY=;
 b=eEsNF+nc8rO4J+ww7sgac+BFL0iaJjHU77yNpf+FjBT1n2K04XfMEq5E3iR9vr2KJ1ixJrVhqs5JO
 EYD2Y+yMA2c5LmglRUdp6yVn5f1Mskn3m/KwBaTK3YivviUROTFNGZN27LqqeKDCC3SpZ/S4wJMKHD
 Zklcq8QkMaBEsWSc672ti/1rOW8pGmyNLhzAovp3Kzj0AN6iK2tMYet0v9q7wNEXhm+JLEd83DGquv
 HoRxAStEmFRzxH7tZgqoVvPG0/7bLxNPUVteJFMNkGnU/nePgziNfkvqybfsVjeYYuvzlXZkOZmKzo
 E4NLu6mdQt/kYXcVQA9TI+Qfm37V4Ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HWQTHkWU8hW14i6ySV7w2ecXhgpPLS3QmMd6XOLJyuY=;
 b=KzzFQ6ixSL9hSckSuVuqzR2LiPupQjCAMX6MmkQFUJqhKLBTDrACG/YcImhJvNO4+POcFn98vmleh
 P2PvWAUDw==
X-HalOne-Cookie: ffc3b99d8d8bdecf788ece33abd59ffc011ed197
X-HalOne-ID: a0f938c5-c542-11ec-a907-d0431ea8a290
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a0f938c5-c542-11ec-a907-d0431ea8a290;
 Tue, 26 Apr 2022 09:24:10 +0000 (UTC)
Date: Tue, 26 Apr 2022 11:24:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] fbdev: Track deferred-I/O pages in pageref struct
Message-ID: <Yme6ON/t6Vxawo2B@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-3-tzimmermann@suse.de>
 <Ymblo7nqB2i2SP7L@ravnborg.org>
 <cd5a70a8-0b35-66b6-5168-e5895c1ed3df@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5a70a8-0b35-66b6-5168-e5895c1ed3df@suse.de>
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

> > > +
> > >   /* this is to find and return the vmalloc-ed fb pages */
> > >   static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
> > >   {
> > > @@ -59,7 +113,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
> > >   		printk(KERN_ERR "no mapping available\n");
> > >   	BUG_ON(!page->mapping);
> > > -	page->index = vmf->pgoff;
> > > +	page->index = vmf->pgoff; /* for page_mkclean() */
> > >   	vmf->page = page;
> > >   	return 0;
> > > @@ -95,7 +149,11 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
> > >   	struct page *page = vmf->page;
> > >   	struct fb_info *info = vmf->vma->vm_private_data;
> > >   	struct fb_deferred_io *fbdefio = info->fbdefio;
> > > -	struct list_head *pos = &fbdefio->pagelist;
> > > +	struct fb_deferred_io_pageref *pageref;
> > > +	unsigned long offset;
> > > +	vm_fault_t ret;
> > > +
> > > +	offset = (vmf->address - vmf->vma->vm_start);
> > >   	/* this is a callback we get when userspace first tries to
> > >   	write to the page. we schedule a workqueue. that workqueue
> > > @@ -112,6 +170,12 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
> > >   	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
> > >   		fbdefio->first_io(info);
> > > +	pageref = fb_deferred_io_pageref_get(info, offset, page);
> > Compared to the old code we now do all the sorting and stuff without
> > the page locked, which seem like a big change.
> 
> We never touch any of the page's fields in fb_deferred_io_pageref_get().
> It's only used to initialize the pageref's page pointer. The pagerefs are
> all protected by fbdev-internal locking.  Is there a reason why we should
> further hold the page lock?
I only commented because it was a change in scope of the lock, I did not
see anything wrong in the locking, but then I do not understand locking
so that does not say much.

> 
> All sorting is done by the pageref addresses, which implicitly correspond to
> 'offset'. After looking at the new function again, I'll change it to sort
> directly by offset. It's clearer in its intend.
Looks forward for the re-spin.

	Sam
