Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2934EAA31
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 11:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074B310E302;
	Tue, 29 Mar 2022 09:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0410E302
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1648545084; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMAjaC6Xw9SY4zhfvb3pKA4ot1/J4vIm+YtJOA8m/zE=;
 b=pwWs/q9k23KWG7HgdNFF25NnQ76o5gHr+LF7wTk332YU0sRuDJRoCvHBgjgjDNDYgdyxcb
 owrNs15C2GzTF2MeRMVxffGqYVRQxbS1T/EJFXlMcLzq3P1X3S8AiXiQEIv1AZuXP/Jyn2
 A0rcspXWffbD9k4wC1psO2d0Y1p4V3Q=
Date: Tue, 29 Mar 2022 10:11:14 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 00/12] iio: buffer-dma: write() and new DMABUF based API
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <QI1I9R.GDPWLM86I45S@crapouillou.net>
In-Reply-To: <YkLEXJzs8ukrxG8s@phenom.ffwll.local>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220213184616.669b490b@jic23-huawei>
 <N8XC7R.5FP2M8552CGT3@crapouillou.net> <YkLEXJzs8ukrxG8s@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le mar., mars 29 2022 at 10:33:32 +0200, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Tue, Feb 15, 2022 at 05:43:35PM +0000, Paul Cercueil wrote:
>>  Hi Jonathan,
>>=20
>>  Le dim., f=E9vr. 13 2022 at 18:46:16 +0000, Jonathan Cameron
>>  <jic23@kernel.org> a =E9crit :
>>  > On Mon,  7 Feb 2022 12:59:21 +0000
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  > >  Hi Jonathan,
>>  > >
>>  > >  This is the V2 of my patchset that introduces a new userspace
>>  > > interface
>>  > >  based on DMABUF objects to complement the fileio API, and adds
>>  > > write()
>>  > >  support to the existing fileio API.
>>  >
>>  > Hi Paul,
>>  >
>>  > It's been a little while. Perhaps you could summarize the various=20
>> view
>>  > points around the appropriateness of using DMABUF for this?
>>  > I appreciate it is a tricky topic to distil into a brief summary=20
>> but
>>  > I know I would find it useful even if no one else does!
>>=20
>>  So we want to have a high-speed interface where buffers of samples=20
>> are
>>  passed around between IIO devices and other devices (e.g. USB or=20
>> network),
>>  or made available to userspace without copying the data.
>>=20
>>  DMABUF is, at least in theory, exactly what we need. Quoting the
>>  documentation
>>  (https://www.kernel.org/doc/html/v5.15/driver-api/dma-buf.html):
>>  "The dma-buf subsystem provides the framework for sharing buffers=20
>> for
>>  hardware (DMA) access across multiple device drivers and=20
>> subsystems, and for
>>  synchronizing asynchronous hardware access. This is used, for=20
>> example, by
>>  drm =B4prime=A1 multi-GPU support, but is of course not limited to=20
>> GPU use
>>  cases."
>>=20
>>  The problem is that right now DMABUF is only really used by DRM,=20
>> and to
>>  quote Daniel, "dma-buf looks like something super generic and=20
>> useful, until
>>  you realize that there's a metric ton of gpu/accelerator bagage=20
>> piled in".
>>=20
>>  Still, it seems to be the only viable option. We could add a custom
>>  buffer-passing interface, but that would mean implementing the same
>>  buffer-passing interface on the network and USB stacks, and before=20
>> we know
>>  it we re-invented DMABUFs.
>=20
> dma-buf also doesn't support sharing with network and usb stacks, so=20
> I'm a
> bit confused why exactly this is useful?

There is an attempt to get dma-buf support in the network stack, called=20
"zctap". Last patchset was sent last november. USB stack does not=20
support dma-buf, but we can add it later I guess.

> So yeah unless there's some sharing going on with gpu stuff (for data
> processing maybe) I'm not sure this makes a lot of sense really. Or at
> least some zero-copy sharing between drivers, but even that would
> minimally require a dma-buf import ioctl of some sorts. Which I either
> missed or doesn't exist.

We do want zero-copy between drivers, the network stack, and the USB=20
stack. It's not just about having a userspace interface.

