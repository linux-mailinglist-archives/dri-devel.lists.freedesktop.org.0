Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995345093F2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3810F12C;
	Wed, 20 Apr 2022 23:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914410F12C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 23:52:48 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 t18-20020a257812000000b0064140091ba2so2916287ybc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=MFjiN2c4422vfH3G5XH/W0LypfixtCAuep+NsTNNNpQ=;
 b=O9DK+nzovZ+3UKgC7FIOwT0aMuF2SvsCaF3ZXeSoWy1EhpK0ePx8O/H08V2UqVfgNE
 UN5jw6LkKrD8qnmQ8yNpabAi8LYhV7IVlIhIyxjzWt3DwY0xQYzoGMBwBTocnz0s4rQ5
 ZOKGBkrXwliivGK3Dk1OOuz1iBAnoM5/GpdgoZDvda2LQ+79y+gHEcN4hEcic5si8/tq
 BgIQcchgyZXlLHtJLZrCzUf6RpuLOSrX5iJi0+Wk0Z3RcDlTPXgAj1jg8XJPOdnclJ4g
 1cwxGcpXpjpo6GYI8wlIE6qmSSkrnjGd9jEmnSx6WLGCOCS3QWAGjtKo+pr14uahGroF
 uPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=MFjiN2c4422vfH3G5XH/W0LypfixtCAuep+NsTNNNpQ=;
 b=NOAHMohJnu8GqR/T51lBo700dkWSMj1tyPxcljs4cqcmBZ8t003R8vApUL3Oun1yBi
 Jof+Ra+IvYBrOQlwoyVMKq4erzp5k4eBXDPzW0g5pniNjKzf8l0aHU12ZgKntJ3LPlfb
 ouXw33k0h6DwCVmK89sQwD0oFmjecwtl8S4xZ/T4sqsR+CtCmj0oEiE5wK5YyYtUjx2J
 utyYt0J3QyLDkRTkSFq3Kk4yLGnXObI5dI+lfSmq09ZQOtjch72WL3IIiphnjDu6sRew
 n1qGRvw8QPf0ncrxYxR8ERGcVdg2dwkkhgtSWa9YDZiKVaeM+G/KY+nd5ezu+8b0FozA
 9yOg==
X-Gm-Message-State: AOAM532/vT2U4Obi1MSQfArCGlmdBqCJWqhbn1KeBwTqJxkg3EQVdXam
 rKE7b4Yj7rtWluvebemcLOA+ZktnYfRMcTE=
X-Google-Smtp-Source: ABdhPJwgj/q1pkBqUx+EtmezTxZVaTnub+E1mqztCIeOzLZpLnxcjiZoZHoIs2LVhmVe02tDSbzgfaHA7Of00Js=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr1882789ywe.437.1650498767961; Wed, 20
 Apr 2022 16:52:47 -0700 (PDT)
Date: Wed, 20 Apr 2022 23:52:22 +0000
In-Reply-To: <20220420235228.2767816-1-tjmercier@google.com>
Message-Id: <20220420235228.2767816-5-tjmercier@google.com>
Mime-Version: 1.0
References: <20220420235228.2767816-1-tjmercier@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [RFC v5 4/6] dmabuf: Add gpu cgroup charge transfer function
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, daniel@ffwll.ch, tj@kernel.org, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>
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
 cgroups@vger.kernel.org, skhan@linuxfoundation.org, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, jstultz@google.com, kaleshsingh@google.com,
 hridya@google.com, mkoutny@suse.com, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma_buf_transfer_charge function provides a way for processes to
transfer charge of a buffer to a different process. This is essential
for the cases where a central allocator process does allocations for
various subsystems, hands over the fd to the client who requested the
memory and drops all references to the allocated memory.

Originally-by: Hridya Valsaraju <hridya@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>

---
v5 changes
Fix commit message which still contained the old name for
dma_buf_transfer_charge per Michal Koutn=C3=BD.

Modify the dma_buf_transfer_charge API to accept a task_struct instead
of a gpucg. This avoids requiring the caller to manage the refcount
of the gpucg upon failure and confusing ownership transfer logic.

v4 changes
Adjust ordering of charge/uncharge during transfer to avoid potentially
hitting cgroup limit per Michal Koutn=C3=BD.

