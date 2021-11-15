Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E982B450694
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027296EDED;
	Mon, 15 Nov 2021 14:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E556EDED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:20:19 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 07/15] iio: core: Add new DMABUF interface infrastructure
Date: Mon, 15 Nov 2021 14:19:17 +0000
Message-Id: <20211115141925.60164-8-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the necessary infrastructure to the IIO core to support a new DMABUF
based interface.

The advantage of this new DMABUF based interface vs. the read()
interface, is that it avoids an extra copy of the data between the
kernel and userspace. This is particularly userful for high-speed
devices which produce several megabytes or even gigabytes of data per
second.

The data in this new DMABUF interface is managed at the granularity of
DMABUF objects. Reducing the granularity from byte level to block level
is done to reduce the userspace-kernelspace synchronization overhead
since performing syscalls for each byte at a few Mbps is just not
feasible.

This of course leads to a slightly increased latency. For this reason an
application can choose the size of the DMABUFs as well as how many it
allocates. E.g. two DMABUFs would be a traditional double buffering
scheme. But using a higher number might be necessary to avoid
underflow/overflow situations in the presence of scheduling latencies.

As part of the interface, 2 new IOCTLs have been added:

IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *):
 Each call will allocate a new DMABUF object. The return value (if not
 a negative errno value as error) will be the file descriptor of the new
 DMABUF.

IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
 Place the DMABUF object into the queue pending for hardware process.

These two IOCTLs have to be performed on the IIO buffer's file
descriptor (either opened from the corresponding /dev/iio:deviceX, or
obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl).

To access the data stored in a block by userspace the block must be
mapped to the process's memory. This is done by calling mmap() on the
DMABUF's file descriptor.

Before accessing the data through the map, you must use the
DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
DMA_BUF_SYNC_START flag, to make sure that the data is available.
This call may block until the hardware is done with this block. Once
you are done reading or writing the data, you must use this ioctl again
with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
kernel's queue.

If you need to know when the hardware is done with a DMABUF, you can
poll its file descriptor for the EPOLLOUT event.

Finally, to destroy a DMABUF object, simply call close() on its file
descriptor.

A typical workflow for the new interface is:

  for block in blocks:
    DMABUF_ALLOC block
    mmap block

  enable buffer

  while !done
    for block in blocks:
      DMABUF_ENQUEUE block

      DMABUF_SYNC_START block
      process data
      DMABUF_SYNC_END block

  disable buffer

  for block in blocks:
    close block

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/industrialio-buffer.c | 44 +++++++++++++++++++++++++++++++
 include/linux/iio/buffer_impl.h   |  8 ++++++
 include/uapi/linux/iio/buffer.h   | 29 ++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index e180728914c0..30910e6c2346 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -17,6 +17,7 @@
 #include <linux/fs.h>
 #include <linux/cdev.h>
 #include <linux/slab.h>
+#include <linux/mm.h>
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
 
@@ -1585,12 +1586,55 @@ static long iio_device_buffer_getfd(struct iio_dev *indio_dev, unsigned long arg
 	return ret;
 }
 
+static int iio_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				     struct iio_dmabuf __user *user_buf)
+{
+	struct iio_dmabuf dmabuf;
+
+	if (!buffer->access->enqueue_dmabuf)
+		return -EPERM;
+
+	if (copy_from_user(&dmabuf, user_buf, sizeof(dmabuf)))
+		return -EFAULT;
+
+	if (dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
+		return -EINVAL;
+
+	return buffer->access->enqueue_dmabuf(buffer, &dmabuf);
+}
+
+static int iio_buffer_alloc_dmabuf(struct iio_buffer *buffer,
+				   struct iio_dmabuf_alloc_req __user *user_req)
+{
+	struct iio_dmabuf_alloc_req req;
+
+	if (!buffer->access->alloc_dmabuf)
+		return -EPERM;
+
+	if (copy_from_user(&req, user_req, sizeof(req)))
+		return -EFAULT;
+
+	if (req.resv)
+		return -EINVAL;
+
+	return buffer->access->alloc_dmabuf(buffer, &req);
+}
+
 static long iio_device_buffer_ioctl(struct iio_dev *indio_dev, struct file *filp,
 				    unsigned int cmd, unsigned long arg)
 {
+	struct iio_dev_buffer_pair *ib = filp->private_data;
+	struct iio_buffer *buffer = ib->buffer;
+	void __user *_arg = (void __user *)arg;
+
 	switch (cmd) {
 	case IIO_BUFFER_GET_FD_IOCTL:
 		return iio_device_buffer_getfd(indio_dev, arg);
+	case IIO_BUFFER_DMABUF_ALLOC_IOCTL:
+		return iio_buffer_alloc_dmabuf(buffer, _arg);
+	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
+		/* TODO: support non-blocking enqueue operation */
+		return iio_buffer_enqueue_dmabuf(buffer, _arg);
 	default:
 		return IIO_IOCTL_UNHANDLED;
 	}
diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
index e2ca8ea23e19..728541bc2c63 100644
--- a/include/linux/iio/buffer_impl.h
+++ b/include/linux/iio/buffer_impl.h
@@ -39,6 +39,9 @@ struct iio_buffer;
  *                      device stops sampling. Calles are balanced with @enable.
  * @release:		called when the last reference to the buffer is dropped,
  *			should free all resources allocated by the buffer.
+ * @alloc_dmabuf:	called from userspace via ioctl to allocate one DMABUF.
+ * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
+ *			object to this buffer. Requires a valid DMABUF fd.
  * @modes:		Supported operating modes by this buffer type
  * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
  *
@@ -68,6 +71,11 @@ struct iio_buffer_access_funcs {
 
 	void (*release)(struct iio_buffer *buffer);
 
+	int (*alloc_dmabuf)(struct iio_buffer *buffer,
+			    struct iio_dmabuf_alloc_req *req);
+	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
+			      struct iio_dmabuf *block);
+
 	unsigned int modes;
 	unsigned int flags;
 };
diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
index 13939032b3f6..e4621b926262 100644
--- a/include/uapi/linux/iio/buffer.h
+++ b/include/uapi/linux/iio/buffer.h
@@ -5,6 +5,35 @@
 #ifndef _UAPI_IIO_BUFFER_H_
 #define _UAPI_IIO_BUFFER_H_
 
+#include <linux/types.h>
+
+#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000000
+
+/**
+ * struct iio_dmabuf_alloc_req - Descriptor for allocating IIO DMABUFs
+ * @size:	the size of a single DMABUF
+ * @resv:	reserved
+ */
+struct iio_dmabuf_alloc_req {
+	__u64 size;
+	__u64 resv;
+};
+
+/**
+ * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
+ * @fd:		file descriptor of the DMABUF object
+ * @flags:	one or more IIO_BUFFER_DMABUF_* flags
+ * @bytes_used:	number of bytes used in this DMABUF for the data transfer.
+ *		If zero, the full buffer is used.
+ */
+struct iio_dmabuf {
+	__u32 fd;
+	__u32 flags;
+	__u64 bytes_used;
+};
+
 #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i', 0x91, int)
+#define IIO_BUFFER_DMABUF_ALLOC_IOCTL		_IOW('i', 0x92, struct iio_dmabuf_alloc_req)
+#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i', 0x93, struct iio_dmabuf)
 
 #endif /* _UAPI_IIO_BUFFER_H_ */
-- 
2.33.0

