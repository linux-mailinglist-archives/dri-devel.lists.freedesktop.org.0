Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AD981BD08
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 18:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995A310E70E;
	Thu, 21 Dec 2023 17:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990CA10E6D0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1703179313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BlZlxbLzNCNMyCpcVFlFbc9xCSSGUZy0/AkVj3iZWds=;
 b=2Rm/2nyPRNQnLESexxS6mQA71ENwnzPq46ed4Pz90okyf+JJpxNHm91TWMZ/SktES/D8Fo
 A7YkNFEFnXquXNYtUeEGCnQB/cvyej/IsmVaijDRBuwEjrI59M0Z8WdKlZpueTZV+uqY+g
 uu7/BsjrT396Nd/j2Qa/sL/ukTxMnxw=
Message-ID: <baee615936893ab5e28e6fff1014211286579476.camel@crapouillou.net>
Subject: Re: [PATCH v5 5/8] iio: core: Add new DMABUF interface infrastructure
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Date: Thu, 21 Dec 2023 18:21:51 +0100
In-Reply-To: <20231221120624.7bcdc302@jic23-huawei>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-6-paul@crapouillou.net>
 <20231221120624.7bcdc302@jic23-huawei>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le jeudi 21 d=C3=A9cembre 2023 =C3=A0 12:06 +0000, Jonathan Cameron a =C3=
