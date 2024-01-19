Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D97832B15
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC50010EA50;
	Fri, 19 Jan 2024 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D7F10EA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705673651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqYgKFlSXeXJ+ek05cChLqHNIcn71hJPj0SKGxZRr1E=;
 b=nihKf29QM3PAzCv1lf02nN0Lm7J1hFfqxSiJIykkJWXBNUWAts3p9naI7FhbAo3qS1vUZ+
 AQnGMwjj3hS2I+vprXp5cMewxBvtbj1QizrYkrsEZ5nETFXsE//UAy/FMDfPFQvI/KRz1x
 ZpJEeAwef/CDAgBRqgMIUAVTEo2wVuY=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 1/6] dma-buf: Add dma_buf_{begin,end}_access()
Date: Fri, 19 Jan 2024 15:13:57 +0100
Message-ID: <20240119141402.44262-2-paul@crapouillou.net>
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

These functions should be used by device drivers when they start and
stop accessing the data of DMABUF. It allows DMABUF importers to cache
the dma_buf_attachment while ensuring that the data they want to access
is available for their device when the DMA transfers take place.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
v5: New patch
---
 drivers/dma-buf/dma-buf.c | 66 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..a8bab6c18fcd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -830,6 +830,8 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  *     - dma_buf_mmap()
  *     - dma_buf_begin_cpu_access()
  *     - dma_buf_end_cpu_access()
+ *     - dma_buf_begin_access()
+ *     - dma_buf_end_access()
  *     - dma_buf_map_attachment_unlocked()
  *     - dma_buf_unmap_attachment_unlocked()
  *     - dma_buf_vmap_unlocked()
@@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
 
+/**
+ * @dma_buf_begin_access - Call before any hardware access from/to the DMABUF
+ * @attach:	[in]	attachment used for hardware access
+ * @sg_table:	[in]	scatterlist used for the DMA transfer
+ * @direction:  [in]    direction of DMA transfer
+ */
+int dma_buf_begin_access(struct dma_buf_attachment *attach,
+			 struct sg_table *sgt, enum dma_data_direction dir)
+{
+	struct dma_buf *dmabuf;
+	bool cookie;
+	int ret;
+
+	if (WARN_ON(!attach))
+		return -EINVAL;
+
+	dmabuf = attach->dmabuf;
+
+	if (!dmabuf->ops->begin_access)
+		return 0;
+
+	cookie = dma_fence_begin_signalling();
+	ret = dmabuf->ops->begin_access(attach, sgt, dir);
+	dma_fence_end_signalling(cookie);
+
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
+
+/**
+ * @dma_buf_end_access - Call after any hardware access from/to the DMABUF
+ * @attach:	[in]	attachment used for hardware access
+ * @sg_table:	[in]	scatterlist used for the DMA transfer
+ * @direction:  [in]    direction of DMA transfer
+ */
+int dma_buf_end_access(struct dma_buf_attachment *attach,
+		       struct sg_table *sgt, enum dma_data_direction dir)
+{
+	struct dma_buf *dmabuf;
+	bool cookie;
+	int ret;
+
+	if (WARN_ON(!attach))
+		return -EINVAL;
+
+	dmabuf = attach->dmabuf;
+
+	if (!dmabuf->ops->end_access)
+		return 0;
+
+	cookie = dma_fence_begin_signalling();
+	ret = dmabuf->ops->end_access(attach, sgt, dir);
+	dma_fence_end_signalling(cookie);
+
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8ff4add71f88..8ba612c7cc16 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -246,6 +246,38 @@ struct dma_buf_ops {
 	 */
 	int (*end_cpu_access)(struct dma_buf *, enum dma_data_direction);
 
+	/**
+	 * @begin_access:
+	 *
+	 * This is called from dma_buf_begin_access() when a device driver
+	 * wants to access the data of the DMABUF. The exporter can use this
+	 * to flush/sync the caches if needed.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
+	int (*begin_access)(struct dma_buf_attachment *, struct sg_table *,
+			    enum dma_data_direction);
+
+	/**
+	 * @end_access:
+	 *
+	 * This is called from dma_buf_end_access() when a device driver is
+	 * done accessing the data of the DMABUF. The exporter can use this
+	 * to flush/sync the caches if needed.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
+	int (*end_access)(struct dma_buf_attachment *, struct sg_table *,
+			  enum dma_data_direction);
+
 	/**
 	 * @mmap:
 	 *
@@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf *dmabuf,
 int dma_buf_pin(struct dma_buf_attachment *attach);
 void dma_buf_unpin(struct dma_buf_attachment *attach);
 
+int dma_buf_begin_access(struct dma_buf_attachment *attach,
+			 struct sg_table *sgt, enum dma_data_direction dir);
+int dma_buf_end_access(struct dma_buf_attachment *attach,
+		       struct sg_table *sgt, enum dma_data_direction dir);
+
 struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
 
 int dma_buf_fd(struct dma_buf *dmabuf, int flags);
-- 
2.43.0

