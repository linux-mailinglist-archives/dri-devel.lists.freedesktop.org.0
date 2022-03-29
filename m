Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D064EAF05
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA1710E8E6;
	Tue, 29 Mar 2022 14:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1154 seconds by postgrey-1.36 at gabe;
 Tue, 29 Mar 2022 13:56:13 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4C10E8FF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 13:56:13 +0000 (UTC)
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KSVtJ61gGz67kMk;
 Tue, 29 Mar 2022 21:35:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Tue, 29 Mar 2022 15:36:56 +0200
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 14:36:55 +0100
Date: Tue, 29 Mar 2022 14:36:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 05/12] iio: core: Add new DMABUF interface
 infrastructure
Message-ID: <20220329143653.000057d4@Huawei.com>
In-Reply-To: <VDXG9R.5IH6K0N3FLTA3@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-6-paul@crapouillou.net>
 <20220328183701.02884cc3@jic23-huawei>
 <VDXG9R.5IH6K0N3FLTA3@crapouillou.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Mar 2022 14:05:25 +0000
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
 linaro-mm-sig@lists.linaro.org, Alexandru
 Ardelean <ardeleanalex@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 19:44:19 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
>=20
> Le lun., mars 28 2022 at 18:37:01 +0100, Jonathan Cameron=20
> <jic23@kernel.org> a =E9crit :
> > On Mon,  7 Feb 2022 12:59:26 +0000
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >  =20
> >>  Add the necessary infrastructure to the IIO core to support a new
> >>  optional DMABUF based interface.
> >>=20
> >>  The advantage of this new DMABUF based interface vs. the read()
> >>  interface, is that it avoids an extra copy of the data between the
> >>  kernel and userspace. This is particularly userful for high-speed =20
> >=20
> > useful
> >  =20
> >>  devices which produce several megabytes or even gigabytes of data=20
> >> per
> >>  second.
> >>=20
> >>  The data in this new DMABUF interface is managed at the granularity=20
> >> of
> >>  DMABUF objects. Reducing the granularity from byte level to block=20
> >> level
> >>  is done to reduce the userspace-kernelspace synchronization overhead
> >>  since performing syscalls for each byte at a few Mbps is just not
> >>  feasible.
> >>=20
> >>  This of course leads to a slightly increased latency. For this=20
> >> reason an
> >>  application can choose the size of the DMABUFs as well as how many=20
> >> it
> >>  allocates. E.g. two DMABUFs would be a traditional double buffering
> >>  scheme. But using a higher number might be necessary to avoid
> >>  underflow/overflow situations in the presence of scheduling=20
> >> latencies.
> >>=20
> >>  As part of the interface, 2 new IOCTLs have been added:
> >>=20
> >>  IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *):
> >>   Each call will allocate a new DMABUF object. The return value (if=20
> >> not
> >>   a negative errno value as error) will be the file descriptor of=20
> >> the new
> >>   DMABUF.
> >>=20
> >>  IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
> >>   Place the DMABUF object into the queue pending for hardware=20
> >> process.
> >>=20
> >>  These two IOCTLs have to be performed on the IIO buffer's file
> >>  descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl. =20
> >=20
> > Just to check, do they work on the old deprecated chardev route?=20
> > Normally
> > we can directly access the first buffer without the ioctl. =20
>=20
> They do not. I think it's fine this way, since as you said, the old=20
> chardev route is deprecated. But I can add support for it with enough=20
> peer pressure.
Agreed. Definitely fine to not support the 'old way'.

