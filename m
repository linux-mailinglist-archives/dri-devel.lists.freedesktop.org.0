Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2219B9B55
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 00:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4F110E208;
	Fri,  1 Nov 2024 23:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g/m3u7bU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9261F10E208
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 23:55:07 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71e5130832aso2002208b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730505307; x=1731110107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJxFKebSx7zrRkfr76WJvp4GsO3+c9Ujl0eoJtBuqDQ=;
 b=g/m3u7bUDsUoHofwb173D9lI55NX1k8ReVns4Mq1hFScp3HXmvQKTkXrp/FiKPrd4f
 cbfKOJCmivP4qSUpDKvpo3g9FFuXUj/LamGn7CYjbCjN/lf4fIhJBg0jq2U1DqLQQYil
 KmfUFEppRvcUl68wEpywgg8z1QyUo3k5edjBUUIWRXAAiSlPU5UZI/PObYN+2Wspgdff
 xNihWP0xCtMQdOQ01xYVmvW0fx17azfhu7unJvxsjU6zp693RWgk/qGBA0lKNcTKpIok
 +CT/HSir1VDMGHjKLxm57IktC42mc3fvVKhhKfHSDHGxPNO03xBxQe/6m1fednOjrgSz
 HURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730505307; x=1731110107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJxFKebSx7zrRkfr76WJvp4GsO3+c9Ujl0eoJtBuqDQ=;
 b=rByxurCuRndjxT9vX9FZoMP5kkWdGqh/e3kEIJFIBlvDPFseAxkbKcN6pZC5n2yDW4
 UBV9guduEA7Ulb8JvDxanw03kXbLpE+Wa68P7+1h3S//MzessuFV0MCdrVw6Dtdh8vyv
 gPdOT3Cneb2L72NfQpu7USCAivPGk6eahj2PkIC8o0i+eCju5GwzOjAg5k9N1KLkLPVO
 wSt7yxbs8hyY3GiMTLijD+ehDEVUrxMBEpgsK7sZIfs8uv2sa3dDZiHdD+xItjCm00X4
 Se04jIguvprelZ7O/u0hX2bi42035GlfbDIWxb9r+SbCLbObB6pq4MCnxtWLiNI6nOba
 FfRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFGG6CLXNEj30kWjTr55kovupWbTcZicMpoEWHxMNo7pFQxAHQlJMYit58jhWcFGt68a01V9Xg+8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Yh3Xqf6dRj+ncnXqPWFBzYc2/21/9duvp4eFsNU+6YLawnvv
 ylUq/auSVoiU+UbE71aPItKF6LM7Iv9+Jfh1ikp6EIQXG9IqYjpt
X-Google-Smtp-Source: AGHT+IHY7edvJre2a9iTf1j4tY2ZYnpz6gk3Fg/Att00o0EeAfl3NVCM8rzK53IyKrNHX7pI89lwpg==
X-Received: by 2002:a05:6a21:3a83:b0:1d9:1907:aa2b with SMTP id
 adf61e73a8af0-1dba5219098mr7426138637.1.1730505306958; 
 Fri, 01 Nov 2024 16:55:06 -0700 (PDT)
