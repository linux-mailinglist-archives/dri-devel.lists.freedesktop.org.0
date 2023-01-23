Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7115678261
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA0D10E50E;
	Mon, 23 Jan 2023 16:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0010E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:58:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A5462D9;
 Mon, 23 Jan 2023 17:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674493083;
 bh=kDKF4A6ZDyQHXFMYN9w6HQo5DdaJO5wDDeNan4zyVis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MRRBRkfUzEvjWDKjwqzWZTvn8a4ZYKkv/eFBndQyv2QuIbZnj9YbDn2ZoZwoFMeMX
 Wdv4ezHrHRnjSX9Ob9umakxP+6FYAH1MfJBCWdgEQV8w1ZwXKSddjCwC1IpaSkg5XL
 reHgdDwtZf0djBxV+06O7vfOhyDYHvl+JtlSC3OQ=
Date: Mon, 23 Jan 2023 18:58:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: DMA-heap driver hints
Message-ID: <Y868mG7Oa5bI1wB7@pendragon.ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
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
Cc: James Jones <jajones@nvidia.com>, linaro-mm-sig@lists.linaro.org,
 sebastian.wick@redhat.com, labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 jstultz@google.com, lmark@codeaurora.org, tfiga@chromium.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Mon, Jan 23, 2023 at 05:29:18PM +0100, Christian König wrote:
> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
> > Hi Christian,
> >
> > CC'ing James as I think this is related to his work on the unix device
> > memory allocator ([1]).
> >
> > [1] https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/
> >
> > On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
> >> Hi guys,
> >>
> >> this is just an RFC! The last time we discussed the DMA-buf coherency
> >> problem [1] we concluded that DMA-heap first needs a better way to
> >> communicate to userspace which heap to use for a certain device.
> >>
> >> As far as I know userspace currently just hard codes that information
> >> which is certainly not desirable considering that we should have this
> >> inside the kernel as well.
> >>
> >> So what those two patches here do is to first add some
> >> dma_heap_create_device_link() and  dma_heap_remove_device_link()
> >> function and then demonstrating the functionality with uvcvideo
> >> driver.
> >>
> >> The preferred DMA-heap is represented with a symlink in sysfs between
> >> the device and the virtual DMA-heap device node.
> >
> > I'll start with a few high-level comments/questions:
> >
> > - Instead of tying drivers to heaps, have you considered a system where
> >    a driver would expose constraints, and a heap would then be selected
> >    based on those constraints ? A tight coupling between heaps and
> >    drivers means downstream patches to drivers in order to use
> >    vendor-specific heaps, that sounds painful.
> 
> I was wondering the same thing as well, but came to the conclusion that 
> just the other way around is the less painful approach.

From a kernel point of view, sure, it's simpler and thus less painful.
From the point of view of solving the whole issue, I'm not sure :-)

> The problem is that there are so many driver specific constrains that I 
> don't even know where to start from.

That's where I was hoping James would have some feedback for us, based
on the work he did on the Unix device memory allocator. If that's not
the case, we can brainstorm this from scratch.

> >    A constraint-based system would also, I think, be easier to extend
> >    with additional constraints in the future.
> >
> > - I assume some drivers will be able to support multiple heaps. How do
> >    you envision this being implemented ?
> 
> I don't really see an use case for this.
> 
> We do have some drivers which say: for this use case you can use 
> whatever you want, but for that use case you need to use specific memory 
> (scan out on GPUs for example works like this).
> 
> But those specific use cases are exactly that, very specific. And 
> exposing all the constrains for them inside a kernel UAPI is a futile 
> effort (at least for the GPU scan out case). In those situations it's 
> just better to have the allocator in userspace deal with device specific 
> stuff.

While the exact constraints will certainly be device-specific, is that
also true of the type of constraints, or the existence of constraints in
the first place ? To give an example, with a video decoder producing
frames that are then rendered by a GPU, the tiling format that would
produce the best result is device-specific, but the fact that the
decoder can produce a tiled format that would work better for the GPU,
or a non-tiled format for other consumers, is a very common constraint.
I don't think we'll be able to do away completely with the
device-specific code in userspace, but I think we should be able to
expose constraints in a generic-enough way that many simple use cases
will be covered by generic code.

> What I want to do is to separate the problem. The kernel only provides 
> the information where to allocate from, figuring out the details like 
> how many bytes, which format, plane layout etc.. is still the job of 
> userspace.

Even with UVC, where to allocate memory from will depend on the use
case. If the consumer is a device that doesn't support non-contiguous
DMA, the system heap won't work.

Actually, could you explain why UVC works better with the system heap ?
I'm looking at videobuf2 as an importer, and it doesn't call the dmabuf
as far as I can tell, so cache management provided by the exporter seems
to be bypassed in any case.

> What we do have is compatibility between heaps. E.g. a CMA heap is 
> usually compatible with the system heap or might even be a subset of 
> another CMA heap. But I wanted to add that as next step to the heaps 
> framework itself.
> 
> > - Devices could have different constraints based on particular
> >    configurations. For instance, a device may require specific memory
> >    layout for multi-planar YUV formats only (as in allocating the Y and C
> >    planes of NV12 from different memory banks). A dynamic API may thus be
> >    needed (but may also be very painful to use from userspace).
> 
> Uff, good to know. But I'm not sure how to expose stuff like that.

Let's see if James has anything to share with us :-) With a bit of luck
we won't have to start from scratch.

> >> What's still missing is certainly matching userspace for this since I
> >> wanted to discuss the initial kernel approach first.
> >
> > https://git.libcamera.org/libcamera/libcamera.git/ would be a good place
> > to prototype userspace support :-)
> 
> Thanks for the pointer and the review,

By the way, side question, does anyone know what the status of dma heaps
support is in major distributions ? On my Gentoo box,
/dev/dma_heap/system is 0600 root:root. That's easy to change for a
developer, but not friendly to end-users. If we want to move forward
with dma heaps as standard multimedia allocators (and I would really
like to see that happening), we have to make sure they can be used.

> >> Please take a look and comment.
> >>
> >> Thanks,
> >> Christian.
> >>
> >> [1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/

-- 
Regards,

Laurent Pinchart
