Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BCCA9C0AC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEF810E8C2;
	Fri, 25 Apr 2025 08:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VI9HqwR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3272D10E8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5qYX4fxmvotPEe9k1Ldxje/is/5r/CwZVYIsI3ib8k=;
 b=VI9HqwR/Ylv6SVdyKG3cWodiV7Nk8yrilA5jdukaZiOzCAEAaT1itXIE+8wldVpXSuCu1T
 1QW1gWxbxr982c2ZmKSz9aCAUGzh5Q2b3Z2hRmDegDjscCKz9+5Fc2zJXn/7timFEpQphD
 cjQMcJl3NJ7tQGwqQwY9rgwvszB2aj4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-d0iXNodIMzSrBfNHCx4XXg-1; Fri, 25 Apr 2025 04:17:31 -0400
X-MC-Unique: d0iXNodIMzSrBfNHCx4XXg-1
X-Mimecast-MFC-AGG-ID: d0iXNodIMzSrBfNHCx4XXg_1745569051
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39143311936so665282f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569050; x=1746173850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5qYX4fxmvotPEe9k1Ldxje/is/5r/CwZVYIsI3ib8k=;
 b=VGZuWC9fRIJXUld3wG/n+O81RZRTUQ5s4NTia9lA3HffpaF0nC1U3wQpp5FuwN23ec
 VK9Vj+kHXCR0KvlTJxH2oqCzTFkUxkGWStYAXGaGmNZ1KdGHHzc0JVTFC/yobdP4vXL8
 Tojy4RxZirnukH5us2lUet7TMQ/4OefHrzC6Vk17borSDY59cXSDPaYqWIlDatARgmqO
 kzsDOeSwqF/qXUhQ4Fx5lWbx6T+XyxXmLSclgJTLEavIug57ZSIYYQkDAqVQmHKZk67k
 gPZJKbgZ0a9CNqjOjGKyLOnFvdtsOiXxAN7436JQb+wOhO1BHKVk94QNW3sa0okjlQVx
 UwlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Vj42YDVIs3taAabT9qQPNb+Hrr/J+BZE4My91vyjXR9+lTzhYKPFlBCb89gUn6IpsbsIiaXARF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy6tzmu1gIGrK12fmxI3q8B82OYlS8I0wAfQI2lHdHJ63y1h5Y
 t2eOQilut/0DmlYTDIdHiOCspVJrTt1t0Xr/eWjqULxZRL4FDdwgGsZQhYpD627kg7IVNHMFYHl
 iKoP6ppjbtEbsZbXxJU7Zgm8qpy75U53zc74a47eXsnMBpdY56xHrhiVu71u961XjfQ==
X-Gm-Gg: ASbGncuub6O5uvfG+S2E8jq29SmNNdE2ZUjpPMyhkvq6fcZaRUvpGoW0d7gHfqD/LkH
 iAEtkv83h0Fm7vFLiXP0Uo+Btc2lP6I4BWvFtZBLg8W6TwH2cW4c9pGTkY8x5WoWy7+8OARzahH
 QlTGMLd6tbWvkAQSgT+GE/v08bMwfdS3W6Vsz9m8cE409UHVhKyEgQOYKAwe4wdhzEru5fWSl38
 PX4/2tVw57Q85u8KPMhIltlSpngd3Jb6vzFSJMIffHkXELOXCAs4cUFrbTVV3lcG4X3oBKLVTGg
 O4KDTtE8yYp+fdY7ftE0gv523kIIyrjwaUR5fAadxLV4fzJHXYpnyim9FfjWFhOLt8p8m7o=
X-Received: by 2002:a5d:5f81:0:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-3a074e1f470mr1107782f8f.16.1745569050539; 
 Fri, 25 Apr 2025 01:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJg971aqo8Jp2DD0sLjroPpaq2VGTsTlnda8tdZOkS/zEdxzp9UNRB8QDEhn4HU4OMmpqxNg==
X-Received: by 2002:a5d:5f81:0:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-3a074e1f470mr1107731f8f.16.1745569049967; 
 Fri, 25 Apr 2025 01:17:29 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073ca4cbcsm1599884f8f.25.2025.04.25.01.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:29 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track() +
 pfnmap_untrack()
