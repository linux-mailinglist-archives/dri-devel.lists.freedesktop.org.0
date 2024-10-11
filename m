Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8C99AB0E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 20:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3837E10EBF2;
	Fri, 11 Oct 2024 18:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q8VYwb/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7210EBF2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 18:36:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [132.205.230.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8C388D4;
 Fri, 11 Oct 2024 20:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1728671698;
 bh=wru5Rvv4jiT752rUTr3o8+DQM9S2aJwuMOpuGzkMBNs=;
 h=Date:From:To:Cc:Subject:From;
 b=Q8VYwb/CfJqyKGz1ZbmmBK0kjR2M9rXeXLclkfANT9uz9EqqjJNb06+NhjxhKOOaJ
 fC7kjI/bWZHiMpvSkkk59aazpMZDMF/+0h+IX3N9NngUijvHm8/WX1ERCUbYI68aex
 ihVNpU2FvkwJeixDzHC3zpy9B7zFQ1JO0VDJrOas=
Date: Fri, 11 Oct 2024 21:36:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Cc: Erico Nunes <ernunes@redhat.com>, James Jones <jajones@nvidia.com>,
 Nicolas Dufresne <nicolas@collabora.com>, Yunxiang Li <yunxiang.li@amd.com>
Subject: Notes from the XDC 2024 "universal buffer allocator" workshop
Message-ID: <20241011183631.GC26015@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hello,

We held a workshop at XDC 2024 titled "Towards a universal buffer
allocator for Linux", whose abstract was as follows:

  Buffer allocation for media contents, despite being required for any
  framework or application dealing with image capture, processing,
  decoding, encoding, rendering and display, remains an area plagued by
  many unsolved problems. Over time improvements have been made to APIs
  for buffer allocation, both on the kernel side (standardization of the
  DRM dumb buffer API, or DMA heaps, to name a few) and in userspace
  (most notably with GBM, and the buffer management API in Vulkan), or
  for specific use cases (e.g. gralloc in Android). Unfortunately, no
  universal solution exists to allocate buffers shared by multiple
  devices. This is hindering interoperability and forces userspace to
  pile hacks and workarounds.

  (https://indico.freedesktop.org/event/6/contributions/395/). 


Here are the raw notes from the workshop.


XDC 2024 - Buffer allocation workshop
=====================================

Attendees:

- Erico Nunes <ernunes@redhat.com>
- James Jones <jajones@nvidia.com>
- Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- Nicolas Dufresne <nicolas@collabora.com>
- Yunxiang (Teddy) Li <yunxiang.li@amd.com>

Relevant content:

- XDC 2016: https://www.x.org/wiki/Events/XDC2016/Program/Unix_Device_Memory_Allocation.pdf
- XDC 2020: https://lpc.events/event/9/contributions/615/attachments/704/1301/XDC_2020__Allocation_Constraints.pdf


Discussions
-----------

NICs are relevant to the discussion, but likely only on large servers.
The proposal needs to accomodate that.

Nicolas asked about support for the CPU as a device. A lot of pipelines
are hybrid, with CPU processing and dedicated hardware processing. James
said previous proposals were able to support the CPU as a device.  The
last proposal was focussed on usages, so could support CPUs.

Demi things this could be viewed as in a similar way as type checking in
compilers, which have to resolve constraints.

Nicolas is annoyed that we force applications to make a decision,
requiring them to go the hard route of reallocation if they get it
wrong. Some of the parameters are the MMU configuration, which can't be
changed afterwards in Linux.

Demi said that there could be cases where the fastest thing to do is to
use shadow memory and copy. Nicolas said the first question that would
come back is if this is something userspace should decide. Yunxiang
asked if we're looking at designing a kernel interface to convey
constraints. Nicolas said some kernel APIs expose some constraints. For
instance, V4L2 allows discovering some stride constraints. Yunxiang
thinks constraints won't be able to scale.  Capabilities would be
better. The difference is that the hardware device can have lots of
constraints, but could more easily say some of the things it can do.
Adding a new capability later wouldn't break anything, but adding a new
constraint would require all components to understand it. James said the
latest proposal handled constraints in a forward-compatible way with
versioned constraints. Demi prefers the capabilities approach. Yunxiang
said devices could expose which memory they can access.

Nicolas said that in GStreamer, the current approach is trial and error.
Capabilities would reduce trial and error.  Everybody has hacks on top.
James is instead bringing a formula that solves this. As soon as each of
the nodes involved can be identified (which GStreamer can do now), we
can calculate and combine but can't sustain adding capabilities. Liviu
said GStreamer could tell which capabilities it supports, and push
hardware vendors to comply with that. If the hardware is not compatible,
GStreamer would provide converters. Nicolas said buffer sharing is a
trade-off. We will find things that won't break it but will make it
slower. Demi said that cache-incoherent DMA will usually have higher
bandwidth than cache-coherent DMA, unless all the components share the
same cache.

Discussion followed on capabilities vs. constraints. It's partly a
vocabulary matter. The first proposal from James was using the word
capability. Constraints in the last proposal describe what a device can
do.

Nicolas has only stride and number of planes as constraints in
GStreamer. James' mechanism has support for much more. Yunxiang asked if
we can include the pixel format as constraints. James said we first have
to resolve formats and modifiers, and then handle allocation
constraints. Yunxiang thinks the allocator should also take care of the
format. Nicolas said that when using a tiling modifier, we already
reduce the scope of incompatibilities.  When using e.g. an Intel tiling
modifier, there's a bigger guarantee that the devices that support it
will be able to inter-operate as they're designed for that purpose.

Demi said it should be possible to validate parameters for buffers
without being Mesa. The format modifiers are way too opaque. James said
that for each format we need to query possible modifiers, and for each
format+modifier we need to query constraints. Modifiers are mostly
considered opaque to applications, constraints are semi-opaque, and
formats are not opaque.

The problem that remains hard to James is when it comes to locality, how
do we say "local to a device" ? There's no serializable representation
of a device. Nicolas says that as soon as it stays in the graphics
stack, the stack will hide the problem from applications. A sysfs path
could be used on Linux to identify a device.

James asked how an application would be allowed to allocate buffers from
e.g. a DRI device, if the allocator library told it that the allocation
needs to be done there. This starts becoming a permission issue or a
logind issue. Passing fds could help, but when sitting on top of GL, we
have no way to get an fd. Nicolas said Vulkan should be OK, but GL is
dead. Nicolas asked why it would be useful to get access to fds. James
said that at the bottom of the problem we have the question of which fd
we send an ioctl to to allocate memory.

We could start small to have something and break the chicken and egg
problem. James thought about using GBM to start with, but this isn't
good for GStreamer. James and Nicolas thought that kernel drivers would
register dmabuf heaps. One issue with dmabuf heaps today is that
allocation isn't tracked, so we bypass cgroups.  DRM and V4L2 have the
same issue, offering an infinite amount of memory. logind has a
responsibility of not making it worse, so didn't allow access to dmabuf
heaps. The problem needs to be fixed in the kernel first, adding
accounting. This would then be an incentive to abandon device-specific
allocation APIs, as memory accounting would come for free when using
dmabuf heaps. Nicolas wonders why the obvious path forward of
implementing heaps for devices that have specific constraints didn't
happen. James thinks people may just have been too busy.

Demi brought up the VFIO case. The hardware device may not be managed by
the kernel, it may be managed by userspace, or passed to a guest.
Capabilities for those devices can't come from a kernel device. James
said the key is communicating the constraints in a serializable way.
Allocation would involve passing dmabufs between guests and hosts.

Allocation from DMA heaps and from subsystem-specific APIs will coexist
for a long time. This needs to be abstracted in a userspace library, so
that the underlying allocators can evolve.

Demi asked if GBM is needed when using Vulkan. Internally in mesa,
everything uses GBM for allocation. James said it's a good argument to
ask why not using Vulkan only. If we decide to use GBM to bootstrap this
evolution, and GBM allocates for a specific device, then it doesn't seem
to be a good fit. We don't want to add support for system memory
allocation to GBM. Erico said that there's a use case for GBM even when
using Vulkan when there's a separate display device that has no Vulkan
implementation.

We need an iterative approach. For instance a simple useful improvement
would be to expose stride constraints on DRM devices.


Conclusions
-----------

- We need some library (existing or new one)
- We need some API
- We need someone to bootstrap this
- We need a more iterative approach


Action points
-------------

- Add memory accounting to DMA heaps
- Push drivers to implement their own heaps to replace subsystem allocation APIs

-- 
Regards,

Laurent Pinchart
