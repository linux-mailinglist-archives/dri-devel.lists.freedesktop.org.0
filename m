Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD45093EF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04F010ED91;
	Wed, 20 Apr 2022 23:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB74410ED91
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 23:52:44 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2dc7bdd666fso29288217b3.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=5E9Rbs7lnkN3+W98JnkIUAPTQ49TUyPznJB6J7YNkeo=;
 b=SWzxIRgdRQUtqcnezZ1qAW7U1kX7+57LPNNbfRy88rcYumm4IA2OJuYgyyg7UDgn4q
 MCDVqH2XccdjAMgVUESHKUP693m4h0vVR930REBPdZ6wch5vagUCuVlCO3pq1G/WttSm
 AKvzWT9Nlv5PQyonszFAMeFGYDERNSYU+Ih9zKKj6eBos5pKLMLliVS1pcZcxSRG7Zrn
 Oqa7NQcw9kxxBDKs5sWyq9NwhYkTbsb6IZoi2/ioWxpbEzVBB21ZKhOvAmxpG8APKTEc
 XJCoqM2RQuc7J0nxY6KCv4Zd+OgEpsgHqAse8y3xvopI5/qJepc4wtE8OIQeY+rpy9yg
 tZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=5E9Rbs7lnkN3+W98JnkIUAPTQ49TUyPznJB6J7YNkeo=;
 b=Yy00J5DQ24ZPb/XqfFW2NZU7F/rOUSjcbblInqkqxtfkCDNTeuFZ6Zuo4tDVMiO4KG
 NEHHxmyXT2S+BveYjw68/DDo0BriVG4tr/DUbXoDQQt/7soq1l8uCMU6USGwJANdr6kp
 GLXLLUJdq6bqC8hGMMDPYzO/FUDv+qpCZ8DQiuvYaxl337uXUFQWddsCQKZE1U8A9//v
 FIjrIrFqESJJszOELZ/OmC240PMi5uuels7dXg95xKB4ccTHwSVN9WyugaE0nn9S8Uda
 5lTjxJ+gOScTLqxKMCA1UB6vlQ2cEJpBJXyxijHy1qGB/RBBJ0Bu6YK3A5ZthGIOsVPW
 Qe3w==
X-Gm-Message-State: AOAM532r/ADoUmNbR2aK5sRF/l8Ev5WCiTa3EKpCnjg03IukUvbWTHMi
 uzQi8qokBraLbkd6K1Bi8mQrAwCGkmQ7JzE=
X-Google-Smtp-Source: ABdhPJw5EwHTC7Q1N41+mc2GzL5YAYNhrKpjL8DBLEBrLVaVg9GO5bS/iutUfeBK1JN69nQVWaRhMs4VIs/z4os=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a25:7795:0:b0:645:682a:d56e with SMTP id
 s143-20020a257795000000b00645682ad56emr3285177ybc.403.1650498763943; Wed, 20
 Apr 2022 16:52:43 -0700 (PDT)
Date: Wed, 20 Apr 2022 23:52:21 +0000
In-Reply-To: <20220420235228.2767816-1-tjmercier@google.com>
Message-Id: <20220420235228.2767816-4-tjmercier@google.com>
Mime-Version: 1.0
References: <20220420235228.2767816-1-tjmercier@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [RFC v5 3/6] dmabuf: heaps: export system_heap buffers with GPU
 cgroup charging
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, daniel@ffwll.ch, tj@kernel.org, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kernel-team@android.com, tkjos@android.com, Kenny.Ho@amd.com,
 skhan@linuxfoundation.org, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, jstultz@google.com, kaleshsingh@google.com,
 hridya@google.com, mkoutny@suse.com, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All DMA heaps now register a new GPU cgroup bucket upon creation, and the
system_heap now exports buffers associated with its GPU cgroup bucket for
tracking purposes.

In order to support GPU cgroup charge transfer on a dma-buf, the current
GPU cgroup information must be stored inside the dma-buf struct. For
tracked buffers, exporters include the struct gpucg and struct
gpucg_bucket pointers in the export info which can later be modified if
the charge is migrated to another cgroup.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>

---
v5 changes
Merge dmabuf: Use the GPU cgroup charge/uncharge APIs into this patch.