Date: Fri, 25 Apr 2025 10:17:09 +0200
Message-ID: <20250425081715.1341199-6-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pi_5ZoKgPLqRhMkyhKWWkLYJD1sFn484xn2hcCY1-_Y_1745569051
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Let's use our new interface. In remap_pfn_range(), we'll now decide
whether we have to track (full VMA covered) or only sanitize the pgprot
(partial VMA covered).

Remember what we have to untrack by linking it from the VMA. When
duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
to anon VMA names, and use a kref to share the tracking.

Once the last VMA un-refs our tracking data, we'll do the untracking,
which simplifies things a lot and should sort our various issues we saw
recently, for example, when partially unmapping/zapping a tracked VMA.

This change implies that we'll keep tracking the original PFN range even
after splitting + partially unmapping it: not too bad, because it was
not working reliably before. The only thing that kind-of worked before
was shrinking such a mapping using mremap(): we managed to adjust the
reservation in a hacky way, now we won't adjust the reservation but
leave it around until all involved VMAs are gone.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm_inline.h |  2 +
 include/linux/mm_types.h  | 11 ++++++
 kernel/fork.c             | 54 ++++++++++++++++++++++++--
 mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
 mm/mremap.c               |  4 --
 5 files changed, 128 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f9157a0c42a5c..89b518ff097e6 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
 
 #endif  /* CONFIG_ANON_VMA_NAME */
 
+void pfnmap_track_ctx_release(struct kref *ref);
+
 static inline void init_tlb_flush_pending(struct mm_struct *mm)
 {
 	atomic_set(&mm->tlb_flush_pending, 0);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f91..91124761cfda8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -764,6 +764,14 @@ struct vma_numab_state {
 	int prev_scan_seq;
 };
 
+#ifdef __HAVE_PFNMAP_TRACKING
+struct pfnmap_track_ctx {
+	struct kref kref;
+	unsigned long pfn;
+	unsigned long size;
+};
+#endif
+
 /*
  * This struct describes a virtual memory area. There is one of these
  * per VM-area/task. A VM area is any part of the process virtual memory
@@ -877,6 +885,9 @@ struct vm_area_struct {
 	struct anon_vma_name *anon_name;
 #endif
 	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
+#ifdef __HAVE_PFNMAP_TRACKING
+	struct pfnmap_track_ctx *pfnmap_track_ctx;
+#endif
 } __randomize_layout;
 
 #ifdef CONFIG_NUMA
diff --git a/kernel/fork.c b/kernel/fork.c
index 168681fc4b25a..ae518b8fe752c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -481,7 +481,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
 #ifdef CONFIG_NUMA
 	dest->vm_policy = src->vm_policy;
 #endif
+#ifdef __HAVE_PFNMAP_TRACKING
+	dest->pfnmap_track_ctx = NULL;
+#endif
+}
+
+#ifdef __HAVE_PFNMAP_TRACKING
+static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
+		struct vm_area_struct *new)
+{
+	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
+
+	if (likely(!ctx))
+		return 0;
+
+	/*
+	 * We don't expect to ever hit this. If ever required, we would have
+	 * to duplicate the tracking.
+	 */
+	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
+		return -ENOMEM;
+	kref_get(&ctx->kref);
+	new->pfnmap_track_ctx = ctx;
+	return 0;
+}
+
+static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
+{
+	struct pfnmap_track_ctx *ctx = vma->pfnmap_track_ctx;
+
+	if (likely(!ctx))
+		return;
+
+	kref_put(&ctx->kref, pfnmap_track_ctx_release);
+	vma->pfnmap_track_ctx = NULL;
+}
+#else
+static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
+		struct vm_area_struct *new)
+{
+	return 0;
 }
