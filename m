Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599F4506B0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066AF6E8CA;
	Mon, 15 Nov 2021 14:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4326E8CA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:23:09 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 15/15] Documentation: iio: Document high-speed DMABUF based API
Date: Mon, 15 Nov 2021 14:22:43 +0000
Message-Id: <20211115142243.60605-4-paul@crapouillou.net>
In-Reply-To: <20211115142243.60605-1-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115142243.60605-1-paul@crapouillou.net>
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

Document the new DMABUF based API.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/driver-api/dma-buf.rst |  2 +
 Documentation/iio/dmabuf_api.rst     | 94 ++++++++++++++++++++++++++++
 Documentation/iio/index.rst          |  2 +
 3 files changed, 98 insertions(+)
 create mode 100644 Documentation/iio/dmabuf_api.rst

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 2cd7db82d9fe..d3c9b58d2706 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -1,3 +1,5 @@
+.. _dma-buf:
+
 Buffer Sharing and Synchronization
 ==================================
 
diff --git a/Documentation/iio/dmabuf_api.rst b/Documentation/iio/dmabuf_api.rst
new file mode 100644
index 000000000000..b4e120a4ef0c
--- /dev/null
+++ b/Documentation/iio/dmabuf_api.rst
@@ -0,0 +1,94 @@
+===================================
+High-speed DMABUF interface for IIO
+===================================
+
+1. Overview
+===========
+
+The Industrial I/O subsystem supports access to buffers through a file-based
+interface, with read() and write() access calls through the IIO device's dev
+node.
+
+It additionally supports a DMABUF based interface, where the userspace
+application can allocate and append DMABUF objects to the buffer's queue.
+
+The advantage of this DMABUF based interface vs. the fileio
+interface, is that it avoids an extra copy of the data between the
+kernel and userspace. This is particularly userful for high-speed
+devices which produce several megabytes or even gigabytes of data per
+second.
+
+The data in this DMABUF interface is managed at the granularity of
+DMABUF objects. Reducing the granularity from byte level to block level
+is done to reduce the userspace-kernelspace synchronization overhead
+since performing syscalls for each byte at a few Mbps is just not
+feasible.
+
+This of course leads to a slightly increased latency. For this reason an
+application can choose the size of the DMABUFs as well as how many it
+allocates. E.g. two DMABUFs would be a traditional double buffering
+scheme. But using a higher number might be necessary to avoid
+underflow/overflow situations in the presence of scheduling latencies.
+
+2. User API
+===========
+
+``IIO_BUFFER_DMABUF_ALLOC_IOCTL(struct iio_dmabuf_alloc_req *)``
+----------------------------------------------------------------
+
+Each call will allocate a new DMABUF object. The return value (if not
+a negative errno value as error) will be the file descriptor of the new
+DMABUF.
+
+``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *)``
+--------------------------------------------------------
+
+Place the DMABUF object into the queue pending for hardware process.
+
+These two IOCTLs have to be performed on the IIO buffer's file
+descriptor (either opened from the corresponding /dev/iio:deviceX, or
+obtained using the `IIO_BUFFER_GET_FD_IOCTL` ioctl).
+
+3. Usage
+========
+
+To access the data stored in a block by userspace the block must be
+mapped to the process's memory. This is done by calling mmap() on the
+DMABUF's file descriptor.
+
+Before accessing the data through the map, you must use the
+DMA_BUF_IOCTL_SYNC(struct dma_buf_sync *) ioctl, with the
+DMA_BUF_SYNC_START flag, to make sure that the data is available.
+This call may block until the hardware is done with this block. Once
+you are done reading or writing the data, you must use this ioctl again
+with the DMA_BUF_SYNC_END flag, before enqueueing the DMABUF to the
+kernel's queue.
+
+If you need to know when the hardware is done with a DMABUF, you can
+poll its file descriptor for the EPOLLOUT event.
+
+Finally, to destroy a DMABUF object, simply call close() on its file
+descriptor.
+
+For more information about manipulating DMABUF objects, see: :ref:`dma-buf`.
+
+A typical workflow for the new interface is:
+
+    for block in blocks:
+      DMABUF_ALLOC block
+      mmap block
+
+    enable buffer
+
+    while !done
+      for block in blocks:
+        DMABUF_ENQUEUE block
+
+        DMABUF_SYNC_START block
+        process data
+        DMABUF_SYNC_END block
+
+    disable buffer
+
+    for block in blocks:
+      close block
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index 58b7a4ebac51..9ce799fbf262 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -10,3 +10,5 @@ Industrial I/O
    iio_configfs
 
    ep93xx_adc
+
+   dmabuf_api
-- 
2.33.0

