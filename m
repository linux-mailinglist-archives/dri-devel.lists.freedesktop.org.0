Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ADC4B30E9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9A10EBB2;
	Fri, 11 Feb 2022 22:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4697110EAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:18:59 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 z15-20020a25bb0f000000b00613388c7d99so19801312ybg.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=sjycs3J1raw78h/CcVrcAvxXNJMm38YGwWJkg+hcSJk=;
 b=HCicQU9wOvrep9Zko1Sp6f1kcNJH7vA3zXU3TjVhgtj7ecoJwQbiD5zNwlfXKnd3Uk
 fKTPKQahF2g4Y6Yl7OC7kdWe7Xj8Eip01fQ6bgZwKtUVfM3OdrQeD+P6IfjP4J6lHMxA
 3Wd8KCv9vSHVzLrGft5zgckgtzVcnmXlHGqDJHcNNED707tgW9lJ0MnWqLKY0kp2dvQ/
 UUurtSGmuV/6T387NDPTkYw+EQTiIjeuuZAohK9DBXj7o64/5JeY3gPt76JuMQ8y3+Fu
 NHs0H9pPGSnyHfRViau6furuWINKT4TIcOBlhZR4UuboJcrJaNNaihVZN+Vu6nhzK9qs
 mgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=sjycs3J1raw78h/CcVrcAvxXNJMm38YGwWJkg+hcSJk=;
 b=37TmBY5KjvUS2MdoZhET/SbbQk00+EevmVbUbveWYFvezKJNhiQWPbwev7ZTejt3Ek
 zIpr9sWFf81BMLX4aCBPRXfiSto09VzLUOogT3fm5PSYywqXkL6sU9p/sgXbs0TEIdeB
 JmSB7uoAtZIWBGD5cpTWq/S08HS/ObOoTm+sH4jpvdV3ugexUp2SQr4yFU/1iG86c4jl
 k1djmXwe+/m0kaLvyoybZv/wSEt70UGfOzgq5jXZZvh2zYYda7gdZUnwoexLhRPMg5VU
 9PzQJ2GjebH9SnDtFmXrNz+OAIc6Z3xuHjJL8KzmwpCgs4f2nzP4/nDZxcEDpNmdMKWe
 9gWQ==
X-Gm-Message-State: AOAM531KiswQt6kzsiUM27wDRd+v+hUcvdZm87rJWQeFeIEMZH15/wHS
 k5ANr5j7XoIARfai4rcDNiPKwu5d2ha8ltM=
X-Google-Smtp-Source: ABdhPJyO8mB9+1hjpEI4c2iys3oGoAzHpKFN+ZZyeFAfnRemdzA9D7jOCwPVue2W9QmLyraSfSF4AB2bqc0vndI=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a81:ae0c:: with SMTP id
 m12mr2454548ywh.19.1644596338464; Fri, 11 Feb 2022 08:18:58 -0800 (PST)
Date: Fri, 11 Feb 2022 16:18:26 +0000
In-Reply-To: <20220211161831.3493782-1-tjmercier@google.com>
Message-Id: <20220211161831.3493782-4-tjmercier@google.com>
Mime-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [RFC v2 3/6] dmabuf: Use the GPU cgroup charge/uncharge APIs
From: "T.J. Mercier" <tjmercier@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 11 Feb 2022 22:40:02 +0000
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kaleshsingh@google.com, cgroups@vger.kernel.org,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch uses the GPU cgroup charge/uncharge APIs to charge buffers
allocated by any DMA-BUF exporter that exports a buffer with a GPU cgroup
device association.

By doing so, it becomes possible to track who allocated/exported a
DMA-BUF even after the allocating process drops all references to a
buffer.

From: Hridya Valsaraju <hridya@google.com>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
Co-developed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
changes in v2
- Move dma-buf cgroup charging/uncharging from a dma_buf_op defined by ever=
y
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig.

 drivers/dma-buf/dma-buf.c | 52 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 20 +++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 602b12d7470d..83d0d1b91547 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -56,6 +56,50 @@ static char *dmabuffs_dname(struct dentry *dentry, char =
*buffer, int buflen)
 			     dentry->d_name.name, ret > 0 ? name : "");
 }
