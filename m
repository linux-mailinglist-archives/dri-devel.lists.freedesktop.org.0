Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774F24CE91
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49EB6EA9C;
	Fri, 21 Aug 2020 07:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5181F6E030
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:07:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id BDA6529A318
Message-ID: <8fb2e5f7c2943df0d733fc604cafd547edd4b8ea.camel@collabora.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Brian Starkey <brian.starkey@arm.com>
Date: Thu, 20 Aug 2020 05:07:29 -0300
In-Reply-To: <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
Organization: Collabora
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Robert Beckett <bob.beckett@collabora.com>, nd@arm.com,
 Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, James Jones <jajones@nvidia.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Laura Abbott <labbott@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brian,

Thanks a lot for reviewing this patch.

I'm happy my humble proof-of-concept
is able to spark some interest and raise
some questions.

On Mon, 2020-08-17 at 16:18 +0100, Brian Starkey wrote:
> Hi Ezequiel,
> 
> On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
> > This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> > which will allocate memory suitable for the given device.
> > 
> > The implementation is mostly a port of the Contiguous Videobuf2
> > memory allocator (see videobuf2/videobuf2-dma-contig.c)
> > over to the DMA-BUF Heap interface.
> > 
> > The intention of this allocator is to provide applications
> > with a more system-agnostic API: the only thing the application
> > needs to know is which device to get the buffer for.
> > 
> > Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> > is unknown to the application.
> > 
> > I'm not really expecting this patch to be correct or even
> > a good idea, but just submitting it to start a discussion on DMA-BUF
> > heap discovery and negotiation.
> > 
> 
> My initial reaction is that I thought dmabuf heaps are meant for use
> to allocate buffers for sharing across devices, which doesn't fit very
> well with having per-device heaps.
> 

That's true.

> For single-device allocations, would using the buffer allocation
> functionality of that device's native API be better in most
> cases? (Some other possibly relevant discussion at [1])
> 

That may be true for existing subsystems.

However, how about a new subsystem/API wanting to
leverage the heap API and avoid exposing yet another
allocator API?

And then, also, if we have an allocator API, perhaps
we could imagine a future where applications would only
need to worry about that, and not about each per-framework
allocator.

> I can see that this can save some boilerplate for devices that want
> to expose private chunks of memory, but might it also lead to 100
> aliases for the system's generic coherent memory pool?
> 

The idea (even if PoC) was to let drivers decide if they are special
enough to add themselves (via dev_dma_heap_add).

Aliasing the heap would be ceratainly too much (although trying
it for every device was a fun experiment to watch). 

Thanks,
Ezequiel

> I wonder if a set of helpers to allow devices to expose whatever they
> want with minimal effort would be better.
> 
> Cheers,
> -Brian
> 
> 1. https://lore.kernel.org/dri-devel/57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi/
> 
> > Given Plumbers is just a couple weeks from now, I've submitted
> > a BoF proposal to discuss this, as perhaps it would make
> > sense to discuss this live?
> > 
> > Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
