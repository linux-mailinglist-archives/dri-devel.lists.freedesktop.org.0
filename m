Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416F4546A3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 13:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A2D6E941;
	Wed, 17 Nov 2021 12:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09F76E93B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 12:50:33 +0000 (UTC)
Date: Wed, 17 Nov 2021 12:50:20 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <WNVP2R.HXWZSVQE5UMK1@crapouillou.net>
In-Reply-To: <YZPWEU2zRCY0En4l@phenom.ffwll.local>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <YZJwnPbgCOdeKq6S@phenom.ffwll.local> <18CM2R.6UYFWJDX5UQD@crapouillou.net>
 <YZPWEU2zRCY0En4l@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le mar., nov. 16 2021 at 17:02:25 +0100, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Mon, Nov 15, 2021 at 02:57:37PM +0000, Paul Cercueil wrote:
>>  Hi Daniel,
>>=20
>>  Le lun., nov. 15 2021 at 15:37:16 +0100, Daniel Vetter=20
>> <daniel@ffwll.ch> a
>>  =E9crit :
>>  > On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
>>  > >  Hi Jonathan,
>>  > >
>>  > >  This patchset introduces a new userspace interface based on=20
>> DMABUF
>>  > >  objects, to complement the existing fileio based API.
>>  > >
>>  > >  The advantage of this DMABUF based interface vs. the fileio
>>  > >  interface, is that it avoids an extra copy of the data between=20
>> the
>>  > >  kernel and userspace. This is particularly userful for=20
>> high-speed
>>  > >  devices which produce several megabytes or even gigabytes of=20
>> data
>>  > > per
>>  > >  second.
>>  > >
>>  > >  The first few patches [01/15] to [03/15] are not really=20
>> related, but
>>  > >  allow to reduce the size of the patches that introduce the new=20
>> API.
>>  > >
>>  > >  Patch [04/15] to [06/15] enables write() support to the=20
>> buffer-dma
>>  > >  implementation of the buffer API, to continue the work done by
>>  > >  Mihail Chindris.
>>  > >
>>  > >  Patches [07/15] to [12/15] introduce the new DMABUF based API.
>>  > >
>>  > >  Patches [13/15] and [14/15] add support for cyclic buffers,=20
>> only
>>  > > through
>>  > >  the new API. A cyclic buffer will be repeated on the output=20
>> until
>>  > > the
>>  > >  buffer is disabled.
>>  > >
>>  > >  Patch [15/15] adds documentation about the new API.
>>  > >
>>  > >  For now, the API allows you to alloc DMABUF objects and mmap()=20
>> them
>>  > > to
>>  > >  read or write the samples. It does not yet allow to import=20
>> DMABUFs
>>  > >  parented to other subsystems, but that should eventually be=20
>> possible
>>  > >  once it's wired.
>>  > >
>>  > >  This patchset is inspired by the "mmap interface" that was
>>  > > previously
>>  > >  submitted by Alexandru Ardelean and Lars-Peter Clausen, so it=20
>> would
>>  > > be
>>  > >  great if I could get a review from you guys. Alexandru's=20
>> commit was
>>  > >  signed with his @analog.com address but he doesn't work at ADI
>>  > > anymore,
>>  > >  so I believe I'll need him to sign with a new email.
>>  >
>>  > Why dma-buf? dma-buf looks like something super generic and=20
>> useful,
>>  > until
>>  > you realize that there's a metric ton of gpu/accelerator bagage=20
>> piled
>>  > in.
>>  > So unless buffer sharing with a gpu/video/accel/whatever device=20
>> is the
>>  > goal here, and it's just for a convenient way to get at buffer=20
>> handles,
>>  > this doesn't sound like a good idea.
>>=20
>>  Good question. The first reason is that a somewhat similar API was=20
>> intented
>>  before[1], but refused upstream as it was kind of re-inventing the=20
>> wheel.
>>=20
>>  The second reason, is that we want to be able to share buffers too,=20
>> not with
>>  gpu/video but with the network (zctap) and in the future with USB
>>  (functionFS) too.
>>=20
>>  [1]:=20
>> https://lore.kernel.org/linux-iio/20210217073638.21681-1-alexandru.ardel=
ean@analog.com/T/
>=20
> Hm is that code merged already in upstream already?

No, it was never merged.

