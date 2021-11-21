Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0245844A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 16:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BD36EA89;
	Sun, 21 Nov 2021 15:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EAF6EA89
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 15:05:35 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 620A16069B;
 Sun, 21 Nov 2021 15:05:32 +0000 (UTC)
Date: Sun, 21 Nov 2021 15:10:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 15/15] Documentation: iio: Document high-speed DMABUF
 based API
Message-ID: <20211121151026.0cc95f40@jic23-huawei>
In-Reply-To: <20211115142243.60605-4-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115142243.60605-1-paul@crapouillou.net>
 <20211115142243.60605-4-paul@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021 14:22:43 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Document the new DMABUF based API.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Hi Paul,

A few trivial things inline but looks good to me if we do end up using DMABUF
anyway.

Jonathan

> ---
>  Documentation/driver-api/dma-buf.rst |  2 +
>  Documentation/iio/dmabuf_api.rst     | 94 ++++++++++++++++++++++++++++
>  Documentation/iio/index.rst          |  2 +
>  3 files changed, 98 insertions(+)
>  create mode 100644 Documentation/iio/dmabuf_api.rst
> 
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 2cd7db82d9fe..d3c9b58d2706 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -1,3 +1,5 @@
> +.. _dma-buf:
> +

Why this change?

>  Buffer Sharing and Synchronization
>  ==================================
>  
> diff --git a/Documentation/iio/dmabuf_api.rst b/Documentation/iio/dmabuf_api.rst
> new file mode 100644
> index 000000000000..b4e120a4ef0c
> --- /dev/null
> +++ b/Documentation/iio/dmabuf_api.rst
> @@ -0,0 +1,94 @@
> +===================================
> +High-speed DMABUF interface for IIO
> +===================================
> +
> +1. Overview
> +===========
> +
> +The Industrial I/O subsystem supports access to buffers through a file-based
> +interface, with read() and write() access calls through the IIO device's dev
> +node.
> +
> +It additionally supports a DMABUF based interface, where the userspace
> +application can allocate and append DMABUF objects to the buffer's queue.

I would note somewhere that this interface is optional for a given IIO driver.
I don't want people to start assuming their i2c ADC will support this and
wondering why it doesn't work :)

> +
> +The advantage of this DMABUF based interface vs. the fileio
> +interface, is that it avoids an extra copy of the data between the
> +kernel and userspace. This is particularly userful for high-speed
> +devices which produce several megabytes or even gigabytes of data per
> +second.
> +
> +The data in this DMABUF interface is managed at the granularity of
> +DMABUF objects. Reducing the granularity from byte level to block level
> +is done to reduce the userspace-kernelspace synchronization overhead
> +since performing syscalls for each byte at a few Mbps is just not
> +feasible.
> +
> +This of course leads to a slightly increased latency. For this reason an
> +application can choose the size of the DMABUFs as well as how many it
> +allocates. E.g. two DMABUFs would be a traditional double buffering
> +scheme. But using a higher number might be necessary to avoid
> +underflow/overflow situations in the presence of scheduling latencies.
> +
> +2. User API
> +===========
> +
> +``IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *)``
> +----------------------------------------------------------------
> +
> +Each call will allocate a new DMABUF object. The return value (if not
> +a negative errno value as error) will be the file descriptor of the new
> +DMABUF.
> +
> +``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *)``
> +--------------------------------------------------------
> +
> +Place the DMABUF object into the queue pending for hardware process.
> +
> +These two IOCTLs have to be performed on the IIO buffer's file
> +descriptor (either opened from the corresponding /dev/iio:deviceX, or
> +obtained using the `IIO_BUFFER_GET_FD_IOCTL` ioctl).
> +
> +3. Usage
> +========
> +
> +To access the data stored in a block by userspace the block must be
> +mapped to the process's memory. This is done by calling mmap() on the
> +DMABUF's file descriptor.
> +
> +Before accessing the data through the map, you must use the
> +DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
> +DMA_BUF_SYNC_START flag, to make sure that the data is available.
> +This call may block until the hardware is done with this block. Once
> +you are done reading or writing the data, you must use this ioctl again
> +with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
> +kernel's queue.
> +
> +If you need to know when the hardware is done with a DMABUF, you can
> +poll its file descriptor for the EPOLLOUT event.
> +
> +Finally, to destroy a DMABUF object, simply call close() on its file
> +descriptor.
> +
> +For more information about manipulating DMABUF objects, see: :ref:`dma-buf`.
> +
> +A typical workflow for the new interface is:
> +
> +    for block in blocks:
> +      DMABUF_ALLOC block
> +      mmap block
> +
> +    enable buffer
> +
> +    while !done
> +      for block in blocks:
> +        DMABUF_ENQUEUE block
> +
> +        DMABUF_SYNC_START block
> +        process data
> +        DMABUF_SYNC_END block
> +
> +    disable buffer
> +
> +    for block in blocks:
> +      close block
> diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
> index 58b7a4ebac51..9ce799fbf262 100644
> --- a/Documentation/iio/index.rst
> +++ b/Documentation/iio/index.rst
> @@ -10,3 +10,5 @@ Industrial I/O
>     iio_configfs
>  
>     ep93xx_adc
> +
> +   dmabuf_api

Given this is core stuff rather than driver specific, perhaps move it up a few lines?


