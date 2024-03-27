Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3488EE84
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 19:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E833C10F5D8;
	Wed, 27 Mar 2024 18:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="gI6xLEj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C217D10EFAF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1711565328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q+VAflKSVpS/uc6+Go3aTZwY2NhcMu7ws4PPiZrId24=;
 b=gI6xLEj+UsSUNTlkykQPWip0ilyapL3nf3XyTLl62CtIECVWNrv31dmBZjgpOnu1nf63xD
 AdBBX/hxu3rh3NSGhnntdiLM8gcyfe2rPBK7J5j8gpydBut6vZHkWEkxiy/eB05EVAPK7B
 b71O3LKauKpiqJhrXUPEmBx40nFG4bo=
Message-ID: <5ea549035d25273df6e45849a8dcc1bde71723b1.camel@crapouillou.net>
Subject: Re: [PATCH v9 3/6] iio: core: Add new DMABUF interface infrastructure
From: Paul Cercueil <paul@crapouillou.net>
To: Andrew Davis <afd@ti.com>, Jonathan Cameron <jic23@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: Nuno Sa <nuno.sa@analog.com>, Michael Hennerich
 <michael.hennerich@analog.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 27 Mar 2024 19:48:45 +0100
In-Reply-To: <7f175cf2-0eb0-452f-b2db-881d8a9b215c@ti.com>
References: <20240310124836.31863-1-paul@crapouillou.net>
 <20240310124836.31863-4-paul@crapouillou.net>
 <7f175cf2-0eb0-452f-b2db-881d8a9b215c@ti.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Andrew,

Le mercredi 27 mars 2024 =C3=A0 12:21 -0500, Andrew Davis a =C3=A9crit=C2=
=A0:
> On 3/10/24 7:48 AM, Paul Cercueil wrote:
> > Add the necessary infrastructure to the IIO core to support a new
> > optional DMABUF based interface.
> >=20
> > With this new interface, DMABUF objects (externally created) can be
> > attached to a IIO buffer, and subsequently used for data transfer.
> >=20
> > A userspace application can then use this interface to share DMABUF
> > objects between several interfaces, allowing it to transfer data in
> > a
> > zero-copy fashion, for instance between IIO and the USB stack.
> >=20
> > The userspace application can also memory-map the DMABUF objects,
> > and
> > access the sample data directly. The advantage of doing this vs.
> > the
> > read() interface is that it avoids an extra copy of the data
> > between the
> > kernel and userspace. This is particularly userful for high-speed
> > devices which produce several megabytes or even gigabytes of data
> > per
> > second.
> >=20
> > As part of the interface, 3 new IOCTLs have been added:
> >=20
> > IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
> > =C2=A0 Attach the DMABUF object identified by the given file descriptor
> > to the
> > =C2=A0 buffer.
> >=20
> > IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
> > =C2=A0 Detach the DMABUF object identified by the given file descriptor
> > from
> > =C2=A0 the buffer. Note that closing the IIO buffer's file descriptor
> > will
> > =C2=A0 automatically detach all previously attached DMABUF objects.
> >=20
> > IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
> > =C2=A0 Request a data transfer to/from the given DMABUF object. Its fil=
e
> > =C2=A0 descriptor, as well as the transfer size and flags are provided
> > in the
> > =C2=A0 "iio_dmabuf" structure.
> >=20
> > These three IOCTLs have to be performed on the IIO buffer's file
> > descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> >=20
> > ---
> > v2: Only allow the new IOCTLs on the buffer FD created with
> > =C2=A0=C2=A0=C2=A0=C2=A0 IIO_BUFFER_GET_FD_IOCTL().
> >=20
> > v3: - Get rid of the old IOCTLs. The IIO subsystem does not create
> > or
> > =C2=A0=C2=A0=C2=A0=C2=A0 manage DMABUFs anymore, and only attaches/deta=
ches externally
> > =C2=A0=C2=A0=C2=A0=C2=A0 created DMABUFs.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Add IIO_BUFFER_DMABUF_CYCLIC to the supporte=
d flags.
> >=20
> > v5: - Use dev_err() instead of pr_err()
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Inline to_iio_dma_fence()
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Add comment to explain why we unref twice wh=
en detaching
> > dmabuf
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Remove TODO comment. It is actually safe to =
free the file's
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 private data even when transfers a=
re still pending because
> > it
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 won't be accessed.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Fix documentation of new fields in struct
> > iio_buffer_access_funcs
> > =C2=A0=C2=A0=C2=A0=C2=A0 - iio_dma_resv_lock() does not need to be expo=
rted, make it
> > static
> >=20
> > v6: - Remove dead code in iio_dma_resv_lock()
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Fix non-block actually blocking
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Cache dma_buf_attachment instead of mapping/=
unmapping it for
> > every
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 transfer
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Return -EINVAL instead of IIO_IOCTL_UNHANDLE=
D for unknown
> > ioctl
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Make .block_enqueue() callback take a dma_fe=
nce pointer,
> > which
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be passed to iio_buffer_signa=
l_dmabuf_done() instead of
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_attachment; and remove the=
 backpointer from the priv
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 structure to the dma_fence.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Use dma_fence_begin/end_signalling in the dm=
a_fence critical
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sections
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Unref dma_fence and dma_buf_attachment in wo=
rker, because
> > they
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 might try to lock the dma_resv, wh=
ich would deadlock.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Add buffer ops to lock/unlock the queue. Thi=
s is motivated
> > by the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fact that once the dma_fence has b=
een installed, we cannot
> > lock
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anything anymore - so the queue mu=
st be locked before the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence is installed.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Use 'long retl' variable to handle the retur=
n value of
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_wait_timeout()
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Protect dmabufs list access with a mutex
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Rework iio_buffer_find_attachment() to use t=
he internal
> > dmabufs
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list, instead of messing with dmab=
ufs private data.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Add an atomically-increasing sequence number=
 for fences
