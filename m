Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85F4EAAB7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 11:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CFD10E796;
	Tue, 29 Mar 2022 09:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFEB10E792
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1648547260; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8RgERyOiW+i+GwydncfsHV1G1M1TmxHobeUS8u9jq4=;
 b=Z/BO0tiDIQpKj0a5aKQmLM7Y9WyMII/XnpqKHAjueN1dLp3XhBsqxs4GcLXarRrNnn07Gv
 Kmskxk6LAOg9r/RBxVE3j29PkKi8Myc0t4dAA4CVEKmTjhCA7Lvap82oM26LP4xTWMshGB
 RfDhQY5k2tc5ylIDMTc25PAUZQfTE08=
Date: Tue, 29 Mar 2022 10:47:23 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 12/12] Documentation: iio: Document high-speed DMABUF
 based API
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <Z63I9R.MKYUKBH4V8L41@crapouillou.net>
In-Reply-To: <YkLJU7Pp98CPIHfY@phenom.ffwll.local>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207130140.81891-1-paul@crapouillou.net>
 <20220207130140.81891-2-paul@crapouillou.net>
 <YkLJU7Pp98CPIHfY@phenom.ffwll.local>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le mar., mars 29 2022 at 10:54:43 +0200, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Mon, Feb 07, 2022 at 01:01:40PM +0000, Paul Cercueil wrote:
>>  Document the new DMABUF based API.
>>=20
>>  v2: - Explicitly state that the new interface is optional and is
>>        not implemented by all drivers.
>>      - The IOCTLs can now only be called on the buffer FD returned by
>>        IIO_BUFFER_GET_FD_IOCTL.
>>      - Move the page up a bit in the index since it is core stuff=20
>> and not
>>        driver-specific.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   Documentation/driver-api/dma-buf.rst |  2 +
>>   Documentation/iio/dmabuf_api.rst     | 94=20
>> ++++++++++++++++++++++++++++
>>   Documentation/iio/index.rst          |  2 +
>>   3 files changed, 98 insertions(+)
>>   create mode 100644 Documentation/iio/dmabuf_api.rst
>>=20
>>  diff --git a/Documentation/driver-api/dma-buf.rst=20
>> b/Documentation/driver-api/dma-buf.rst
>>  index 2cd7db82d9fe..d3c9b58d2706 100644
>>  --- a/Documentation/driver-api/dma-buf.rst
>>  +++ b/Documentation/driver-api/dma-buf.rst
>>  @@ -1,3 +1,5 @@
>>  +.. _dma-buf:
>>  +
>>   Buffer Sharing and Synchronization
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  diff --git a/Documentation/iio/dmabuf_api.rst=20
>> b/Documentation/iio/dmabuf_api.rst
>>  new file mode 100644
>>  index 000000000000..43bb2c1b9fdc
>>  --- /dev/null
>>  +++ b/Documentation/iio/dmabuf_api.rst
>>  @@ -0,0 +1,94 @@
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +High-speed DMABUF interface for IIO
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +1. Overview
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +The Industrial I/O subsystem supports access to buffers through a=20
>> file-based
>>  +interface, with read() and write() access calls through the IIO=20
>> device's dev
>>  +node.
>>  +
>>  +It additionally supports a DMABUF based interface, where the=20
>> userspace
>>  +application can allocate and append DMABUF objects to the buffer's=20
>> queue.
>>  +This interface is however optional and is not available in all=20
>> drivers.
>>  +
>>  +The advantage of this DMABUF based interface vs. the read()
>>  +interface, is that it avoids an extra copy of the data between the
>>  +kernel and userspace. This is particularly useful for high-speed
>>  +devices which produce several megabytes or even gigabytes of data=20
>> per
>>  +second.
>>  +
>>  +The data in this DMABUF interface is managed at the granularity of
>>  +DMABUF objects. Reducing the granularity from byte level to block=20
>> level
>>  +is done to reduce the userspace-kernelspace synchronization=20
>> overhead
>>  +since performing syscalls for each byte at a few Mbps is just not
>>  +feasible.
>>  +
>>  +This of course leads to a slightly increased latency. For this=20
>> reason an
>>  +application can choose the size of the DMABUFs as well as how many=20
>> it
>>  +allocates. E.g. two DMABUFs would be a traditional double buffering
>>  +scheme. But using a higher number might be necessary to avoid
>>  +underflow/overflow situations in the presence of scheduling=20
>> latencies.
>=20
> So this reads a lot like reinventing io-uring with pre-registered=20
> O_DIRECT
> memory ranges. Except it's using dma-buf and hand-rolling a lot of=20
> pieces
> instead of io-uring and O_DIRECT.

