Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0A82750F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 17:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0659210E15D;
	Mon,  8 Jan 2024 16:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB00710E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1704731256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rk2yIZ5fs0+Qn/EDDSEo0lJfzI0ino/K//O3pF7UCWk=;
 b=QQrpwAO8njYYMuJVu+hnNerT+9Ky6WXTN+KDC6MDH1WLmhpS9hJJ4u+HF7UHT5n/0iEpKo
 FjGUcrPAQYCBdLItL388AjhAUu7R+ynCsjfmLEO0K22ahwKUJdJhwHBYUhyKcZzylNIPnK
 C2GtBcTZeLdUdM8ZIv7oadC7857mTLg=
Message-ID: <2c0d4ef1b657c56ea2290fe16d757ce563a3e71b.camel@crapouillou.net>
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
From: Paul Cercueil <paul@crapouillou.net>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 08 Jan 2024 17:27:33 +0100
In-Reply-To: <ZZwU827NMHbx7bsO@phenom.ffwll.local>
References: <20240108120056.22165-1-paul@crapouillou.net>
 <20240108120056.22165-4-paul@crapouillou.net>
 <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
 <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
 <ZZwU827NMHbx7bsO@phenom.ffwll.local>
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
Cc: linux-usb@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lundi 08 janvier 2024 =C3=A0 16:29 +0100, Daniel Vetter a =C3=A9crit=C2=
=A0:
> On Mon, Jan 08, 2024 at 03:21:21PM +0100, Paul Cercueil wrote:
> > Hi Daniel (Sima?),
> >=20
> > Le lundi 08 janvier 2024 =C3=A0 13:39 +0100, Daniel Vetter a =C3=A9crit=
=C2=A0:
> > > On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul Cercueil wrote:
> > > > This patch introduces three new ioctls. They all should be
> > > > called
> > > > on a
> > > > data endpoint (ie. not ep0). They are:
> > > >=20
> > > > - FUNCTIONFS_DMABUF_ATTACH, which takes the file descriptor of
> > > > a
> > > > DMABUF
> > > > =C2=A0 object to attach to the endpoint.
> > > >=20
> > > > - FUNCTIONFS_DMABUF_DETACH, which takes the file descriptor of
> > > > the
> > > > =C2=A0 DMABUF to detach from the endpoint. Note that closing the
> > > > endpoint's
> > > > =C2=A0 file descriptor will automatically detach all attached
> > > > DMABUFs.
> > > >=20
> > > > - FUNCTIONFS_DMABUF_TRANSFER, which requests a data transfer
> > > > from /
> > > > to
> > > > =C2=A0 the given DMABUF. Its argument is a structure that packs the
> > > > DMABUF's
> > > > =C2=A0 file descriptor, the size in bytes to transfer (which should
> > > > generally
> > > > =C2=A0 be set to the size of the DMABUF), and a 'flags' field which
> > > > is
> > > > unused
> > > > =C2=A0 for now.
> > > > =C2=A0 Before this ioctl can be used, the related DMABUF must be
> > > > attached
> > > > =C2=A0 with FUNCTIONFS_DMABUF_ATTACH.
> > > >=20
> > > > These three ioctls enable the FunctionFS code to transfer data
> > > > between
> > > > the USB stack and a DMABUF object, which can be provided by a
> > > > driver
> > > > from a completely different subsystem, in a zero-copy fashion.
> > > >=20
> > > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > >=20
> > > > ---
> > > > v2:
> > > > - Make ffs_dma_resv_lock() static
> > > > - Add MODULE_IMPORT_NS(DMA_BUF);
> > > > - The attach/detach functions are now performed without locking
> > > > the
> > > > =C2=A0 eps_lock spinlock. The transfer function starts with the
> > > > spinlock
> > > > =C2=A0 unlocked, then locks it before allocating and queueing the
> > > > USB
> > > > =C2=A0 transfer.
> > > >=20
> > > > v3:
> > > > - Inline to_ffs_dma_fence() which was called only once.
> > > > - Simplify ffs_dma_resv_lock()
> > > > - Add comment explaining why we unref twice in
> > > > ffs_dmabuf_detach()
> > > > - Document uapi struct usb_ffs_dmabuf_transfer_req and IOCTLs
> > > > ---
> > > > =C2=A0drivers/usb/gadget/function/f_fs.c=C2=A0 | 417
> > > > ++++++++++++++++++++++++++++
> > > > =C2=A0include/uapi/linux/usb/functionfs.h |=C2=A0 41 +++
> > > > =C2=A02 files changed, 458 insertions(+)
> > > >=20
> > > > diff --git a/drivers/usb/gadget/function/f_fs.c
> > > > b/drivers/usb/gadget/function/f_fs.c
> > > > index ed2a6d5fcef7..9df1f5abb0d4 100644
> > > > --- a/drivers/usb/gadget/function/f_fs.c
> > > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > > @@ -15,6 +15,9 @@
> > > > =C2=A0/* #define VERBOSE_DEBUG */
> > > > =C2=A0
> > > > =C2=A0#include <linux/blkdev.h>
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/dma-fence.h>
> > > > +#include <linux/dma-resv.h>
> > > > =C2=A0#include <linux/pagemap.h>
> > > > =C2=A0#include <linux/export.h>
> > > > =C2=A0#include <linux/fs_parser.h>
> > > > @@ -43,6 +46,8 @@
> > > > =C2=A0
> > > > =C2=A0#define FUNCTIONFS_MAGIC	0xa647361 /* Chosen by a
> > > > honest
> > > > dice roll ;) */
> > > > =C2=A0
> > > > +MODULE_IMPORT_NS(DMA_BUF);
> > > > +
> > > > =C2=A0/* Reference counter handling */
> > > > =C2=A0static void ffs_data_get(struct ffs_data *ffs);
> > > > =C2=A0static void ffs_data_put(struct ffs_data *ffs);
> > > > @@ -124,6 +129,21 @@ struct ffs_ep {
> > > > =C2=A0	u8				num;
> > > > =C2=A0};
> > > > =C2=A0
> > > > +struct ffs_dmabuf_priv {
> > > > +	struct list_head entry;
> > > > +	struct kref ref;
> > > > +	struct dma_buf_attachment *attach;
> > > > +	spinlock_t lock;
> > > > +	u64 context;
> > > > +};
> > > > +
> > > > +struct ffs_dma_fence {
> > > > +	struct dma_fence base;
> > > > +	struct ffs_dmabuf_priv *priv;
> > > > +	struct sg_table *sgt;
> > > > +	enum dma_data_direction dir;
> > > > +};
> > > > +
> > > > =C2=A0struct ffs_epfile {
> > > > =C2=A0	/* Protects ep->ep and ep->req. */
> > > > =C2=A0	struct mutex			mutex;
> > > > @@ -197,6 +217,8 @@ struct ffs_epfile {
> > > > =C2=A0	unsigned char			isoc;	/* P: ffs-
> > > > > eps_lock */
> > > > =C2=A0
> > > > =C2=A0	unsigned char			_pad;
> > > > +
> > > > +	struct list_head		dmabufs;
> > > > =C2=A0};
> > > > =C2=A0
> > > > =C2=A0struct ffs_buffer {
> > > > @@ -1271,10 +1293,44 @@ static ssize_t
> > > > ffs_epfile_read_iter(struct
> > > > kiocb *kiocb, struct iov_iter *to)
> > > > =C2=A0	return res;
> > > > =C2=A0}
> > > > =C2=A0
> > > > +static void ffs_dmabuf_release(struct kref *ref)
> > > > +{
> > > > +	struct ffs_dmabuf_priv *priv =3D container_of(ref,
> > > > struct
> > > > ffs_dmabuf_priv, ref);
> > > > +	struct dma_buf_attachment *attach =3D priv->attach;
> > > > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > > > +
> > > > +	pr_debug("FFS DMABUF release\n");
> > > > +	dma_buf_detach(attach->dmabuf, attach);
> > > > +	dma_buf_put(dmabuf);
> > > > +
> > > > +	list_del(&priv->entry);
> > >=20
> > > I didn't find any locking for this list here.
> >=20
> > Yeah. I'll add some.
> >=20
> > > > +	kfree(priv);
> > > > +}
> > > > +
> > > > +static void ffs_dmabuf_get(struct dma_buf_attachment *attach)
> > > > +{
> > > > +	struct ffs_dmabuf_priv *priv =3D attach->importer_priv;
> > > > +
> > > > +	kref_get(&priv->ref);
> > > > +}
> > > > +
> > > > +static void ffs_dmabuf_put(struct dma_buf_attachment *attach)
> > > > +{
> > > > +	struct ffs_dmabuf_priv *priv =3D attach->importer_priv;
> > > > +
> > > > +	kref_put(&priv->ref, ffs_dmabuf_release);
> > > > +}
> > > > +
> > > > =C2=A0static int
> > > > =C2=A0ffs_epfile_release(struct inode *inode, struct file *file)
> > > > =C2=A0{
> > > > =C2=A0	struct ffs_epfile *epfile =3D inode->i_private;
> > > > +	struct ffs_dmabuf_priv *priv, *tmp;
> > > > +
> > > > +	/* Close all attached DMABUFs */
> > > > +	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs,
> > > > entry) {
> > > > +		ffs_dmabuf_put(priv->attach);
> > > > +	}
> > > > =C2=A0
> > > > =C2=A0	__ffs_epfile_read_buffer_free(epfile);
> > > > =C2=A0	ffs_data_closed(epfile->ffs);
> > > > @@ -1282,6 +1338,328 @@ ffs_epfile_release(struct inode *inode,
> > > > struct file *file)
> > > > =C2=A0	return 0;
> > > > =C2=A0}
> > > > =C2=A0
> > > > +static void ffs_dmabuf_signal_done(struct ffs_dma_fence
> > > > *dma_fence, int ret)
> > > > +{
> > > > +	struct ffs_dmabuf_priv *priv =3D dma_fence->priv;
> > > > +	struct dma_fence *fence =3D &dma_fence->base;
> > > > +
> > > > +	dma_fence_get(fence);
> > > > +	fence->error =3D ret;
> > > > +	dma_fence_signal(fence);
> > > > +
> > > > +	dma_buf_unmap_attachment(priv->attach, dma_fence->sgt,
> > > > dma_fence->dir);
> > > > +	dma_fence_put(fence);
> > > > +	ffs_dmabuf_put(priv->attach);
> > >=20
> > > So this can in theory take the dma_resv lock, and if the usb
> > > completion
> > > isn't an unlimited worker this could hold up completion of future
> > > dma_fence, resulting in a deadlock.
> > >=20
> > > Needs to be checked how usb works, and if stalling indefinitely
> > > in
> > > the
> > > io_complete callback can hold up the usb stack you need to:
> > >=20
> > > - drop a dma_fence_begin/end_signalling annotations in here
> > > - pull out the unref stuff into a separate preallocated worker
> > > (or at
> > > =C2=A0 least the final unrefs for ffs_dma_buf).
> >=20
> > Only ffs_dmabuf_put() can attempt to take the dma_resv and would
> > have
> > to be in a worker, right? Everything else would be inside the
> > dma_fence_begin/end_signalling() annotations?
>=20
> Yup. Also I noticed that unlike the iio patches you don't have the
> dma_buf_unmap here in the completion path (or I'm blind?), which
> helps a
> lot with avoiding trouble.

They both call dma_buf_unmap_attachment() in the "signal done"
callback, the only difference I see is that it is called after the
dma_fence_put() in the iio patches, while it's called before
dma_fence_put() here.

>=20
> > > > +}
> > > > +
> > > > +static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
> > > > +					=C2=A0 struct usb_request
> > > > *req)
> > > > +{
> > > > +	pr_debug("FFS: DMABUF transfer complete, status=3D%d\n",
> > > > req->status);
> > > > +	ffs_dmabuf_signal_done(req->context, req->status);
> > > > +	usb_ep_free_request(ep, req);
> > > > +}
> > > > +
> > > > +static const char *ffs_dmabuf_get_driver_name(struct dma_fence
> > > > *fence)
> > > > +{
> > > > +	return "functionfs";
> > > > +}
> > > > +
> > > > +static const char *ffs_dmabuf_get_timeline_name(struct
> > > > dma_fence
> > > > *fence)
> > > > +{
> > > > +	return "";
> > > > +}
> > > > +
> > > > +static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> > > > +{
> > > > +	struct ffs_dma_fence *dma_fence =3D
> > > > +		container_of(fence, struct ffs_dma_fence,
> > > > base);
> > > > +
> > > > +	kfree(dma_fence);
> > > > +}
> > > > +
> > > > +static const struct dma_fence_ops ffs_dmabuf_fence_ops =3D {
> > > > +	.get_driver_name	=3D ffs_dmabuf_get_driver_name,
> > > > +	.get_timeline_name	=3D
> > > > ffs_dmabuf_get_timeline_name,
> > > > +	.release		=3D ffs_dmabuf_fence_release,
> > > > +};
> > > > +
> > > > +static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool
> > > > nonblock)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret =3D dma_resv_lock_interruptible(dmabuf->resv, NULL);
> > > > +	if (ret) {
> > > > +		if (ret !=3D -EDEADLK)
> > > > +			return ret;
> > > > +		if (nonblock)
> > > > +			return -EBUSY;
> > > > +
> > > > +		ret =3D dma_resv_lock_slow_interruptible(dmabuf-
> > > > > resv, NULL);
> > >=20
> > > This is overkill, without a reservation context you will never
> > > get
> > > -EDEADLK and so never have to do slowpath locking. So just dead
> > > code.
> > >=20
> > > If you want to check, build with CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> >=20
> > Ok.
> >=20
> > >=20
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static struct dma_buf_attachment *
> > > > +ffs_dmabuf_find_attachment(struct device *dev, struct dma_buf
> > > > *dmabuf,
> > > > +			=C2=A0=C2=A0 bool nonblock)
> > > > +{
> > > > +	struct dma_buf_attachment *elm, *attach =3D NULL;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D ffs_dma_resv_lock(dmabuf, nonblock);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > > > +
> > > > +	list_for_each_entry(elm, &dmabuf->attachments, node) {
> > > > +		if (elm->dev =3D=3D dev) {
> > > > +			attach =3D elm;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (attach)
> > > > +		ffs_dmabuf_get(elm);
> > >=20
> > > This needs a kref_get_unless_zero or you can race with the final
> > > free.
> > >=20
> > > I'm not super keen that usb-gadget is noodling around in the
> > > attachment
> > > list like this, your own lookup structure (you have the dma-buf
> > > list
> > > already anyway to keep track of all attachments) would be much
> > > nicer.
> > > But
> > > the get_unless_zero I think is mandatory here for this weak
> > > reference.
> >=20
> > Christian suggested to move that to a dma_buf function.
> > Alternatively I can browse my epfile->dmabufs list, sure - that
> > won't
> > be hard to do. That's probably a better idea too.
>=20
> The trouble with the dma_buf function is that you need to have the
> kref_get_unless_zero on the kref in your private thing _within_ the
> dma_resv_lock critical section. Otherwise this lookup function and a
> concurrent final kref_put might race. So that helper function would
> need
> to require the caller to hold dma_resv_lock already.
>=20
> It's that kind of locking context leaking across subsystems I don't
> really
> like much. It's not buggy, but it is a bit much leaky abstraction.
>=20
> > > > +
> > > > +	dma_resv_unlock(dmabuf->resv);
> > > > +
> > > > +	return attach ?: ERR_PTR(-EPERM);
> > > > +}
> > > > +
> > > > +static int ffs_dmabuf_attach(struct file *file, int fd)
> > > > +{
> > > > +	struct ffs_epfile *epfile =3D file->private_data;
> > > > +	struct usb_gadget *gadget =3D epfile->ffs->gadget;
> > > > +	struct dma_buf_attachment *attach;
> > > > +	struct ffs_dmabuf_priv *priv;
> > > > +	struct dma_buf *dmabuf;
> > > > +	int err;
> > > > +
> > > > +	if (!gadget || !gadget->sg_supported)
> > > > +		return -EPERM;
> > > > +
> > > > +	dmabuf =3D dma_buf_get(fd);
> > > > +	if (IS_ERR(dmabuf))
> > > > +		return PTR_ERR(dmabuf);
> > > > +
> > > > +	attach =3D dma_buf_attach(dmabuf, gadget->dev.parent);
> > > > +	if (IS_ERR(attach)) {
> > > > +		err =3D PTR_ERR(attach);
> > > > +		goto err_dmabuf_put;
> > > > +	}
> > > > +
> > > > +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > > > +	if (!priv) {
> > > > +		err =3D -ENOMEM;
> > > > +		goto err_dmabuf_detach;
> > > > +	}
> > > > +
> > > > +	attach->importer_priv =3D priv;
> > > > +
> > > > +	priv->attach =3D attach;
> > > > +	spin_lock_init(&priv->lock);
> > > > +	kref_init(&priv->ref);
> > > > +	priv->context =3D dma_fence_context_alloc(1);
> > >=20
> > > Just to check: usb gagdet gurantees that all requests on an ep
> > > are
> > > ordered?
> >=20
> > The documentation of usb_ep_queue() states that the transfer
> > requests
> > are processed in FIFO order, yes.
>=20
> Might be good to document this in the comment message, or if you feel
> like, in the seqno generation for each dma_fence.
> >=20
> > >=20
> > > > +
> > > > +	list_add(&priv->entry, &epfile->dmabufs);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_dmabuf_detach:
> > > > +	dma_buf_detach(dmabuf, attach);
> > > > +err_dmabuf_put:
> > > > +	dma_buf_put(dmabuf);
> > > > +
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static int ffs_dmabuf_detach(struct file *file, int fd)
> > > > +{
> > > > +	struct ffs_epfile *epfile =3D file->private_data;
> > > > +	struct usb_gadget *gadget =3D epfile->ffs->gadget;
> > > > +	bool nonblock =3D file->f_flags & O_NONBLOCK;
> > > > +	struct dma_buf_attachment *attach;
> > > > +	struct dma_buf *dmabuf;
> > > > +	int ret =3D 0;
> > > > +
> > > > +	dmabuf =3D dma_buf_get(fd);
> > > > +	if (IS_ERR(dmabuf))
> > > > +		return PTR_ERR(dmabuf);
> > > > +
> > > > +	attach =3D ffs_dmabuf_find_attachment(gadget-
> > > > >dev.parent,
> > > > +					=C2=A0=C2=A0=C2=A0 dmabuf, nonblock);
> > > > +	if (IS_ERR(attach)) {
> > > > +		ret =3D PTR_ERR(attach);
> > > > +		goto out_dmabuf_put;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Unref twice to release the reference obtained with
> > > > +	 * ffs_dmabuf_find_attachment() above, and the one
> > > > obtained in
> > > > +	 * ffs_dmabuf_attach().
> > > > +	 */
> > > > +	ffs_dmabuf_put(attach);
> > >=20
> > > This looks strange, what's stopping userspace from calling detach
> > > multiple
> > > times while a transfer is pending (so that the destruction is
> > > delayed)?
> > > That smells like a refcount underflow.
> >=20
> > My idea was that the second ffs_dmabuf_put() would trigger
> > ffs_dmabuf_release(), which calls the list_del(); so a second call
> > to
> > ffs_dmabuf_detach() would fail to find the attachment.
> >=20
> > Indeed, if there's an on-going transfer, the refcount is higher,
> > and
> > this breaks miserably.
>=20
> Yup that was the scenario I was thinking of.
>=20
> > Christian pointed out that it breaks if ffs_dmabuf_detach() is
> > called
> > concurrently, but this is even worse :)
>=20
> You need the 2nd detach ioctl call to actually make things underrun,
> but I
> guess it also means that with just one you destroy the
> mapping/attachment
> before the hw is finished. Which I missed :-)

No, that shouldn't happen, because an extra reference is obtained in
ffs_dmabuf_find_attachment() called by ffs_dmabuf_transfer(), and is
only released in the ffs_dmabuf_signal_done() function.

> > > You probably need to tie the refcounts you acquire in
> > > ffs_dmabuf_attach to
> > > epfile->dmabufs 1:1 to make sure there's no way userspace can
> > > pull
> > > you
> > > over the table. This is also the reason why I looked for the
> > > locking
> > > of
> > > that list, and didn't find it.
> >=20
> > I'll change the code to atomically get the dma_buf_attachment and
> > remove it from the list.
> >=20
> > >=20
> > > > +	ffs_dmabuf_put(attach);
> > > > +
> > > > +out_dmabuf_put:
> > > > +	dma_buf_put(dmabuf);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int ffs_dmabuf_transfer(struct file *file,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > > usb_ffs_dmabuf_transfer_req *req)
> > > > +{
> > > > +	bool dma_to_ram, nonblock =3D file->f_flags &
> > > > O_NONBLOCK;
> > > > +	struct ffs_epfile *epfile =3D file->private_data;
> > > > +	struct usb_gadget *gadget =3D epfile->ffs->gadget;
> > > > +	struct dma_buf_attachment *attach;
> > > > +	struct ffs_dmabuf_priv *priv;
> > > > +	enum dma_data_direction dir;
> > > > +	struct ffs_dma_fence *fence;
> > > > +	struct usb_request *usb_req;
> > > > +	struct sg_table *sg_table;
> > > > +	struct dma_buf *dmabuf;
> > > > +	struct ffs_ep *ep;
> > > > +	int ret;
> > > > +
> > > > +	if (req->flags & ~USB_FFS_DMABUF_TRANSFER_MASK)
> > > > +		return -EINVAL;
> > > > +
> > > > +	dmabuf =3D dma_buf_get(req->fd);
> > > > +	if (IS_ERR(dmabuf))
> > > > +		return PTR_ERR(dmabuf);
> > > > +
> > > > +	if (req->length > dmabuf->size || req->length =3D=3D 0) {
> > > > +		ret =3D -EINVAL;
> > > > +		goto err_dmabuf_put;
> > > > +	}
> > > > +
> > > > +	attach =3D ffs_dmabuf_find_attachment(gadget-
> > > > >dev.parent,
> > > > +					=C2=A0=C2=A0=C2=A0 dmabuf, nonblock);
> > > > +	if (IS_ERR(attach)) {
> > > > +		ret =3D PTR_ERR(attach);
> > > > +		goto err_dmabuf_put;
> > > > +	}
> > > > +
> > > > +	priv =3D attach->importer_priv;
> > > > +
> > > > +	if (epfile->in)
> > > > +		dir =3D DMA_FROM_DEVICE;
> > > > +	else
> > > > +		dir =3D DMA_TO_DEVICE;
> > > > +
> > > > +	sg_table =3D dma_buf_map_attachment(attach, dir);
> > > > +	if (IS_ERR(sg_table)) {
> > > > +		ret =3D PTR_ERR(sg_table);
> > > > +		goto err_attachment_put;
> > > > +	}
> > > > +
> > > > +	ep =3D ffs_epfile_wait_ep(file);
> > > > +	if (IS_ERR(ep)) {
> > > > +		ret =3D PTR_ERR(ep);
> > > > +		goto err_unmap_attachment;
> > > > +	}
> > > > +
> > > > +	ret =3D ffs_dma_resv_lock(dmabuf, nonblock);
> > > > +	if (ret)
> > > > +		goto err_unmap_attachment;
> > > > +
> > > > +	/* Make sure we don't have writers */
> > > > +	if (!dma_resv_test_signaled(dmabuf->resv,
> > > > DMA_RESV_USAGE_WRITE)) {
> > > > +		pr_debug("FFS WRITE fence is not signaled\n");
> > > > +		ret =3D -EBUSY;
> > > > +		goto err_resv_unlock;
> > > > +	}
> > > > +
> > > > +	dma_to_ram =3D dir =3D=3D DMA_FROM_DEVICE;
> > > > +
> > > > +	/* If we're writing to the DMABUF, make sure we don't
> > > > have
> > > > readers */
> > > > +	if (dma_to_ram &&
> > > > +	=C2=A0=C2=A0=C2=A0 !dma_resv_test_signaled(dmabuf->resv,
> > > > DMA_RESV_USAGE_READ)) {
> > > > +		pr_debug("FFS READ fence is not signaled\n");
> > > > +		ret =3D -EBUSY;
> > > > +		goto err_resv_unlock;
> > > > +	}
> > > > +
> > > > +	ret =3D dma_resv_reserve_fences(dmabuf->resv, 1);
> > > > +	if (ret)
> > > > +		goto err_resv_unlock;
> > > > +
> > > > +	fence =3D kmalloc(sizeof(*fence), GFP_KERNEL);
> > > > +	if (!fence) {
> > > > +		ret =3D -ENOMEM;
> > > > +		goto err_resv_unlock;
> > > > +	}
> > > > +
> > > > +	fence->sgt =3D sg_table;
> > > > +	fence->dir =3D dir;
> > > > +	fence->priv =3D priv;
> > > > +
> > > > +	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &priv->lock, priv->context,=
 0);
> > >=20
> > > You need a real seqno here or things break with fence merging. Or
> > > alternatively unordered dma_fence (which are implemented by
> > > allocating a
> > > new context for each fence, maybe we should change that
> > > eventually
> > > ...).
> >=20
> > Understood.
> >=20
> > > > +
> > > > +	spin_lock_irq(&epfile->ffs->eps_lock);
> > > > +
> > > > +	/* In the meantime, endpoint got disabled or changed.
> > > > */
> > > > +	if (epfile->ep !=3D ep) {
> > > > +		ret =3D -ESHUTDOWN;
> > > > +		goto err_fence_put;
> > > > +	}
> > > > +
> > > > +	usb_req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> > > > +	if (!usb_req) {
> > > > +		ret =3D -ENOMEM;
> > > > +		goto err_fence_put;
> > > > +	}
> > > > +
> > > > +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> > > > +			=C2=A0=C2=A0 dma_resv_usage_rw(dma_to_ram));
> > > > +	dma_resv_unlock(dmabuf->resv);
> > > > +
> > > > +	/* Now that the dma_fence is in place, queue the
> > > > transfer.
> > > > */
> > > > +
> > > > +	usb_req->length =3D req->length;
> > > > +	usb_req->buf =3D NULL;
> > > > +	usb_req->sg =3D sg_table->sgl;
> > > > +	usb_req->num_sgs =3D sg_nents_for_len(sg_table->sgl,
> > > > req-
> > > > > length);
> > > > +	usb_req->sg_was_mapped =3D true;
> > > > +	usb_req->context=C2=A0 =3D fence;
> > > > +	usb_req->complete =3D ffs_epfile_dmabuf_io_complete;
> > > > +
> > > > +	ret =3D usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
> > > > +	if (ret) {
> > > > +		usb_ep_free_request(ep->ep, usb_req);
> > > > +
> > > > +		spin_unlock_irq(&epfile->ffs->eps_lock);
> > > > +
> > > > +		pr_warn("FFS: Failed to queue DMABUF: %d\n",
> > > > ret);
> > > > +		ffs_dmabuf_signal_done(fence, ret);
> > > > +		goto out_dma_buf_put;
> > > > +	}
> > > > +
> > > > +	spin_unlock_irq(&epfile->ffs->eps_lock);
> > > > +
> > > > +out_dma_buf_put:
> > > > +	dma_buf_put(dmabuf);
> > > > +
> > > > +	return ret;
> > > > +
> > > > +err_fence_put:
> > > > +	spin_unlock_irq(&epfile->ffs->eps_lock);
> > > > +	dma_fence_put(&fence->base);
> > > > +err_resv_unlock:
> > > > +	dma_resv_unlock(dmabuf->resv);
> > > > +err_unmap_attachment:
> > > > +	dma_buf_unmap_attachment(attach, sg_table, dir);
> > > > +err_attachment_put:
> > > > +	ffs_dmabuf_put(attach);
> > > > +err_dmabuf_put:
> > > > +	dma_buf_put(dmabuf);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > =C2=A0static long ffs_epfile_ioctl(struct file *file, unsigned code=
,
> > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long value)
> > > > =C2=A0{
> > > > @@ -1292,6 +1670,44 @@ static long ffs_epfile_ioctl(struct file
> > > > *file, unsigned code,
> > > > =C2=A0	if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
> > > > =C2=A0		return -ENODEV;
> > > > =C2=A0
> > > > +	switch (code) {
> > > > +	case FUNCTIONFS_DMABUF_ATTACH:
> > > > +	{
> > > > +		int fd;
> > > > +
> > > > +		if (copy_from_user(&fd, (void __user *)value,
> > > > sizeof(fd))) {
> > > > +			ret =3D -EFAULT;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		return ffs_dmabuf_attach(file, fd);
> > > > +	}
> > > > +	case FUNCTIONFS_DMABUF_DETACH:
> > > > +	{
> > > > +		int fd;
> > > > +
> > > > +		if (copy_from_user(&fd, (void __user *)value,
> > > > sizeof(fd))) {
> > > > +			ret =3D -EFAULT;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		return ffs_dmabuf_detach(file, fd);
> > > > +	}
> > > > +	case FUNCTIONFS_DMABUF_TRANSFER:
> > > > +	{
> > > > +		struct usb_ffs_dmabuf_transfer_req req;
> > > > +
> > > > +		if (copy_from_user(&req, (void __user *)value,
> > > > sizeof(req))) {
> > > > +			ret =3D -EFAULT;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		return ffs_dmabuf_transfer(file, &req);
> > > > +	}
> > > > +	default:
> > > > +		break;
> > > > +	}
> > > > +
> > > > =C2=A0	/* Wait for endpoint to be enabled */
> > > > =C2=A0	ep =3D ffs_epfile_wait_ep(file);
> > > > =C2=A0	if (IS_ERR(ep))
> > > > @@ -1869,6 +2285,7 @@ static int ffs_epfiles_create(struct
> > > > ffs_data
> > > > *ffs)
> > > > =C2=A0	for (i =3D 1; i <=3D count; ++i, ++epfile) {
> > > > =C2=A0		epfile->ffs =3D ffs;
> > > > =C2=A0		mutex_init(&epfile->mutex);
> > > > +		INIT_LIST_HEAD(&epfile->dmabufs);
> > > > =C2=A0		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
> > > > =C2=A0			sprintf(epfile->name, "ep%02x", ffs-
> > > > > eps_addrmap[i]);
> > > > =C2=A0		else
> > > > diff --git a/include/uapi/linux/usb/functionfs.h
> > > > b/include/uapi/linux/usb/functionfs.h
> > > > index 078098e73fd3..9f88de9c3d66 100644
> > > > --- a/include/uapi/linux/usb/functionfs.h
> > > > +++ b/include/uapi/linux/usb/functionfs.h
> > > > @@ -86,6 +86,22 @@ struct usb_ext_prop_desc {
> > > > =C2=A0	__le16	wPropertyNameLength;
> > > > =C2=A0} __attribute__((packed));
> > > > =C2=A0
> > > > +/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now)
> > > > */
> > > > +#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
> > > > +
> > > > +/**
> > > > + * struct usb_ffs_dmabuf_transfer_req - Transfer request for a
> > > > DMABUF object
> > > > + * @fd:		file descriptor of the DMABUF object
> > > > + * @flags:	one or more USB_FFS_DMABUF_TRANSFER_* flags
> > > > + * @length:	number of bytes used in this DMABUF for the
> > > > data
> > > > transfer.
> > > > + *		Should generally be set to the DMABUF's size.
> > > > + */
> > > > +struct usb_ffs_dmabuf_transfer_req {
> > > > +	int fd;
> > > > +	__u32 flags;
> > > > +	__u64 length;
> > > > +} __attribute__((packed));
> > > > +
> > > > =C2=A0#ifndef __KERNEL__
> > > > =C2=A0
> > > > =C2=A0/*
> > > > @@ -290,6 +306,31 @@ struct usb_functionfs_event {
> > > > =C2=A0#define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130,
> > > > \
> > > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > > usb_endpoint_descriptor)
> > > > =C2=A0
> > > > +/*
> > > > + * Attach the DMABUF object, identified by its file
> > > > descriptor, to
> > > > the
> > > > + * data endpoint. Returns zero on success, and a negative
> > > > errno
> > > > value
> > > > + * on error.
> > > > + */
> > > > +#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
> > > > +
> > > > =C2=A0
> > > > +/*
> > > > + * Detach the given DMABUF object, identified by its file
> > > > descriptor,
> > > > + * from the data endpoint. Returns zero on success, and a
> > > > negative
> > > > + * errno value on error. Note that closing the endpoint's file
> > > > + * descriptor will automatically detach all attached DMABUFs.
> > > > + */
> > > > +#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
> > > > +
> > > > +/*
> > > > + * Enqueue the previously attached DMABUF to the transfer
> > > > queue.
> > > > + * The argument is a structure that packs the DMABUF's file
> > > > descriptor,
> > > > + * the size in bytes to transfer (which should generally
> > > > correspond to
> > > > + * the size of the DMABUF), and a 'flags' field which is
> > > > unused
> > > > + * for now. Returns zero on success, and a negative errno
> > > > value on
> > > > + * error.
> > > > + */
> > > > +#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > > > usb_ffs_dmabuf_transfer_req)
> > > > =C2=A0
> > > > =C2=A0#endif /* _UAPI__LINUX_FUNCTIONFS_H__ */
> > >=20
> > > Only things I've found are (I think at least) bugs in the usb
> > > gadget
> > > logic, not directly in how dma-buf/fence is used. The only thing
> > > I've
> > > noticed is the lack of actual dma_fence seqno (which I think
> > > Christian
> > > already pointed out in an already review, looking at archives at
> > > least).
> > > With that addressed:
> > >=20
> > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >=20
> > > Cheers, Sima
> >=20
> > Thanks for the review!
>=20
> btw if you address all the locking/lifetime issues I guess you can
> upgrade
> to r-b: me on the next version.
>=20
> Cheers, Daniel

Great! Thanks!

It's a bit dangerous though, the chances that I get things wrong are
non-zero.

Cheers,
-Paul
