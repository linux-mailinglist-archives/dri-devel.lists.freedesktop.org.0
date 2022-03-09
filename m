Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35A4D34ED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 17:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEE110E44A;
	Wed,  9 Mar 2022 16:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BAD10E487
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 16:52:46 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 c6-20020a25f306000000b006291deb924fso2145296ybs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 08:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=lhHGzZoREQNnf55wN1HaeVUD3hjLL00JJ5cetBP+eaQ=;
 b=gKIbC0k/5p+fyNlConlMN+xPe/ebk8ebvd/uWg6T6vooL8MMIfva9qwy7Lpdbivqq7
 oJoIgx2KDTrB7PC2LXU6JYkOQgHlH1J78wsI/1CybgkEOgCETFPbvTPvvBZjF3KtEYrW
 804ENocSNg1iNY0zuUQhjo4BolEmxZkdv9JShsHPaP3w6yigklJE9Q9l+xaJDLCwR09A
 4DGED7VchRj5zoSQ42M5Way/Ra/0h5dn8HeEz5ZQ9KAEmdn2oNLN4RDfrLj7Imh7317M
 J7FgGxhT0IWthtTIVaNXYJbTS5HECV7f+G560rkLLiA/e5xw92yjAG61zMDzxkzWjfrM
 JpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=lhHGzZoREQNnf55wN1HaeVUD3hjLL00JJ5cetBP+eaQ=;
 b=rUOzPKtSpv6pY8frC8hDbagY5vd96giRU+H/h+8CI7SoGkQ2L/1F+Fpta0aKvxBqb5
 bUG9ODGnfwdFJqBKQua3ZOA64tqbxGDUz4D4iNnfnf26+l4buvsiN5APip3z3Iv/dSnl
 2EJq8VKIq5j1rF63RFf3fuvKhn6POyb/f5YQM5lQ2VvwmsmW7xArQ2UHFfWi5AJQug4a
 3cP+bvBP3GV+EZWeCOpHyhvDI+fj2Wn6zeGyv09AeLz2+9dhQGq2L9yoOGX1R5loBFYS
 Hfh0GYBfh5OQiI+nhLaoFiOG2sGolWgphr4BWOHZS/FJIhsbuV6hcbYfKz5ZZ+JVfIMw
 DspQ==
X-Gm-Message-State: AOAM5302JIIev/7qfiMNnItr37x/NZd4cgU9GJbNM/CyLgUG0WPy6sVj
 KLxECyVnNz1zPmzgaDLPk8c5GIlwKBhCngY=
X-Google-Smtp-Source: ABdhPJwK4yKwsDlaoEUAS3Vm5fm7rENo1CQsEFqudzHVLPT45CzkuU3D+7W8hxwy+2V9Wem//6DQfWjRXmIBTMk=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a05:6902:1541:b0:628:a0ed:ad49 with SMTP
 id r1-20020a056902154100b00628a0edad49mr513167ybu.419.1646844765074; Wed, 09
 Mar 2022 08:52:45 -0800 (PST)
Date: Wed,  9 Mar 2022 16:52:14 +0000
In-Reply-To: <20220309165222.2843651-1-tjmercier@google.com>
Message-Id: <20220309165222.2843651-5-tjmercier@google.com>
Mime-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [RFC v3 4/8] dmabuf: heaps: export system_heap buffers with GPU
 cgroup charging
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
 Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>
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
Cc: linux-doc@vger.kernel.org, Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, kaleshsingh@google.com,
 cgroups@vger.kernel.org, "T.J. Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hridya Valsaraju <hridya@google.com>

All DMA heaps now register a new GPU cgroup device upon creation, and the
system_heap now exports buffers associated with its GPU cgroup device for
tracking purposes.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>

---
v3 changes
Use more common dual author commit message format per John Stultz.

v2 changes
Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig.
---
 drivers/dma-buf/dma-heap.c          | 27 +++++++++++++++++++++++++++
 drivers/dma-buf/heaps/system_heap.c |  3 +++
 include/linux/dma-heap.h            | 11 +++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8f5848aa144f..885072427775 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,6 +7,7 @@
  */
=20
 #include <linux/cdev.h>
+#include <linux/cgroup_gpu.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
@@ -31,6 +32,7 @@
  * @heap_devt		heap device node
  * @list		list head connecting to list of heaps
  * @heap_cdev		heap char device
+ * @gpucg_dev		gpu cgroup device for memory accounting
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -41,6 +43,9 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+#ifdef CONFIG_CGROUP_GPU
+	struct gpucg_device gpucg_dev;
+#endif
 };
=20
 static LIST_HEAD(heap_list);
@@ -216,6 +221,26 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 	return heap->name;
 }
=20
+#ifdef CONFIG_CGROUP_GPU
+/**
+ * dma_heap_get_gpucg_dev() - get struct gpucg_device for the heap.
+ * @heap: DMA-Heap to get the gpucg_device struct for.
+ *
+ * Returns:
+ * The gpucg_device struct for the heap. NULL if the GPU cgroup controller=
 is
+ * not enabled.
+ */
+struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
+{
+	return &heap->gpucg_dev;
+}
+#else /* CONFIG_CGROUP_GPU */
+struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap)
+{
+	return NULL;
+}
+#endif /* CONFIG_CGROUP_GPU */
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
@@ -288,6 +313,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap_exp=
ort_info *exp_info)
 	list_add(&heap->list, &heap_list);
 	mutex_unlock(&heap_list_lock);
=20
+	gpucg_register_device(dma_heap_get_gpucg_dev(heap), exp_info->name);
+
 	return heap;
=20
 err2:
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/sy=
stem_heap.c
index ab7fd896d2c4..752a05c3cfe2 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -395,6 +395,9 @@ static struct dma_buf *system_heap_allocate(struct dma_=
heap *heap,
 	exp_info.ops =3D &system_heap_buf_ops;
 	exp_info.size =3D buffer->len;
 	exp_info.flags =3D fd_flags;
+#ifdef CONFIG_CGROUP_GPU
+	exp_info.gpucg_dev =3D dma_heap_get_gpucg_dev(heap);
+#endif
 	exp_info.priv =3D buffer;
 	dmabuf =3D dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..e447a61d054e 100644
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
@@ -59,6 +60,16 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
  */
 const char *dma_heap_get_name(struct dma_heap *heap);
=20
+/**
+ * dma_heap_get_gpucg_dev() - get a pointer to the struct gpucg_device for=
 the
+ * heap.
+ * @heap: DMA-Heap to retrieve gpucg_device for.
+ *
+ * Returns:
+ * The gpucg_device struct for the heap.
+ */
+struct gpucg_device *dma_heap_get_gpucg_dev(struct dma_heap *heap);
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
--=20
2.35.1.616.g0bdcbb4464-goog

