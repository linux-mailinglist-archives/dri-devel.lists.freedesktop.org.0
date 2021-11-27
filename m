Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C645FFC1
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 16:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E096F629;
	Sat, 27 Nov 2021 15:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 664 seconds by postgrey-1.36 at gabe;
 Sat, 27 Nov 2021 15:21:42 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE0A6F62D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 15:21:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 961D6B817AC;
 Sat, 27 Nov 2021 15:12:55 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 7A32AC53FBF;
 Sat, 27 Nov 2021 15:12:50 +0000 (UTC)
Date: Sat, 27 Nov 2021 15:17:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/15] iio: buffer-dma: Enable buffer write support
Message-ID: <20211127151751.71bafcf9@jic23-huawei>
In-Reply-To: <KSMX2R.V0Q6PW6OC9Q62@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-5-paul@crapouillou.net>
 <20211121142049.2d000c04@jic23-huawei>
 <KSMX2R.V0Q6PW6OC9Q62@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Nov 2021 17:19:32 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
>=20
> Le dim., nov. 21 2021 at 14:20:49 +0000, Jonathan Cameron=20
> <jic23@kernel.org> a =C3=A9crit :
> > On Mon, 15 Nov 2021 14:19:14 +0000
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >  =20
> >>  Adding write support to the buffer-dma code is easy - the write()
> >>  function basically needs to do the exact same thing as the read()
> >>  function: dequeue a block, read or write the data, enqueue the block
> >>  when entirely processed.
> >>=20
> >>  Therefore, the iio_buffer_dma_read() and the new=20
> >> iio_buffer_dma_write()
> >>  now both call a function iio_buffer_dma_io(), which will perform=20
> >> this
> >>  task.
> >>=20
> >>  The .space_available() callback can return the exact same value as=20
> >> the
> >>  .data_available() callback for input buffers, since in both cases we
> >>  count the exact same thing (the number of bytes in each available
> >>  block).
> >>=20
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net> =20
> > Hi Paul,
> >=20
> > There are a few changes in here, such as the bytes_used value being=20
> > set that
> > I'm not following the reasoning behind. More info on those?
> > Also good to provide something about those in this patch description.
> >=20
> > Thanks,
> >=20
> > Jonathan
> >=20
> >  =20
> >>  ---
> >>   drivers/iio/buffer/industrialio-buffer-dma.c | 75=20
> >> +++++++++++++++-----
> >>   include/linux/iio/buffer-dma.h               |  7 ++
> >>   2 files changed, 66 insertions(+), 16 deletions(-)
> >>=20
> >>  diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c=20
> >> b/drivers/iio/buffer/industrialio-buffer-dma.c
> >>  index abac88f20104..eeeed6b2e0cf 100644
> >>  --- a/drivers/iio/buffer/industrialio-buffer-dma.c
> >>  +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
> >>  @@ -179,7 +179,8 @@ static struct iio_dma_buffer_block=20
> >> *iio_dma_buffer_alloc_block(
> >>   	}
> >>=20
> >>   	block->size =3D size;
> >>  -	block->state =3D IIO_BLOCK_STATE_DEQUEUED;
> >>  +	block->bytes_used =3D size;
> >>  +	block->state =3D IIO_BLOCK_STATE_DONE; =20
> >=20
> > I don't know why these are here - some more info? =20
>=20
> When using an input buffer the block->bytes_used is unconditionally=20
> reset in iio_dmaengine_buffer_submit_block(), so this was fine until=20
> now.
>=20
> When using an output buffer the block->bytes_used can actually (with=20
> the new API) be specified by the user, so we don't want=20
> iio_dmaengine_buffer_submit_block() to unconditionally override it.=20
> Which means that in the case where we have an output buffer in fileio=20
> mode, we do need block->bytes_used to be initialized to the buffer's=20
> size since it won't be set anywhere else.

Makes sense.  Thanks for the explanation.

>=20
> About the change in block->state: in patch [01/15] we removed the=20
> incoming/outgoing queues, and while the "enqueued" state is still=20
> useful to know which buffers have to be submitted when the buffer is=20
> enabled, the "dequeued" state is not useful anymore since there is no=20
> more distinction vs. the "done" state.
>=20
> I believe this change should be moved to patch [01/15] then, and I=20
> should go further and remove the IIO_BLOCK_STATE_DEQUEUED completely.