Remove all GPU cgroup code from dma-buf except what's necessary to support
charge transfer. Previously charging was done in export, but for
non-Android graphics use-cases this is not ideal since there may be a
dealy between allocation and export, during which time there is no
accounting.

Append "-heap" to gpucg_bucket names.

Charge on allocation instead of export. This should more closely mirror
non-Android use-cases where there is potentially a delay between allocation
and export.

Put the charge and uncharge code in the same file (system_heap_allocate,
system_heap_dma_buf_release) instead of splitting them between the heap and
the dma_buf_release.

Move no-op code to header file to match other files in the series.

v3 changes
Use more common dual author commit message format per John Stultz.

v2 changes
Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig.
---
 drivers/dma-buf/dma-buf.c           | 19 +++++++++++++
 drivers/dma-buf/dma-heap.c          | 39 +++++++++++++++++++++++++++
 drivers/dma-buf/heaps/system_heap.c | 28 +++++++++++++++++---
 include/linux/dma-buf.h             | 41 +++++++++++++++++++++++------
 include/linux/dma-heap.h            | 15 +++++++++++
 5 files changed, 130 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index df23239b04fc..bc89c44bd9b9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -462,6 +462,24 @@ static struct file *dma_buf_getfile(struct dma_buf *dm=
abuf, int flags)
  * &dma_buf_ops.
  */
=20
+#ifdef CONFIG_CGROUP_GPU
+static void dma_buf_set_gpucg(struct dma_buf *dmabuf, const struct dma_buf=
_export_info *exp)
+{
+	dmabuf->gpucg =3D exp->gpucg;
+	dmabuf->gpucg_bucket =3D exp->gpucg_bucket;
+}
+
+void dma_buf_exp_info_set_gpucg(struct dma_buf_export_info *exp_info,
+				struct gpucg *gpucg,
+				struct gpucg_bucket *gpucg_bucket)
+{
+	exp_info->gpucg =3D gpucg;
+	exp_info->gpucg_bucket =3D gpucg_bucket;
+}
+#else
+static void dma_buf_set_gpucg(struct dma_buf *dmabuf, struct dma_buf_expor=
t_info *exp) {}
+#endif
+
 /**
  * dma_buf_export - Creates a new dma_buf, and associates an anon file
  * with this buffer, so it can be exported.
@@ -527,6 +545,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 	init_waitqueue_head(&dmabuf->poll);
 	dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
 	dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
+	dma_buf_set_gpucg(dmabuf, exp_info);
=20
 	if (!resv) {
 		resv =3D (struct dma_resv *)&dmabuf[1];
diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8f5848aa144f..b81015548314 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,10 +7,12 @@
  */
=20
 #include <linux/cdev.h>
+#include <linux/cgroup_gpu.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/err.h>
+#include <linux/kconfig.h>
 #include <linux/xarray.h>
 #include <linux/list.h>
 #include <linux/slab.h>
@@ -21,6 +23,7 @@
 #include <uapi/linux/dma-heap.h>
=20
 #define DEVNAME "dma_heap"
+#define HEAP_NAME_SUFFIX "-heap"
=20
 #define NUM_HEAP_MINORS 128
=20
@@ -31,6 +34,7 @@
  * @heap_devt		heap device node
  * @list		list head connecting to list of heaps
  * @heap_cdev		heap char device
+ * @gpucg_bucket	gpu cgroup bucket for memory accounting
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -41,6 +45,9 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+#ifdef CONFIG_CGROUP_GPU
+	struct gpucg_bucket gpucg_bucket;
+#endif
 };
=20
 static LIST_HEAD(heap_list);
@@ -216,6 +223,19 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 	return heap->name;
 }
=20
+/**
+ * dma_heap_get_gpucg_bucket() - get struct gpucg_bucket for the heap.
+ * @heap: DMA-Heap to get the gpucg_bucket struct for.
+ *
+ * Returns:
+ * The gpucg_bucket struct for the heap. NULL if the GPU cgroup controller=
 is
+ * not enabled.
+ */
+struct gpucg_bucket *dma_heap_get_gpucg_bucket(struct dma_heap *heap)
+{
+	return &heap->gpucg_bucket;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
@@ -228,6 +248,12 @@ struct dma_heap *dma_heap_add(const struct dma_heap_ex=
port_info *exp_info)
 		return ERR_PTR(-EINVAL);
 	}