> If there's none of that then just hand-roll your buffer handling code
> (xarray is cheap to use in terms of code for this), you can always add
> dma-buf import/export later on when the need arises.
>=20
> Scrolling through patches you only have dma-buf export, but no=20
> importing,
> so the use-case that works is with one of the existing subsystems that
> supporting dma-buf importing.
>=20
> I think minimally we need the use-case (in form of code) that needs=20
> the
> buffer sharing here.

I'll try with zctap and report back.

Cheers,
-Paul

>>  > >
>>  > >  Changes since v1:
>>  > >
>>  > >  - the patches that were merged in v1 have been (obviously)=20
>> dropped
>>  > > from
>>  > >    this patchset;
>>  > >  - the patch that was setting the write-combine cache setting=20
>> has
>>  > > been
>>  > >    dropped as well, as it was simply not useful.
>>  > >  - [01/12]:
>>  > >      * Only remove the outgoing queue, and keep the incoming=20
>> queue,
>>  > > as we
>>  > >        want the buffer to start streaming data as soon as it is
>>  > > enabled.
>>  > >      * Remove IIO_BLOCK_STATE_DEQUEUED, since it is now=20
>> functionally
>>  > > the
>>  > >        same as IIO_BLOCK_STATE_DONE.
>>  > >  - [02/12]:
>>  > >      * Fix block->state not being reset in
>>  > >        iio_dma_buffer_request_update() for output buffers.
>>  > >      * Only update block->bytes_used once and add a comment=20
>> about
>>  > > why we
>>  > >        update it.
>>  > >      * Add a comment about why we're setting a different state=20
>> for
>>  > > output
>>  > >        buffers in iio_dma_buffer_request_update()
>>  > >      * Remove useless cast to bool (!!) in iio_dma_buffer_io()
>>  > >  - [05/12]:
>>  > >      Only allow the new IOCTLs on the buffer FD created with
>>  > >      IIO_BUFFER_GET_FD_IOCTL().
>>  > >  - [12/12]:
>>  > >      * Explicitly state that the new interface is optional and=20
>> is
>>  > >        not implemented by all drivers.
>>  > >      * The IOCTLs can now only be called on the buffer FD=20
>> returned by
>>  > >        IIO_BUFFER_GET_FD_IOCTL.
>>  > >      * Move the page up a bit in the index since it is core=20
>> stuff
>>  > > and not
>>  > >        driver-specific.
>>  > >
>>  > >  The patches not listed here have not been modified since v1.
>>  > >
>>  > >  Cheers,
>>  > >  -Paul
>>  > >
>>  > >  Alexandru Ardelean (1):
>>  > >    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
>>  > >
>>  > >  Paul Cercueil (11):
>>  > >    iio: buffer-dma: Get rid of outgoing queue
>>  > >    iio: buffer-dma: Enable buffer write support
>>  > >    iio: buffer-dmaengine: Support specifying buffer direction
>>  > >    iio: buffer-dmaengine: Enable write support
>>  > >    iio: core: Add new DMABUF interface infrastructure
>>  > >    iio: buffer-dma: Use DMABUFs instead of custom solution
>>  > >    iio: buffer-dma: Implement new DMABUF based userspace API
>>  > >    iio: buffer-dmaengine: Support new DMABUF based userspace API
>>  > >    iio: core: Add support for cyclic buffers
>>  > >    iio: buffer-dmaengine: Add support for cyclic buffers
>>  > >    Documentation: iio: Document high-speed DMABUF based API
>>  > >
>>  > >   Documentation/driver-api/dma-buf.rst          |   2 +
>>  > >   Documentation/iio/dmabuf_api.rst              |  94 +++
>>  > >   Documentation/iio/index.rst                   |   2 +
>>  > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
>>  > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 610
>>  > > ++++++++++++++----
>>  > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
>>  > >   drivers/iio/industrialio-buffer.c             |  60 ++
>>  > >   include/linux/iio/buffer-dma.h                |  38 +-
>>  > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
>>  > >   include/linux/iio/buffer_impl.h               |   8 +
>>  > >   include/uapi/linux/iio/buffer.h               |  30 +
>>  > >   11 files changed, 749 insertions(+), 145 deletions(-)
>>  > >   create mode 100644 Documentation/iio/dmabuf_api.rst
>>  > >
>>  >
>>=20
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


