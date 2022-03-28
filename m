Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65824E9F1C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B0A10E246;
	Mon, 28 Mar 2022 18:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28C110E246
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1648492796; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmieihZbGB29NOEkXombMlBt3Ij7l+yxxQPdnPvDlbM=;
 b=oBUY8yaDcgU5YYatcQr7/GNeFWvb5DzhkdvXEQunAKpWhRoGQxcwo5cuBZKwXRj32FyE0g
 aqkOUpQRJiVkD5tz92uU0wyEMy0yjca22p+Vb1Kfoy1iLLosOikPwArTdhlSoKBjLxbbH8
 jQ/rWoaM4qDFtKJWq6t51AwDAxoThy0=
Date: Mon, 28 Mar 2022 19:39:45 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 02/12] iio: buffer-dma: Enable buffer write support
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <96XG9R.3NOIIEN7IS001@crapouillou.net>
In-Reply-To: <20220328182409.1e959386@jic23-huawei>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-3-paul@crapouillou.net>
 <20220328182409.1e959386@jic23-huawei>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le lun., mars 28 2022 at 18:24:09 +0100, Jonathan Cameron=20
<jic23@kernel.org> a =E9crit :
> On Mon,  7 Feb 2022 12:59:23 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Adding write support to the buffer-dma code is easy - the write()
>>  function basically needs to do the exact same thing as the read()
>>  function: dequeue a block, read or write the data, enqueue the block
>>  when entirely processed.
>>=20
>>  Therefore, the iio_buffer_dma_read() and the new=20
>> iio_buffer_dma_write()
>>  now both call a function iio_buffer_dma_io(), which will perform=20
>> this
>>  task.
>>=20
>>  The .space_available() callback can return the exact same value as=20
>> the
>>  .data_available() callback for input buffers, since in both cases we
>>  count the exact same thing (the number of bytes in each available
>>  block).
>>=20
>>  Note that we preemptively reset block->bytes_used to the buffer's=20
>> size
>>  in iio_dma_buffer_request_update(), as in the future the
>>  iio_dma_buffer_enqueue() function won't reset it.
>>=20
>>  v2: - Fix block->state not being reset in
>>        iio_dma_buffer_request_update() for output buffers.
>>      - Only update block->bytes_used once and add a comment about=20
>> why we
>>        update it.
>>      - Add a comment about why we're setting a different state for=20
>> output
>>        buffers in iio_dma_buffer_request_update()
>>      - Remove useless cast to bool (!!) in iio_dma_buffer_io()
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> One comment inline.
>=20
> I'd be tempted to queue this up with that fixed, but do we have
> any users?  Even though it's trivial I'm not that keen on code
> upstream well in advance of it being used.

There's a userspace user in libiio. On the kernel side we do have=20
drivers that use it in ADI's downstream kernel, that we plan to=20
upstream in the long term (but it can take some time, as we need to=20
upstream other things first, like JESD204B support).

