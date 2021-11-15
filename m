Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983B4506AE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AB66E40A;
	Mon, 15 Nov 2021 14:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800BA6E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:22:57 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 13/15] iio: core: Add support for cyclic buffers
Date: Mon, 15 Nov 2021 14:22:41 +0000
Message-Id: <20211115142243.60605-2-paul@crapouillou.net>
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

Introduce a new flag IIO_BUFFER_DMABUF_CYCLIC in the "flags" field of
the iio_dmabuf uapi structure.

When set, the DMABUF enqueued with the enqueue ioctl will be endlessly
repeated on the TX output, until the buffer is disabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/industrialio-buffer.c | 5 +++++
 include/uapi/linux/iio/buffer.h   | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 30910e6c2346..41bc51c88002 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1600,6 +1600,11 @@ static int iio_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
 	if (dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
 		return -EINVAL;
 
+	/* Cyclic flag is only supported on output buffers */
+	if ((dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC) &&
+	    buffer->direction != IIO_BUFFER_DIRECTION_OUT)
+		return -EINVAL;
+
 	return buffer->access->enqueue_dmabuf(buffer, &dmabuf);
 }
 
diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
index e4621b926262..2d541d038c02 100644
--- a/include/uapi/linux/iio/buffer.h
+++ b/include/uapi/linux/iio/buffer.h
@@ -7,7 +7,8 @@
 
 #include <linux/types.h>
 
-#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000000
+#define IIO_BUFFER_DMABUF_CYCLIC		(1 << 0)
+#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
 
 /**
  * struct iio_dmabuf_alloc_req - Descriptor for allocating IIO DMABUFs
-- 
2.33.0

