Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82F24CE89
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4746EA99;
	Fri, 21 Aug 2020 07:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EE76E914
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:36:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 0004629A33B
Message-ID: <621cd69bdd4af3e5bd5f2c96450c87651620381a.camel@collabora.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
From: Ezequiel Garcia <ezequiel@collabora.com>
To: John Stultz <john.stultz@linaro.org>
Date: Thu, 20 Aug 2020 05:36:40 -0300
In-Reply-To: <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, James Jones <jajones@nvidia.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Laura Abbott <labbott@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

Thanks a ton for taking the time
to go thru this.

On Mon, 2020-08-17 at 21:13 -0700, John Stultz wrote:
> On Sun, Aug 16, 2020 at 10:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
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
> 
> My hesitancy here is that the main reason we have DMA BUF Heaps, and
> ION before it, was to expose different types of memory allocations to
> userspace. The main premise that often these buffers are shared with
> multiple devices, which have differing constraints and it is userspace
> that best understands the path a buffer will take through a series of
> devices. So userspace is best positioned to determine what type of
> memory should be allocated to satisfy the various devices constraints
> (there were some design attempts to allow DMA BUFs to use multiple
> attach with deferred alloc at map time to handle this constraint
> solving in-kernel, but it was never adopted in practice).
> 
> This however, requires some system specific policy - implemented in
> the Android userspace by gralloc which maps "usage" types (device
> pipeline flows) to heaps. I liken it to fstab, which helps map mount
> points to partitions - it's not going to be the same on every system.
> 
> What you seem to be proposing seems a bit contrary to this premise -
> Userland doesn't know what type of memory it needs, but given a device
> can somehow find the heap it should allocate for? This seems to assume
> the buffer is only to be used with a single device?
> 

Single-device usage wasn't the intention. I see now that this patch
looks too naive and it's confusing. The idea is of course to get buffers
that can be shared.

I'm thinking you need to share your picture buffer with a decoder,
a renderer, possibly something else. Each with its own set
of constraints and limitations.	

Of course, a buffer that works for device A may be unsuitable for
device B and so this per-device heap is surely way too naive.

As you rightly mention, the main intention of this RFC is to
question exactly the current premise: "userspace knows".
I fail to see how will (generic and system-agnostic) applications
know which heap to use.

Just for completion, let me throw a simple example: i.MX 8M
and some Rockchip platforms share the same VPU block, except the
latter have an IOMMU.

So applications would need to query an iommu presence
to get buffer from CMA or not.

> There was at some point a discussion where folks (maybe it was
> DanielV? I can't remember...) suggested having something like a sysfs
> device node link from a device to a dma-buf heap chardev. This seems
> like it would add a similar behavior as what you're proposing, however
> without adding possibly a ton of new device specific heaps to the
> /dev/dma_heap/ dir. However, we would potentially need any missing
> heap types added first.
> 
> > I'm not really expecting this patch to be correct or even
> > a good idea, but just submitting it to start a discussion on DMA-BUF
> > heap discovery and negotiation.
> > 
> > Given Plumbers is just a couple weeks from now, I've submitted
> > a BoF proposal to discuss this, as perhaps it would make
> > sense to discuss this live?
> 
> I do think it's an interesting idea. I agree that having every driver
> implement a dmabuf exporter is a bit silly, but I also think Brian's
> point that maybe we need some drm helper functions that provide
> similar functionality along with a more standardized device ioctl for
> single device allocations might be better.
> 

I'm unsure we should treat single device specially.
 
Exposing device limitations and constraints properly,
allowing some sort of negotation would hopefully solve
single device and shared requirements.

Thanks,
Ezequiel

> thanks
> -john


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
