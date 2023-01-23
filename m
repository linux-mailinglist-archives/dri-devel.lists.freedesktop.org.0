Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3BF6785FB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 20:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427C10E1F8;
	Mon, 23 Jan 2023 19:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8474710E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 19:17:57 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-4fa63c84621so129070257b3.20
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=29eNHuXkN4Biw7YjDro7DKxD9MLgh2JPpCUKKyMlqpA=;
 b=Subdt7mbpSJ3q++6bJrXZjJZZw2B5aXVhcYIOjpWp1e7w65W6r5oAUZpnmuhuuxtGC
 m6yHwVIfAM74kNHnxjivy2kMGAg6vCfv+3hhWBYw2BJN0Dja1Y7NQKOgWr6COa+8oUkk
 rUnUidJgv1sRL2Bt6YdHCPqVzpfizdrAy9YnM1stYfRMcfzP4DXyiUe0ObHRm1rO0ZdX
 Z1ZA/fI74arWwHwvDOYrrcmDZGCsMH3Nq+OQolvzt4CNc9tJFsaB0vn3Yw+H2aqetp8n
 bmppFH7vBRP4aW++HEHSq4uD8ir3GpzrY/G/loULfk/4Fe0e7jWIDY4IGgw0L9zKW6Fz
 9YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29eNHuXkN4Biw7YjDro7DKxD9MLgh2JPpCUKKyMlqpA=;
 b=ypQAmmdDjVInujwczZZuRdkDr47nmmu3lrrnsPdYytFUI62h6tTb50I6FrqYdfy4Xr
 gQyWk1PJ7wnkauSb/VU05IgAbE3hu3954/1eTSlxKkkIJgmgDXSdMLyO7ljMVmwi4K/r
 uFY1NOP9uMv7jefONcIQ9gohWSiykX0F/g68Nl/ppOBdRQkZL62zaUJkWapN5UklyU4j
 ArvUYaBmrgB5+LY59TFTJYfXsdubfCeMbri+GB7aoznWGPun3C52czPgvyUEC3/RNsIo
 YOoHkseFlZDQNTHMRHGcxWsL9N7tbtB7r6drhUay+8sp4649NdQ69yZ+Nck8w4e775V4
 emCA==
X-Gm-Message-State: AFqh2krYGHl60u0eDO1A5vyk10AMyJgLiD6Q1Z3kYiR+phJQVlPuM05Q
 D+NfSzJu4mQ+uCNeUDD8XOv96S2PDbMfriA=
X-Google-Smtp-Source: AMrXdXuIEmBCRRQ29mCX2Lz8F60RAV61DpR49m4PqdkPLl3Fou0sh8htd5KZF+eNK2HXmLDFr4FD/qKGK/2gVtE=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a81:5553:0:b0:4d1:959d:fa49 with SMTP id
 j80-20020a815553000000b004d1959dfa49mr3602848ywb.33.1674501476646; Mon, 23
 Jan 2023 11:17:56 -0800 (PST)
Date: Mon, 23 Jan 2023 19:17:23 +0000
In-Reply-To: <20230123191728.2928839-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230123191728.2928839-2-tjmercier@google.com>
Subject: [PATCH v2 1/4] memcg: Track exported dma-buffers
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeelb@google.com>, 
 Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: android-mm@google.com, linux-doc@vger.kernel.org, selinux@vger.kernel.org,
 daniel.vetter@ffwll.ch, cmllamas@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org, jstultz@google.com,
 jeffv@google.com, cgroups@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a buffer is exported to userspace, use memcg to attribute the
buffer to the allocating cgroup until all buffer references are
released.

Unlike the dmabuf sysfs stats implementation, this memcg accounting
avoids contention over the kernfs_rwsem incurred when creating or
removing nodes.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  4 +++
 drivers/dma-buf/dma-buf.c               | 13 +++++++++
 include/linux/dma-buf.h                 |  3 ++
 include/linux/memcontrol.h              | 38 +++++++++++++++++++++++++
 mm/memcontrol.c                         | 19 +++++++++++++
 5 files changed, 77 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index c8ae7c897f14..538ae22bc514 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1455,6 +1455,10 @@ PAGE_SIZE multiple when read back.
 		Amount of memory used for storing in-kernel data
 		structures.
 
+	  dmabuf (npn)
+		Amount of memory used for exported DMA buffers allocated by the cgroup.
+		Stays with the allocating cgroup regardless of how the buffer is shared.
+
 	  workingset_refault_anon
 		Number of refaults of previously evicted anonymous pages.
 
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e6528767efc7..a6a8cb5cb32d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -75,6 +75,9 @@ static void dma_buf_release(struct dentry *dentry)
 	 */
 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
+	mem_cgroup_uncharge_dmabuf(dmabuf->memcg, PAGE_ALIGN(dmabuf->size) / PAGE_SIZE);
+	mem_cgroup_put(dmabuf->memcg);
+
 	dma_buf_stats_teardown(dmabuf);
 	dmabuf->ops->release(dmabuf);
 
@@ -673,6 +676,13 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	if (ret)
 		goto err_dmabuf;
 
