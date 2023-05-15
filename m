Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC3702787
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62210E174;
	Mon, 15 May 2023 08:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6A610E174
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:48:53 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 1D16D15F16F;
 Mon, 15 May 2023 10:48:48 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684140528; bh=tStAwueOxbXDMBwSLNTJ9Qsuwa6+o5KusDWfCkARZKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iH23OyGTr4tc1eztxSRC7l5DyGiPYJCtProPLZW0bSCFOghwW/tINr+gJraHtwGry
 hX72zLn8R/XonT8ju3AnubkdQpZTJZAV6EpvpedhqTn/K2s23lm9d5q9YeWEC4fImw
 xn45833kH9Y4z/8Gkb/OZjH2nRPRqo0gmtt7ovFRS7gqvveT1jnIIVSvWHsiBlDiQ2
 EIXlYIBZjGenSLF92tW6bjW8pzmeZYOMluUfdjGybfuSiBlNwooy5dBWhi6PoMQIaj
 3Fe3KCsXq2kAY34gB1tRoD4jNkukE+Txg9XTDFtk3uLqX+vjXhnaeEwJtdiCer9VTq
 ErmGi5SmkKILw==
Date: Mon, 15 May 2023 10:48:47 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 RESEND 7/7] swiotlb: per-device flag if there are
 dynamically allocated buffers
Message-ID: <20230515104847.6dfdf31b@meshulam.tesarici.cz>
In-Reply-To: <ZGEuYxR2PM6wHeDh@arm.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <69f9e058bb1ad95905a62a4fc8461b064872af97.1683623618.git.petr.tesarik.ext@huawei.com>
 <ZGEuYxR2PM6wHeDh@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, "open list:DMA
 MAPPING HELPERS" <iommu@lists.linux.dev>, Borislav Petkov <bp@suse.de>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Catalin,

On Sun, 14 May 2023 19:54:27 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Tue, May 09, 2023 at 11:18:19AM +0200, Petr Tesarik wrote:
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index d1d2b8557b30..e340e0f06dce 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -516,6 +516,9 @@ struct device_physical_location {
> >   * @dma_io_tlb_dyn_slots:
> >   *		Dynamically allocated bounce buffers for this device.
> >   *		Not for driver use.
> > + * @dma_io_tlb_have_dyn:
> > + *		Does this device have any dynamically allocated bounce
> > + *		buffers? Not for driver use.
> >   * @archdata:	For arch-specific additions.
> >   * @of_node:	Associated device tree node.
> >   * @fwnode:	Associated device node supplied by platform firmware.
> > @@ -623,6 +626,7 @@ struct device {
> >  	struct io_tlb_mem *dma_io_tlb_mem;
> >  	spinlock_t dma_io_tlb_dyn_lock;
> >  	struct list_head dma_io_tlb_dyn_slots;
> > +	bool dma_io_tlb_have_dyn;
> >  #endif
> >  	/* arch specific additions */
> >  	struct dev_archdata	archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index daa2064f2ede..8cbb0bebb0bc 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -152,7 +152,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> >  
> >  	return mem &&
> >  		(is_swiotlb_fixed(mem, paddr) ||
> > -		 (mem->allow_dyn && is_swiotlb_dyn(dev, paddr)));
> > +		 /* Pairs with smp_store_release() in swiotlb_dyn_map()
> > +		  * and swiotlb_dyn_unmap().
> > +		  */
> > +		 (smp_load_acquire(&dev->dma_io_tlb_have_dyn) &&
> > +		  is_swiotlb_dyn(dev, paddr)));
> >  }
> >  
> >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 81eab1c72c50..e8be3ee50f18 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -642,6 +642,9 @@ static phys_addr_t swiotlb_dyn_map(struct device *dev, phys_addr_t orig_addr,
> >  
> >  	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> >  	list_add(&slot->node, &dev->dma_io_tlb_dyn_slots);
> > +	if (!dev->dma_io_tlb_have_dyn)
> > +		/* Pairs with smp_load_acquire() in is_swiotlb_buffer() */
> > +		smp_store_release(&dev->dma_io_tlb_have_dyn, true);
> >  	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);  
> 
> I'm not sure this works. What this seems to do is that if the caller of
> is_swiotlb_buffer() sees the flag set, it's guaranteed that something
> was added to the dma_io_tlb_dyn_slots list. But the reverse is not
> necessarily true. IOW, if something was added to the list, there is a
> brief window where the dma_io_tlb_have_dyn flag is still false. In the
> general case, I doubt any ordering between list_add() and the flag
> setting changes anything since neither of them may be visible to another
> CPU.

