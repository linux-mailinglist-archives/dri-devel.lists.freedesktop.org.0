Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAFE6D5A0B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 09:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7C710E5FB;
	Tue,  4 Apr 2023 07:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2435C10E5FB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680594911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t715Ygrn5fIl2cP6G38Htiwv5CykzjtvmcPHY4zyI2o=;
 b=1XNboJ0IFTYwdM/cv/LxhwVl7+jh/lpT0k0cTSwd3VsYA1CGC4AwFhn+dCofdp2Cj5qT0l
 xV+4RJZoIEMPqaMn4lz5nsQBXm/gnlWTIV7jfHpej+9mC7TqNZ3zsEgDM1Kn8OKnHY6R5E
 IYD9a8v/4f97OepuCMYNllEXaMD3xKk=
Message-ID: <2dac030470ffe74b6d21a1e6510afcefaf58cd6a.camel@crapouillou.net>
Subject: Re: [PATCH v3 07/11] iio: core: Add new DMABUF interface
 infrastructure
From: Paul Cercueil <paul@crapouillou.net>
To: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Tue, 04 Apr 2023 09:55:09 +0200
In-Reply-To: <798e1ff0651da8e4b113d30bf8cec2a7a0e6898f.camel@gmail.com>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-8-paul@crapouillou.net>
 <798e1ff0651da8e4b113d30bf8cec2a7a0e6898f.camel@gmail.com>
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
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nuno,

Le mardi 04 avril 2023 =C3=A0 09:32 +0200, Nuno S=C3=A1 a =C3=A9crit=C2=A0:
> On Mon, 2023-04-03 at 17:47 +0200, Paul Cercueil wrote:
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
> > between
> > the
> > kernel and userspace. This is particularly userful for high-speed
> > devices which produce several megabytes or even gigabytes of data
> > per
> > second.
> >=20
> > As part of the interface, 3 new IOCTLs have been added:
> >=20
> > IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
> > =C2=A0Attach the DMABUF object identified by the given file descriptor
> > to
> > the
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
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > ---
> > v2: Only allow the new IOCTLs on the buffer FD created with
> > =C2=A0=C2=A0=C2=A0 IIO_BUFFER_GET_FD_IOCTL().
> >=20
> > v3: - Get rid of the old IOCTLs. The IIO subsystem does not create
> > or
> > =C2=A0=C2=A0=C2=A0 manage DMABUFs anymore, and only attaches/detaches e=
xternally
> > =C2=A0=C2=A0=C2=A0 created DMABUFs.
> > =C2=A0=C2=A0=C2=A0 - Add IIO_BUFFER_DMABUF_CYCLIC to the supported flag=
s.
> > ---
> > =C2=A0drivers/iio/industrialio-buffer.c | 402
> > ++++++++++++++++++++++++++++++
> > =C2=A0include/linux/iio/buffer_impl.h=C2=A0=C2=A0 |=C2=A0 22 ++
> > =C2=A0include/uapi/linux/iio/buffer.h=C2=A0=C2=A0 |=C2=A0 22 ++
> > =C2=A03 files changed, 446 insertions(+)
> >=20
> > diff --git a/drivers/iio/industrialio-buffer.c
> > b/drivers/iio/industrialio-buffer.c
> > index 80c78bd6bbef..5d88e098b3e7 100644
> > --- a/drivers/iio/industrialio-buffer.c
> > +++ b/drivers/iio/industrialio-buffer.c
> > @@ -13,10 +13,14 @@
> > =C2=A0#include <linux/kernel.h>
> > =C2=A0#include <linux/export.h>
> > =C2=A0#include <linux/device.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-fence.h>
> > +#include <linux/dma-resv.h>
> > =C2=A0#include <linux/file.h>
> > =C2=A0#include <linux/fs.h>
> > =C2=A0#include <linux/cdev.h>
> > =C2=A0#include <linux/slab.h>
> > +#include <linux/mm.h>
> > =C2=A0#include <linux/poll.h>
> > =C2=A0#include <linux/sched/signal.h>
> > =C2=A0
> > @@ -28,11 +32,41 @@
> > =C2=A0#include <linux/iio/buffer.h>
> > =C2=A0#include <linux/iio/buffer_impl.h>
> > =C2=A0
> > +#define DMABUF_ENQUEUE_TIMEOUT_MS 5000
> > +
> > +struct iio_dma_fence;
> > +
> > +struct iio_dmabuf_priv {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head entry;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct kref ref;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_buffer *buffer;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dma_buffer_block =
*block;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 context;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spinlock_t lock;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_buf_attachment *a=
ttach;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dma_fence *fence;
> > +};
> > +
> > +struct iio_dma_fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_fence base;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dmabuf_priv *priv=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sg_table *sgt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum dma_data_direction dir;
> > +};
> > +
> > =C2=A0static const char * const iio_endian_prefix[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[IIO_BE] =3D "be",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[IIO_LE] =3D "le",
> > =C2=A0};
> > =C2=A0
> > +static inline struct iio_dma_fence *to_iio_dma_fence(struct
> > dma_fence *fence)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return container_of(fence, s=
truct iio_dma_fence, base);
> > +}
> > +
>=20
> Kind of a nitpick but I only see this being used once so I would
> maybe
> use plain 'container_of()' as you are already doing for:
>=20
> ... =3D container_of(ref, struct iio_dmabuf_priv, ref);
>=20
> So I would at least advocate for consistency. I would also probably
> ditch the inline but I guess that is more a matter of
> style/preference.