Complete removal would indeed be a more 'obvious' change, so I'd support
that assuming now disadvantages we havent' thought of yet.
>=20
> >>   	block->queue =3D queue;
> >>   	INIT_LIST_HEAD(&block->head);
> >>   	kref_init(&block->kref);
> >>  @@ -195,6 +196,18 @@ static void _iio_dma_buffer_block_done(struct=20
> >> iio_dma_buffer_block *block)
> >>   		block->state =3D IIO_BLOCK_STATE_DONE;
> >>   }
> >>=20
> >>  +static void iio_dma_buffer_queue_wake(struct iio_dma_buffer_queue=20
> >> *queue)
> >>  +{
> >>  +	__poll_t flags;
> >>  +
> >>  +	if (queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN)
> >>  +		flags =3D EPOLLIN | EPOLLRDNORM;
> >>  +	else
> >>  +		flags =3D EPOLLOUT | EPOLLWRNORM;
> >>  +
> >>  +	wake_up_interruptible_poll(&queue->buffer.pollq, flags);
> >>  +}
> >>  +
> >>   /**
> >>    * iio_dma_buffer_block_done() - Indicate that a block has been=20
> >> completed
> >>    * @block: The completed block
> >>  @@ -212,7 +225,7 @@ void iio_dma_buffer_block_done(struct=20
> >> iio_dma_buffer_block *block)
> >>   	spin_unlock_irqrestore(&queue->list_lock, flags);
> >>=20
> >>   	iio_buffer_block_put_atomic(block);
> >>  -	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN |=20
> >> EPOLLRDNORM);
> >>  +	iio_dma_buffer_queue_wake(queue);
> >>   }
> >>   EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
> >>=20
> >>  @@ -241,7 +254,7 @@ void iio_dma_buffer_block_list_abort(struct=20
> >> iio_dma_buffer_queue *queue,
> >>   	}
> >>   	spin_unlock_irqrestore(&queue->list_lock, flags);
> >>=20
> >>  -	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN |=20
> >> EPOLLRDNORM);
> >>  +	iio_dma_buffer_queue_wake(queue);
> >>   }
> >>   EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
> >>=20
> >>  @@ -334,7 +347,8 @@ int iio_dma_buffer_request_update(struct=20
> >> iio_buffer *buffer)
> >>   			queue->fileio.blocks[i] =3D block;
> >>   		}
> >>=20
> >>  -		block->state =3D IIO_BLOCK_STATE_QUEUED;
> >>  +		if (queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN)
> >>  +			block->state =3D IIO_BLOCK_STATE_QUEUED; =20
> >=20
> > Possibly worth a comment on the state being set here.  I figured it=20
> > out, but might
> > save some brain cells in future if it's stated in the code. =20
>=20
> Ok.
>=20
> >>   	}
> >>=20
> >>   out_unlock:
> >>  @@ -467,20 +481,12 @@ static struct iio_dma_buffer_block=20
> >> *iio_dma_buffer_dequeue(
> >>   	return block;
> >>   }
> >>=20
> >>  -/**
> >>  - * iio_dma_buffer_read() - DMA buffer read callback
> >>  - * @buffer: Buffer to read form
> >>  - * @n: Number of bytes to read
> >>  - * @user_buffer: Userspace buffer to copy the data to
> >>  - *
> >>  - * Should be used as the read callback for iio_buffer_access_ops
> >>  - * struct for DMA buffers.
> >>  - */
> >>  -int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
> >>  -	char __user *user_buffer)
> >>  +static int iio_dma_buffer_io(struct iio_buffer *buffer,
> >>  +			     size_t n, char __user *user_buffer, bool is_write)
> >>   {
> >>   	struct iio_dma_buffer_queue *queue =3D iio_buffer_to_queue(buffer);
> >>   	struct iio_dma_buffer_block *block;
> >>  +	void *addr;
> >>   	int ret;
> >>=20
> >>   	if (n < buffer->bytes_per_datum)
> >>  @@ -503,8 +509,13 @@ int iio_dma_buffer_read(struct iio_buffer=20
> >> *buffer, size_t n,
> >>   	n =3D rounddown(n, buffer->bytes_per_datum);
> >>   	if (n > block->bytes_used - queue->fileio.pos)
> >>   		n =3D block->bytes_used - queue->fileio.pos;
> >>  +	addr =3D block->vaddr + queue->fileio.pos;
> >>=20
> >>  -	if (copy_to_user(user_buffer, block->vaddr + queue->fileio.pos,=20
> >> n)) {
> >>  +	if (is_write)
> >>  +		ret =3D !!copy_from_user(addr, user_buffer, n);
> >>  +	else
> >>  +		ret =3D !!copy_to_user(user_buffer, addr, n); =20
> >=20
> > What is the !! gaining us here?  We only care about =3D=3D 0 vs !=3D 0 =
so
> > forcing it to be 0 or 1 isn't useful. =20
>=20
> Right.
>=20
> >>  +	if (ret) {
> >>   		ret =3D -EFAULT;
> >>   		goto out_unlock;
> >>   	}
> >>  @@ -513,6 +524,7 @@ int iio_dma_buffer_read(struct iio_buffer=20
> >> *buffer, size_t n,
> >>=20
> >>   	if (queue->fileio.pos =3D=3D block->bytes_used) {
> >>   		queue->fileio.active_block =3D NULL;
> >>  +		block->bytes_used =3D block->size; =20
> >=20
> > This seems to be a functional change that isn't called out in the=20
> > patch description. =20
>=20
> See the explanation above. Although I most likely don't need to set it=20
> at two different spots... I'll check that in detail next week.
>=20
> Cheers,
> -Paul
>=20
> >>   		iio_dma_buffer_enqueue(queue, block);
> >>   	}
> >>=20
> >>  @@ -523,8 +535,39 @@ int iio_dma_buffer_read(struct iio_buffer=20
> >> *buffer, size_t n,
> >>=20
> >>   	return ret;
> >>   }
> >>  +
> >>  +/**
> >>  + * iio_dma_buffer_read() - DMA buffer read callback
> >>  + * @buffer: Buffer to read form
> >>  + * @n: Number of bytes to read
> >>  + * @user_buffer: Userspace buffer to copy the data to
> >>  + *
> >>  + * Should be used as the read callback for iio_buffer_access_ops
> >>  + * struct for DMA buffers.
> >>  + */
> >>  +int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
> >>  +	char __user *user_buffer)
> >>  +{
> >>  +	return iio_dma_buffer_io(buffer, n, user_buffer, false);
> >>  +}
> >>   EXPORT_SYMBOL_GPL(iio_dma_buffer_read);
> >>=20
> >>  +/**
> >>  + * iio_dma_buffer_write() - DMA buffer write callback
> >>  + * @buffer: Buffer to read form
> >>  + * @n: Number of bytes to read
> >>  + * @user_buffer: Userspace buffer to copy the data from
> >>  + *
> >>  + * Should be used as the write callback for iio_buffer_access_ops
> >>  + * struct for DMA buffers.
> >>  + */
> >>  +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
> >>  +			 const char __user *user_buffer)
> >>  +{
> >>  +	return iio_dma_buffer_io(buffer, n, (__force char *)user_buffer,=20
> >> true);
> >>  +}
> >>  +EXPORT_SYMBOL_GPL(iio_dma_buffer_write);
> >>  +
> >>   /**
> >>    * iio_dma_buffer_data_available() - DMA buffer data_available=20
> >> callback
> >>    * @buf: Buffer to check for data availability
> >>  diff --git a/include/linux/iio/buffer-dma.h=20
> >> b/include/linux/iio/buffer-dma.h
> >>  index a65a005c4a19..09c07d5563c0 100644
> >>  --- a/include/linux/iio/buffer-dma.h
> >>  +++ b/include/linux/iio/buffer-dma.h
> >>  @@ -132,6 +132,8 @@ int iio_dma_buffer_disable(struct iio_buffer=20
> >> *buffer,
> >>   	struct iio_dev *indio_dev);
> >>   int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
> >>   	char __user *user_buffer);
> >>  +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
> >>  +			 const char __user *user_buffer);
> >>   size_t iio_dma_buffer_data_available(struct iio_buffer *buffer);
> >>   int iio_dma_buffer_set_bytes_per_datum(struct iio_buffer *buffer,=20
> >> size_t bpd);
> >>   int iio_dma_buffer_set_length(struct iio_buffer *buffer, unsigned=20
> >> int length);
> >>  @@ -142,4 +144,9 @@ int iio_dma_buffer_init(struct=20
> >> iio_dma_buffer_queue *queue,
> >>   void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue);
> >>   void iio_dma_buffer_release(struct iio_dma_buffer_queue *queue);
> >>=20
> >>  +static inline size_t iio_dma_buffer_space_available(struct=20
> >> iio_buffer *buffer)
> >>  +{
> >>  +	return iio_dma_buffer_data_available(buffer);
> >>  +}
> >>  +
> >>   #endif =20
> >  =20
>=20
>=20

