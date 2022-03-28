Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBC4E9F9B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1381710ED9B;
	Mon, 28 Mar 2022 19:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA7210ED9B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1648494984; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bR+5ek2By7kDQ4MDZLE82wSKnOnXLjg0yQ+z90nLqXE=;
 b=Y/OYuheazXHpu1GEObnPnrWFEJ5vTPCYieMCY9BJwtco180FyNGrXAp8hNZQDWGGWaVmdG
 aXsx4iMkvQQhEMHoFi1BA0Dh9idiOE0GGMpDub54xvYbE49lKiH83y/SLrM9yJH9i4P6N+
 15Lg8l46yEr678RsDsDJDw0L+Esd5hg=
Date: Mon, 28 Mar 2022 20:16:13 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 07/12] iio: buffer-dma: Use DMABUFs instead of custom
 solution
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <1VYG9R.1JAKRTCN4I411@crapouillou.net>
In-Reply-To: <20220328185425.56b51f4a@jic23-huawei>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-8-paul@crapouillou.net>
 <20220328185425.56b51f4a@jic23-huawei>
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

Le lun., mars 28 2022 at 18:54:25 +0100, Jonathan Cameron=20
<jic23@kernel.org> a =E9crit :
> On Mon,  7 Feb 2022 12:59:28 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Enhance the current fileio code by using DMABUF objects instead of
>>  custom buffers.
>>=20
>>  This adds more code than it removes, but:
>>  - a lot of the complexity can be dropped, e.g. custom kref and
>>    iio_buffer_block_put_atomic() are not needed anymore;
>>  - it will be much easier to introduce an API to export these DMABUF
>>    objects to userspace in a following patch.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Hi Paul,
>=20
> I'm a bit rusty on dma mappings, but you seem to have
> a mixture of streaming and coherent mappings going on in here.

That's OK, so am I. What do you call "streaming mappings"?

> Is it the case that the current code is using the coherent mappings
> and a potential 'other user' of the dma buffer might need
> streaming mappings?

Something like that. There are two different things; on both cases,=20
userspace needs to create a DMABUF with IIO_BUFFER_DMABUF_ALLOC_IOCTL,=20
and the backing memory is allocated with dma_alloc_coherent().

- For the userspace interface, you then have a "cpu access" IOCTL=20
(DMA_BUF_IOCTL_SYNC), that allows userspace to inform when it will=20
start/finish to process the buffer in user-space (which will=20
sync/invalidate the data cache if needed). A buffer can then be=20
enqueued for DMA processing (TX or RX) with the new=20
IIO_BUFFER_DMABUF_ENQUEUE_IOCTL.

- When the DMABUF created via the IIO core is sent to another driver=20
through the driver's custom DMABUF import function, this driver will=20
call dma_buf_attach(), which will call iio_buffer_dma_buf_map(). Since=20
it has to return a "struct sg_table *", this function then simply=20
creates a sgtable with one entry that points to the backing memory.

Note that I added the iio_buffer_dma_buf_map() / _unmap() functions=20
because the dma-buf core would WARN() if these were not provided. But=20
since this code doesn't yet support importing/exporting DMABUFs to=20
other drivers, these are never called, and I should probably just make=20
them return a ERR_PTR() unconditionally.

Cheers,
-Paul