=20
+	if (IS_ENABLED(CONFIG_CGROUP_GPU) && strlen(exp_info->name) + strlen(HEAP=
_NAME_SUFFIX) >=3D
+		GPUCG_BUCKET_NAME_MAX_LEN) {
+		pr_err("dma_heap: Name is too long for GPU cgroup\n");
+		return ERR_PTR(-ENAMETOOLONG);
+	}
+
 	if (!exp_info->ops || !exp_info->ops->allocate) {
 		pr_err("dma_heap: Cannot add heap with invalid ops struct\n");
 		return ERR_PTR(-EINVAL);
@@ -253,6 +279,19 @@ struct dma_heap *dma_heap_add(const struct dma_heap_ex=
port_info *exp_info)
 	heap->ops =3D exp_info->ops;
 	heap->priv =3D exp_info->priv;
=20
+	if (IS_ENABLED(CONFIG_CGROUP_GPU)) {
+		char gpucg_bucket_name[GPUCG_BUCKET_NAME_MAX_LEN];
+
+		snprintf(gpucg_bucket_name, sizeof(gpucg_bucket_name), "%s%s",
+			 exp_info->name, HEAP_NAME_SUFFIX);
+
+		ret =3D gpucg_register_bucket(dma_heap_get_gpucg_bucket(heap), gpucg_buc=
ket_name);
+		if (ret < 0) {
+			err_ret =3D ERR_PTR(ret);
+			goto err0;
+		}
+	}
+
 	/* Find unused minor number */
 	ret =3D xa_alloc(&dma_heap_minors, &minor, heap,
 		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/sy=
stem_heap.c
index fcf836ba9c1f..27f686faef00 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -297,6 +297,11 @@ static void system_heap_dma_buf_release(struct dma_buf=
 *dmabuf)
 	}
 	sg_free_table(table);
 	kfree(buffer);
+
+	if (dmabuf->gpucg && dmabuf->gpucg_bucket) {
+		gpucg_uncharge(dmabuf->gpucg, dmabuf->gpucg_bucket, dmabuf->size);
+		gpucg_put(dmabuf->gpucg);
+	}
 }
