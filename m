Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30370465C
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0845E10E312;
	Tue, 16 May 2023 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB67C10E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 10:47:27 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id EC6E616059E;
 Mon, 15 May 2023 12:47:23 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684147644; bh=dP2juyFNHxMfZj2XFRXG6EvWkRW0Me3msJBOCkA1/Ac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=4Y2PpILwCenw9c8UteMfHlZRmhWTfChfwugGpIe8hNFWWswWFFSlY0Y1fe7wW9akd
 02oBhJozeL7xrZiSfCwju9IBj82TCm0gPBy9BE3FO6o2qKlKmfb7x+/dfRNgOOUNdq
 bA+04YoaWMyn2YL0x4ARVhH1Qa0Xs+DqyfNXg00hxCs80xFtSYFDS8xknTjsYl13bp
 eS0M2ewwPJd3wq2yQ+GrwLTZpj/cwbv414PplwkMrNmdt69nxEyzZzLxEgBupYmuAQ
 8tbX4Jg6b820cjT9VKlSX0FNPx3HFl97cThrcuyvPmPG+zTuwvsJOB1HFd+Uq0GKad
 j11k0TXxBFfbw==
Date: Mon, 15 May 2023 12:47:22 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 RESEND 7/7] swiotlb: per-device flag if there are
 dynamically allocated buffers
Message-ID: <20230515124722.35c30f5d@meshulam.tesarici.cz>
In-Reply-To: <ZGH9v2KWJWZnKvxP@arm.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <69f9e058bb1ad95905a62a4fc8461b064872af97.1683623618.git.petr.tesarik.ext@huawei.com>
 <ZGEuYxR2PM6wHeDh@arm.com>
 <20230515104737.2c4c05db@meshulam.tesarici.cz>
 <ZGH9v2KWJWZnKvxP@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 16 May 2023 07:27:39 +0000
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
Cc: "Rafael  J. Wysocki" <rafael@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Petr Tesarik <petrtesarik@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	DMA@freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(restoring the Cc list that I accidentally removed in my previous reply.)

