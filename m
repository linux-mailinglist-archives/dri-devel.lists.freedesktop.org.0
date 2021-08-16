Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260103ED10C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 11:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C484689D7D;
	Mon, 16 Aug 2021 09:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2999189D7D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 09:27:51 +0000 (UTC)
Date: Mon, 16 Aug 2021 11:27:40 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: IIO, dmabuf, io_uring
To: Christoph Hellwig <hch@lst.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?iso-8859-1?b?S/ZuaWc=?=
 <christian.koenig@amd.com>, linux-iio@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Hennerich
 <Michael.Hennerich@analog.com>, Alexandru Ardelean <ardeleanalex@gmail.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Message-Id: <4AEXXQ.7Z97EUWQOO0Q3@crapouillou.net>
In-Reply-To: <20210814073019.GC21175@lst.de>
References: <2H0SXQ.2KIK2PBVRFWH2@crapouillou.net>
 <20210814073019.GC21175@lst.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

Le sam., ao=FBt 14 2021 at 09:30:19 +0200, Christoph Hellwig=20
<hch@lst.de> a =E9crit :
> On Fri, Aug 13, 2021 at 01:41:26PM +0200, Paul Cercueil wrote:
>>  Hi,
>>=20
>>  A few months ago we (ADI) tried to upstream the interface we use=20
>> with our
>>  high-speed ADCs and DACs. It is a system with custom ioctls on the=20
>> iio
>>  device node to dequeue and enqueue buffers (allocated with
>>  dma_alloc_coherent), that can then be mmap'd by userspace=20
>> applications.
>>  Anyway, it was ultimately denied entry [1]; this API was okay in=20
>> ~2014 when
>>  it was designed but it feels like re-inventing the wheel in 2021.
>>=20
>>  Back to the drawing table, and we'd like to design something that=20
>> we can
>>  actually upstream. This high-speed interface looks awfully similar=20
>> to
>>  DMABUF, so we may try to implement a DMABUF interface for IIO,=20
>> unless
>>  someone has a better idea.
>=20
> To me this does sound a lot like a dma buf use case.  The interesting
> question to me is how to signal arrival of new data, or readyness to
> consume more data.  I suspect that people that are actually using
> dmabuf heavily at the moment (dri/media folks) might be able to chime
> in a little more on that.

Thanks for the feedback.

I haven't looked too much into how dmabuf works; but IIO device nodes=20
right now have a regular stdio interface, so I believe poll() flags can=20
be used to signal arrival of new data.

>>  Our first usecase is, we want userspace applications to be able to=20
>> dequeue
>>  buffers of samples (from ADCs), and/or enqueue buffers of samples=20
>> (for
>>  DACs), and to be able to manipulate them (mmapped buffers). With a=20
>> DMABUF
>>  interface, I guess the userspace application would dequeue a dma=20
>> buffer
>>  from the driver, mmap it, read/write the data, unmap it, then=20
>> enqueue it to
>>  the IIO driver again so that it can be disposed of. Does that sound=20
>> sane?
>>=20
>>  Our second usecase is - and that's where things get tricky - to be=20
>> able to
>>  stream the samples to another computer for processing, over=20
>> Ethernet or
>>  USB. Our typical setup is a high-speed ADC/DAC on a dev board with=20
>> a FPGA
>>  and a weak soft-core or low-power CPU; processing the data in-situ=20
>> is not
>>  an option. Copying the data from one buffer to another is not an=20
>> option
>>  either (way too slow), so we absolutely want zero-copy.
>>=20
>>  Usual userspace zero-copy techniques (vmsplice+splice, MSG_ZEROCOPY=20
>> etc)
>>  don't really work with mmapped kernel buffers allocated for DMA [2]=20
>> and/or
>>  have a huge overhead, so the way I see it, we would also need DMABUF
>>  support in both the Ethernet stack and USB (functionfs) stack.=20
>> However, as
>>  far as I understood, DMABUF is mostly a DRM/V4L2 thing, so I am=20
>> really not
>>  sure we have the right idea here.
>>=20
>>  And finally, there is the new kid in town, io_uring. I am not very=20
>> literate
>>  about the topic, but it does not seem to be able to handle DMA=20
>> buffers
>>  (yet?). The idea that we could dequeue a buffer of samples from the=20
>> IIO
>>  device and send it over the network in one single syscall is=20
>> appealing,
>>  though.
>=20
> Think of io_uring really just as an async syscall layer.  It doesn't
> replace DMA buffers, but can be used as a different and for some
> workloads more efficient way to dispatch syscalls.

That was my thought, yes. Thanks.

Cheers,
-Paul