Yep, at least it should be consistent.

>=20
> > =C2=A0static bool iio_buffer_is_active(struct iio_buffer *buf)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return !list_empty(&buf=
->buffer_list);
> > @@ -329,6 +363,7 @@ void iio_buffer_init(struct iio_buffer *buffer)
> > =C2=A0{
> >=20
>=20
> ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv =3D attach->importer_pr=
iv;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_del_init(&priv->entry);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iio_buffer_dmabuf_put(attach=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iio_buffer_dmabuf_put(attach=
);
> > +
>=20
> Is this intended? Looks suspicious...

It is intended, yes. You want to release the dma_buf_attachment that's
created in iio_buffer_attach_dmabuf(), and you need to call
iio_buffer_find_attachment() to get a pointer to it, which also gets a
second reference - so it needs to unref twice.

>=20
> > +out_dmabuf_put:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_buf_put(dmabuf);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > +}
> > +
> > +static const char *
> > +iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return "iio";
> > +}
> > +
> > +static void iio_buffer_dma_fence_release(struct dma_fence *fence)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dma_fence *iio_fe=
nce =3D to_iio_dma_fence(fence);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(iio_fence);
> > +}
> > +
> > +static const struct dma_fence_ops iio_buffer_dma_fence_ops =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_driver_name=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D
> > iio_buffer_dma_fence_get_driver_name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_timeline_name=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D
> > iio_buffer_dma_fence_get_driver_name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.release=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=3D iio_buffer_dma_fence_release,
> > +};
> > +
> > +static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair
> > *ib,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct i=
io_dmabuf __user
> > *iio_dmabuf_req,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool non=
block)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_buffer *buffer =
=3D ib->buffer;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dmabuf iio_dmabuf=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_buf_attachment *a=
ttach;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dmabuf_priv *priv=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum dma_data_direction dir;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dma_fence *fence;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_buf *dmabuf;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sg_table *sgt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long timeout;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool dma_to_ram;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool cyclic;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (copy_from_user(&iio_dmab=
uf, iio_dmabuf_req,
> > sizeof(iio_dmabuf)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EFAULT;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (iio_dmabuf.flags & ~IIO_=
BUFFER_DMABUF_SUPPORTED_FLAGS)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cyclic =3D iio_dmabuf.flags =
& IIO_BUFFER_DMABUF_CYCLIC;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Cyclic flag is only suppo=
rted on output buffers */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (cyclic && buffer->direct=
ion !=3D
> > IIO_BUFFER_DIRECTION_OUT)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dmabuf =3D dma_buf_get(iio_d=
mabuf.fd);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(dmabuf))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(dmabuf);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!iio_dmabuf.bytes_used |=
| iio_dmabuf.bytes_used >
> > dmabuf-
> > > size) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D -EINVAL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_dmabuf_put;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0attach =3D iio_buffer_find_a=
ttachment(ib->indio_dev, dmabuf);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(attach)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D PTR_ERR(attach);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_dmabuf_put;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv =3D attach->importer_pr=
iv;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_to_ram =3D buffer->direc=
tion =3D=3D IIO_BUFFER_DIRECTION_IN;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dir =3D dma_to_ram ? DMA_FRO=
M_DEVICE : DMA_TO_DEVICE;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sgt =3D dma_buf_map_attachme=
nt(attach, dir);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(sgt)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D PTR_ERR(sgt);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pr_err("Unable to map attachment: %d\n", ret);
>=20
> dev_err()? We should be able to reach the iio_dev

Should work with (&ib->indio_dev->dev), yes.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_attachment_put;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fence =3D kmalloc(sizeof(*fe=
nce), GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!fence) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D -ENOMEM;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_unmap_attachment;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> >=20
>=20
> ...
>=20
> > =C2=A0static const struct file_operations iio_buffer_chrdev_fileops =3D=
 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.owner =3D THIS_MODULE,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.llseek =3D noop_llseek=
,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read =3D iio_buffer_re=
ad,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.write =3D iio_buffer_w=
rite,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.unlocked_ioctl =3D iio_buff=
er_chrdev_ioctl,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.compat_ioctl =3D compat_ptr=
_ioctl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.poll =3D iio_buffer_po=
ll,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.release =3D iio_buffer=
_chrdev_release,
> > =C2=A0};
>=20
> Hmmm, what about the legacy buffer? We should also support this
> interface using it, right? Otherwise, using one of the new IOCTL in
> iio_device_buffer_ioctl() (or /dev/iio:device0) will error out.

According to Jonathan the old chardev route is deprecated, and it's
fine not to support the IOCTL there.

Cheers,
-Paul
