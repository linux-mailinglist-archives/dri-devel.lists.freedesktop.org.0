Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B17060D4
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED0710E3C8;
	Wed, 17 May 2023 07:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A359610E33B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 11:22:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B81C36386D;
 Tue, 16 May 2023 11:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5D5C433D2;
 Tue, 16 May 2023 11:22:05 +0000 (UTC)
Date: Tue, 16 May 2023 12:22:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v2 RESEND 7/7] swiotlb: per-device flag if there are
 dynamically allocated buffers
Message-ID: <ZGNnWmw4eDsh9hBN@arm.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <69f9e058bb1ad95905a62a4fc8461b064872af97.1683623618.git.petr.tesarik.ext@huawei.com>
 <ZGEuYxR2PM6wHeDh@arm.com>
 <20230515104847.6dfdf31b@meshulam.tesarici.cz>
 <20230515120054.0115a4eb@meshulam.tesarici.cz>
 <ZGJdtmP13pv06xDH@arm.com>
 <20230516095512.3c99c35e@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516095512.3c99c35e@meshulam.tesarici.cz>
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kim Phillips <kim.phillips@amd.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 09:55:12AM +0200, Petr Tesařík wrote:
> On Mon, 15 May 2023 17:28:38 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > There is another scenario to take into account on the list_del() side.
> > Let's assume that there are other elements on the list, so
> > list_empty() == false:
> > 
> > P0:
> > 	list_del(paddr);
> > 	/* the memory gets freed, added to some slab or page free list */
> > 	WRITE_ONCE(slab_free_list, __va(paddr));
> > 
> > P1:
> > 	paddr = __pa(READ_ONCE(slab_free_list));/* re-allocating paddr freed on P0 */
> > 	if (!list_empty()) {			/* assuming other elements on the list */
> > 		/* searching the list */
> > 		list_for_each() {
> > 			if (pos->paddr) == __pa(vaddr))
> > 				/* match */
> > 		}
> > 	}
> > 
> > On P0, you want the list update to be visible before the memory is freed
> > (and potentially reallocated on P1). An smp_wmb() on P0 would do. For
> > P1, we don't care about list_empty() as there can be other elements
> > already. But we do want any list elements reading during the search to
> > be ordered after the slab_free_list reading. The smp_rmb() you'd add for
> > the case above would suffice.
> 
> Yes, but to protect against concurrent insertions/deletions, a spinlock
> is held while searching the list. The spin lock provides the necessary
> memory barriers implicitly.

Well, mostly. The spinlock acquire/release semantics ensure that
accesses within the locked region are not observed outside the
lock/unlock. But it doesn't guarantee anything about accesses outside
such region in relation to the accesses within the region. For example:

P0:
	spin_lock_irqsave(&swiotlb_dyn_lock);
	list_del(paddr);
	spin_unlock_irqrestore(&swiotlb_dyn_lock);

	/* the blah write below can be observed before list_del() above */
	WRITE_ONCE(blah, paddr);

	/* that's somewhat tricker but slab_free_list update can also be
	 * seen before list_del() above on certain architectures */
	spin_lock_irqsave(&slab_lock);
 	WRITE_ONCE(slab_free_list, __va(paddr));
	spin_unlock_irqrestore(&slab_lock);

On most architectures, the writing of the pointer to a slab structure
(assuming some spinlocks) would be ordered against the list_del() from
the swiotlb code. Apart from powerpc where the spin_unlock() is not
necessarily ordered against the subsequent spin_lock(). The architecture
selects ARCH_WEAK_RELEASE_ACQUIRE which in turns makes
smp_mb__after_unlock_lock() an smp_mb() (rather than no-op on all the
other architectures).

On arm64 we have smp_mb__after_spinlock() which ensures that memory
accesses prior to spin_lock() are not observed after accesses within the
locked region. I don't think this matters for your case but I thought
I'd mention it.

-- 
Catalin