+	dmabuf->memcg = get_mem_cgroup_from_mm(current->mm);
+	if (!mem_cgroup_charge_dmabuf(dmabuf->memcg, PAGE_ALIGN(dmabuf->size) / PAGE_SIZE,
+				      GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto err_memcg;
+	}
+
 	file->private_data = dmabuf;
 	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
@@ -683,6 +693,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	return dmabuf;
 
+err_memcg:
+	mem_cgroup_put(dmabuf->memcg);
+	dma_buf_stats_teardown(dmabuf);
 err_dmabuf:
 	if (!resv)
 		dma_resv_fini(dmabuf->resv);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 6fa8d4e29719..1f0ffb8e4bf5 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
+#include <linux/memcontrol.h>
 
 struct device;
 struct dma_buf;
@@ -446,6 +447,8 @@ struct dma_buf {
 		struct dma_buf *dmabuf;
 	} *sysfs_entry;
 #endif
+	/* The cgroup to which this buffer is currently attributed */
+	struct mem_cgroup *memcg;
 };
 
 /**
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index d3c8203cab6c..c10b8565fdbf 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -37,6 +37,7 @@ enum memcg_stat_item {
 	MEMCG_KMEM,
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
+	MEMCG_DMABUF,
 	MEMCG_NR_STAT,
 };
 
@@ -673,6 +674,25 @@ static inline int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm,
 
 int mem_cgroup_swapin_charge_folio(struct folio *folio, struct mm_struct *mm,
 				  gfp_t gfp, swp_entry_t entry);
+
+/**
+ * mem_cgroup_charge_dmabuf - Charge dma-buf memory to a cgroup and update stat counter
+ * @memcg: memcg to charge
+ * @nr_pages: number of pages to charge
+ * @gfp_mask: reclaim mode
+ *
+ * Charges @nr_pages to @memcg. Returns %true if the charge fit within
+ * @memcg's configured limit, %false if it doesn't.
+ */
+bool __mem_cgroup_charge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages, gfp_t gfp_mask);
+static inline bool mem_cgroup_charge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages,
+					    gfp_t gfp_mask)
+{
+	if (mem_cgroup_disabled())
+		return 0;
+	return __mem_cgroup_charge_dmabuf(memcg, nr_pages, gfp_mask);
+}
+
 void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry);
 
 void __mem_cgroup_uncharge(struct folio *folio);
@@ -690,6 +710,14 @@ static inline void mem_cgroup_uncharge(struct folio *folio)
 	__mem_cgroup_uncharge(folio);
 }
 
+void __mem_cgroup_uncharge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages);
+static inline void mem_cgroup_uncharge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages)
+{
+	if (mem_cgroup_disabled())
+		return;
+	__mem_cgroup_uncharge_dmabuf(memcg, nr_pages);
+}
+
 void __mem_cgroup_uncharge_list(struct list_head *page_list);
 static inline void mem_cgroup_uncharge_list(struct list_head *page_list)
 {
@@ -1242,6 +1270,12 @@ static inline int mem_cgroup_swapin_charge_folio(struct folio *folio,
 	return 0;
 }
 
+static inline bool mem_cgroup_charge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages,
+					    gfp_t gfp_mask)
+{
+	return true;
+}
+
 static inline void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry)
 {
 }
@@ -1250,6 +1284,10 @@ static inline void mem_cgroup_uncharge(struct folio *folio)
 {
 }
 
+static inline void mem_cgroup_uncharge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages)
+{
+}
+
 static inline void mem_cgroup_uncharge_list(struct list_head *page_list)
 {
 }
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ab457f0394ab..375d18370f4b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1502,6 +1502,7 @@ static const struct memory_stat memory_stats[] = {
 	{ "unevictable",		NR_UNEVICTABLE			},
 	{ "slab_reclaimable",		NR_SLAB_RECLAIMABLE_B		},
 	{ "slab_unreclaimable",		NR_SLAB_UNRECLAIMABLE_B		},
+	{ "dmabuf",			MEMCG_DMABUF			},
 
 	/* The memory events */
 	{ "workingset_refault_anon",	WORKINGSET_REFAULT_ANON		},
@@ -4042,6 +4043,7 @@ static const unsigned int memcg1_stats[] = {
 	WORKINGSET_REFAULT_ANON,
 	WORKINGSET_REFAULT_FILE,
 	MEMCG_SWAP,
+	MEMCG_DMABUF,
 };
 
 static const char *const memcg1_stat_names[] = {
@@ -4057,6 +4059,7 @@ static const char *const memcg1_stat_names[] = {
 	"workingset_refault_anon",
 	"workingset_refault_file",
 	"swap",
+	"dmabuf",
 };
 
 /* Universal VM events cgroup1 shows, original sort order */
@@ -7299,6 +7302,22 @@ void mem_cgroup_uncharge_skmem(struct mem_cgroup *memcg, unsigned int nr_pages)
 	refill_stock(memcg, nr_pages);
 }
 
+bool __mem_cgroup_charge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages, gfp_t gfp_mask)
+{
+	if (try_charge(memcg, gfp_mask, nr_pages) == 0) {
+		mod_memcg_state(memcg, MEMCG_DMABUF, nr_pages);
+		return true;
+	}
+
+	return false;
+}
+
+void __mem_cgroup_uncharge_dmabuf(struct mem_cgroup *memcg, unsigned int nr_pages)
+{
+	mod_memcg_state(memcg, MEMCG_DMABUF, -nr_pages);
+	refill_stock(memcg, nr_pages);
+}
+
 static int __init cgroup_memory(char *s)
 {
 	char *token;
-- 
2.39.0.246.g2a6d74b583-goog