> >=20
> > v8=C2=A0 - Fix swapped fence direction
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Simplify fence wait mechanism
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Remove "Buffer closed with active transfers"=
 print, as it
> > was dead
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Un-export iio_buffer_dmabuf_{get,put}. They =
are not used
> > anywhere
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else so they can even be static.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Prevent attaching already-attached DMABUFs
> >=20
> > v9: - Select DMA_SHARED_BUFFER in Kconfig
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Remove useless forward declaration of 'iio_d=
ma_fence'
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Import DMA-BUF namespace
> > =C2=A0=C2=A0=C2=A0=C2=A0 - Add missing __user tag to iio_buffer_detach_=
dmabuf()
> > argument
> > ---
> > =C2=A0 drivers/iio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/iio/industrialio-buffer.c | 462
> > ++++++++++++++++++++++++++++++
> > =C2=A0 include/linux/iio/buffer_impl.h=C2=A0=C2=A0 |=C2=A0 30 ++
> > =C2=A0 include/uapi/linux/iio/buffer.h=C2=A0=C2=A0 |=C2=A0 22 ++
> > =C2=A0 4 files changed, 515 insertions(+)
> >=20
> > diff --git a/drivers/iio/Kconfig b/drivers/iio/Kconfig
> > index 9c351ffc7bed..661127aed2f9 100644
> > --- a/drivers/iio/Kconfig
> > +++ b/drivers/iio/Kconfig
> > @@ -14,6 +14,7 @@ if IIO
> > =C2=A0=20
> > =C2=A0 config IIO_BUFFER
> > =C2=A0=C2=A0	bool "Enable buffer support within IIO"
> > +	select DMA_SHARED_BUFFER
> > =C2=A0=C2=A0	help
> > =C2=A0=C2=A0	=C2=A0 Provide core support for various buffer based data
> > =C2=A0=C2=A0	=C2=A0 acquisition methods.
> > diff --git a/drivers/iio/industrialio-buffer.c
> > b/drivers/iio/industrialio-buffer.c
> > index b581a7e80566..a987654f82fc 100644
> > --- a/drivers/iio/industrialio-buffer.c
> > +++ b/drivers/iio/industrialio-buffer.c
> > @@ -9,14 +9,19 @@
> > =C2=A0=C2=A0 * - Better memory allocation techniques?
> > =C2=A0=C2=A0 * - Alternative access techniques?
> > =C2=A0=C2=A0 */
> > +#include <linux/atomic.h>
> > =C2=A0 #include <linux/anon_inodes.h>
> > =C2=A0 #include <linux/kernel.h>
> > =C2=A0 #include <linux/export.h>
> > =C2=A0 #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-fence.h>
> > +#include <linux/dma-resv.h>
> > =C2=A0 #include <linux/file.h>
> > =C2=A0 #include <linux/fs.h>
> > =C2=A0 #include <linux/cdev.h>
> > =C2=A0 #include <linux/slab.h>
> > +#include <linux/mm.h>
> > =C2=A0 #include <linux/poll.h>
> > =C2=A0 #include <linux/sched/signal.h>
> > =C2=A0=20
> > @@ -28,6 +33,32 @@
> > =C2=A0 #include <linux/iio/buffer.h>
> > =C2=A0 #include <linux/iio/buffer_impl.h>
> > =C2=A0=20
> > +#define DMABUF_ENQUEUE_TIMEOUT_MS 5000
> > +
> > +MODULE_IMPORT_NS(DMA_BUF);
> > +
> > +struct iio_dmabuf_priv {
> > +	struct list_head entry;
> > +	struct kref ref;
> > +
> > +	struct iio_buffer *buffer;
> > +	struct iio_dma_buffer_block *block;
> > +
> > +	u64 context;
> > +	spinlock_t lock;
> > +
> > +	struct dma_buf_attachment *attach;
> > +	struct sg_table *sgt;
> > +	enum dma_data_direction dir;
> > +	atomic_t seqno;
> > +};
> > +
> > +struct iio_dma_fence {
> > +	struct dma_fence base;
> > +	struct iio_dmabuf_priv *priv;
> > +	struct work_struct work;
> > +};
> > +
> > =C2=A0 static const char * const iio_endian_prefix[] =3D {
> > =C2=A0=C2=A0	[IIO_BE] =3D "be",
> > =C2=A0=C2=A0	[IIO_LE] =3D "le",
> > @@ -332,6 +363,8 @@ void iio_buffer_init(struct iio_buffer *buffer)
> > =C2=A0 {
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&buffer->demux_list);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&buffer->buffer_list);
> > +	INIT_LIST_HEAD(&buffer->dmabufs);
> > +	mutex_init(&buffer->dmabufs_mutex);
> > =C2=A0=C2=A0	init_waitqueue_head(&buffer->pollq);
> > =C2=A0=C2=A0	kref_init(&buffer->ref);
> > =C2=A0=C2=A0	if (!buffer->watermark)
> > @@ -1519,14 +1552,57 @@ static void
> > iio_buffer_unregister_legacy_sysfs_groups(struct iio_dev
> > *indio_dev)
> > =C2=A0=C2=A0	kfree(iio_dev_opaque->legacy_scan_el_group.attrs);
> > =C2=A0 }
> > =C2=A0=20
> > +static void iio_buffer_dmabuf_release(struct kref *ref)
> > +{
> > +	struct iio_dmabuf_priv *priv =3D container_of(ref, struct
> > iio_dmabuf_priv, ref);
> > +	struct dma_buf_attachment *attach =3D priv->attach;
> > +	struct iio_buffer *buffer =3D priv->buffer;
> > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > +
> > +	dma_resv_lock(dmabuf->resv, NULL);
> > +	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
> > +	dma_resv_unlock(dmabuf->resv);
> > +
> > +	buffer->access->detach_dmabuf(buffer, priv->block);
> > +
> > +	dma_buf_detach(attach->dmabuf, attach);
> > +	dma_buf_put(dmabuf);
> > +	kfree(priv);
> > +}
> > +
> > +static void iio_buffer_dmabuf_get(struct dma_buf_attachment
> > *attach)
> > +{
> > +	struct iio_dmabuf_priv *priv =3D attach->importer_priv;
> > +
> > +	kref_get(&priv->ref);
> > +}
> > +
> > +static void iio_buffer_dmabuf_put(struct dma_buf_attachment
> > *attach)
> > +{
> > +	struct iio_dmabuf_priv *priv =3D attach->importer_priv;
> > +
> > +	kref_put(&priv->ref, iio_buffer_dmabuf_release);
> > +}
> > +
> > =C2=A0 static int iio_buffer_chrdev_release(struct inode *inode, struct
> > file *filep)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct iio_dev_buffer_pair *ib =3D filep->private_data;
> > =C2=A0=C2=A0	struct iio_dev *indio_dev =3D ib->indio_dev;
> > =C2=A0=C2=A0	struct iio_buffer *buffer =3D ib->buffer;
> > +	struct iio_dmabuf_priv *priv, *tmp;
> > =C2=A0=20
> > =C2=A0=C2=A0	wake_up(&buffer->pollq);
> > =C2=A0=20
> > +	mutex_lock(&buffer->dmabufs_mutex);
> > +
> > +	/* Close all attached DMABUFs */
> > +	list_for_each_entry_safe(priv, tmp, &buffer->dmabufs,
> > entry) {
> > +		list_del_init(&priv->entry);
> > +		iio_buffer_dmabuf_put(priv->attach);
> > +	}
> > +
> > +	mutex_unlock(&buffer->dmabufs_mutex);
> > +
> > =C2=A0=C2=A0	kfree(ib);
> > =C2=A0=C2=A0	clear_bit(IIO_BUSY_BIT_POS, &buffer->flags);
> > =C2=A0=C2=A0	iio_device_put(indio_dev);
> > @@ -1534,11 +1610,396 @@ static int
> > iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=20
> > +static int iio_dma_resv_lock(struct dma_buf *dmabuf, bool
> > nonblock)
> > +{
> > +	if (!nonblock)
> > +		return dma_resv_lock_interruptible(dmabuf->resv,
> > NULL);
> > +
> > +	if (!dma_resv_trylock(dmabuf->resv))
> > +		return -EBUSY;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct dma_buf_attachment *
> > +iio_buffer_find_attachment(struct iio_dev_buffer_pair *ib,
> > +			=C2=A0=C2=A0 struct dma_buf *dmabuf, bool nonblock)
> > +{
> > +	struct device *dev =3D ib->indio_dev->dev.parent;
> > +	struct iio_buffer *buffer =3D ib->buffer;
> > +	struct dma_buf_attachment *attach =3D NULL;
> > +	struct iio_dmabuf_priv *priv;
> > +
> > +	mutex_lock(&buffer->dmabufs_mutex);
> > +
> > +	list_for_each_entry(priv, &buffer->dmabufs, entry) {
> > +		if (priv->attach->dev =3D=3D dev
> > +		=C2=A0=C2=A0=C2=A0 && priv->attach->dmabuf =3D=3D dmabuf) {
> > +			attach =3D priv->attach;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (attach)
> > +		iio_buffer_dmabuf_get(attach);
> > +
> > +	mutex_unlock(&buffer->dmabufs_mutex);
> > +
> > +	return attach ?: ERR_PTR(-EPERM);
> > +}
> > +
> > +static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair
> > *ib,
> > +				=C2=A0=C2=A0=C2=A0 int __user *user_fd, bool
> > nonblock)
> > +{
> > +	struct iio_dev *indio_dev =3D ib->indio_dev;
> > +	struct iio_buffer *buffer =3D ib->buffer;
> > +	struct dma_buf_attachment *attach;
> > +	struct iio_dmabuf_priv *priv, *each;
> > +	struct dma_buf *dmabuf;
> > +	int err, fd;
> > +
> > +	if (!buffer->access->attach_dmabuf
> > +	=C2=A0=C2=A0=C2=A0 || !buffer->access->detach_dmabuf
> > +	=C2=A0=C2=A0=C2=A0 || !buffer->access->enqueue_dmabuf)
> > +		return -EPERM;
> > +
> > +	if (copy_from_user(&fd, user_fd, sizeof(fd)))
> > +		return -EFAULT;
> > +
> > +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&priv->lock);
> > +	priv->context =3D dma_fence_context_alloc(1);
> > +
> > +	dmabuf =3D dma_buf_get(fd);
> > +	if (IS_ERR(dmabuf)) {
> > +		err =3D PTR_ERR(dmabuf);
> > +		goto err_free_priv;
> > +	}
> > +
> > +	attach =3D dma_buf_attach(dmabuf, indio_dev->dev.parent);
> > +	if (IS_ERR(attach)) {
> > +		err =3D PTR_ERR(attach);
> > +		goto err_dmabuf_put;
> > +	}
> > +
> > +	err =3D iio_dma_resv_lock(dmabuf, nonblock);
> > +	if (err)
> > +		goto err_dmabuf_detach;
> > +
> > +	priv->dir =3D buffer->direction =3D=3D IIO_BUFFER_DIRECTION_IN
> > +		? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > +
> > +	priv->sgt =3D dma_buf_map_attachment(attach, priv->dir);
>=20
> Part of the fundamental design of DMABUF is the ability for all
> users of a buffer to attach to the buffer before any user maps that
> buffer. This allows an exporter to do constraint solving based
> on all the attached buffers at map time to select the best backing
> memory.
>=20
> I know none of the exporters do that right now, probably due to
> most of the importers doing what you do here: attach then immediately
> map. This prevents the split between attach and map from being
> useful.
>=20
> I'd recommend only doing the dma_buf_map_attachment() later when you
> use the buffer, maybe part of enqueue_dmabuf() step below. Then
> unmap()
> it after you are done with it, not only when detaching.
>=20
> As this change will not affect the UAPI (which only deals with
> "attach" ioctl), then this comment should not be seen as a blocker
> for taking this series. We should be able to make this change later,
> but just something to think about.

Both the dma-heap implementations and udmabuf will sync/flush the CPU
cache in their map/unmap callbacks (as they call dma_{un}map_sgtable()
with attrs =3D=3D 0). In my case not only it is unnecessary, it also
destroys performance, especially with big DMABUFs backed by small pages
as they'll be sync'd one by one.

For that reason (as well as convenience) I'm caching the attachment.

> Andrew

Cheers,
-Paul

>=20
> > +	if (IS_ERR(priv->sgt)) {
> > +		err =3D PTR_ERR(priv->sgt);
> > +		dev_err(&indio_dev->dev, "Unable to map
> > attachment: %d\n", err);
> > +		goto err_resv_unlock;
> > +	}
> > +
> > +	kref_init(&priv->ref);
> > +	priv->buffer =3D buffer;
> > +	priv->attach =3D attach;
> > +	attach->importer_priv =3D priv;
> > +
> > +	priv->block =3D buffer->access->attach_dmabuf(buffer,
> > attach);
> > +	if (IS_ERR(priv->block)) {
> > +		err =3D PTR_ERR(priv->block);
> > +		goto err_dmabuf_unmap_attachment;
> > +	}
> > +
> > +	dma_resv_unlock(dmabuf->resv);
> > +
> > +	mutex_lock(&buffer->dmabufs_mutex);
> > +
> > +	/*
> > +	 * Check whether we already have an attachment for this
> > driver/DMABUF
> > +	 * combo. If we do, refuse to attach.
> > +	 */
> > +	list_for_each_entry(each, &buffer->dmabufs, entry) {
> > +		if (each->attach->dev =3D=3D indio_dev->dev.parent
> > +		=C2=A0=C2=A0=C2=A0 && each->attach->dmabuf =3D=3D dmabuf) {
> > +			/*
> > +			 * We unlocked the reservation object, so
> > going through
> > +			 * the cleanup code would mean re-locking
> > it first.
> > +			 * At this stage it is simpler to free the
> > attachment
> > +			 * using iio_buffer_dma_put().
> > +			 */
> > +			mutex_unlock(&buffer->dmabufs_mutex);
> > +			iio_buffer_dmabuf_put(attach);
> > +			return -EBUSY;
> > +		}
> > +	}
> > +
> > +	/* Otherwise, add the new attachment to our dmabufs list.
> > */
> > +	list_add(&priv->entry, &buffer->dmabufs);
> > +	mutex_unlock(&buffer->dmabufs_mutex);
> > +
> > +	return 0;
> > +
> > +err_dmabuf_unmap_attachment:
> > +	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
> > +err_resv_unlock:
> > +	dma_resv_unlock(dmabuf->resv);
> > +err_dmabuf_detach:
> > +	dma_buf_detach(dmabuf, attach);
> > +err_dmabuf_put:
> > +	dma_buf_put(dmabuf);
> > +err_free_priv:
> > +	kfree(priv);
> > +
> > +	return err;
> > +}
> > +
> > +static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair
> > *ib,
> > +				=C2=A0=C2=A0=C2=A0 int __user *user_req, bool
> > nonblock)
> > +{
> > +	struct iio_buffer *buffer =3D ib->buffer;
> > +	struct iio_dev *indio_dev =3D ib->indio_dev;
> > +	struct iio_dmabuf_priv *priv;
> > +	struct dma_buf *dmabuf;
> > +	int dmabuf_fd, ret =3D -EPERM;
> > +
> > +	if (copy_from_user(&dmabuf_fd, user_req,
> > sizeof(dmabuf_fd)))
> > +		return -EFAULT;
> > +
> > +	dmabuf =3D dma_buf_get(dmabuf_fd);
> > +	if (IS_ERR(dmabuf))
> > +		return PTR_ERR(dmabuf);
> > +
> > +	mutex_lock(&buffer->dmabufs_mutex);
> > +
> > +	list_for_each_entry(priv, &buffer->dmabufs, entry) {
> > +		if (priv->attach->dev =3D=3D indio_dev->dev.parent
> > +		=C2=A0=C2=A0=C2=A0 && priv->attach->dmabuf =3D=3D dmabuf) {
> > +			list_del(&priv->entry);
> > +
> > +			/* Unref the reference from
> > iio_buffer_attach_dmabuf() */
> > +			iio_buffer_dmabuf_put(priv->attach);
> > +			ret =3D 0;
> > +			break;
> > +		}
> > +	}
> > +
> > +	mutex_unlock(&buffer->dmabufs_mutex);
> > +	dma_buf_put(dmabuf);
> > +
> > +	return ret;
> > +}
> > +
> > +static const char *
> > +iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
> > +{
> > +	return "iio";
> > +}
> > +
> > +static void iio_buffer_dma_fence_release(struct dma_fence *fence)
> > +{
> > +	struct iio_dma_fence *iio_fence =3D
> > +		container_of(fence, struct iio_dma_fence, base);
> > +
> > +	kfree(iio_fence);
> > +}
> > +
> > +static const struct dma_fence_ops iio_buffer_dma_fence_ops =3D {
> > +	.get_driver_name	=3D
> > iio_buffer_dma_fence_get_driver_name,
> > +	.get_timeline_name	=3D
> > iio_buffer_dma_fence_get_driver_name,
> > +	.release		=3D iio_buffer_dma_fence_release,
> > +};
> > +
> > +static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair
> > *ib,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct iio_dmabuf __user
> > *iio_dmabuf_req,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 bool nonblock)
> > +{
> > +	struct iio_buffer *buffer =3D ib->buffer;
> > +	struct iio_dmabuf iio_dmabuf;
> > +	struct dma_buf_attachment *attach;
> > +	struct iio_dmabuf_priv *priv;
> > +	struct iio_dma_fence *fence;
> > +	struct dma_buf *dmabuf;
> > +	unsigned long timeout;
> > +	bool cookie, cyclic, dma_to_ram;
> > +	long retl;
> > +	u32 seqno;
> > +	int ret;
> > +
> > +	if (copy_from_user(&iio_dmabuf, iio_dmabuf_req,
> > sizeof(iio_dmabuf)))
> > +		return -EFAULT;
> > +
> > +	if (iio_dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
> > +		return -EINVAL;
> > +
> > +	cyclic =3D iio_dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC;
> > +
> > +	/* Cyclic flag is only supported on output buffers */
> > +	if (cyclic && buffer->direction !=3D
> > IIO_BUFFER_DIRECTION_OUT)
> > +		return -EINVAL;
> > +
> > +	dmabuf =3D dma_buf_get(iio_dmabuf.fd);
> > +	if (IS_ERR(dmabuf))
> > +		return PTR_ERR(dmabuf);
> > +
> > +	if (!iio_dmabuf.bytes_used || iio_dmabuf.bytes_used >
> > dmabuf->size) {
> > +		ret =3D -EINVAL;
> > +		goto err_dmabuf_put;
> > +	}
> > +
> > +	attach =3D iio_buffer_find_attachment(ib, dmabuf, nonblock);
> > +	if (IS_ERR(attach)) {
> > +		ret =3D PTR_ERR(attach);
> > +		goto err_dmabuf_put;
> > +	}
> > +
> > +	priv =3D attach->importer_priv;
> > +
> > +	fence =3D kmalloc(sizeof(*fence), GFP_KERNEL);
> > +	if (!fence) {
> > +		ret =3D -ENOMEM;
> > +		goto err_attachment_put;
> > +	}
> > +
> > +	fence->priv =3D priv;
> > +
> > +	seqno =3D atomic_add_return(1, &priv->seqno);
> > +
> > +	/*
> > +	 * The transfers are guaranteed to be processed in the
> > order they are
> > +	 * enqueued, so we can use a simple incrementing sequence
> > number for
> > +	 * the dma_fence.
> > +	 */
> > +	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &priv->lock, priv->context, seq=
no);
> > +
> > +	ret =3D iio_dma_resv_lock(dmabuf, nonblock);
> > +	if (ret)
> > +		goto err_fence_put;
> > +
> > +	timeout =3D nonblock ? 0 :
> > msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
> > +	dma_to_ram =3D buffer->direction =3D=3D IIO_BUFFER_DIRECTION_IN;
> > +
> > +	/* Make sure we don't have writers */
> > +	retl =3D dma_resv_wait_timeout(dmabuf->resv,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0
> > dma_resv_usage_rw(dma_to_ram),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 true, timeout);
> > +	if (retl =3D=3D 0)
> > +		retl =3D -EBUSY;
> > +	if (retl < 0) {
> > +		ret =3D (int)retl;
> > +		goto err_resv_unlock;
> > +	}
> > +
> > +	if (buffer->access->lock_queue)
> > +		buffer->access->lock_queue(buffer);
> > +
> > +	ret =3D dma_resv_reserve_fences(dmabuf->resv, 1);
> > +	if (ret)
> > +		goto err_queue_unlock;
> > +
> > +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> > +			=C2=A0=C2=A0 dma_to_ram ? DMA_RESV_USAGE_WRITE :
> > DMA_RESV_USAGE_READ);
> > +	dma_resv_unlock(dmabuf->resv);
> > +
> > +	cookie =3D dma_fence_begin_signalling();
> > +
> > +	ret =3D buffer->access->enqueue_dmabuf(buffer, priv->block,
> > &fence->base,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 priv->sgt,
> > iio_dmabuf.bytes_used,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 cyclic);
> > +	if (ret) {
> > +		/*
> > +		 * DMABUF enqueue failed, but we already added the
> > fence.
> > +		 * Signal the error through the fence completion
> > mechanism.
> > +		 */
> > +		iio_buffer_signal_dmabuf_done(&fence->base, ret);
> > +	}
> > +
> > +	if (buffer->access->unlock_queue)
> > +		buffer->access->unlock_queue(buffer);
> > +
> > +	dma_fence_end_signalling(cookie);
> > +	dma_buf_put(dmabuf);
> > +
> > +	return ret;
> > +
> > +err_queue_unlock:
> > +	if (buffer->access->unlock_queue)
> > +		buffer->access->unlock_queue(buffer);
> > +err_resv_unlock:
> > +	dma_resv_unlock(dmabuf->resv);
> > +err_fence_put:
> > +	dma_fence_put(&fence->base);
> > +err_attachment_put:
> > +	iio_buffer_dmabuf_put(attach);
> > +err_dmabuf_put:
> > +	dma_buf_put(dmabuf);
> > +
> > +	return ret;
> > +}
> > +
> > +static void iio_buffer_cleanup(struct work_struct *work)
> > +{
> > +	struct iio_dma_fence *fence =3D
> > +		container_of(work, struct iio_dma_fence, work);
> > +	struct iio_dmabuf_priv *priv =3D fence->priv;
> > +	struct dma_buf_attachment *attach =3D priv->attach;
> > +
> > +	dma_fence_put(&fence->base);
> > +	iio_buffer_dmabuf_put(attach);
> > +}
> > +
> > +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int
> > ret)
> > +{
> > +	struct iio_dma_fence *iio_fence =3D
> > +		container_of(fence, struct iio_dma_fence, base);
> > +	bool cookie =3D dma_fence_begin_signalling();
> > +
> > +	/*
> > +	 * Get a reference to the fence, so that it's not freed as
> > soon as
> > +	 * it's signaled.
> > +	 */
> > +	dma_fence_get(fence);
> > +
> > +	fence->error =3D ret;
> > +	dma_fence_signal(fence);
> > +	dma_fence_end_signalling(cookie);
> > +
> > +	/*
> > +	 * The fence will be unref'd in iio_buffer_cleanup.
> > +	 * It can't be done here, as the unref functions might try
> > to lock the
> > +	 * resv object, which can deadlock.
> > +	 */
> > +	INIT_WORK(&iio_fence->work, iio_buffer_cleanup);
> > +	schedule_work(&iio_fence->work);
> > +}
> > +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
> > +
> > +static long iio_buffer_chrdev_ioctl(struct file *filp,
> > +				=C2=A0=C2=A0=C2=A0 unsigned int cmd, unsigned
> > long arg)
> > +{
> > +	struct iio_dev_buffer_pair *ib =3D filp->private_data;
> > +	void __user *_arg =3D (void __user *)arg;
> > +	bool nonblock =3D filp->f_flags & O_NONBLOCK;
> > +
> > +	switch (cmd) {
> > +	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
> > +		return iio_buffer_attach_dmabuf(ib, _arg,
> > nonblock);
> > +	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
> > +		return iio_buffer_detach_dmabuf(ib, _arg,
> > nonblock);
> > +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> > +		return iio_buffer_enqueue_dmabuf(ib, _arg,
> > nonblock);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > =C2=A0 static const struct file_operations iio_buffer_chrdev_fileops =
=3D {
> > =C2=A0=C2=A0	.owner =3D THIS_MODULE,
> > =C2=A0=C2=A0	.llseek =3D noop_llseek,
> > =C2=A0=C2=A0	.read =3D iio_buffer_read,
> > =C2=A0=C2=A0	.write =3D iio_buffer_write,
> > +	.unlocked_ioctl =3D iio_buffer_chrdev_ioctl,
> > +	.compat_ioctl =3D compat_ptr_ioctl,
> > =C2=A0=C2=A0	.poll =3D iio_buffer_poll,
> > =C2=A0=C2=A0	.release =3D iio_buffer_chrdev_release,
> > =C2=A0 };
> > @@ -1953,6 +2414,7 @@ static void iio_buffer_release(struct kref
> > *ref)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct iio_buffer *buffer =3D container_of(ref, struct
> > iio_buffer, ref);
> > =C2=A0=20
> > +	mutex_destroy(&buffer->dmabufs_mutex);
> > =C2=A0=C2=A0	buffer->access->release(buffer);
> > =C2=A0 }
> > =C2=A0=20
> > diff --git a/include/linux/iio/buffer_impl.h
> > b/include/linux/iio/buffer_impl.h
> > index 89c3fd7c29ca..1a221c1d7736 100644
> > --- a/include/linux/iio/buffer_impl.h
> > +++ b/include/linux/iio/buffer_impl.h
> > @@ -9,8 +9,12 @@
> > =C2=A0 #include <uapi/linux/iio/buffer.h>
> > =C2=A0 #include <linux/iio/buffer.h>
> > =C2=A0=20
> > +struct dma_buf_attachment;
> > +struct dma_fence;
> > =C2=A0 struct iio_dev;
> > +struct iio_dma_buffer_block;
> > =C2=A0 struct iio_buffer;
> > +struct sg_table;
> > =C2=A0=20
> > =C2=A0 /**
> > =C2=A0=C2=A0 * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of t=
he
> > buffer can not be
> > @@ -39,6 +43,13 @@ struct iio_buffer;
> > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devic=
e stops sampling. Calles are
> > balanced with @enable.
> > =C2=A0=C2=A0 * @release:		called when the last reference to the
> > buffer is dropped,
> > =C2=A0=C2=A0 *			should free all resources allocated by the
> > buffer.
> > + * @attach_dmabuf:	called from userspace via ioctl to attach
> > one external
> > + *			DMABUF.
> > + * @detach_dmabuf:	called from userspace via ioctl to detach
> > one previously
> > + *			attached DMABUF.
> > + * @enqueue_dmabuf:	called from userspace via ioctl to queue
> > this DMABUF
> > + *			object to this buffer. Requires a valid
> > DMABUF fd, that
> > + *			was previouly attached to this buffer.
> > =C2=A0=C2=A0 * @modes:		Supported operating modes by this buffer
> > type
> > =C2=A0=C2=A0 * @flags:		A bitmask combination of
> > INDIO_BUFFER_FLAG_*
> > =C2=A0=C2=A0 *
> > @@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
> > =C2=A0=20
> > =C2=A0=C2=A0	void (*release)(struct iio_buffer *buffer);
> > =C2=A0=20
> > +	struct iio_dma_buffer_block * (*attach_dmabuf)(struct
> > iio_buffer *buffer,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > dma_buf_attachment *attach);
> > +	void (*detach_dmabuf)(struct iio_buffer *buffer,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iio_dma_buffer_block *block);
> > +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iio_dma_buffer_block *block,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence, struct
> > sg_table *sgt,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, bool cyclic);
> > +	void (*lock_queue)(struct iio_buffer *buffer);
> > +	void (*unlock_queue)(struct iio_buffer *buffer);
> > +
> > =C2=A0=C2=A0	unsigned int modes;
> > =C2=A0=C2=A0	unsigned int flags;
> > =C2=A0 };
> > @@ -136,6 +158,12 @@ struct iio_buffer {
> > =C2=A0=20
> > =C2=A0=C2=A0	/* @ref: Reference count of the buffer. */
> > =C2=A0=C2=A0	struct kref ref;
> > +
> > +	/* @dmabufs: List of DMABUF attachments */
> > +	struct list_head dmabufs; /* P: dmabufs_mutex */
> > +
> > +	/* @dmabufs_mutex: Protects dmabufs */
> > +	struct mutex dmabufs_mutex;
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -159,6 +187,8 @@ void iio_buffer_init(struct iio_buffer
> > *buffer);
> > =C2=A0 struct iio_buffer *iio_buffer_get(struct iio_buffer *buffer);
> > =C2=A0 void iio_buffer_put(struct iio_buffer *buffer);
> > =C2=A0=20
> > +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int
> > ret);
> > +
> > =C2=A0 #else /* CONFIG_IIO_BUFFER */
> > =C2=A0=20
> > =C2=A0 static inline void iio_buffer_get(struct iio_buffer *buffer) {}
> > diff --git a/include/uapi/linux/iio/buffer.h
> > b/include/uapi/linux/iio/buffer.h
> > index 13939032b3f6..c666aa95e532 100644
> > --- a/include/uapi/linux/iio/buffer.h
> > +++ b/include/uapi/linux/iio/buffer.h
> > @@ -5,6 +5,28 @@
> > =C2=A0 #ifndef _UAPI_IIO_BUFFER_H_
> > =C2=A0 #define _UAPI_IIO_BUFFER_H_
> > =C2=A0=20
> > +#include <linux/types.h>
> > +
> > +/* Flags for iio_dmabuf.flags */
> > +#define IIO_BUFFER_DMABUF_CYCLIC		(1 << 0)
> > +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
> > +
> > +/**
> > + * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
> > + * @fd:		file descriptor of the DMABUF object
> > + * @flags:	one or more IIO_BUFFER_DMABUF_* flags
> > + * @bytes_used:	number of bytes used in this DMABUF for
> > the data transfer.
> > + *		Should generally be set to the DMABUF's size.
> > + */
> > +struct iio_dmabuf {
> > +	__u32 fd;
> > +	__u32 flags;
> > +	__u64 bytes_used;
> > +};
> > +
> > =C2=A0 #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i',
> > 0x91, int)
> > +#define IIO_BUFFER_DMABUF_ATTACH_IOCTL		_IOW('i', 0x92,
> > int)
> > +#define IIO_BUFFER_DMABUF_DETACH_IOCTL		_IOW('i', 0x93,
> > int)
> > +#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i',
> > 0x94, struct iio_dmabuf)
> > =C2=A0=20
> > =C2=A0 #endif /* _UAPI_IIO_BUFFER_H_ */

