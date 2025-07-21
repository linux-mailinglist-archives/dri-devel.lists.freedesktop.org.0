Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3CCB0C515
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 15:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3510E541;
	Mon, 21 Jul 2025 13:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="T3eT+XSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7510E2A5;
 Mon, 21 Jul 2025 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6M2lfrqiVCmiF0Wc9FAkpPta+B8beY73GHDzTT0mJuM=; b=T3eT+XSsrzwbV1XqZcbUbrh7LZ
 H776ohxzo3FqBHlR9iUOMKsWSekI3pZ2M4Q7fI3qVGcz8XFiL3A0Yco+hW77J4VJd3rKMznaLp8yp
 MhkgVuYw+ssT8lWfZ9qJ5xN1I2wjh7NvJujhQpqfQm5ICcjwsvs0nSZJrBnvpAO6PuAGQZcA87TEN
 UPVibCOP1YOVHX5l2Zwpe0VC6AATkYZ4hZKzd70J5wAi2Nm0jXmh5tW/s8Uk1NdxUopZSV1scRPsx
 g0lzFIdaw3LFkEtZ3C62ZL7TK8ZXrnvYG7yTpAuzxv+1TZqlQkkSpJdv1B8ROa/69QRxMtWJapMgs
 ky127NWw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1udqU5-0000000D9wk-1SEe;
 Mon, 21 Jul 2025 13:23:13 +0000
Date: Mon, 21 Jul 2025 14:23:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <aH4_QaNtIJMrPqOw@casper.infradead.org>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718144442.GG2206214@ziepe.ca>
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

On Fri, Jul 18, 2025 at 11:44:42AM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 18, 2025 at 03:17:00PM +0100, Matthew Wilcox wrote:
> > On Fri, Jul 18, 2025 at 02:51:08PM +0300, Yonatan Maman wrote:
> > > +++ b/include/linux/memremap.h
> > > @@ -89,6 +89,14 @@ struct dev_pagemap_ops {
> > >  	 */
> > >  	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
> > >  
> > > +	/*
> > > +	 * Used for private (un-addressable) device memory only. Return a
> > > +	 * corresponding PFN for a page that can be mapped to device
> > > +	 * (e.g using dma_map_page)
> > > +	 */
> > > +	int (*get_dma_pfn_for_device)(struct page *private_page,
> > > +				      unsigned long *dma_pfn);
> > 
> > This makes no sense.  If a page is addressable then it has a PFN.
> > If a page is not addressable then it doesn't have a PFN.
> 
> The DEVICE_PRIVATE pages have a PFN, but it is not usable for
> anything.

OK, then I don't understand what DEVICE PRIVATE means.

I thought it was for memory on a PCIe device that isn't even visible
through a BAR and so the CPU has no way of addressing it directly.
But now you say that it has a PFN, which means it has a physical
address, which means it's accessible to the CPU.

So what is it?

> This is effectively converting from a DEVICE_PRIVATE page to an actual
> DMA'able address of some kind. The DEVICE_PRIVATE is just a non-usable
> proxy, like a swap entry, for where the real data is sitting.
> 
> Jason
> 