+static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
+{
+}
+#endif
 
 struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 {
@@ -493,6 +537,11 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
 	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
 	vm_area_init_from(orig, new);
+
+	if (vma_pfnmap_track_ctx_dup(orig, new)) {
+		kmem_cache_free(vm_area_cachep, new);
+		return NULL;
+	}
 	vma_lock_init(new, true);
 	INIT_LIST_HEAD(&new->anon_vma_chain);
 	vma_numab_state_init(new);
@@ -507,6 +556,7 @@ void vm_area_free(struct vm_area_struct *vma)
 	vma_assert_detached(vma);
 	vma_numab_state_free(vma);
 	free_anon_vma_name(vma);
+	vma_pfnmap_track_ctx_release(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
 
@@ -669,10 +719,6 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 		if (!tmp)
 			goto fail_nomem;
 
-		/* track_pfn_copy() will later take care of copying internal state. */
-		if (unlikely(tmp->vm_flags & VM_PFNMAP))
-			untrack_pfn_clear(tmp);
-
 		retval = vma_dup_policy(mpnt, tmp);
 		if (retval)
 			goto fail_nomem_policy;
diff --git a/mm/memory.c b/mm/memory.c
index c737a8625866a..eb2b3f10a97ec 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1370,7 +1370,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 	struct mm_struct *dst_mm = dst_vma->vm_mm;
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	struct mmu_notifier_range range;
-	unsigned long next, pfn = 0;
+	unsigned long next;
 	bool is_cow;
 	int ret;
 
@@ -1380,12 +1380,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 	if (is_vm_hugetlb_page(src_vma))
 		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
 
-	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
-		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
-		if (ret)
-			return ret;
-	}
-
 	/*
 	 * We need to invalidate the secondary MMU mappings only when
 	 * there could be a permission downgrade on the ptes of the
@@ -1427,8 +1421,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 		raw_write_seqcount_end(&src_mm->write_protect_seq);
 		mmu_notifier_invalidate_range_end(&range);
 	}
-	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
-		untrack_pfn_copy(dst_vma, pfn);
 	return ret;
 }
 
@@ -1923,9 +1915,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 	if (vma->vm_file)
 		uprobe_munmap(vma, start, end);
 
-	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn(vma, 0, 0, mm_wr_locked);
-
 	if (start != end) {
 		if (unlikely(is_vm_hugetlb_page(vma))) {
 			/*
@@ -2871,6 +2860,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
 	return error;
 }
 
+#ifdef __HAVE_PFNMAP_TRACKING
+static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
+		unsigned long size, pgprot_t *prot)
+{
+	struct pfnmap_track_ctx *ctx;
+
+	if (pfnmap_track(pfn, size, prot))
+		return ERR_PTR(-EINVAL);
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (unlikely(!ctx)) {
+		pfnmap_untrack(pfn, size);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ctx->pfn = pfn;
+	ctx->size = size;
+	kref_init(&ctx->kref);
+	return ctx;
+}
+
+void pfnmap_track_ctx_release(struct kref *ref)
+{
+	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
+
+	pfnmap_untrack(ctx->pfn, ctx->size);
+	kfree(ctx);
+}
+#endif /* __HAVE_PFNMAP_TRACKING */
+
 /**
  * remap_pfn_range - remap kernel memory to userspace
  * @vma: user vma to map to
@@ -2883,20 +2902,50 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
  *
  * Return: %0 on success, negative error code otherwise.
  */
+#ifdef __HAVE_PFNMAP_TRACKING
 int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 		    unsigned long pfn, unsigned long size, pgprot_t prot)
 {
+	struct pfnmap_track_ctx *ctx = NULL;
 	int err;
 
-	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
-	if (err)
+	size = PAGE_ALIGN(size);
+
+	/*
+	 * If we cover the full VMA, we'll perform actual tracking, and
+	 * remember to untrack when the last reference to our tracking
+	 * context from a VMA goes away.
+	 *
+	 * If we only cover parts of the VMA, we'll only sanitize the
+	 * pgprot.
+	 */
+	if (addr == vma->vm_start && addr + size == vma->vm_end) {
+		if (vma->pfnmap_track_ctx)
+			return -EINVAL;
+		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+	} else if (pfnmap_sanitize_pgprot(pfn, size, &prot)) {
 		return -EINVAL;
+	}
 
 	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
-	if (err)
-		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
+	if (ctx) {
+		if (err)
+			kref_put(&ctx->kref, pfnmap_track_ctx_release);
+		else
+			vma->pfnmap_track_ctx = ctx;
+	}
 	return err;
 }
+
+#else
+int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
+		    unsigned long pfn, unsigned long size, pgprot_t prot)
+{
+	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
+}
+#endif
 EXPORT_SYMBOL(remap_pfn_range);
 
 /**
diff --git a/mm/mremap.c b/mm/mremap.c
index 7db9da609c84f..6e78e02f74bd3 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
 	if (is_vm_hugetlb_page(vma))
 		clear_vma_resv_huge_pages(vma);
 
-	/* Tell pfnmap has moved from this vma */
-	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn_clear(vma);
-
 	*new_vma_ptr = new_vma;
 	return err;
 }
-- 
2.49.0