>=20
>>  ---
>>   drivers/iio/buffer/industrialio-buffer-dma.c | 88=20
>> ++++++++++++++++----
>>   include/linux/iio/buffer-dma.h               |  7 ++
>>   2 files changed, 79 insertions(+), 16 deletions(-)
>>=20
>>  diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c=20
>> b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  index 1fc91467d1aa..a9f1b673374f 100644
>>  --- a/drivers/iio/buffer/industrialio-buffer-dma.c
>>  +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  @@ -195,6 +195,18 @@ static void _iio_dma_buffer_block_done(struct=20
>> iio_dma_buffer_block *block)
>>   		block->state =3D IIO_BLOCK_STATE_DONE;
>>   }
>>=20
>>  +static void iio_dma_buffer_queue_wake(struct iio_dma_buffer_queue=20
>> *queue)
>>  +{
>>  +	__poll_t flags;
>>  +
>>  +	if (queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN)
>>  +		flags =3D EPOLLIN | EPOLLRDNORM;
>>  +	else
>>  +		flags =3D EPOLLOUT | EPOLLWRNORM;
>>  +
>>  +	wake_up_interruptible_poll(&queue->buffer.pollq, flags);
>>  +}
>>  +
>>   /**
>>    * iio_dma_buffer_block_done() - Indicate that a block has been=20
>> completed
>>    * @block: The completed block
>>  @@ -212,7 +224,7 @@ void iio_dma_buffer_block_done(struct=20
>> iio_dma_buffer_block *block)
>>   	spin_unlock_irqrestore(&queue->list_lock, flags);
>>=20
>>   	iio_buffer_block_put_atomic(block);
>>  -	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN |=20
>> EPOLLRDNORM);
>>  +	iio_dma_buffer_queue_wake(queue);
>>   }
>>   EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
>>=20
>>  @@ -241,7 +253,7 @@ void iio_dma_buffer_block_list_abort(struct=20
>> iio_dma_buffer_queue *queue,
>>   	}
>>   	spin_unlock_irqrestore(&queue->list_lock, flags);
>>=20
>>  -	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN |=20
>> EPOLLRDNORM);
>>  +	iio_dma_buffer_queue_wake(queue);
>>   }
>>   EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
>>=20
>>  @@ -335,8 +347,24 @@ int iio_dma_buffer_request_update(struct=20
>> iio_buffer *buffer)
>>   			queue->fileio.blocks[i] =3D block;
>>   		}
>>=20
>>  -		block->state =3D IIO_BLOCK_STATE_QUEUED;
>>  -		list_add_tail(&block->head, &queue->incoming);
>>  +		/*
>>  +		 * block->bytes_used may have been modified previously, e.g. by
>>  +		 * iio_dma_buffer_block_list_abort(). Reset it here to the
>>  +		 * block's so that iio_dma_buffer_io() will work.
>>  +		 */
>>  +		block->bytes_used =3D block->size;
>>  +
>>  +		/*
>>  +		 * If it's an input buffer, mark the block as queued, and
>>  +		 * iio_dma_buffer_enable() will submit it. Otherwise mark it as
>>  +		 * done, which means it's ready to be dequeued.
>>  +		 */
>>  +		if (queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN) {
>>  +			block->state =3D IIO_BLOCK_STATE_QUEUED;
>>  +			list_add_tail(&block->head, &queue->incoming);
>>  +		} else {
>>  +			block->state =3D IIO_BLOCK_STATE_DONE;
>>  +		}
>>   	}
>>=20
>>   out_unlock:
>>  @@ -465,20 +493,12 @@ static struct iio_dma_buffer_block=20
>> *iio_dma_buffer_dequeue(
>>   	return block;
>>   }
>>=20
>>  -/**
>>  - * iio_dma_buffer_read() - DMA buffer read callback
>>  - * @buffer: Buffer to read form
>>  - * @n: Number of bytes to read
>>  - * @user_buffer: Userspace buffer to copy the data to
>>  - *
>>  - * Should be used as the read callback for iio_buffer_access_ops
>>  - * struct for DMA buffers.
>>  - */
>>  -int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
>>  -	char __user *user_buffer)
>>  +static int iio_dma_buffer_io(struct iio_buffer *buffer,
>>  +			     size_t n, char __user *user_buffer, bool is_write)
>>   {
>>   	struct iio_dma_buffer_queue *queue =3D iio_buffer_to_queue(buffer);
>>   	struct iio_dma_buffer_block *block;
>>  +	void *addr;
>>   	int ret;
>>=20
>>   	if (n < buffer->bytes_per_datum)
>>  @@ -501,8 +521,13 @@ int iio_dma_buffer_read(struct iio_buffer=20
>> *buffer, size_t n,
>>   	n =3D rounddown(n, buffer->bytes_per_datum);
>>   	if (n > block->bytes_used - queue->fileio.pos)
>>   		n =3D block->bytes_used - queue->fileio.pos;
>>  +	addr =3D block->vaddr + queue->fileio.pos;
>>=20
>>  -	if (copy_to_user(user_buffer, block->vaddr + queue->fileio.pos,=20
>> n)) {
>>  +	if (is_write)
>>  +		ret =3D copy_from_user(addr, user_buffer, n);
>>  +	else
>>  +		ret =3D copy_to_user(user_buffer, addr, n);
>>  +	if (ret) {
>>   		ret =3D -EFAULT;
>>   		goto out_unlock;
>>   	}
>>  @@ -521,8 +546,39 @@ int iio_dma_buffer_read(struct iio_buffer=20
>> *buffer, size_t n,
>>=20
>>   	return ret;
>>   }
>>  +
>>  +/**
>>  + * iio_dma_buffer_read() - DMA buffer read callback
>>  + * @buffer: Buffer to read form
>>  + * @n: Number of bytes to read
>>  + * @user_buffer: Userspace buffer to copy the data to
>>  + *
>>  + * Should be used as the read callback for iio_buffer_access_ops
>>  + * struct for DMA buffers.
>>  + */
>>  +int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
>>  +	char __user *user_buffer)
>>  +{
>>  +	return iio_dma_buffer_io(buffer, n, user_buffer, false);
>>  +}
>>   EXPORT_SYMBOL_GPL(iio_dma_buffer_read);
>>=20
>>  +/**
>>  + * iio_dma_buffer_write() - DMA buffer write callback
>>  + * @buffer: Buffer to read form
>>  + * @n: Number of bytes to read
>>  + * @user_buffer: Userspace buffer to copy the data from
>>  + *
>>  + * Should be used as the write callback for iio_buffer_access_ops
>>  + * struct for DMA buffers.
>>  + */
>>  +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
>>  +			 const char __user *user_buffer)
>>  +{
>>  +	return iio_dma_buffer_io(buffer, n, (__force char *)user_buffer,=20
>> true);
>=20
> Casting away the const is a little nasty.   Perhaps it's worth adding=20
> a
> parameter to iio_dma_buffer_io so you can have different parameters
> for the read and write cases and hence keep the const in place?
> return iio_dma_buffer_io(buffer, n, NULL, user_buffer, true);
> and
> return iio_dma_buffer_io(buffer,n, user_buffer, NULL, false);

I can do that.

Cheers,
-Paul

>>  +}
>>  +EXPORT_SYMBOL_GPL(iio_dma_buffer_write);
>>  +
>>   /**
>>    * iio_dma_buffer_data_available() - DMA buffer data_available=20
>> callback
>>    * @buf: Buffer to check for data availability
>>  diff --git a/include/linux/iio/buffer-dma.h=20
>> b/include/linux/iio/buffer-dma.h
>>  index 18d3702fa95d..490b93f76fa8 100644
>>  --- a/include/linux/iio/buffer-dma.h
>>  +++ b/include/linux/iio/buffer-dma.h
>>  @@ -132,6 +132,8 @@ int iio_dma_buffer_disable(struct iio_buffer=20
>> *buffer,
>>   	struct iio_dev *indio_dev);
>>   int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
>>   	char __user *user_buffer);
>>  +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
>>  +			 const char __user *user_buffer);
>>   size_t iio_dma_buffer_data_available(struct iio_buffer *buffer);
>>   int iio_dma_buffer_set_bytes_per_datum(struct iio_buffer *buffer,=20
>> size_t bpd);
>>   int iio_dma_buffer_set_length(struct iio_buffer *buffer, unsigned=20
>> int length);
>>  @@ -142,4 +144,9 @@ int iio_dma_buffer_init(struct=20
>> iio_dma_buffer_queue *queue,
>>   void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue);
>>   void iio_dma_buffer_release(struct iio_dma_buffer_queue *queue);
>>=20
>>  +static inline size_t iio_dma_buffer_space_available(struct=20
>> iio_buffer *buffer)
>>  +{
>>  +	return iio_dma_buffer_data_available(buffer);
>>  +}
>>  +
>>   #endif
>=20