=20
+#ifdef CONFIG_CGROUP_GPU
+static inline struct gpucg_device *
+exp_info_gpucg_dev(const struct dma_buf_export_info *exp_info)
+{
+	return exp_info->gpucg_dev;
+}
+
+static bool dmabuf_try_charge(struct dma_buf *dmabuf,
+			      struct gpucg_device *gpucg_dev)
+{
+	dmabuf->gpucg =3D gpucg_get(current);
+	dmabuf->gpucg_dev =3D gpucg_dev;
+	if (gpucg_try_charge(dmabuf->gpucg, dmabuf->gpucg_dev, dmabuf->size)) {
+		gpucg_put(dmabuf->gpucg);
+		dmabuf->gpucg =3D NULL;
+		dmabuf->gpucg_dev =3D NULL;
+		return false;
+	}
+	return true;
+}
+
+static void dmabuf_uncharge(struct dma_buf *dmabuf)
+{
+	if (dmabuf->gpucg && dmabuf->gpucg_dev) {
+		gpucg_uncharge(dmabuf->gpucg, dmabuf->gpucg_dev, dmabuf->size);
+		gpucg_put(dmabuf->gpucg);
+	}
+}
+#else /* CONFIG_CGROUP_GPU */
+static inline struct gpucg_device *exp_info_gpucg_dev(
+const struct dma_buf_export_info *exp_info)
+{
+	return NULL;
+}
+
+static inline bool dmabuf_try_charge(struct dma_buf *dmabuf,
+				     struct gpucg_device *gpucg_dev))
+{
+	return false;
+}
+
+static inline void dmabuf_uncharge(struct dma_buf *dmabuf) {}
+#endif /* CONFIG_CGROUP_GPU */
+
 static void dma_buf_release(struct dentry *dentry)
 {
 	struct dma_buf *dmabuf;
@@ -79,6 +123,8 @@ static void dma_buf_release(struct dentry *dentry)
 	if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
=20
+	dmabuf_uncharge(dmabuf);
+
 	WARN_ON(!list_empty(&dmabuf->attachments));
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
@@ -484,6 +530,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 {
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv =3D exp_info->resv;
+	struct gpucg_device *gpucg_dev =3D exp_info_gpucg_dev(exp_info);
 	struct file *file;
 	size_t alloc_size =3D sizeof(struct dma_buf);
 	int ret;
@@ -534,6 +581,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 	}
 	dmabuf->resv =3D resv;
=20
+	if (gpucg_dev && !dmabuf_try_charge(dmabuf, gpucg_dev))
+		goto err_charge;
+
 	file =3D dma_buf_getfile(dmabuf, exp_info->flags);
 	if (IS_ERR(file)) {
 		ret =3D PTR_ERR(file);
@@ -565,6 +615,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 	file->f_path.dentry->d_fsdata =3D NULL;
 	fput(file);
 err_dmabuf:
+	dmabuf_uncharge(dmabuf);
+err_charge:
 	kfree(dmabuf);
 err_module:
 	module_put(exp_info->owner);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7ab50076e7a6..742f29c3daaf 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -13,6 +13,7 @@
 #ifndef __DMA_BUF_H__
 #define __DMA_BUF_H__
=20
+#include <linux/cgroup_gpu.h>
 #include <linux/dma-buf-map.h>
 #include <linux/file.h>
 #include <linux/err.h>
@@ -303,7 +304,7 @@ struct dma_buf {
 	/**
 	 * @size:
 	 *
-	 * Size of the buffer; invariant over the lifetime of the buffer.
+	 * Size of the buffer in bytes; invariant over the lifetime of the buffer=
.
 	 */
 	size_t size;
=20
@@ -453,6 +454,17 @@ struct dma_buf {
 		struct dma_buf *dmabuf;
 	} *sysfs_entry;
 #endif
+
+#ifdef CONFIG_CGROUP_GPU
+	/** @gpucg: Pointer to the cgroup this buffer currently belongs to. */
+	struct gpucg *gpucg;
+
+	/** @gpucg_dev:
+	 *
+	 * Pointer to the cgroup GPU device whence this buffer originates.
+	 */
+	struct gpucg_device *gpucg_dev;
+#endif
 };
=20
 /**
@@ -529,9 +541,10 @@ struct dma_buf_attachment {
  * @exp_name:	name of the exporter - useful for debugging.
  * @owner:	pointer to exporter module - used for refcounting kernel module
  * @ops:	Attach allocator-defined dma buf ops to the new buffer
- * @size:	Size of the buffer - invariant over the lifetime of the buffer
+ * @size:	Size of the buffer in bytes - invariant over the lifetime of the=
 buffer
  * @flags:	mode flags for the file
  * @resv:	reservation-object, NULL to allocate default one
+ * @gpucg_dev:	pointer to the gpu cgroup device this buffer belongs to
  * @priv:	Attach private data of allocator to this buffer
  *
  * This structure holds the information required to export the buffer. Use=
d
@@ -544,6 +557,9 @@ struct dma_buf_export_info {
 	size_t size;
 	int flags;
 	struct dma_resv *resv;
+#ifdef CONFIG_CGROUP_GPU
+	struct gpucg_device *gpucg_dev;
+#endif
 	void *priv;
 };
=20
--=20
2.35.1.265.g69c8d7142f-goog

