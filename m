Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55B4E9D89
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429189EBB;
	Mon, 28 Mar 2022 17:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D3E89EBB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 17:29:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB27AB81171;
 Mon, 28 Mar 2022 17:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18328C340F0;
 Mon, 28 Mar 2022 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648488569;
 bh=QIRBqAVby7hWkSmWlUKvvjjcLwJ5RrXgnyxLcGvT3lI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BcFg4XTS+AIRVPKYDBBFs4bMgJRLHz1JGvH2Ws/yvROjv0EDJZ1z0+tRBeUejRsTL
 5CL9zPotjHrG2w9L+QwCKc8reZZhIA0k6E4x8cF/16BXChYwm+SlKHphCGvvkdgsZy
 51v1L4F1g2l2g3qoDOqniGKO6T+75cDuXWFLWOY5oEqX8YE6TElcKC9Rz29FuHW/gC
 nUo01GQlYSmGTudlHghLcWdAL+VmgzrrQl3InoIsnoUnPeswkLVLHJQsgmtJIybuGI
 9ztGHE+uYpJRVQsmHjfyBYTOFn9KPRaZYm768BWLtwJtqJlX9fRUF6AwhligIYXJgh
 jJU/mi335lpEg==
Date: Mon, 28 Mar 2022 18:37:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 05/12] iio: core: Add new DMABUF interface
 infrastructure
Message-ID: <20220328183701.02884cc3@jic23-huawei>
In-Reply-To: <20220207125933.81634-6-paul@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-6-paul@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  7 Feb 2022 12:59:26 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Add the necessary infrastructure to the IIO core to support a new
> optional DMABUF based interface.
> 
> The advantage of this new DMABUF based interface vs. the read()
> interface, is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed

useful

> devices which produce several megabytes or even gigabytes of data per
> second.
> 
> The data in this new DMABUF interface is managed at the granularity of
> DMABUF objects. Reducing the granularity from byte level to block level
> is done to reduce the userspace-kernelspace synchronization overhead
> since performing syscalls for each byte at a few Mbps is just not
> feasible.
> 
> This of course leads to a slightly increased latency. For this reason an
> application can choose the size of the DMABUFs as well as how many it
> allocates. E.g. two DMABUFs would be a traditional double buffering
> scheme. But using a higher number might be necessary to avoid
> underflow/overflow situations in the presence of scheduling latencies.
> 
> As part of the interface, 2 new IOCTLs have been added:
> 
> IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *):
>  Each call will allocate a new DMABUF object. The return value (if not
>  a negative errno value as error) will be the file descriptor of the new
>  DMABUF.
> 
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>  Place the DMABUF object into the queue pending for hardware process.
> 
> These two IOCTLs have to be performed on the IIO buffer's file
> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.

Just to check, do they work on the old deprecated chardev route? Normally
we can directly access the first buffer without the ioctl.

> 
> To access the data stored in a block by userspace the block must be
> mapped to the process's memory. This is done by calling mmap() on the
> DMABUF's file descriptor.
> 
> Before accessing the data through the map, you must use the
> DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
> DMA_BUF_SYNC_START flag, to make sure that the data is available.
> This call may block until the hardware is done with this block. Once
> you are done reading or writing the data, you must use this ioctl again
> with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
> kernel's queue.
> 
> If you need to know when the hardware is done with a DMABUF, you can
> poll its file descriptor for the EPOLLOUT event.
> 
> Finally, to destroy a DMABUF object, simply call close() on its file
> descriptor.
> 
> A typical workflow for the new interface is:
> 
>   for block in blocks:
>     DMABUF_ALLOC block
>     mmap block
> 
>   enable buffer
> 
>   while !done
>     for block in blocks:
>       DMABUF_ENQUEUE block
> 
>       DMABUF_SYNC_START block
>       process data
>       DMABUF_SYNC_END block
> 
>   disable buffer
> 
>   for block in blocks:
>     close block

Given my very limited knowledge of dma-buf, I'll leave commenting
on the flow to others who know if this looks 'standards' or not ;)

Code looks sane to me..