I don't see how io_uring would help us. It's an async I/O framework,=20
does it allow us to access a kernel buffer without copying the data?=20
Does it allow us to zero-copy the data to a network interface?

> At least if the entire justification for dma-buf support is zero-copy
> support between the driver and userspace it's _really_ not the right=20
> tool
> for the job. dma-buf is for zero-copy between devices, with cpu access
> from userpace (or kernel fwiw) being very much the exception (and=20
> often
> flat-out not supported at all).

We want both. Using dma-bufs for the driver/userspace interface is a=20
convenience as we then have a unique API instead of two distinct ones.

Why should CPU access from userspace be the exception? It works fine=20
for IIO dma-bufs. You keep warning about this being a terrible design,=20
but I simply don't see it.

Cheers,
-Paul

>>  +
>>  +2. User API
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +``IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *)``
>>  +----------------------------------------------------------------
>>  +
>>  +Each call will allocate a new DMABUF object. The return value (if=20
>> not
>>  +a negative errno value as error) will be the file descriptor of=20
>> the new
>>  +DMABUF.
>>  +
>>  +``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *)``
>>  +--------------------------------------------------------
>>  +
>>  +Place the DMABUF object into the queue pending for hardware=20
>> process.
>>  +
>>  +These two IOCTLs have to be performed on the IIO buffer's file
>>  +descriptor, obtained using the `IIO_BUFFER_GET_FD_IOCTL` ioctl.
>>  +
>>  +3. Usage
>>  +=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +To access the data stored in a block by userspace the block must be
>>  +mapped to the process's memory. This is done by calling mmap() on=20
>> the
>>  +DMABUF's file descriptor.
>>  +
>>  +Before accessing the data through the map, you must use the
>>  +DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
>>  +DMA_BUF_SYNC_START flag, to make sure that the data is available.
>>  +This call may block until the hardware is done with this block.=20
>> Once
>>  +you are done reading or writing the data, you must use this ioctl=20
>> again
>>  +with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
>>  +kernel's queue.
>>  +
>>  +If you need to know when the hardware is done with a DMABUF, you=20
>> can
>>  +poll its file descriptor for the EPOLLOUT event.
>>  +
>>  +Finally, to destroy a DMABUF object, simply call close() on its=20
>> file
>>  +descriptor.
>>  +
>>  +For more information about manipulating DMABUF objects, see:=20
>> :ref:`dma-buf`.
>>  +
>>  +A typical workflow for the new interface is:
>>  +
>>  +    for block in blocks:
>>  +      DMABUF_ALLOC block
>>  +      mmap block
>>  +
>>  +    enable buffer
>>  +
>>  +    while !done
>>  +      for block in blocks:
>>  +        DMABUF_ENQUEUE block
>>  +
>>  +        DMABUF_SYNC_START block
>>  +        process data
>>  +        DMABUF_SYNC_END block
>>  +
>>  +    disable buffer
>>  +
>>  +    for block in blocks:
>>  +      close block
>>  diff --git a/Documentation/iio/index.rst=20
>> b/Documentation/iio/index.rst
>>  index 58b7a4ebac51..669deb67ddee 100644
>>  --- a/Documentation/iio/index.rst
>>  +++ b/Documentation/iio/index.rst
>>  @@ -9,4 +9,6 @@ Industrial I/O
>>=20
>>      iio_configfs
>>=20
>>  +   dmabuf_api
>>  +
>>      ep93xx_adc
>>  --
>>  2.34.1
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


