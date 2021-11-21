Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD9458585
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 18:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20CA6E05D;
	Sun, 21 Nov 2021 17:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC936E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 17:43:32 +0000 (UTC)
Date: Sun, 21 Nov 2021 17:43:20 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/15] iio: buffer-dma: Boost performance using
 write-combine cache setting
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <8WNX2R.M4XE9MQC24W22@crapouillou.net>
In-Reply-To: <20211121150037.2a606be0@jic23-huawei>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-12-paul@crapouillou.net>
 <20211121150037.2a606be0@jic23-huawei>
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
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le dim., nov. 21 2021 at 15:00:37 +0000, Jonathan Cameron=20
<jic23@kernel.org> a =E9crit :
> On Mon, 15 Nov 2021 14:19:21 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  We can be certain that the input buffers will only be accessed by
>>  userspace for reading, and output buffers will mostly be accessed by
>>  userspace for writing.
>=20
> Mostly?  Perhaps a little more info on why that's not 'only'.

Just like with a framebuffer, it really depends on what the application=20
does. Most of the cases it will just read sequentially an input buffer,=20
or write sequentially an output buffer. But then you get the exotic=20
application that will try to do something like alpha blending, which=20
means read+write. Hence "mostly".

>>=20
>>  Therefore, it makes more sense to use only fully cached input=20
>> buffers,
>>  and to use the write-combine cache coherency setting for output=20
>> buffers.
>>=20
>>  This boosts performance, as the data written to the output buffers=20
>> does
>>  not have to be sync'd for coherency. It will halve performance if=20
>> the
>>  userspace application tries to read from the output buffer, but this
>>  should never happen.
>>=20
>>  Since we don't need to sync the cache when disabling CPU access=20
>> either
>>  for input buffers or output buffers, the .end_cpu_access() callback=20
>> can
>>  be dropped completely.
>=20
> We have an odd mix of coherent and non coherent DMA in here as you=20
> noted,
> but are you sure this is safe on all platforms?

The mix isn't safe, but using only coherent or only non-coherent should=20
be safe, yes.

>=20
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> Any numbers to support this patch?  The mapping types are performance
> optimisations so nice to know how much of a difference they make.

Output buffers are definitely faster in write-combine mode. On a=20
ZedBoard with a AD9361 transceiver set to 66 MSPS, and buffer/size set=20
to 8192, I would get about 185 MiB/s before, 197 MiB/s after.

Input buffers... early results are mixed. On ARM32 it does look like it=20
is slightly faster to read from *uncached* memory than reading from=20
cached memory. The cache sync does take a long time.

Other architectures might have a different result, for instance on MIPS=20
invalidating the cache is a very fast operation, so using cached=20
buffers would be a huge win in performance.

Setups where the DMA operations are coherent also wouldn't require any=20
cache sync and this patch would give a huge win in performance.

I'll run some more tests next week to have some fresh numbers.

Cheers,
-Paul