v3 changes
Use more common dual author commit message format per John Stultz.

v2 changes
Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig.
---
 drivers/dma-buf/dma-buf.c  | 57 +++++++++++++++++++++++++++++++++++
 include/linux/cgroup_gpu.h | 14 +++++++++
 include/linux/dma-buf.h    |  6 ++++
 kernel/cgroup/gpu.c        | 62 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index bc89c44bd9b9..f3fb844925e2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1341,6 +1341,63 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct i=
osys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
=20
+/**
+ * dma_buf_transfer_charge - Change the GPU cgroup to which the provided d=
ma_buf is charged.
+ * @dmabuf:	[in]	buffer whose charge will be migrated to a different GPU c=
group
+ * @target:	[in]	the task_struct of the destination process for the GPU cg=
roup charge
+ *
+ * Only tasks that belong to the same cgroup the buffer is currently charg=
ed to
+ * may call this function, otherwise it will return -EPERM.
+ *
+ * Returns 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_transfer_charge(struct dma_buf *dmabuf, struct task_struct *ta=
rget)
+{
+	struct gpucg *current_gpucg, *target_gpucg, *to_release;
+	int ret;
+
+	if (!dmabuf->gpucg || !dmabuf->gpucg_bucket) {
+		/* This dmabuf is not tracked under GPU cgroup accounting */
+		return 0;
+	}
+
+	current_gpucg =3D gpucg_get(current);
+	target_gpucg =3D gpucg_get(target);
+	to_release =3D target_gpucg;
+
+	/* If the source and destination cgroups are the same, don't do anything.=
 */
+	if (current_gpucg =3D=3D target_gpucg) {
+		ret =3D 0;
+		goto skip_transfer;
+	}
+
+	/*
+	 * Verify that the cgroup of the process requesting the transfer
+	 * is the same as the one the buffer is currently charged to.
+	 */
+	mutex_lock(&dmabuf->lock);
+	if (current_gpucg !=3D dmabuf->gpucg) {
+		ret =3D -EPERM;
+		goto err;
+	}
+
+	ret =3D gpucg_transfer_charge(
+		dmabuf->gpucg, target_gpucg, dmabuf->gpucg_bucket, dmabuf->size);
+	if (ret)
+		goto err;
+
+	to_release =3D dmabuf->gpucg;
+	dmabuf->gpucg =3D target_gpucg;
+
+err:
+	mutex_unlock(&dmabuf->lock);
+skip_transfer:
+	gpucg_put(current_gpucg);
+	gpucg_put(to_release);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_transfer_charge, DMA_BUF);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/cgroup_gpu.h b/include/linux/cgroup_gpu.h
index 4dfe633d6ec7..f5973ef9f926 100644
--- a/include/linux/cgroup_gpu.h
+++ b/include/linux/cgroup_gpu.h
@@ -83,7 +83,13 @@ static inline struct gpucg *gpucg_parent(struct gpucg *c=
g)
 }
=20
 int gpucg_charge(struct gpucg *gpucg, struct gpucg_bucket *bucket, u64 siz=
e);
+
 void gpucg_uncharge(struct gpucg *gpucg, struct gpucg_bucket *bucket, u64 =
size);
+
+int gpucg_transfer_charge(struct gpucg *source,
+			  struct gpucg *dest,
+			  struct gpucg_bucket *bucket,
+			  u64 size);
 int gpucg_register_bucket(struct gpucg_bucket *bucket, const char *name);
 #else /* CONFIG_CGROUP_GPU */
=20
@@ -118,6 +124,14 @@ static inline void gpucg_uncharge(struct gpucg *gpucg,
 				  struct gpucg_bucket *bucket,
 				  u64 size) {}
=20
+static inline int gpucg_transfer_charge(struct gpucg *source,
+					struct gpucg *dest,
+					struct gpucg_bucket *bucket,
+					u64 size)
+{
+	return 0;
+}
+
 static inline int gpucg_register_bucket(struct gpucg_bucket *bucket, const=
 char *name) {}
 #endif /* CONFIG_CGROUP_GPU */
 #endif /* _CGROUP_GPU_H */
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8e7c55c830b3..438ad8577b76 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -18,6 +18,7 @@
 #include <linux/file.h>
 #include <linux/err.h>
 #include <linux/scatterlist.h>