On Mon, 15 May 2023 10:39:11 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> Hi Petr,
>=20
> On Mon, May 15, 2023 at 10:47:37AM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > On Sun, 14 May 2023 19:54:27 +0100
> > Catalin Marinas <catalin.marinas@arm.com> wrote: =20
> > > On Tue, May 09, 2023 at 11:18:19AM +0200, Petr Tesarik wrote: =20
> > > > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > > > index daa2064f2ede..8cbb0bebb0bc 100644
> > > > --- a/include/linux/swiotlb.h
> > > > +++ b/include/linux/swiotlb.h
> > > > @@ -152,7 +152,11 @@ static inline bool is_swiotlb_buffer(struct de=
vice *dev, phys_addr_t paddr)
> > > > =20
> > > >  	return mem &&
> > > >  		(is_swiotlb_fixed(mem, paddr) ||
> > > > -		 (mem->allow_dyn && is_swiotlb_dyn(dev, paddr)));
> > > > +		 /* Pairs with smp_store_release() in swiotlb_dyn_map()
> > > > +		  * and swiotlb_dyn_unmap().
> > > > +		  */
> > > > +		 (smp_load_acquire(&dev->dma_io_tlb_have_dyn) &&
> > > > +		  is_swiotlb_dyn(dev, paddr)));
> > > >  }
> > > > =20
> > > >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> > > > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > > > index 81eab1c72c50..e8be3ee50f18 100644
> > > > --- a/kernel/dma/swiotlb.c
> > > > +++ b/kernel/dma/swiotlb.c
> > > > @@ -642,6 +642,9 @@ static phys_addr_t swiotlb_dyn_map(struct devic=
e *dev, phys_addr_t orig_addr,
> > > > =20
> > > >  	spin_lock_irqsave(&dev->dma_io_tlb_dyn_lock, flags);
> > > >  	list_add(&slot->node, &dev->dma_io_tlb_dyn_slots);
> > > > +	if (!dev->dma_io_tlb_have_dyn)
> > > > +		/* Pairs with smp_load_acquire() in is_swiotlb_buffer() */
> > > > +		smp_store_release(&dev->dma_io_tlb_have_dyn, true);
> > > >  	spin_unlock_irqrestore(&dev->dma_io_tlb_dyn_lock, flags);   =20
> > >=20
> > > I'm not sure this works. What this seems to do is that if the caller =
of
> > > is_swiotlb_buffer() sees the flag set, it's guaranteed that something
> > > was added to the dma_io_tlb_dyn_slots list. But the reverse is not
> > > necessarily true. IOW, if something was added to the list, there is a
> > > brief window where the dma_io_tlb_have_dyn flag is still false. In the
> > > general case, I doubt any ordering between list_add() and the flag
> > > setting changes anything since neither of them may be visible to anot=
her
> > > CPU. =20
> >=20
> > Thank you for the review! This patch probably needs a bit more
> > explanation.
> >=20
> > The goal is to avoid taking a spin lock in the mkost common case that
> > the dynamic list is empty. The only required invariant is:
> >=20
> >   When the flag is clear, it is safe to skip the list.
> >=20
> > It's not a bug to walk an empty list, it's merely less efficient. Such
> > race window would be acceptable. OTOH that's not your concern if I
> > understand you correctly. =20
>=20
> I got what the patch aims to do. What I meant is that your proposed
> invariant (flag =3D=3D false =3D> list_empty()) doesn't hold. The list be=
comes
> non-empty with list_add() but the flag is set after. For this to work,
> you'd need to set the flag prior to list_add().
>=20
> However, even if you fix this invariant, I don't think it helps because
> the ordering isn't between a list update and the flag but rather a list
> update and the actual paddr visibility you want to look up in the list.
>=20
> > > What you need is for a 'paddr' added to the dynamic list to be correc=
tly
> > > identified by another CPU as dynamic swiotlb. That other CPU doesn't
> > > check random addresses but only those returned by the DMA API. =20
> >=20
> > Yes, that's correct.
> >  =20
> > > Such
> > > values would be normally passed through a memory location (e.g. driver
> > > local structures) and that's what you want to order against. =20
> >=20
> > This would certainly work, but I'm not sure I need it. My only goal is
> > that when the flag is set, the new value is observed by all CPUs on the
> > next call to is_swiotlb_buffer(). =20
>=20
> Which value? paddr? That's not guaranteed with your current ordering.

I was thinking the flag value, but...

> Let's say P0 does:
>=20
> 	list_add(paddr);
> 	smp_store_release(&flag, true);
> 	WRITE_ONCE(blah, paddr);	// using *_ONCE for clarity
>=20
> On P1:
>=20
> 	paddr =3D READ_ONCE(blah);
> 	if (smp_load_acquire(&flag)) {
> 		// check the list etc.
> 	}

... I see now, the problem is that smp_store_release() on P0 may happen
after smp_load_acquire() on P1, while paddr was already visible
(not through the list).

Thank you for patience. I was too focused on the linked list.

>[...]
> > Wait, let me check that I understand you right. Do you suggest that I
> > convert dma_io_tlb_dyn_slots to a lockless list and get rid of the
> > spinlock? =20
>=20
> I don't mind the spinlock. It feels safer to keep it ;) (and you do need
> for list updates anyway). Using RCU gets too complicated TBH, I'd rather
> keep it simple, it's not on an extremely critical path.
>=20
> What I believe is that you can get rid of the flag, and just rely on
> probing list_empty() locklessly. If that's false, you take the lock and
> search the list again. Basically dev->dma_io_tlb_syn_slots.next is your
> flag, no need for an additional one (just the explicit smp_*mb()
> barriers as I mentioned above).

Since we don't control how drivers store the physical address (to give
them release semantics), the check cannot be performed without a read
memory barrier (aka "dsb" on arm64). Okay... still better than the
spinlock.

Petr T