Thank you for the review! This patch probably needs a bit more
explanation.

The goal is to avoid taking a spin lock in the mkost common case that
the dynamic list is empty. The only required invariant is:

  When the flag is clear, it is safe to skip the list.

It's not a bug to walk an empty list, it's merely less efficient. Such
race window would be acceptable. OTOH that's not your concern if I
understand you correctly.

> What you need is for a 'paddr' added to the dynamic list to be correctly
> identified by another CPU as dynamic swiotlb. That other CPU doesn't
> check random addresses but only those returned by the DMA API.

Yes, that's correct.

> Such
> values would be normally passed through a memory location (e.g. driver
> local structures) and that's what you want to order against.

This would certainly work, but I'm not sure I need it. My only goal is
that when the flag is set, the new value is observed by all CPUs on the
next call to is_swiotlb_buffer().

> What I mean is that a 'dev->blah = paddr' needs to be ordered _after_
> your flag setting. So you need the either the 'blah = paddr' assignment
> to have release semantics or the flag setting to be an
> smp_store_acquire() (but we don't have such thing). You'd have to use an
> explicit smp_wmb() barrier after the flag setting (it can be outside the
> lock). The spin_unlock() is not sufficient since it only has release
> semantics.

Understood. The spinlock is supposed to order changes to the list, not
to the flag.

> I also don't think the ordering between list_add() and flag
> setting matters since the smp_wmb() would ensure that both are visible
> when the 'paddr' value made it to the other CPU.

If the flag makes it before the list, then the other CPU will walk the
list only after acquiring dma_io_tlb_dyn_lock, and that's what the list
is ordered against.

I don't think there is any concern if the list makes it before the
flag, as long as the new value of the flag is observed on the next call
to is_swiotlb_buffer (on any CPU).

> Similarly on the is_swiotlb_buffer() side, you want the flag reading to
> be ordered after the 'blah = paddr' is observed. Here the
> smp_load_acquire() is sufficient.
> 
> >  	return page_to_phys(slot->page);
> > @@ -668,6 +671,9 @@ static void swiotlb_dyn_unmap(struct device *dev, phys_addr_t tlb_addr,
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> > +	if (list_is_singular(&dev->dma_io_tlb_dyn_slots))
> > +		/* Pairs with smp_load_acquire() in is_swiotlb_buffer() */
> > +		smp_store_release(&dev->dma_io_tlb_have_dyn, false);
> >  	slot = lookup_dyn_slot_locked(dev, tlb_addr);
> >  	list_del(&slot->node);
> >  	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);  
> 
> As with the map case, I don't think the ordering between list_del() and
> the flag setting matters. If you unmap the last dynamic buffer, the
> worst that can happen is that an is_swiotlb_buffer() call attempts a
> read of the list but the flag will eventually become visible. There
> shouldn't be another caller trying to unmap the same paddr (in well
> behaved drivers).
> 
> Now, thinking about the list_head access and the flag ordering, since it
> doesn't matter, you might as well not bother with the flag at all and
> rely on list_add() and list_empty() ordering vs the hypothetical 'blah'
> access. Both of these use READ/WRITE_ONCE() for setting
> dma_io_tlb_dyn_slots.next. You only need an smp_wmb() after the
> list_add() and an smp_rmb() before a list_empty() check in
> is_swiotlb_buffer(), no dma_iotlb_have_dyn variable.

Wait, let me check that I understand you right. Do you suggest that I
convert dma_io_tlb_dyn_slots to a lockless list and get rid of the
spinlock?

I'm sure it can be done for list_add() and list_del(). I'll have
to think about list_move().

> That's my reasoning but to I'll have be absolutely sure, you can pass that through
> some formal modelling.

Good idea. Especially if I try to get rid of the lock.

Petr T