> I know that dma-buf looks really generic, but like I said if there's=20
> no
> need ever to interface with any of the gpu buffer sharing it might be
> better to use something else (like get_user_pages maybe, would that=20
> work?).

If it was such a bad idea, why didn't you say it in the first place=20
when you replied to my request for feedback? [1]

I don't think we have any other solution. We can design a custom API to=20
pass buffers between IIO and user space, but that won't allow us to=20
share these buffers with other subsystems. If dma-buf is not a generic=20
solution, then we need a generic solution.

[1]:=20
https://x-lore.kernel.org/io-uring/b0a336c0-ae2f-e77f-3c5f-51fdb3fc51fe@amd=
.com/T/

>>  > Also if the idea is to this with gpus/accelerators then I'd=20
>> really like
>>  > to
>>  > see the full thing, since most likely at that point you also want
>>  > dma_fence. And once we talk dma_fence things get truly horrible=20
>> from a
>>  > locking pov :-( Or well, just highly constrained and I get to=20
>> review
>>  > what
>>  > iio is doing with these buffers to make sure it all fits.
>>=20
>>  There is some dma_fence action in patch #10, which is enough for the
>>  userspace apps to use the API.
>>=20
>>  What "horribleness" are we talking about here? It doesn't look that=20
>> scary to
>>  me, but I certainly don't have the complete picture.
>=20
> You need to annotate all the code involved in signalling that=20
> dma_fence
> using dma_fence_begin/end_signalling, and then enable full lockdep and
> everything.

Doesn't dma_fence_signal() do it for me? Looking at the code, it does=20
call dma_fence_begin/end_signalling.

Cheers,
-Paul

> You can safely assume you'll find bugs, because we even have bugs=20
> about
> this in gpu drivers (where that annotation isn't fully rolled out=20
> yet).
>=20
> The tldr is that you can allocate memory in there. And a pile of other
> restrictions, but not being able to allocate memory (well GFP_ATOMIC=20
> is
> ok, but that can fail) is a very serious restriction.
> -Daniel
>=20
>=20
>>=20
>>  Cheers,
>>  -Paul
>>=20
>>  > Cheers, Daniel
>>  >
>>  > >
>>  > >  Cheers,
>>  > >  -Paul
>>  > >
>>  > >  Alexandru Ardelean (1):
>>  > >    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
>>  > >
>>  > >  Paul Cercueil (14):
>>  > >    iio: buffer-dma: Get rid of incoming/outgoing queues
>>  > >    iio: buffer-dma: Remove unused iio_buffer_block struct
>>  > >    iio: buffer-dma: Use round_down() instead of rounddown()
>>  > >    iio: buffer-dma: Enable buffer write support
>>  > >    iio: buffer-dmaengine: Support specifying buffer direction
>>  > >    iio: buffer-dmaengine: Enable write support
>>  > >    iio: core: Add new DMABUF interface infrastructure
>>  > >    iio: buffer-dma: Use DMABUFs instead of custom solution
>>  > >    iio: buffer-dma: Implement new DMABUF based userspace API
>>  > >    iio: buffer-dma: Boost performance using write-combine cache
>>  > > setting
>>  > >    iio: buffer-dmaengine: Support new DMABUF based userspace API
>>  > >    iio: core: Add support for cyclic buffers
>>  > >    iio: buffer-dmaengine: Add support for cyclic buffers
>>  > >    Documentation: iio: Document high-speed DMABUF based API
>>  > >
>>  > >   Documentation/driver-api/dma-buf.rst          |   2 +
>>  > >   Documentation/iio/dmabuf_api.rst              |  94 +++
>>  > >   Documentation/iio/index.rst                   |   2 +
>>  > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
>>  > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 670
>>  > > ++++++++++++++----
>>  > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
>>  > >   drivers/iio/industrialio-buffer.c             |  49 ++
>>  > >   include/linux/iio/buffer-dma.h                |  43 +-
>>  > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
>>  > >   include/linux/iio/buffer_impl.h               |   8 +
>>  > >   include/uapi/linux/iio/buffer.h               |  30 +
>>  > >   11 files changed, 783 insertions(+), 165 deletions(-)
>>  > >   create mode 100644 Documentation/iio/dmabuf_api.rst
>>  > >
>>  > >  --
>>  > >  2.33.0
>>  > >
>>  >
>>  > --
>>  > Daniel Vetter
>>  > Software Engineer, Intel Corporation
>>  > http://blog.ffwll.ch
>>=20
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


