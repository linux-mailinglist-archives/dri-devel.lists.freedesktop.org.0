Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1DF4507B0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E816EB36;
	Mon, 15 Nov 2021 14:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B556EB36
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:57:48 +0000 (UTC)
Date: Mon, 15 Nov 2021 14:57:37 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <18CM2R.6UYFWJDX5UQD@crapouillou.net>
In-Reply-To: <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
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

Le lun., nov. 15 2021 at 15:37:16 +0100, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
>>  Hi Jonathan,
>>=20
>>  This patchset introduces a new userspace interface based on DMABUF
>>  objects, to complement the existing fileio based API.
>>=20
>>  The advantage of this DMABUF based interface vs. the fileio
>>  interface, is that it avoids an extra copy of the data between the
>>  kernel and userspace. This is particularly userful for high-speed
>>  devices which produce several megabytes or even gigabytes of data=20
>> per
>>  second.
>>=20
>>  The first few patches [01/15] to [03/15] are not really related, but
>>  allow to reduce the size of the patches that introduce the new API.
>>=20
>>  Patch [04/15] to [06/15] enables write() support to the buffer-dma
>>  implementation of the buffer API, to continue the work done by
>>  Mihail Chindris.
>>=20
>>  Patches [07/15] to [12/15] introduce the new DMABUF based API.
>>=20
>>  Patches [13/15] and [14/15] add support for cyclic buffers, only=20
>> through
>>  the new API. A cyclic buffer will be repeated on the output until=20
>> the
>>  buffer is disabled.
>>=20
>>  Patch [15/15] adds documentation about the new API.
>>=20
>>  For now, the API allows you to alloc DMABUF objects and mmap() them=20
>> to
>>  read or write the samples. It does not yet allow to import DMABUFs
>>  parented to other subsystems, but that should eventually be possible
>>  once it's wired.
>>=20
>>  This patchset is inspired by the "mmap interface" that was=20
>> previously
>>  submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would=20
>> be
>>  great if I could get a review from you guys. Alexandru's commit was
>>  signed with his @analog.com address but he doesn't work at ADI=20
>> anymore,
>>  so I believe I'll need him to sign with a new email.
>=20
> Why dma-buf? dma-buf looks like something super generic and useful,=20
> until
> you realize that there's a metric ton of gpu/accelerator bagage piled=20
> in.
> So unless buffer sharing with a gpu/video/accel/whatever device is the
> goal here, and it's just for a convenient way to get at buffer=20
> handles,
> this doesn't sound like a good idea.

Good question. The first reason is that a somewhat similar API was=20
intented before[1], but refused upstream as it was kind of re-inventing=20
the wheel.

The second reason, is that we want to be able to share buffers too, not=20
with gpu/video but with the network (zctap) and in the future with USB=20
(functionFS) too.

[1]:=20
https://lore.kernel.org/linux-iio/20210217073638.21681-1-alexandru.ardelean=
@analog.com/T/

> Also if the idea is to this with gpus/accelerators then I'd really=20
> like to
> see the full thing, since most likely at that point you also want
> dma_fence. And once we talk dma_fence things get truly horrible from a
> locking pov :-( Or well, just highly constrained and I get to review=20
> what
> iio is doing with these buffers to make sure it all fits.

There is some dma_fence action in patch #10, which is enough for the=20
userspace apps to use the API.

What "horribleness" are we talking about here? It doesn't look that=20
scary to me, but I certainly don't have the complete picture.

Cheers,
-Paul

> Cheers, Daniel
>=20
>>=20
>>  Cheers,
>>  -Paul
>>=20
>>  Alexandru Ardelean (1):
>>    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
>>=20
>>  Paul Cercueil (14):
>>    iio: buffer-dma: Get rid of incoming/outgoing queues
>>    iio: buffer-dma: Remove unused iio_buffer_block struct
>>    iio: buffer-dma: Use round_down() instead of rounddown()
>>    iio: buffer-dma: Enable buffer write support
>>    iio: buffer-dmaengine: Support specifying buffer direction
>>    iio: buffer-dmaengine: Enable write support
>>    iio: core: Add new DMABUF interface infrastructure
>>    iio: buffer-dma: Use DMABUFs instead of custom solution
>>    iio: buffer-dma: Implement new DMABUF based userspace API
>>    iio: buffer-dma: Boost performance using write-combine cache=20
>> setting
>>    iio: buffer-dmaengine: Support new DMABUF based userspace API
>>    iio: core: Add support for cyclic buffers
>>    iio: buffer-dmaengine: Add support for cyclic buffers
>>    Documentation: iio: Document high-speed DMABUF based API
>>=20
>>   Documentation/driver-api/dma-buf.rst          |   2 +
>>   Documentation/iio/dmabuf_api.rst              |  94 +++
>>   Documentation/iio/index.rst                   |   2 +
>>   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
>>   drivers/iio/buffer/industrialio-buffer-dma.c  | 670=20
>> ++++++++++++++----
>>   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
>>   drivers/iio/industrialio-buffer.c             |  49 ++
>>   include/linux/iio/buffer-dma.h                |  43 +-
>>   include/linux/iio/buffer-dmaengine.h          |   5 +-
>>   include/linux/iio/buffer_impl.h               |   8 +
>>   include/uapi/linux/iio/buffer.h               |  30 +
>>   11 files changed, 783 insertions(+), 165 deletions(-)
>>   create mode 100644 Documentation/iio/dmabuf_api.rst
>>=20
>>  --
>>  2.33.0
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


