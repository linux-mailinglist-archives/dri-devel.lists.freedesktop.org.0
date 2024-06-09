Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9690155D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 11:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E0A10E144;
	Sun,  9 Jun 2024 09:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bIEEKDMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273410E144
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 09:53:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A49EFCE0AD9;
 Sun,  9 Jun 2024 09:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA36C2BD10;
 Sun,  9 Jun 2024 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717926822;
 bh=Fx1CFy/u8QJt4DN2buBsiMU8aZaiixCcuBcpda3WzMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bIEEKDMrec9mguFYy0W/Btn/AQPGRsat5rKnIcsWo/4LRpQEFgOf5fYrOT7Jh+AnT
 PWu5Nr/9LceG/yyf4465Q3CdvfLLdQqYm9a9pVTtxg80DmMl1ue90d0wY/tNc9OXxz
 yQuRFxnJfrPAut+LkX7kbwxZ17wruMRfsRNNuTv/bqaMhd5/8v9Tn0J9XgWFdgIwG4
 zITp4K328Nots1/H9Zm/RtHeHfJ6zs7FWDcv8KVkeA3rr/A6WJQjIHYrxYyUIQb7pA
 Zu4HW1443zO62SM0+oHq6vAJAk1Ot7fyvZHgafvWQuDdWnamfRzuMU2MXf94+fH+cb
 ELV29zWwcNMJw==
Date: Sun, 9 Jun 2024 10:53:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Nuno Sa
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v10 3/6] iio: core: Add new DMABUF interface infrastructure
Message-ID: <20240609105302.07de907a@jic23-huawei>
In-Reply-To: <20240605110845.86740-4-paul@crapouillou.net>
References: <20240605110845.86740-1-paul@crapouillou.net>
 <20240605110845.86740-4-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  5 Jun 2024 13:08:42 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Add the necessary infrastructure to the IIO core to support a new
> optional DMABUF based interface.
> 
> With this new interface, DMABUF objects (externally created) can be
> attached to a IIO buffer, and subsequently used for data transfer.
> 
> A userspace application can then use this interface to share DMABUF
> objects between several interfaces, allowing it to transfer data in a
> zero-copy fashion, for instance between IIO and the USB stack.
> 
> The userspace application can also memory-map the DMABUF objects, and
> access the sample data directly. The advantage of doing this vs. the
> read() interface is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed
> devices which produce several megabytes or even gigabytes of data per
> second.
> 
> As part of the interface, 3 new IOCTLs have been added:
> 
> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>  Attach the DMABUF object identified by the given file descriptor to the
>  buffer.
> 
> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>  Detach the DMABUF object identified by the given file descriptor from
>  the buffer. Note that closing the IIO buffer's file descriptor will
>  automatically detach all previously attached DMABUF objects.
> 
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>  Request a data transfer to/from the given DMABUF object. Its file
>  descriptor, as well as the transfer size and flags are provided in the
>  "iio_dmabuf" structure.
> 
> These three IOCTLs have to be performed on the IIO buffer's file
> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Need a brief note on the sign off chain.
What is Nuno's role in this series as he's not sending the emails and not
marked with Co-developed-by 

I gave this a much more thorough look in earlier versions than I have today but
a few really minor things inline (that I might have fixed up whilst applying)
but looks like you'll be done a v11 for Randy's docs comments anyway :(

Jonathan


> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
> index 0138b21b244f..c98c8ac83785 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c

> +struct iio_dmabuf_priv {
> +	struct list_head entry;
> +	struct kref ref;
> +
> +	struct iio_buffer *buffer;
> +	struct iio_dma_buffer_block *block;
> +
> +	u64 context;
> +	spinlock_t lock;

Given you are going to have a v11, please add a comment to this lock
to say what data it is protecting. 

> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	enum dma_data_direction dir;
> +	atomic_t seqno;
> +};


> diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
> index 89c3fd7c29ca..1a221c1d7736 100644
> --- a/include/linux/iio/buffer_impl.h
> +++ b/include/linux/iio/buffer_impl.h
> @@ -9,8 +9,12 @@
>  #include <uapi/linux/iio/buffer.h>
>  #include <linux/iio/buffer.h>
>  
> +struct dma_buf_attachment;
> +struct dma_fence;
>  struct iio_dev;
> +struct iio_dma_buffer_block;
>  struct iio_buffer;
> +struct sg_table;
>  
>  /**
>   * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the buffer can not be
> @@ -39,6 +43,13 @@ struct iio_buffer;
>   *                      device stops sampling. Calles are balanced with @enable.
>   * @release:		called when the last reference to the buffer is dropped,
>   *			should free all resources allocated by the buffer.
> + * @attach_dmabuf:	called from userspace via ioctl to attach one external
> + *			DMABUF.
> + * @detach_dmabuf:	called from userspace via ioctl to detach one previously
> + *			attached DMABUF.
> + * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
> + *			object to this buffer. Requires a valid DMABUF fd, that
> + *			was previouly attached to this buffer.

Missing docs for lock_queue() and unlock_queue()

Kernel-doc must be complete or bots are going to moan at us :(

>   * @modes:		Supported operating modes by this buffer type
>   * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
>   *
> @@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
>  
>  	void (*release)(struct iio_buffer *buffer);
>  
> +	struct iio_dma_buffer_block * (*attach_dmabuf)(struct iio_buffer *buffer,
> +						       struct dma_buf_attachment *attach);
> +	void (*detach_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block);
> +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block,
> +			      struct dma_fence *fence, struct sg_table *sgt,
> +			      size_t size, bool cyclic);
> +	void (*lock_queue)(struct iio_buffer *buffer);
> +	void (*unlock_queue)(struct iio_buffer *buffer);
> +