=A9crit=C2=A0:
> On Tue, 19 Dec 2023 18:50:06 +0100
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
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
> > =C2=A0Attach the DMABUF object identified by the given file descriptor
> > to the
> > =C2=A0buffer.
> >=20
> > IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
> > =C2=A0Detach the DMABUF object identified by the given file descriptor
> > from
> > =C2=A0the buffer. Note that closing the IIO buffer's file descriptor
> > will
> > =C2=A0automatically detach all previously attached DMABUF objects.
> >=20
> > IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
> > =C2=A0Request a data transfer to/from the given DMABUF object. Its file
> > =C2=A0descriptor, as well as the transfer size and flags are provided i=
n
> > the
> > =C2=A0"iio_dmabuf" structure.
> >=20
> > These three IOCTLs have to be performed on the IIO buffer's file
> > descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> >=20
>=20
> Fair enough - so they don't apply to the 'legacy' buffer which
> simplifies
> things but in one place you assume that logic is used (given error
> return
> values).
>=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> This is big and complex and I'm out of time for now, so I've made
> some
> comments but should revisit it.
> I'm also looking for review from those more familiar with dmabuf side
> of things than I am!
>=20
> Jonathan
>=20
>=20
> > =C2=A0
> > +static int iio_dma_resv_lock(struct dma_buf *dmabuf, bool
> > nonblock)
> > +{
> > +	int ret;
> > +
> > +	ret =3D dma_resv_lock_interruptible(dmabuf->resv, NULL);
> > +	if (ret) {
> > +		if (ret !=3D -EDEADLK)
> > +			goto out;
> > +		if (nonblock) {
> > +			ret =3D -EBUSY;
> > +			goto out;
> > +		}
> > +
> > +		ret =3D dma_resv_lock_slow_interruptible(dmabuf-
> > >resv, NULL);
> > +	}
> > +
> > +out:
> > +	return ret;
>=20
> I'm not a fan gotos that do nothing.=C2=A0 Just return in appropriate
> places above.
>=20
> > +}
> >=20
> > +static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair
> > *ib, int *user_req)
> > +{
> > +	struct dma_buf_attachment *attach;
> > +	struct iio_dmabuf_priv *priv;
> > +	struct dma_buf *dmabuf;
> > +	int dmabuf_fd, ret =3D 0;
> > +
> > +	if (copy_from_user(&dmabuf_fd, user_req,
> > sizeof(dmabuf_fd)))
> > +		return -EFAULT;
> > +
> > +	dmabuf =3D dma_buf_get(dmabuf_fd);
> > +	if (IS_ERR(dmabuf))
> > +		return PTR_ERR(dmabuf);
> > +
> > +	attach =3D iio_buffer_find_attachment(ib->indio_dev,
> > dmabuf);
> > +	if (IS_ERR(attach)) {
> > +		ret =3D PTR_ERR(attach);
> > +		goto out_dmabuf_put;
> > +	}
> > +
> > +	priv =3D attach->importer_priv;
> > +	list_del_init(&priv->entry);
> > +
> > +	/*
> > +	 * Unref twice to release the reference obtained with
> > +	 * iio_buffer_find_attachment() above, and the one
> > obtained in
> > +	 * iio_buffer_attach_dmabuf().
> > +	 */
> > +	iio_buffer_dmabuf_put(attach);
> > +	iio_buffer_dmabuf_put(attach);
> > +
> > +out_dmabuf_put:
> > +	dma_buf_put(dmabuf);
> As below. Feels like a __free(dma_buf_put) bit of magic would be a
> nice to have.

Whoa, never heard about this. That looks great!

>=20
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
> > +	struct iio_dev *indio_dev =3D ib->indio_dev;
> > +	struct iio_buffer *buffer =3D ib->buffer;
> > +	struct iio_dmabuf iio_dmabuf;
> > +	struct dma_buf_attachment *attach;
> > +	struct iio_dmabuf_priv *priv;
> > +	enum dma_data_direction dir;
> > +	struct iio_dma_fence *fence;
> > +	struct dma_buf *dmabuf;
> > +	struct sg_table *sgt;
> > +	unsigned long timeout;
> > +	bool dma_to_ram;
> > +	bool cyclic;
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
> > +	attach =3D iio_buffer_find_attachment(indio_dev, dmabuf);
> > +	if (IS_ERR(attach)) {
> > +		ret =3D PTR_ERR(attach);
> > +		goto err_dmabuf_put;
>=20
> Might be worth some cleanup.h magic given this put happens in all
> exit paths.
>=20
> > +	}
> > +
> > +	priv =3D attach->importer_priv;
> > +
> > +	dma_to_ram =3D buffer->direction =3D=3D IIO_BUFFER_DIRECTION_IN;
> > +	dir =3D dma_to_ram ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > +
> > +	sgt =3D dma_buf_map_attachment(attach, dir);
> > +	if (IS_ERR(sgt)) {
> > +		ret =3D PTR_ERR(sgt);
> > +		dev_err(&indio_dev->dev, "Unable to map
> > attachment: %d\n", ret);
> > +		goto err_attachment_put;
> > +	}
> > +
> > +	fence =3D kmalloc(sizeof(*fence), GFP_KERNEL);
> > +	if (!fence) {
> > +		ret =3D -ENOMEM;
> > +		goto err_unmap_attachment;
> > +	}
> > +
> > +	fence->priv =3D priv;
> > +	fence->sgt =3D sgt;
> > +	fence->dir =3D dir;
> > +	priv->fence =3D fence;
> > +
> > +	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &priv->lock, priv->context, 0);
> > +
> > +	ret =3D iio_dma_resv_lock(dmabuf, nonblock);
> > +	if (ret)
> > +		goto err_fence_put;
> > +
> > +	timeout =3D nonblock ? 0 :
> > msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
> > +
> > +	/* Make sure we don't have writers */
> > +	ret =3D (int) dma_resv_wait_timeout(dmabuf->resv,
> > DMA_RESV_USAGE_WRITE,
> > +					=C2=A0 true, timeout);
>=20
> I'd handle this and similar cases as long rather than adding the odd
> looking cast and making
> me think too much about it.
>=20
> > +	if (ret =3D=3D 0)
> > +		ret =3D -EBUSY;
> > +	if (ret < 0)
> > +		goto err_resv_unlock;
> > +
> > +	if (dma_to_ram) {
> > +		/*
> > +		 * If we're writing to the DMABUF, make sure we
> > don't have
> > +		 * readers
> > +		 */
> > +		ret =3D (int) dma_resv_wait_timeout(dmabuf->resv,
> > +						=C2=A0
> > DMA_RESV_USAGE_READ, true,
> > +						=C2=A0 timeout);
> > +		if (ret =3D=3D 0)
> > +			ret =3D -EBUSY;
> > +		if (ret < 0)
> > +			goto err_resv_unlock;
> > +	}
> > +
> > +	ret =3D dma_resv_reserve_fences(dmabuf->resv, 1);
> > +	if (ret)
> > +		goto err_resv_unlock;
> > +
> > +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> > +			=C2=A0=C2=A0 dma_resv_usage_rw(dma_to_ram));
> > +	dma_resv_unlock(dmabuf->resv);
> > +
> > +	ret =3D buffer->access->enqueue_dmabuf(buffer, priv->block,
> > sgt,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > iio_dmabuf.bytes_used, cyclic);
> > +	if (ret)
> > +		iio_buffer_signal_dmabuf_done(attach, ret);
>=20
> I'd like a comment on why using the 'successful' path cleanup makes
> sense in this
> error case.=C2=A0 It's possible to figure it out, but reviewers are lazy
> and generally
> we like the cleanup to be obvious and local on error paths.
>=20
> > +
> > +	dma_buf_put(dmabuf);
> > +
> > +	return ret;
> > +
> > +err_resv_unlock:
> > +	dma_resv_unlock(dmabuf->resv);
> > +err_fence_put:
> > +	dma_fence_put(&fence->base);
> > +err_unmap_attachment:
> > +	dma_buf_unmap_attachment(attach, sgt, dir);
> > +err_attachment_put:
> > +	iio_buffer_dmabuf_put(attach);
> > +err_dmabuf_put:
> > +	dma_buf_put(dmabuf);
> > +
> > +	return ret;
> > +}
> > +
> > +void iio_buffer_signal_dmabuf_done(struct dma_buf_attachment
> > *attach, int ret)
> > +{
> > +	struct iio_dmabuf_priv *priv =3D attach->importer_priv;
> > +	struct iio_dma_fence *fence =3D priv->fence;
> > +	enum dma_data_direction dir =3D fence->dir;
> > +	struct sg_table *sgt =3D fence->sgt;
> > +
> > +	dma_fence_get(&fence->base);
>=20
> I don't know much about dma_fence, but is it valid to access
> contents of it (sgt, etc) before getting a reference?
> Ultimately dma_fence_put() can result in a kfree_rcu() so seems
> unlikely to be safe and definitely fails the 'obviously correct'
> test.=C2=A0 Given those are I assume trivial accesses just do them=20
> down here perhaps?

It is valid to access the fence before getting a reference - the fence
won't be freed before it is signaled down below. It would be illegal to
access it after the dma_fence_put() though, which I'm not doing here.

>=20
>=20
> > +	fence->base.error =3D ret;
> > +	dma_fence_signal(&fence->base);
> > +	dma_fence_put(&fence->base);
> > +
> > +	dma_buf_unmap_attachment(attach, sgt, dir);
> > +	iio_buffer_dmabuf_put(attach);
> > +}
> > +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
> > +
>=20
> > +static long iio_buffer_chrdev_ioctl(struct file *filp,
> > +				=C2=A0=C2=A0=C2=A0 unsigned int cmd, unsigned
> > long arg)
> > +{
> > +	struct iio_dev_buffer_pair *ib =3D filp->private_data;
> > +	void __user *_arg =3D (void __user *)arg;
> > +
> > +	switch (cmd) {
> > +	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
> > +		return iio_buffer_attach_dmabuf(ib, _arg);
> > +	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
> > +		return iio_buffer_detach_dmabuf(ib, _arg);
> > +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> > +		return iio_buffer_enqueue_dmabuf(ib, _arg,
> > +						 filp->f_flags &
> > O_NONBLOCK);
> > +	default:
> > +		return IIO_IOCTL_UNHANDLED;
>=20
> Given you aren't using the ioctl handling on the legacy buffer, I
> think this
> should simply return an error code, not the magic value we use to
> indicate
> 'all fine, but it's not mine'.
> Probably -EINVAL or similar.=C2=A0 Note that the wrapper around the legac=
y
> buffer
> ioctls translates this to -ENODEV; rather than returning from the
> ioctl.

ACK for this and the other comments.

Thanks for reviewing!

Cheers,
-Paul

> > +	}
> > +}
> > +
> > =C2=A0static const struct file_operations iio_buffer_chrdev_fileops =3D=
 {
> > =C2=A0	.owner =3D THIS_MODULE,
> > =C2=A0	.llseek =3D noop_llseek,
> > =C2=A0	.read =3D iio_buffer_read,
> > =C2=A0	.write =3D iio_buffer_write,
> > +	.unlocked_ioctl =3D iio_buffer_chrdev_ioctl,
> > +	.compat_ioctl =3D compat_ptr_ioctl,
> > =C2=A0	.poll =3D iio_buffer_poll,
> > =C2=A0	.release =3D iio_buffer_chrdev_release,
> > =C2=A0};
>=20