=20
 static const struct dma_buf_ops system_heap_buf_ops =3D {
@@ -346,11 +351,21 @@ static struct dma_buf *system_heap_allocate(struct dm=
a_heap *heap,
 	struct scatterlist *sg;
 	struct list_head pages;
 	struct page *page, *tmp_page;
-	int i, ret =3D -ENOMEM;
+	struct gpucg *gpucg;
+	struct gpucg_bucket *gpucg_bucket;
+	int i, ret;
+
+	gpucg =3D gpucg_get(current);
+	gpucg_bucket =3D dma_heap_get_gpucg_bucket(heap);
+	ret =3D gpucg_charge(gpucg, gpucg_bucket, len);
+	if (ret)
+		goto put_gpucg;
=20
 	buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
-	if (!buffer)
-		return ERR_PTR(-ENOMEM);
+	if (!buffer) {
+		ret =3D -ENOMEM;
+		goto uncharge_gpucg;
+	}
=20
 	INIT_LIST_HEAD(&buffer->attachments);
 	mutex_init(&buffer->lock);
@@ -396,6 +411,8 @@ static struct dma_buf *system_heap_allocate(struct dma_=
heap *heap,
 	exp_info.size =3D buffer->len;
 	exp_info.flags =3D fd_flags;
 	exp_info.priv =3D buffer;
+	dma_buf_exp_info_set_gpucg(&exp_info, gpucg, gpucg_bucket);
+
 	dmabuf =3D dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret =3D PTR_ERR(dmabuf);
@@ -414,7 +431,10 @@ static struct dma_buf *system_heap_allocate(struct dma=
_heap *heap,
 	list_for_each_entry_safe(page, tmp_page, &pages, lru)
 		__free_pages(page, compound_order(page));
 	kfree(buffer);
-
+uncharge_gpucg:
+	gpucg_uncharge(gpucg, gpucg_bucket, len);
+put_gpucg:
+	gpucg_put(gpucg);
 	return ERR_PTR(ret);
 }
=20
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 2097760e8e95..8e7c55c830b3 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -13,6 +13,7 @@
 #ifndef __DMA_BUF_H__
 #define __DMA_BUF_H__
=20
+#include <linux/cgroup_gpu.h>
 #include <linux/iosys-map.h>
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
@@ -453,6 +454,14 @@ struct dma_buf {
 		struct dma_buf *dmabuf;
 	} *sysfs_entry;
 #endif
+
+#ifdef CONFIG_CGROUP_GPU
+	/** @gpucg: Pointer to the GPU cgroup this buffer currently belongs to. *=
/
+	struct gpucg *gpucg;
+
+	/* @gpucg_bucket: Pointer to the GPU cgroup bucket whence this buffer ori=
ginates. */
+	struct gpucg_bucket *gpucg_bucket;
+#endif
 };
=20
 /**
@@ -526,13 +535,15 @@ struct dma_buf_attachment {
=20
 /**
  * struct dma_buf_export_info - holds information needed to export a dma_b=
uf
- * @exp_name:	name of the exporter - useful for debugging.
- * @owner:	pointer to exporter module - used for refcounting kernel module
- * @ops:	Attach allocator-defined dma buf ops to the new buffer
- * @size:	Size of the buffer - invariant over the lifetime of the buffer
- * @flags:	mode flags for the file
- * @resv:	reservation-object, NULL to allocate default one
- * @priv:	Attach private data of allocator to this buffer
+ * @exp_name:		name of the exporter - useful for debugging.
+ * @owner:		pointer to exporter module - used for refcounting kernel modul=
e
+ * @ops:		Attach allocator-defined dma buf ops to the new buffer
+ * @size:		Size of the buffer in bytes - invariant over the lifetime of th=
e buffer
+ * @flags:		mode flags for the file
+ * @resv:		reservation-object, NULL to allocate default one
+ * @priv:		Attach private data of allocator to this buffer
+ * @gpucg:		Pointer to GPU cgroup this buffer is charged to, or NULL if no=
t charged
+ * @gpucg_bucket:	Pointer to GPU cgroup bucket this buffer comes from, or =
NULL if not charged
  *
  * This structure holds the information required to export the buffer. Use=
d
  * with dma_buf_export() only.
@@ -545,6 +556,10 @@ struct dma_buf_export_info {
 	int flags;
 	struct dma_resv *resv;
 	void *priv;
+#ifdef CONFIG_CGROUP_GPU
+	struct gpucg *gpucg;
+	struct gpucg_bucket *gpucg_bucket;
+#endif
 };
=20
 /**
@@ -630,4 +645,14 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_stru=
ct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
+
+#ifdef CONFIG_CGROUP_GPU
+void dma_buf_exp_info_set_gpucg(struct dma_buf_export_info *exp_info,
+				struct gpucg *gpucg,
+				struct gpucg_bucket *gpucg_bucket);
+#else/* CONFIG_CGROUP_GPU */
+static inline void dma_buf_exp_info_set_gpucg(struct dma_buf_export_info *=
exp_info,
+					      struct gpucg *gpucg,
+					      struct gpucg_bucket *gpucg_bucket) {}
+#endif /* CONFIG_CGROUP_GPU */
 #endif /* __DMA_BUF_H__ */
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..6321e7636538 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -10,6 +10,7 @@
 #define _DMA_HEAPS_H
=20
 #include <linux/cdev.h>
+#include <linux/cgroup_gpu.h>
 #include <linux/types.h>
=20
 struct dma_heap;
@@ -59,6 +60,20 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
  */
 const char *dma_heap_get_name(struct dma_heap *heap);
=20
+#ifdef CONFIG_CGROUP_GPU
+/**
+ * dma_heap_get_gpucg_bucket() - get a pointer to the struct gpucg_bucket =
for the heap.
+ * @heap: DMA-Heap to retrieve gpucg_bucket for
+ *
+ * Returns:
+ * The gpucg_bucket struct for the heap.
+ */
+struct gpucg_bucket *dma_heap_get_gpucg_bucket(struct dma_heap *heap);
+#else /* CONFIG_CGROUP_GPU */
+static inline struct gpucg_bucket *dma_heap_get_gpucg_bucket(struct dma_he=
ap *heap)
+{ return NULL; }
+#endif /* CONFIG_CGROUP_GPU */
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
--=20
2.36.0.rc0.470.gd361397f0d-goog