Received: from tungpham-mbp.DHCP.thefacebook.com ([2620:10d:c090:400::5:7de5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc2eb64esm3238357b3a.168.2024.11.01.16.55.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 01 Nov 2024 16:55:06 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 kernel-team@fb.com
Subject: [PATCH bpf-next 2/2] bpf: Switch bpf arena to use drm_mm instead of
 maple_tree
Date: Fri,  1 Nov 2024 16:54:53 -0700
Message-Id: <20241101235453.63380-3-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
References: <20241101235453.63380-1-alexei.starovoitov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexei Starovoitov <ast@kernel.org>

bpf arena is moving towards non-sleepable allocations in tracing
context while maple_tree does kmalloc/kfree deep inside. Hence switch
bpf arena to drm_mm algorithm that works with externally provided
drm_mm_node-s. This patch kmalloc/kfree-s drm_mm_node-s, but the next
patch will switch to bpf_mem_alloc and preallocated drm_mm_node-s.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/bpf/arena.c | 67 +++++++++++++++++++++++++++++++++++-----------
 lib/Makefile       |  1 +
 2 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
index e52b3ad231b9..ef1de26020f2 100644
--- a/kernel/bpf/arena.c
+++ b/kernel/bpf/arena.c
@@ -6,6 +6,7 @@
 #include <linux/btf_ids.h>
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
+#include <drm/drm_mm.h>
 
 /*
  * bpf_arena is a sparsely populated shared memory region between bpf program and
@@ -45,7 +46,7 @@ struct bpf_arena {
 	u64 user_vm_start;
 	u64 user_vm_end;
 	struct vm_struct *kern_vm;
-	struct maple_tree mt;
+	struct drm_mm mm;
 	struct list_head vma_list;
 	struct mutex lock;
 };
@@ -132,7 +133,7 @@ static struct bpf_map *arena_map_alloc(union bpf_attr *attr)
 
 	INIT_LIST_HEAD(&arena->vma_list);
 	bpf_map_init_from_attr(&arena->map, attr);
-	mt_init_flags(&arena->mt, MT_FLAGS_ALLOC_RANGE);
+	drm_mm_init(&arena->mm, 0, attr->max_entries);
 	mutex_init(&arena->lock);
 
 	return &arena->map;
@@ -164,6 +165,7 @@ static int existing_page_cb(pte_t *ptep, unsigned long addr, void *data)
 static void arena_map_free(struct bpf_map *map)
 {
 	struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
+	struct drm_mm_node *node, *next;
 
 	/*
 	 * Check that user vma-s are not around when bpf map is freed.
@@ -183,7 +185,11 @@ static void arena_map_free(struct bpf_map *map)
 	apply_to_existing_page_range(&init_mm, bpf_arena_get_kern_vm_start(arena),
 				     KERN_VM_SZ - GUARD_SZ, existing_page_cb, NULL);
 	free_vm_area(arena->kern_vm);
-	mtree_destroy(&arena->mt);
+	drm_mm_for_each_node_safe(node, next, &arena->mm) {
+		drm_mm_remove_node(node);
+		kfree(node);
+	}
+	drm_mm_takedown(&arena->mm);
 	bpf_map_area_free(arena);
 }
 
@@ -257,6 +263,7 @@ static vm_fault_t arena_vm_fault(struct vm_fault *vmf)
 {
 	struct bpf_map *map = vmf->vma->vm_file->private_data;
 	struct bpf_arena *arena = container_of(map, struct bpf_arena, map);
+	struct drm_mm_node *node;
 	struct page *page;
 	long kbase, kaddr;
 	int ret;
@@ -274,20 +281,30 @@ static vm_fault_t arena_vm_fault(struct vm_fault *vmf)
 		/* User space requested to segfault when page is not allocated by bpf prog */
 		return VM_FAULT_SIGSEGV;
 
-	ret = mtree_insert(&arena->mt, vmf->pgoff, MT_ENTRY, GFP_KERNEL);
-	if (ret)
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return VM_FAULT_SIGSEGV;
+
+	node->start = vmf->pgoff;
+	node->size = 1;
+	ret = drm_mm_reserve_node(&arena->mm, node);
+	if (ret) {
+		kfree(node);
 		return VM_FAULT_SIGSEGV;
+	}
 
 	/* Account into memcg of the process that created bpf_arena */
 	ret = bpf_map_alloc_pages(map, GFP_KERNEL | __GFP_ZERO, NUMA_NO_NODE, 1, &page);
 	if (ret) {
-		mtree_erase(&arena->mt, vmf->pgoff);
+		drm_mm_remove_node(node);
+		kfree(node);
 		return VM_FAULT_SIGSEGV;
 	}
 
 	ret = vm_area_map_pages(arena->kern_vm, kaddr, kaddr + PAGE_SIZE, &page);
 	if (ret) {
-		mtree_erase(&arena->mt, vmf->pgoff);
+		drm_mm_remove_node(node);
+		kfree(node);
 		__free_page(page);
 		return VM_FAULT_SIGSEGV;
 	}
@@ -420,6 +437,7 @@ static long arena_alloc_pages(struct bpf_arena *arena, long uaddr, long page_cnt
 	/* user_vm_end/start are fixed before bpf prog runs */
 	long page_cnt_max = (arena->user_vm_end - arena->user_vm_start) >> PAGE_SHIFT;
 	u64 kern_vm_start = bpf_arena_get_kern_vm_start(arena);
+	struct drm_mm_node *node;
 	struct page **pages;
 	long pgoff = 0;
 	u32 uaddr32;
@@ -442,14 +460,21 @@ static long arena_alloc_pages(struct bpf_arena *arena, long uaddr, long page_cnt
 	if (!pages)
 		return 0;
 
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node) {
+		kvfree(pages);
+		return 0;
+	}
 	guard(mutex)(&arena->lock);
 
-	if (uaddr)
-		ret = mtree_insert_range(&arena->mt, pgoff, pgoff + page_cnt - 1,
-					 MT_ENTRY, GFP_KERNEL);
-	else
-		ret = mtree_alloc_range(&arena->mt, &pgoff, MT_ENTRY,
-					page_cnt, 0, page_cnt_max - 1, GFP_KERNEL);
+	if (uaddr) {
+		node->start = pgoff;
+		node->size = page_cnt;
+		ret = drm_mm_reserve_node(&arena->mm, node);
+	} else {
+		ret = drm_mm_insert_node(&arena->mm, node, page_cnt);
+		pgoff = node->start;
+	}
 	if (ret)
 		goto out_free_pages;
 
@@ -476,7 +501,8 @@ static long arena_alloc_pages(struct bpf_arena *arena, long uaddr, long page_cnt
 	kvfree(pages);
 	return clear_lo32(arena->user_vm_start) + uaddr32;
 out:
-	mtree_erase(&arena->mt, pgoff);
+	drm_mm_remove_node(node);
+	kfree(node);
 out_free_pages:
 	kvfree(pages);
 	return 0;
@@ -499,6 +525,7 @@ static void zap_pages(struct bpf_arena *arena, long uaddr, long page_cnt)
 static void arena_free_pages(struct bpf_arena *arena, long uaddr, long page_cnt)
 {
 	u64 full_uaddr, uaddr_end;
+	struct drm_mm_node *node, *to_remove;
 	long kaddr, pgoff, i;
 	struct page *page;
 
@@ -516,7 +543,17 @@ static void arena_free_pages(struct bpf_arena *arena, long uaddr, long page_cnt)
 
 	pgoff = compute_pgoff(arena, uaddr);
 	/* clear range */
-	mtree_store_range(&arena->mt, pgoff, pgoff + page_cnt - 1, NULL, GFP_KERNEL);
+	for (;;) {
+		to_remove = NULL;
+		drm_mm_for_each_node_in_range(node, &arena->mm, pgoff, pgoff + page_cnt) {
+			to_remove = node;
+			break;
+		}
+		if (!to_remove)
+			break;
+		drm_mm_remove_node(to_remove);
+		kfree(to_remove);
+	}
 
 	if (page_cnt > 1)
 		/* bulk zap if multiple pages being freed */
diff --git a/lib/Makefile b/lib/Makefile
index 605aa25b71ab..d4787e6b0942 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
 obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
+obj-$(CONFIG_BPF_SYSCALL) += drm_mm.o
 obj-$(CONFIG_DRM) += drm_mm.o
 test_dhry-objs := dhry_1.o dhry_2.o dhry_run.o
 obj-$(CONFIG_TEST_DHRY) += test_dhry.o
-- 
2.43.5