+#include <linux/sched.h>
 #include <linux/list.h>
 #include <linux/dma-mapping.h>
 #include <linux/fs.h>
@@ -650,9 +651,14 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct ios=
ys_map *map);
 void dma_buf_exp_info_set_gpucg(struct dma_buf_export_info *exp_info,
 				struct gpucg *gpucg,
 				struct gpucg_bucket *gpucg_bucket);
+
+int dma_buf_transfer_charge(struct dma_buf *dmabuf, struct task_struct *ta=
rget);
 #else/* CONFIG_CGROUP_GPU */
 static inline void dma_buf_exp_info_set_gpucg(struct dma_buf_export_info *=
exp_info,
 					      struct gpucg *gpucg,
 					      struct gpucg_bucket *gpucg_bucket) {}
+
+static inline int dma_buf_transfer_charge(struct dma_buf *dmabuf, struct t=
ask_struct *target)
+{ return 0; }
 #endif /* CONFIG_CGROUP_GPU */
 #endif /* __DMA_BUF_H__ */
diff --git a/kernel/cgroup/gpu.c b/kernel/cgroup/gpu.c
index 34d0a5b85834..7dfbe0fd7e45 100644
--- a/kernel/cgroup/gpu.c
+++ b/kernel/cgroup/gpu.c
@@ -252,6 +252,68 @@ void gpucg_uncharge(struct gpucg *gpucg, struct gpucg_=
bucket *bucket, u64 size)
 	css_put(&gpucg->css);
 }
=20
+/**
+ * gpucg_transfer_charge - Transfer a GPU charge from one cgroup to anothe=
r.
+ *
+ * @source:	[in]	The GPU cgroup the charge will be transferred from.
+ * @dest:	[in]	The GPU cgroup the charge will be transferred to.
+ * @bucket:	[in]	The GPU cgroup bucket corresponding to the charge.
+ * @size:	[in]	The size of the memory in bytes.
+ *                      This size will be rounded up to the nearest page s=
ize.
+ *
+ * Returns 0 on success, or a negative errno code otherwise.
+ */
+int gpucg_transfer_charge(struct gpucg *source,
+			  struct gpucg *dest,
+			  struct gpucg_bucket *bucket,
+			  u64 size)
+{
+	struct page_counter *counter;
+	u64 nr_pages;
+	struct gpucg_resource_pool *rp_source, *rp_dest;
+	int ret =3D 0;
+
+	nr_pages =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	mutex_lock(&gpucg_mutex);
+	rp_source =3D cg_rpool_find_locked(source, bucket);
+	if (unlikely(!rp_source)) {
+		ret =3D -ENOENT;
+		goto exit_early;
+	}
+
+	rp_dest =3D cg_rpool_get_locked(dest, bucket);
+	if (IS_ERR(rp_dest)) {
+		ret =3D PTR_ERR(rp_dest);
+		goto exit_early;
+	}
+
+	/*
+	 * First uncharge from the pool it's currently charged to. This ordering =
avoids double
+	 * charging while the transfer is in progress, which could cause us to hi=
t a limit.
+	 * If the try_charge fails for this transfer, we need to be able to rever=
se this uncharge,
+	 * so we continue to hold the gpucg_mutex here.
+	 */
+	page_counter_uncharge(&rp_source->total, nr_pages);
+	css_put(&source->css);
+
+	/* Now attempt the new charge */
+	if (page_counter_try_charge(&rp_dest->total, nr_pages, &counter)) {
+		css_get(&dest->css);
+	} else {
+		/*
+		 * The new charge failed, so reverse the uncharge from above. This shoul=
d always
+		 * succeed since charges on source are blocked by gpucg_mutex.
+		 */
+		WARN_ON(!page_counter_try_charge(&rp_source->total, nr_pages, &counter))=
;
+		css_get(&source->css);
+		ret =3D -ENOMEM;
+	}
+exit_early:
+	mutex_unlock(&gpucg_mutex);
+	return ret;
+}
+
 /**
  * gpucg_register_bucket - Registers a bucket for memory accounting using =
the
  * GPU cgroup controller.
--=20
2.36.0.rc0.470.gd361397f0d-goog

