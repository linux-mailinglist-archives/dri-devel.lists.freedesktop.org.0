Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15A453788
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 17:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADDC89D5F;
	Tue, 16 Nov 2021 16:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F9689D5F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 16:32:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35C5CE7;
 Tue, 16 Nov 2021 17:31:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637080319;
 bh=+WYwbvfzPhZ1OsBrofZ/kYexlWkgvCGLKqYe/xe6KJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDDkbEWfBONMw/ndSzWotFH79WN1Sz5JCfLWVZReKJbohWjZ4hfsZ/spdMa4dkA/m
 dTbJQraBzmLwI/+aFgO/wxZobxUfu5Oh2WMMRuUtYRrBtODet52E1dMfPpofRcVc2p
 1VSWoOoY976nTI9WJsjet1wp3Ry5Rub2lqrTwXPQ=
Date: Tue, 16 Nov 2021 18:31:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <YZPc6HNOe6YOLE9k@pendragon.ideasonboard.com>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
 <18CM2R.6UYFWJDX5UQD@crapouillou.net>
 <YZPWEU2zRCY0En4l@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZPWEU2zRCY0En4l@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 05:02:25PM +0100, Daniel Vetter wrote:
> On Mon, Nov 15, 2021 at 02:57:37PM +0000, Paul Cercueil wrote:
> > Le lun., nov. 15 2021 at 15:37:16 +0100, Daniel Vetter a écrit :
> > > On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
> > > >  Hi Jonathan,
> > > > 
> > > >  This patchset introduces a new userspace interface based on DMABUF
> > > >  objects, to complement the existing fileio based API.
> > > > 
> > > >  The advantage of this DMABUF based interface vs. the fileio
> > > >  interface, is that it avoids an extra copy of the data between the
> > > >  kernel and userspace. This is particularly userful for high-speed
> > > >  devices which produce several megabytes or even gigabytes of data per
> > > >  second.
> > > > 
> > > >  The first few patches [01/15] to [03/15] are not really related, but
> > > >  allow to reduce the size of the patches that introduce the new API.
> > > > 
> > > >  Patch [04/15] to [06/15] enables write() support to the buffer-dma
> > > >  implementation of the buffer API, to continue the work done by
> > > >  Mihail Chindris.
> > > > 
> > > >  Patches [07/15] to [12/15] introduce the new DMABUF based API.
> > > > 
> > > >  Patches [13/15] and [14/15] add support for cyclic buffers, only through
> > > >  the new API. A cyclic buffer will be repeated on the output until the
> > > >  buffer is disabled.
> > > > 
> > > >  Patch [15/15] adds documentation about the new API.
> > > > 
> > > >  For now, the API allows you to alloc DMABUF objects and mmap() them
> > > > to
> > > >  read or write the samples. It does not yet allow to import DMABUFs
> > > >  parented to other subsystems, but that should eventually be possible
> > > >  once it's wired.
> > > > 
> > > >  This patchset is inspired by the "mmap interface" that was previously
> > > >  submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would be
> > > >  great if I could get a review from you guys. Alexandru's commit was
> > > >  signed with his @analog.com address but he doesn't work at ADI anymore,
> > > >  so I believe I'll need him to sign with a new email.
> > > 
> > > Why dma-buf? dma-buf looks like something super generic and useful, until
> > > you realize that there's a metric ton of gpu/accelerator bagage piled in.
> > > So unless buffer sharing with a gpu/video/accel/whatever device is the

And cameras (maybe they're included in "whatever" ?).

> > > goal here, and it's just for a convenient way to get at buffer handles,
> > > this doesn't sound like a good idea.
> > 
> > Good question. The first reason is that a somewhat similar API was intented
> > before[1], but refused upstream as it was kind of re-inventing the wheel.
> > 
> > The second reason, is that we want to be able to share buffers too, not with
> > gpu/video but with the network (zctap) and in the future with USB
> > (functionFS) too.
> > 
> > [1]: https://lore.kernel.org/linux-iio/20210217073638.21681-1-alexandru.ardelean@analog.com/T/
> 
> Hm is that code merged already in upstream already?
> 
> I know that dma-buf looks really generic, but like I said if there's no
> need ever to interface with any of the gpu buffer sharing it might be
> better to use something else (like get_user_pages maybe, would that work?).

Not GUP please. That brings another set of issues, especially when
dealing with DMA, we've suffered enough from the USERPTR support in V4L2
to avoid repeating this. Let's make dma-buf better instead.

> > > Also if the idea is to this with gpus/accelerators then I'd really like to
> > > see the full thing, since most likely at that point you also want
> > > dma_fence. And once we talk dma_fence things get truly horrible from a
> > > locking pov :-( Or well, just highly constrained and I get to review what
> > > iio is doing with these buffers to make sure it all fits.
> > 
> > There is some dma_fence action in patch #10, which is enough for the
> > userspace apps to use the API.
> > 
> > What "horribleness" are we talking about here? It doesn't look that scary to
> > me, but I certainly don't have the complete picture.
> 
> You need to annotate all the code involved in signalling that dma_fence
> using dma_fence_begin/end_signalling, and then enable full lockdep and
> everything.
> 
> You can safely assume you'll find bugs, because we even have bugs about
> this in gpu drivers (where that annotation isn't fully rolled out yet).
> 
> The tldr is that you can allocate memory in there. And a pile of other
> restrictions, but not being able to allocate memory (well GFP_ATOMIC is
> ok, but that can fail) is a very serious restriction.
> -Daniel
> 
> > > >  Alexandru Ardelean (1):
> > > >    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> > > > 
> > > >  Paul Cercueil (14):
> > > >    iio: buffer-dma: Get rid of incoming/outgoing queues
> > > >    iio: buffer-dma: Remove unused iio_buffer_block struct
> > > >    iio: buffer-dma: Use round_down() instead of rounddown()
> > > >    iio: buffer-dma: Enable buffer write support
> > > >    iio: buffer-dmaengine: Support specifying buffer direction
> > > >    iio: buffer-dmaengine: Enable write support
> > > >    iio: core: Add new DMABUF interface infrastructure
> > > >    iio: buffer-dma: Use DMABUFs instead of custom solution
> > > >    iio: buffer-dma: Implement new DMABUF based userspace API
> > > >    iio: buffer-dma: Boost performance using write-combine cache setting
> > > >    iio: buffer-dmaengine: Support new DMABUF based userspace API
> > > >    iio: core: Add support for cyclic buffers
> > > >    iio: buffer-dmaengine: Add support for cyclic buffers
> > > >    Documentation: iio: Document high-speed DMABUF based API
> > > > 
> > > >   Documentation/driver-api/dma-buf.rst          |   2 +
> > > >   Documentation/iio/dmabuf_api.rst              |  94 +++
> > > >   Documentation/iio/index.rst                   |   2 +
> > > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
> > > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 670 ++++++++++++++----
> > > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
> > > >   drivers/iio/industrialio-buffer.c             |  49 ++
> > > >   include/linux/iio/buffer-dma.h                |  43 +-
> > > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
> > > >   include/linux/iio/buffer_impl.h               |   8 +
> > > >   include/uapi/linux/iio/buffer.h               |  30 +
> > > >   11 files changed, 783 insertions(+), 165 deletions(-)
> > > >   create mode 100644 Documentation/iio/dmabuf_api.rst

-- 
Regards,

Laurent Pinchart
