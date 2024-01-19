Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49663832B22
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC1710EA58;
	Fri, 19 Jan 2024 14:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA36F10EA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705673652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iIxPbs0dWlzjgcaYm0qZReABojDho1rbr0/l/s8ieo=;
 b=VDmw/5dmFB8a7DjV5sQY6708zGHT8cN9da4xSjKPmDqd5JoGUoAWZFLA4iBJzYVtLoeMc0
 534O4/q85cvb0JyL4RkqR4fcFW36IeUqTLCBrV3EPttmKkeaTxQBZIvVT+hfm/hQr1U2rC
 b1Gx/QWvHOF3f7bFVi1IGm2UPpG4KrU=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 2/6] dma-buf: udmabuf: Implement .{begin,end}_access
Date: Fri, 19 Jan 2024 15:13:58 +0100
Message-ID: <20240119141402.44262-3-paul@crapouillou.net>
In-Reply-To: <20240119141402.44262-1-paul@crapouillou.net>
References: <20240119141402.44262-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement .begin_access() and .end_access() callbacks.

For now these functions will simply sync/flush the CPU cache when
needed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
v5: New patch
---
 drivers/dma-buf/udmabuf.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c40645999648..a87d89b58816 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -179,6 +179,31 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 	return 0;
 }
 
+static int begin_udmabuf(struct dma_buf_attachment *attach,
+			 struct sg_table *sgt,
+			 enum dma_data_direction dir)
+{
+	struct dma_buf *buf = attach->dmabuf;
+	struct udmabuf *ubuf = buf->priv;
+	struct device *dev = ubuf->device->this_device;
+
+	dma_sync_sg_for_device(dev, sgt->sgl, sg_nents(sgt->sgl), dir);
+	return 0;
+}
+
+static int end_udmabuf(struct dma_buf_attachment *attach,
+		       struct sg_table *sgt,
+		       enum dma_data_direction dir)
+{
+	struct dma_buf *buf = attach->dmabuf;
+	struct udmabuf *ubuf = buf->priv;
+	struct device *dev = ubuf->device->this_device;
+
+	if (dir != DMA_TO_DEVICE)
+		dma_sync_sg_for_cpu(dev, sgt->sgl, sg_nents(sgt->sgl), dir);
+	return 0;
+}
+
 static const struct dma_buf_ops udmabuf_ops = {
 	.cache_sgt_mapping = true,
 	.map_dma_buf	   = map_udmabuf,
@@ -189,6 +214,8 @@ static const struct dma_buf_ops udmabuf_ops = {
 	.vunmap		   = vunmap_udmabuf,
 	.begin_cpu_access  = begin_cpu_udmabuf,
 	.end_cpu_access    = end_cpu_udmabuf,
+	.begin_access      = begin_udmabuf,
+	.end_access        = end_udmabuf,
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
-- 
2.43.0

