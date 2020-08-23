Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256624EFBB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 22:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49A6E0F5;
	Sun, 23 Aug 2020 20:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C046E0F5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 20:47:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38D03279;
 Sun, 23 Aug 2020 22:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598215616;
 bh=WvP0yqg0L5kb//Dkw4k/QQmIUOFIq8FpPn0gZ3czNuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UhxFZiXjrPpXjNuGH0vliUDMWSmgt6Cu/iPnb442CPr3gaRyA97kTxvg7TTvx3eQ3
 1VTfdnAAf0MNzg5C1zj0row+KWnHjigKlG6V4S+zvQDfS6E1n4K5VyAQjWF+SZepbL
 7SX7Yji6klz9vf8JNJcx28IEoj+0AK5/gB06bE18=
Date: Sun, 23 Aug 2020 23:46:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Jones <jajones@nvidia.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <20200823204637.GF6002@pendragon.ideasonboard.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
 <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
 <746a0bb75bd8388a30b53a5ddc56fb24aea308a8.camel@collabora.com>
 <4f987e06-7af1-671b-836a-10d3e9623547@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f987e06-7af1-671b-836a-10d3e9623547@nvidia.com>
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
 kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@st.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi James,

On Sun, Aug 23, 2020 at 01:04:43PM -0700, James Jones wrote:
> On 8/20/20 1:15 AM, Ezequiel Garcia wrote:
> > On Mon, 2020-08-17 at 20:49 -0700, James Jones wrote:
> >> On 8/17/20 8:18 AM, Brian Starkey wrote:
> >>> On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
> >>>> This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> >>>> which will allocate memory suitable for the given device.
> >>>>
> >>>> The implementation is mostly a port of the Contiguous Videobuf2
> >>>> memory allocator (see videobuf2/videobuf2-dma-contig.c)
> >>>> over to the DMA-BUF Heap interface.
> >>>>
> >>>> The intention of this allocator is to provide applications
> >>>> with a more system-agnostic API: the only thing the application
> >>>> needs to know is which device to get the buffer for.
> >>>>
> >>>> Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> >>>> is unknown to the application.
> >>>>
> >>>> I'm not really expecting this patch to be correct or even
> >>>> a good idea, but just submitting it to start a discussion on DMA-BUF
> >>>> heap discovery and negotiation.
> >>>>
> >>>
> >>> My initial reaction is that I thought dmabuf heaps are meant for use
> >>> to allocate buffers for sharing across devices, which doesn't fit very
> >>> well with having per-device heaps.
> >>>
> >>> For single-device allocations, would using the buffer allocation
> >>> functionality of that device's native API be better in most
> >>> cases? (Some other possibly relevant discussion at [1])
> >>>
> >>> I can see that this can save some boilerplate for devices that want
> >>> to expose private chunks of memory, but might it also lead to 100
> >>> aliases for the system's generic coherent memory pool?
> >>>
> >>> I wonder if a set of helpers to allow devices to expose whatever they
> >>> want with minimal effort would be better.
> >>
> >> I'm rather interested on where this goes, as I was toying with using
> >> some sort of heap ID as a basis for a "device-local" constraint in the
> >> memory constraints proposals Simon and I will be discussing at XDC this
> >> year.  It would be rather elegant if there was one type of heap ID used
> >> universally throughout the kernel that could provide a unique handle for
> >> the shared system memory heap(s), as well as accelerator-local heaps on
> >> fancy NICs, GPUs, NN accelerators, capture devices, etc. so apps could
> >> negotiate a location among themselves.  This patch seems to be a step
> >> towards that in a way, but I agree it would be counterproductive if a
> >> bunch of devices that were using the same underlying system memory ended
> >> up each getting their own heap ID just because they used some SW
> >> framework that worked that way.
> >>
> >> Would appreciate it if you could send along a pointer to your BoF if it
> >> happens!
> > 
> > Here is it:
> > 
> > https://linuxplumbersconf.org/event/7/contributions/818/
> > 
> > It would be great to see you there and discuss this,
> > given I was hoping we could talk about how to meet a
> > userspace allocator library expectations as well.
> 
> Thanks!  I hadn't registered for LPC and it looks like it's sold out, 
> but I'll try to watch the live stream.
> 
> This is very interesting, in that it looks like we're both trying to 
> solve roughly the same set of problems but approaching it from different 
> angles.  From what I gather, your approach is that a "heap" encompasses 
> all the allocation constraints a device may have.
> 
> The approach Simon Ser and I are tossing around so far is somewhat 
> different, but may potentially leverage dma-buf heaps a bit as well.
> 
> Our approach looks more like what I described at XDC a few years ago, 
> where memory constraints for a given device's usage of an image are 
> exposed up to applications, which can then somehow perform boolean 
> intersection/union operations on them to arrive at a common set of 
> constraints that describe something compatible with all the devices & 
> usages desired (or fail to do so, and fall back to copying things around 
> presumably).  I believe this is more flexible than your initial proposal 
> in that devices often support multiple usages (E.g., different formats, 
> different proprietary layouts represented by format modifiers, etc.), 
> and it avoids adding a combinatorial number of heaps to manage that.
> 
> In my view, heaps are more like blobs of memory that can be allocated 
> from in various different ways to satisfy constraints.  I realize heaps 
> mean something specific in the dma-buf heap design (specifically, 
> something closer to an association between an "allocation mechanism" and 
> "physical memory"), but I hope we don't have massive heap/allocator 
> mechanism proliferation due to constraints alone.  Perhaps some 
> constraints, such as contiguous memory or device-local memory, are 
> properly expressed as a specific heap, but consider the proliferation 
> implied by even that simple pair of examples: How do you express 
> contiguous device-local memory?  Do you need to spawn two heaps on the 
> underlying device-local memory, one for contiguous allocations and one 
> for non-contiguous allocations?  Seems excessive.
> 
> Of course, our approach also has downsides and is still being worked on. 
>   For example, it works best in an ideal world where all the allocators 
> available understand all the constraints that exist.

Shouldn't allocators be decoupled of constraints ? In my imagination I
see devices exposing constraints, and allocators exposing parameters,
with a userspace library to reconcile the constraints and produce
allocator parameters from them.

> Dealing with a 
> reality where there are probably a handful of allocators, another 
> handful of userspace libraries and APIs, and still more applications 
> trying to make use of all this is one of the larger remaining challenges 
> of the design.
> 
> We'll present our work at XDC 2020.  Hope you can check that out as well!
> 
> >>> 1. https://lore.kernel.org/dri-devel/57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi/
> >>>
> >>>> Given Plumbers is just a couple weeks from now, I've submitted
> >>>> a BoF proposal to discuss this, as perhaps it would make
> >>>> sense to discuss this live?
> >>>>
> >>>> Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