> 
> v2: Only allow the new IOCTLs on the buffer FD created with
>     IIO_BUFFER_GET_FD_IOCTL().
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/iio/industrialio-buffer.c | 55 +++++++++++++++++++++++++++++++
>  include/linux/iio/buffer_impl.h   |  8 +++++
>  include/uapi/linux/iio/buffer.h   | 29 ++++++++++++++++
>  3 files changed, 92 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
> index 94eb9f6cf128..72f333a519bc 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c
> @@ -17,6 +17,7 @@
>  #include <linux/fs.h>
>  #include <linux/cdev.h>
>  #include <linux/slab.h>
> +#include <linux/mm.h>
>  #include <linux/poll.h>
>  #include <linux/sched/signal.h>
>  
> @@ -1520,11 +1521,65 @@ static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>  	return 0;
>  }
>  
> +static int iio_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
> +				     struct iio_dmabuf __user *user_buf)
> +{
> +	struct iio_dmabuf dmabuf;
> +
> +	if (!buffer->access->enqueue_dmabuf)
> +		return -EPERM;
> +
> +	if (copy_from_user(&dmabuf, user_buf, sizeof(dmabuf)))
> +		return -EFAULT;
> +
> +	if (dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
> +		return -EINVAL;
> +
> +	return buffer->access->enqueue_dmabuf(buffer, &dmabuf);
> +}
> +
> +static int iio_buffer_alloc_dmabuf(struct iio_buffer *buffer,
> +				   struct iio_dmabuf_alloc_req __user *user_req)
> +{
> +	struct iio_dmabuf_alloc_req req;
> +
> +	if (!buffer->access->alloc_dmabuf)
> +		return -EPERM;
> +
> +	if (copy_from_user(&req, user_req, sizeof(req)))
> +		return -EFAULT;
> +
> +	if (req.resv)
> +		return -EINVAL;
> +
> +	return buffer->access->alloc_dmabuf(buffer, &req);
> +}
> +
> +static long iio_buffer_chrdev_ioctl(struct file *filp,
> +				    unsigned int cmd, unsigned long arg)
> +{
> +	struct iio_dev_buffer_pair *ib = filp->private_data;
> +	struct iio_buffer *buffer = ib->buffer;
> +	void __user *_arg = (void __user *)arg;
> +
> +	switch (cmd) {
> +	case IIO_BUFFER_DMABUF_ALLOC_IOCTL:
> +		return iio_buffer_alloc_dmabuf(buffer, _arg);
> +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> +		/* TODO: support non-blocking enqueue operation */
> +		return iio_buffer_enqueue_dmabuf(buffer, _arg);
> +	default:
> +		return IIO_IOCTL_UNHANDLED;
> +	}
> +}
> +
>  static const struct file_operations iio_buffer_chrdev_fileops = {
>  	.owner = THIS_MODULE,
>  	.llseek = noop_llseek,
>  	.read = iio_buffer_read,
>  	.write = iio_buffer_write,
> +	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
>  	.poll = iio_buffer_poll,
>  	.release = iio_buffer_chrdev_release,
>  };
> diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
> index e2ca8ea23e19..728541bc2c63 100644
> --- a/include/linux/iio/buffer_impl.h
> +++ b/include/linux/iio/buffer_impl.h
> @@ -39,6 +39,9 @@ struct iio_buffer;
>   *                      device stops sampling. Calles are balanced with @enable.
>   * @release:		called when the last reference to the buffer is dropped,
>   *			should free all resources allocated by the buffer.
> + * @alloc_dmabuf:	called from userspace via ioctl to allocate one DMABUF.
> + * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
> + *			object to this buffer. Requires a valid DMABUF fd.
>   * @modes:		Supported operating modes by this buffer type
>   * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
>   *
> @@ -68,6 +71,11 @@ struct iio_buffer_access_funcs {
>  
>  	void (*release)(struct iio_buffer *buffer);
>  
> +	int (*alloc_dmabuf)(struct iio_buffer *buffer,
> +			    struct iio_dmabuf_alloc_req *req);
> +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dmabuf *block);
> +
>  	unsigned int modes;
>  	unsigned int flags;
>  };
> diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
> index 13939032b3f6..e4621b926262 100644
> --- a/include/uapi/linux/iio/buffer.h
> +++ b/include/uapi/linux/iio/buffer.h
> @@ -5,6 +5,35 @@
>  #ifndef _UAPI_IIO_BUFFER_H_
>  #define _UAPI_IIO_BUFFER_H_
>  
> +#include <linux/types.h>
> +
> +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000000
> +
> +/**
> + * struct iio_dmabuf_alloc_req - Descriptor for allocating IIO DMABUFs
> + * @size:	the size of a single DMABUF
> + * @resv:	reserved
> + */
> +struct iio_dmabuf_alloc_req {
> +	__u64 size;
> +	__u64 resv;
> +};
> +
> +/**
> + * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
> + * @fd:		file descriptor of the DMABUF object
> + * @flags:	one or more IIO_BUFFER_DMABUF_* flags
> + * @bytes_used:	number of bytes used in this DMABUF for the data transfer.
> + *		If zero, the full buffer is used.
> + */
> +struct iio_dmabuf {
> +	__u32 fd;
> +	__u32 flags;
> +	__u64 bytes_used;
> +};
> +
>  #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i', 0x91, int)
> +#define IIO_BUFFER_DMABUF_ALLOC_IOCTL		_IOW('i', 0x92, struct iio_dmabuf_alloc_req)
> +#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i', 0x93, struct iio_dmabuf)
>  
>  #endif /* _UAPI_IIO_BUFFER_H_ */