> Jonathan
>=20
>>  ---
>>   drivers/iio/buffer/industrialio-buffer-dma.c | 192=20
>> ++++++++++++-------
>>   include/linux/iio/buffer-dma.h               |   8 +-
>>   2 files changed, 122 insertions(+), 78 deletions(-)
>>=20
>>  diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c=20
>> b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  index 15ea7bc3ac08..54e6000cd2ee 100644
>>  --- a/drivers/iio/buffer/industrialio-buffer-dma.c
>>  +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  @@ -14,6 +14,7 @@
>>   #include <linux/poll.h>
>>   #include <linux/iio/buffer_impl.h>
>>   #include <linux/iio/buffer-dma.h>
>>  +#include <linux/dma-buf.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/sizes.h>
>>=20
>>  @@ -90,103 +91,145 @@
>>    * callback is called from within the custom callback.
>>    */
>>=20
>>  -static void iio_buffer_block_release(struct kref *kref)
>>  -{
>>  -	struct iio_dma_buffer_block *block =3D container_of(kref,
>>  -		struct iio_dma_buffer_block, kref);
>>  -
>>  -	WARN_ON(block->state !=3D IIO_BLOCK_STATE_DEAD);
>>  -
>>  -	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
>>  -					block->vaddr, block->phys_addr);
>>  -
>>  -	iio_buffer_put(&block->queue->buffer);
>>  -	kfree(block);
>>  -}
>>  -
>>  -static void iio_buffer_block_get(struct iio_dma_buffer_block=20
>> *block)
>>  -{
>>  -	kref_get(&block->kref);
>>  -}
>>  -
>>  -static void iio_buffer_block_put(struct iio_dma_buffer_block=20
>> *block)
>>  -{
>>  -	kref_put(&block->kref, iio_buffer_block_release);
>>  -}
>>  -
>>  -/*
>>  - * dma_free_coherent can sleep, hence we need to take some special=20
>> care to be
>>  - * able to drop a reference from an atomic context.
>>  - */
>>  -static LIST_HEAD(iio_dma_buffer_dead_blocks);
>>  -static DEFINE_SPINLOCK(iio_dma_buffer_dead_blocks_lock);
>>  -
>>  -static void iio_dma_buffer_cleanup_worker(struct work_struct *work)
>>  -{
>>  -	struct iio_dma_buffer_block *block, *_block;
>>  -	LIST_HEAD(block_list);
>>  -
>>  -	spin_lock_irq(&iio_dma_buffer_dead_blocks_lock);
>>  -	list_splice_tail_init(&iio_dma_buffer_dead_blocks, &block_list);
>>  -	spin_unlock_irq(&iio_dma_buffer_dead_blocks_lock);
>>  -
>>  -	list_for_each_entry_safe(block, _block, &block_list, head)
>>  -		iio_buffer_block_release(&block->kref);
>>  -}
>>  -static DECLARE_WORK(iio_dma_buffer_cleanup_work,=20
>> iio_dma_buffer_cleanup_worker);
>>  -
>>  -static void iio_buffer_block_release_atomic(struct kref *kref)
>>  -{
>>  +struct iio_buffer_dma_buf_attachment {
>>  +	struct scatterlist sgl;
>>  +	struct sg_table sg_table;
>>   	struct iio_dma_buffer_block *block;
>>  -	unsigned long flags;
>>  -
>>  -	block =3D container_of(kref, struct iio_dma_buffer_block, kref);
>>  -
>>  -	spin_lock_irqsave(&iio_dma_buffer_dead_blocks_lock, flags);
>>  -	list_add_tail(&block->head, &iio_dma_buffer_dead_blocks);
>>  -	spin_unlock_irqrestore(&iio_dma_buffer_dead_blocks_lock, flags);
>>  -
>>  -	schedule_work(&iio_dma_buffer_cleanup_work);
>>  -}
>>  -
>>  -/*
>>  - * Version of iio_buffer_block_put() that can be called from=20
>> atomic context
>>  - */
>>  -static void iio_buffer_block_put_atomic(struct=20
>> iio_dma_buffer_block *block)
>>  -{
>>  -	kref_put(&block->kref, iio_buffer_block_release_atomic);
>>  -}
>>  +};
>>=20
>>   static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct=20
>> iio_buffer *buf)
>>   {
>>   	return container_of(buf, struct iio_dma_buffer_queue, buffer);
>>   }
>>=20
>>  +static struct iio_buffer_dma_buf_attachment *
>>  +to_iio_buffer_dma_buf_attachment(struct sg_table *table)
>>  +{
>>  +	return container_of(table, struct iio_buffer_dma_buf_attachment,=20
>> sg_table);
>>  +}
>>  +
>>  +static void iio_buffer_block_get(struct iio_dma_buffer_block=20
>> *block)
>>  +{
>>  +	get_dma_buf(block->dmabuf);
>>  +}
>>  +
>>  +static void iio_buffer_block_put(struct iio_dma_buffer_block=20
>> *block)
>>  +{
>>  +	dma_buf_put(block->dmabuf);
>>  +}
>>  +
>>  +static int iio_buffer_dma_buf_attach(struct dma_buf *dbuf,
>>  +				     struct dma_buf_attachment *at)
>>  +{
>>  +	at->priv =3D dbuf->priv;
>>  +
>>  +	return 0;
>>  +}
>>  +
>>  +static struct sg_table *iio_buffer_dma_buf_map(struct=20
>> dma_buf_attachment *at,
>>  +					       enum dma_data_direction dma_dir)
>>  +{
>>  +	struct iio_dma_buffer_block *block =3D at->priv;
>>  +	struct iio_buffer_dma_buf_attachment *dba;
>>  +	int ret;
>>  +
>>  +	dba =3D kzalloc(sizeof(*dba), GFP_KERNEL);
>>  +	if (!dba)
>>  +		return ERR_PTR(-ENOMEM);
>>  +
>>  +	sg_init_one(&dba->sgl, block->vaddr, PAGE_ALIGN(block->size));
>>  +	dba->sg_table.sgl =3D &dba->sgl;
>>  +	dba->sg_table.nents =3D 1;
>>  +	dba->block =3D block;
>>  +
>>  +	ret =3D dma_map_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
>>  +	if (ret) {
>>  +		kfree(dba);
>>  +		return ERR_PTR(ret);
>>  +	}
>>  +
>>  +	return &dba->sg_table;
>>  +}
>>  +
>>  +static void iio_buffer_dma_buf_unmap(struct dma_buf_attachment *at,
>>  +				     struct sg_table *sg_table,
>>  +				     enum dma_data_direction dma_dir)
>>  +{
>>  +	struct iio_buffer_dma_buf_attachment *dba =3D
>>  +		to_iio_buffer_dma_buf_attachment(sg_table);
>>  +
>>  +	dma_unmap_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
>>  +	kfree(dba);
>>  +}
>>  +
>>  +static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
>>  +{
>>  +	struct iio_dma_buffer_block *block =3D dbuf->priv;
>>  +	struct iio_dma_buffer_queue *queue =3D block->queue;
>>  +
>>  +	WARN_ON(block->state !=3D IIO_BLOCK_STATE_DEAD);
>>  +
>>  +	mutex_lock(&queue->lock);
>>  +
>>  +	dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
>>  +			  block->vaddr, block->phys_addr);
>>  +	kfree(block);
>>  +
>>  +	mutex_unlock(&queue->lock);
>>  +	iio_buffer_put(&queue->buffer);
>>  +}
>>  +
>>  +static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops =3D {
>>  +	.attach			=3D iio_buffer_dma_buf_attach,
>>  +	.map_dma_buf		=3D iio_buffer_dma_buf_map,
>>  +	.unmap_dma_buf		=3D iio_buffer_dma_buf_unmap,
>>  +	.release		=3D iio_buffer_dma_buf_release,
>>  +};
>>  +
>>   static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
>>   	struct iio_dma_buffer_queue *queue, size_t size)
>>   {
>>   	struct iio_dma_buffer_block *block;
>>  +	DEFINE_DMA_BUF_EXPORT_INFO(einfo);
>>  +	struct dma_buf *dmabuf;
>>  +	int err =3D -ENOMEM;
>>=20
>>   	block =3D kzalloc(sizeof(*block), GFP_KERNEL);
>>   	if (!block)
>>  -		return NULL;
>>  +		return ERR_PTR(err);
>>=20
>>   	block->vaddr =3D dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
>>   		&block->phys_addr, GFP_KERNEL);
>>  -	if (!block->vaddr) {
>>  -		kfree(block);
>>  -		return NULL;
>>  +	if (!block->vaddr)
>>  +		goto err_free_block;
>>  +
>>  +	einfo.ops =3D &iio_dma_buffer_dmabuf_ops;
>>  +	einfo.size =3D PAGE_ALIGN(size);
>>  +	einfo.priv =3D block;
>>  +	einfo.flags =3D O_RDWR;
>>  +
>>  +	dmabuf =3D dma_buf_export(&einfo);
>>  +	if (IS_ERR(dmabuf)) {
>>  +		err =3D PTR_ERR(dmabuf);
>>  +		goto err_free_dma;
>>   	}
>>=20
>>  +	block->dmabuf =3D dmabuf;
>>   	block->size =3D size;
>>   	block->state =3D IIO_BLOCK_STATE_DONE;
>>   	block->queue =3D queue;
>>   	INIT_LIST_HEAD(&block->head);
>>  -	kref_init(&block->kref);
>>=20
>>   	iio_buffer_get(&queue->buffer);
>>=20
>>   	return block;
>>  +
>>  +err_free_dma:
>>  +	dma_free_coherent(queue->dev, PAGE_ALIGN(size),
>>  +			  block->vaddr, block->phys_addr);
>>  +err_free_block:
>>  +	kfree(block);
>>  +	return ERR_PTR(err);
>>   }
>>=20
>>   static void _iio_dma_buffer_block_done(struct iio_dma_buffer_block=20
>> *block)
>>  @@ -223,7 +266,7 @@ void iio_dma_buffer_block_done(struct=20
>> iio_dma_buffer_block *block)
>>   	_iio_dma_buffer_block_done(block);
>>   	spin_unlock_irqrestore(&queue->list_lock, flags);
>>=20
>>  -	iio_buffer_block_put_atomic(block);
>>  +	iio_buffer_block_put(block);
>>   	iio_dma_buffer_queue_wake(queue);
>>   }
>>   EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
>>  @@ -249,7 +292,8 @@ void iio_dma_buffer_block_list_abort(struct=20
>> iio_dma_buffer_queue *queue,
>>   		list_del(&block->head);
>>   		block->bytes_used =3D 0;
>>   		_iio_dma_buffer_block_done(block);
>>  -		iio_buffer_block_put_atomic(block);
>>  +
>>  +		iio_buffer_block_put(block);
>>   	}
>>   	spin_unlock_irqrestore(&queue->list_lock, flags);
>>=20
>>  @@ -340,8 +384,8 @@ int iio_dma_buffer_request_update(struct=20
>> iio_buffer *buffer)
>>=20
>>   		if (!block) {
>>   			block =3D iio_dma_buffer_alloc_block(queue, size);
>>  -			if (!block) {
>>  -				ret =3D -ENOMEM;
>>  +			if (IS_ERR(block)) {
>>  +				ret =3D PTR_ERR(block);
>>   				goto out_unlock;
>>   			}
>>   			queue->fileio.blocks[i] =3D block;
>>  diff --git a/include/linux/iio/buffer-dma.h=20
>> b/include/linux/iio/buffer-dma.h
>>  index 490b93f76fa8..6b3fa7d2124b 100644
>>  --- a/include/linux/iio/buffer-dma.h
>>  +++ b/include/linux/iio/buffer-dma.h
>>  @@ -8,7 +8,6 @@
>>   #define __INDUSTRIALIO_DMA_BUFFER_H__
>>=20
>>   #include <linux/list.h>
>>  -#include <linux/kref.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/mutex.h>
>>   #include <linux/iio/buffer_impl.h>
>>  @@ -16,6 +15,7 @@
>>   struct iio_dma_buffer_queue;
>>   struct iio_dma_buffer_ops;
>>   struct device;
>>  +struct dma_buf;
>>=20
>>   /**
>>    * enum iio_block_state - State of a struct iio_dma_buffer_block
>>  @@ -39,8 +39,8 @@ enum iio_block_state {
>>    * @vaddr: Virutal address of the blocks memory
>>    * @phys_addr: Physical address of the blocks memory
>>    * @queue: Parent DMA buffer queue
>>  - * @kref: kref used to manage the lifetime of block
>>    * @state: Current state of the block
>>  + * @dmabuf: Underlying DMABUF object
>>    */
>>   struct iio_dma_buffer_block {
>>   	/* May only be accessed by the owner of the block */
>>  @@ -56,13 +56,13 @@ struct iio_dma_buffer_block {
>>   	size_t size;
>>   	struct iio_dma_buffer_queue *queue;
>>=20
>>  -	/* Must not be accessed outside the core. */
>>  -	struct kref kref;
>>   	/*
>>   	 * Must not be accessed outside the core. Access needs to hold
>>   	 * queue->list_lock if the block is not owned by the core.
>>   	 */
>>   	enum iio_block_state state;
>>  +
>>  +	struct dma_buf *dmabuf;
>>   };
>>=20
>>   /**
>=20