J
>=20
> >>=20
> >>  To access the data stored in a block by userspace the block must be
> >>  mapped to the process's memory. This is done by calling mmap() on=20
> >> the
> >>  DMABUF's file descriptor.
> >>=20
> >>  Before accessing the data through the map, you must use the
> >>  DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
> >>  DMA_BUF_SYNC_START flag, to make sure that the data is available.
> >>  This call may block until the hardware is done with this block. Once
> >>  you are done reading or writing the data, you must use this ioctl=20
> >> again
> >>  with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
> >>  kernel's queue.
> >>=20
> >>  If you need to know when the hardware is done with a DMABUF, you can
> >>  poll its file descriptor for the EPOLLOUT event.
> >>=20
> >>  Finally, to destroy a DMABUF object, simply call close() on its file
> >>  descriptor.
> >>=20
> >>  A typical workflow for the new interface is:
> >>=20
> >>    for block in blocks:
> >>      DMABUF_ALLOC block
> >>      mmap block
> >>=20
> >>    enable buffer
> >>=20
> >>    while !done
> >>      for block in blocks:
> >>        DMABUF_ENQUEUE block
> >>=20
> >>        DMABUF_SYNC_START block
> >>        process data
> >>        DMABUF_SYNC_END block
> >>=20
> >>    disable buffer
> >>=20
> >>    for block in blocks:
> >>      close block =20
> >=20
> > Given my very limited knowledge of dma-buf, I'll leave commenting
> > on the flow to others who know if this looks 'standards' or not ;)
> >=20
> > Code looks sane to me.. =20
>=20
> Thanks.
>=20
> Cheers,
> -Paul
>=20
> >>=20
> >>  v2: Only allow the new IOCTLs on the buffer FD created with
> >>      IIO_BUFFER_GET_FD_IOCTL().
> >>=20
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>   drivers/iio/industrialio-buffer.c | 55=20
> >> +++++++++++++++++++++++++++++++
> >>   include/linux/iio/buffer_impl.h   |  8 +++++
> >>   include/uapi/linux/iio/buffer.h   | 29 ++++++++++++++++
> >>   3 files changed, 92 insertions(+)
> >>=20
> >>  diff --git a/drivers/iio/industrialio-buffer.c=20
> >> b/drivers/iio/industrialio-buffer.c
> >>  index 94eb9f6cf128..72f333a519bc 100644
> >>  --- a/drivers/iio/industrialio-buffer.c
> >>  +++ b/drivers/iio/industrialio-buffer.c
> >>  @@ -17,6 +17,7 @@
> >>   #include <linux/fs.h>
> >>   #include <linux/cdev.h>
> >>   #include <linux/slab.h>
> >>  +#include <linux/mm.h>
> >>   #include <linux/poll.h>
> >>   #include <linux/sched/signal.h>
> >>=20
> >>  @@ -1520,11 +1521,65 @@ static int iio_buffer_chrdev_release(struct=20
> >> inode *inode, struct file *filep)
> >>   	return 0;
> >>   }
> >>=20
> >>  +static int iio_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
> >>  +				     struct iio_dmabuf __user *user_buf)
> >>  +{
> >>  +	struct iio_dmabuf dmabuf;
> >>  +
> >>  +	if (!buffer->access->enqueue_dmabuf)
> >>  +		return -EPERM;
> >>  +
> >>  +	if (copy_from_user(&dmabuf, user_buf, sizeof(dmabuf)))
> >>  +		return -EFAULT;
> >>  +
> >>  +	if (dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
> >>  +		return -EINVAL;
> >>  +
> >>  +	return buffer->access->enqueue_dmabuf(buffer, &dmabuf);
> >>  +}
> >>  +
> >>  +static int iio_buffer_alloc_dmabuf(struct iio_buffer *buffer,
> >>  +				   struct iio_dmabuf_alloc_req __user *user_req)
> >>  +{
> >>  +	struct iio_dmabuf_alloc_req req;
> >>  +
> >>  +	if (!buffer->access->alloc_dmabuf)
> >>  +		return -EPERM;
> >>  +
> >>  +	if (copy_from_user(&req, user_req, sizeof(req)))
> >>  +		return -EFAULT;
> >>  +
> >>  +	if (req.resv)
> >>  +		return -EINVAL;
> >>  +
> >>  +	return buffer->access->alloc_dmabuf(buffer, &req);
> >>  +}
> >>  +
> >>  +static long iio_buffer_chrdev_ioctl(struct file *filp,
> >>  +				    unsigned int cmd, unsigned long arg)
> >>  +{
> >>  +	struct iio_dev_buffer_pair *ib =3D filp->private_data;
> >>  +	struct iio_buffer *buffer =3D ib->buffer;
> >>  +	void __user *_arg =3D (void __user *)arg;
> >>  +
> >>  +	switch (cmd) {
> >>  +	case IIO_BUFFER_DMABUF_ALLOC_IOCTL:
> >>  +		return iio_buffer_alloc_dmabuf(buffer, _arg);
> >>  +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> >>  +		/* TODO: support non-blocking enqueue operation */
> >>  +		return iio_buffer_enqueue_dmabuf(buffer, _arg);
> >>  +	default:
> >>  +		return IIO_IOCTL_UNHANDLED;
> >>  +	}
> >>  +}
> >>  +
> >>   static const struct file_operations iio_buffer_chrdev_fileops =3D {
> >>   	.owner =3D THIS_MODULE,
> >>   	.llseek =3D noop_llseek,
> >>   	.read =3D iio_buffer_read,
> >>   	.write =3D iio_buffer_write,
> >>  +	.unlocked_ioctl =3D iio_buffer_chrdev_ioctl,
> >>  +	.compat_ioctl =3D compat_ptr_ioctl,
> >>   	.poll =3D iio_buffer_poll,
> >>   	.release =3D iio_buffer_chrdev_release,
> >>   };
> >>  diff --git a/include/linux/iio/buffer_impl.h=20
> >> b/include/linux/iio/buffer_impl.h
> >>  index e2ca8ea23e19..728541bc2c63 100644
> >>  --- a/include/linux/iio/buffer_impl.h
> >>  +++ b/include/linux/iio/buffer_impl.h
> >>  @@ -39,6 +39,9 @@ struct iio_buffer;
> >>    *                      device stops sampling. Calles are balanced=20
> >> with @enable.
> >>    * @release:		called when the last reference to the buffer is=20
> >> dropped,
> >>    *			should free all resources allocated by the buffer.
> >>  + * @alloc_dmabuf:	called from userspace via ioctl to allocate one=20
> >> DMABUF.
> >>  + * @enqueue_dmabuf:	called from userspace via ioctl to queue this=20
> >> DMABUF
> >>  + *			object to this buffer. Requires a valid DMABUF fd.
> >>    * @modes:		Supported operating modes by this buffer type
> >>    * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
> >>    *
> >>  @@ -68,6 +71,11 @@ struct iio_buffer_access_funcs {
> >>=20
> >>   	void (*release)(struct iio_buffer *buffer);
> >>=20
> >>  +	int (*alloc_dmabuf)(struct iio_buffer *buffer,
> >>  +			    struct iio_dmabuf_alloc_req *req);
> >>  +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> >>  +			      struct iio_dmabuf *block);
> >>  +
> >>   	unsigned int modes;
> >>   	unsigned int flags;
> >>   };
> >>  diff --git a/include/uapi/linux/iio/buffer.h=20
> >> b/include/uapi/linux/iio/buffer.h
> >>  index 13939032b3f6..e4621b926262 100644
> >>  --- a/include/uapi/linux/iio/buffer.h
> >>  +++ b/include/uapi/linux/iio/buffer.h
> >>  @@ -5,6 +5,35 @@
> >>   #ifndef _UAPI_IIO_BUFFER_H_
> >>   #define _UAPI_IIO_BUFFER_H_
> >>=20
> >>  +#include <linux/types.h>
> >>  +
> >>  +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000000
> >>  +
> >>  +/**
> >>  + * struct iio_dmabuf_alloc_req - Descriptor for allocating IIO=20
> >> DMABUFs
> >>  + * @size:	the size of a single DMABUF
> >>  + * @resv:	reserved
> >>  + */
> >>  +struct iio_dmabuf_alloc_req {
> >>  +	__u64 size;
> >>  +	__u64 resv;
> >>  +};
> >>  +
> >>  +/**
> >>  + * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
> >>  + * @fd:		file descriptor of the DMABUF object
> >>  + * @flags:	one or more IIO_BUFFER_DMABUF_* flags
> >>  + * @bytes_used:	number of bytes used in this DMABUF for the data=20
> >> transfer.
> >>  + *		If zero, the full buffer is used.
> >>  + */
> >>  +struct iio_dmabuf {
> >>  +	__u32 fd;
> >>  +	__u32 flags;
> >>  +	__u64 bytes_used;
> >>  +};
> >>  +
> >>   #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i', 0x91, int)
> >>  +#define IIO_BUFFER_DMABUF_ALLOC_IOCTL		_IOW('i', 0x92, struct=20
> >> iio_dmabuf_alloc_req)
> >>  +#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i', 0x93, struct=20
> >> iio_dmabuf)
> >>=20
> >>   #endif /* _UAPI_IIO_BUFFER_H_ */ =20
> >  =20
>=20
>=20