>>  ---
>>   drivers/iio/buffer/industrialio-buffer-dma.c | 82=20
>> +++++++++++++-------
>>   1 file changed, 54 insertions(+), 28 deletions(-)
>>=20
>>  diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c=20
>> b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  index 92356ee02f30..fb39054d8c15 100644
>>  --- a/drivers/iio/buffer/industrialio-buffer-dma.c
>>  +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
>>  @@ -229,8 +229,33 @@ static int iio_buffer_dma_buf_mmap(struct=20
>> dma_buf *dbuf,
>>   	if (vma->vm_ops->open)
>>   		vma->vm_ops->open(vma);
>>=20
>>  -	return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
>>  -			      virt_to_page(block->vaddr));
>>  +	if (block->queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN) {
>>  +		/*
>>  +		 * With an input buffer, userspace will only read the data and
>>  +		 * never write. We can mmap the buffer fully cached.
>>  +		 */
>>  +		return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
>>  +				      virt_to_page(block->vaddr));
>>  +	} else {
>>  +		/*
>>  +		 * With an output buffer, userspace will only write the data
>>  +		 * and should rarely (if never) read from it. It is better to
>>  +		 * use write-combine in this case.
>>  +		 */
>>  +		return dma_mmap_wc(dev, vma, block->vaddr, block->phys_addr,
>>  +				   vma->vm_end - vma->vm_start);
>>  +	}
>>  +}
>>  +
>>  +static void iio_dma_buffer_free_dmamem(struct iio_dma_buffer_block=20
>> *block)
>>  +{
>>  +	struct device *dev =3D block->queue->dev;
>>  +	size_t size =3D PAGE_ALIGN(block->size);
>>  +
>>  +	if (block->queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN)
>>  +		dma_free_coherent(dev, size, block->vaddr, block->phys_addr);
>>  +	else
>>  +		dma_free_wc(dev, size, block->vaddr, block->phys_addr);
>>   }
>>=20
>>   static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
>>  @@ -243,9 +268,7 @@ static void iio_buffer_dma_buf_release(struct=20
>> dma_buf *dbuf)
>>=20
>>   	mutex_lock(&queue->lock);
>>=20
>>  -	dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
>>  -			  block->vaddr, block->phys_addr);
>>  -
>>  +	iio_dma_buffer_free_dmamem(block);
>>   	kfree(block);
>>=20
>>   	queue->num_blocks--;
>>  @@ -268,19 +291,6 @@ static int=20
>> iio_buffer_dma_buf_begin_cpu_access(struct dma_buf *dbuf,
>>   	return 0;
>>   }
>>=20
>>  -static int iio_buffer_dma_buf_end_cpu_access(struct dma_buf *dbuf,
>>  -					     enum dma_data_direction dma_dir)
>>  -{
>>  -	struct iio_dma_buffer_block *block =3D dbuf->priv;
>>  -	struct device *dev =3D block->queue->dev;
>>  -
>>  -	/* We only need to sync the cache for output buffers */
>>  -	if (block->queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_OUT)
>>  -		dma_sync_single_for_device(dev, block->phys_addr, block->size,=20
>> dma_dir);
>>  -
>>  -	return 0;
>>  -}
>>  -
>>   static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops =3D {
>>   	.attach			=3D iio_buffer_dma_buf_attach,
>>   	.map_dma_buf		=3D iio_buffer_dma_buf_map,
>>  @@ -288,9 +298,28 @@ static const struct dma_buf_ops=20
>> iio_dma_buffer_dmabuf_ops =3D {
>>   	.mmap			=3D iio_buffer_dma_buf_mmap,
>>   	.release		=3D iio_buffer_dma_buf_release,
>>   	.begin_cpu_access	=3D iio_buffer_dma_buf_begin_cpu_access,
>>  -	.end_cpu_access		=3D iio_buffer_dma_buf_end_cpu_access,
>>   };
>>=20
>>  +static int iio_dma_buffer_alloc_dmamem(struct iio_dma_buffer_block=20
>> *block)
>>  +{
>>  +	struct device *dev =3D block->queue->dev;
>>  +	size_t size =3D PAGE_ALIGN(block->size);
>>  +
>>  +	if (block->queue->buffer.direction =3D=3D IIO_BUFFER_DIRECTION_IN) {
>>  +		block->vaddr =3D dma_alloc_coherent(dev, size,
>>  +						  &block->phys_addr,
>>  +						  GFP_KERNEL);
>>  +	} else {
>>  +		block->vaddr =3D dma_alloc_wc(dev, size,
>>  +					    &block->phys_addr,
>>  +					    GFP_KERNEL);
>>  +	}
>>  +	if (!block->vaddr)
>>  +		return -ENOMEM;
>>  +
>>  +	return 0;
>>  +}
>>  +
>>   static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
>>   	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
>>   {
>>  @@ -303,12 +332,12 @@ static struct iio_dma_buffer_block=20
>> *iio_dma_buffer_alloc_block(
>>   	if (!block)
>>   		return ERR_PTR(-ENOMEM);
>>=20
>>  -	block->vaddr =3D dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
>>  -		&block->phys_addr, GFP_KERNEL);
>>  -	if (!block->vaddr) {
>>  -		err =3D -ENOMEM;
>>  +	block->size =3D size;
>>  +	block->queue =3D queue;
>>  +
>>  +	err =3D iio_dma_buffer_alloc_dmamem(block);
>>  +	if (err)
>>   		goto err_free_block;
>>  -	}
>>=20
>>   	einfo.ops =3D &iio_dma_buffer_dmabuf_ops;
>>   	einfo.size =3D PAGE_ALIGN(size);
>>  @@ -322,10 +351,8 @@ static struct iio_dma_buffer_block=20
>> *iio_dma_buffer_alloc_block(
>>   	}
>>=20
>>   	block->dmabuf =3D dmabuf;
>>  -	block->size =3D size;
>>   	block->bytes_used =3D size;
>>   	block->state =3D IIO_BLOCK_STATE_DONE;
>>  -	block->queue =3D queue;
>>   	block->fileio =3D fileio;
>>   	INIT_LIST_HEAD(&block->head);
>>=20
>>  @@ -338,8 +365,7 @@ static struct iio_dma_buffer_block=20
>> *iio_dma_buffer_alloc_block(
>>   	return block;
>>=20
>>   err_free_dma:
>>  -	dma_free_coherent(queue->dev, PAGE_ALIGN(size),
>>  -			  block->vaddr, block->phys_addr);
>>  +	iio_dma_buffer_free_dmamem(block);
>>   err_free_block:
>>   	kfree(block);
>>   	return ERR_PTR(err);
>=20


