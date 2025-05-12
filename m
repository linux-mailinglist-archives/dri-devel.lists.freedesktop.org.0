Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4297AB3708
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057A310E3E1;
	Mon, 12 May 2025 12:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NHUhaLLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA0A10E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYDrLvG5XDZK2S7Vzjb3pmEnm43v74kkrfTla5+cPZI=;
 b=NHUhaLLyzpyRRsQrpd3sK+uwdDu5BdmEDqMUS36GRK/4GmXd+1epxUdddNsoApW45cSeD6
 2utAwyhdP7ouZbQvWgrPzCmOYfE+hvz6S/TSbKYZVH3xw+vHYTvLkNAaGlIduFHpK8aY0m
 4Y/Z7vWu4fKfzW4LZL9WRqnvpMqllHw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-f4-9_wDaMKeSYHGIsH1IuA-1; Mon, 12 May 2025 08:34:39 -0400
X-MC-Unique: f4-9_wDaMKeSYHGIsH1IuA-1
X-Mimecast-MFC-AGG-ID: f4-9_wDaMKeSYHGIsH1IuA_1747053278
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a0bd786a53so1767582f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053278; x=1747658078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NYDrLvG5XDZK2S7Vzjb3pmEnm43v74kkrfTla5+cPZI=;
 b=Lp0FJbbEYDBq1A7eR2ydcoCTv+AuzEMTAMmTlddST9YF5/zeTJXGwtM070jGdCB1Ra
 wEWRd5BHH5YZMl02SSaZyLcM/ouhZuvswUZSSBsfITsk+fQ0ylVuPZk7LWK0aWb43eaT
 jCga4jp4eny+d+/sblhGB1b/ekHPKJcJG0If9IjAbp6uBMD1rcfSYhRsd7ezo7ZBYr02
 qyBuu0Cam9cyssK/6e518FGWn2yz02xrt1n1tNCSvkTAxIPG1E/jP/fmj46IXhqbXY4d
 d8+DfhYhukMpEMBZMnZ0FAg6fCivSk/yCSpdvhnv+5t3M3Y0yGXyV9+uTEIFdNZ6b6NZ
 G0TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzx1l+rUQ/RuqSGTXP79URbLnz4TitHMzvt04d70FXc4zIrWWjuqGQD9PiVMmXyZnd/OX8/uu8U8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyiy+mSQ7Tu3D6VawMbUVCLdq28dzkJFCxfaxLj/Qa6hMicgy+F
 OVMRwGHoFUVpH1/xy02zb95hvqFEyg61Bg7icgXqznVLsBCoMnqHQ6rNMBXwyv3uGvu032XZlll
 /JW/EqkbOsv2Ut0FBb1wPtS5nsbMYAt4KVA3wxA62GERtvyUqa97Z2v40eDSM/jMoJQ==
X-Gm-Gg: ASbGncsCG5VvqrHjcly9/8yIG3l9Yv2+tiOJE2dHqWwShc0OYpjbUEx0uYZrcu1qDQd
 ydfg0TvJjIHBBe2JxQxw3uCdaBnYYKYMkgtjD79OzwIjVeJfOz9GsKniJqT9ofpDM8Y21HG0dF+
 7EOTQZypIciSB+uDfbTs+ta5PO0u/j2mzyih2bio844eqbMepT8hXWmKm5+JDRnjWD/ZQDsVltR
 MNgKBj2QHlV/sgV9BCVQ2je2Q5MU+EcNfpUWtDnBVajKS6ONZBhABEVcqOgnXYKqX4MTLINp+1y
 uOj1SOVN5EJxO2R1axCZdZTEtfBS5U+Mlm2e452JpGaFjWer4HuCqBMk6le2P7MO/yVBVjMK
X-Received: by 2002:a05:6000:430d:b0:3a0:b9a9:2fd9 with SMTP id
 ffacd0b85a97d-3a1f64a34c6mr10772122f8f.51.1747053278110; 
 Mon, 12 May 2025 05:34:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhxNuxHtjAVwepTb/c5WYjIAvKZdsEfHNK/tmk5VSXnQqEoBOKdiBfd2UyPw5vI1dksu9fng==
X-Received: by 2002:a05:6000:430d:b0:3a0:b9a9:2fd9 with SMTP id
 ffacd0b85a97d-3a1f64a34c6mr10772084f8f.51.1747053277633; 
 Mon, 12 May 2025 05:34:37 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d687ae10sm123566305e9.37.2025.05.12.05.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:36 -0700 (PDT)
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 04/11] mm: convert VM_PFNMAP tracking to pfnmap_track() +
 pfnmap_untrack()
Date: Mon, 12 May 2025 14:34:17 +0200
Message-ID: <20250512123424.637989-5-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f4aCjdyE5WWSnEYrhjHPPm8zMval4W0qJnaodya5OHc_1747053278
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
whether we have to track (full VMA covered) or only lookup the
cachemode (partial VMA covered).

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

If that ever turns out to be an issue, we could hook into VM splitting
code and split the tracking; however, that adds complexity that might
not be required, so we'll keep it simple for now.

Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm_inline.h |  2 +
 include/linux/mm_types.h  | 11 ++++++
 mm/memory.c               | 82 +++++++++++++++++++++++++++++++--------
 mm/mmap.c                 |  5 ---
 mm/mremap.c               |  4 --
 mm/vma_init.c             | 50 ++++++++++++++++++++++++
 6 files changed, 129 insertions(+), 25 deletions(-)

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
index 15808cad2bc1a..3e934dc6057c4 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -763,6 +763,14 @@ struct vma_numab_state {
 	int prev_scan_seq;
 };
 
+#ifdef __HAVE_PFNMAP_TRACKING
+struct pfnmap_track_ctx {
+	struct kref kref;
+	unsigned long pfn;
+	unsigned long size;	/* in bytes */
+};
+#endif
+
 /*
  * Describes a VMA that is about to be mmap()'ed. Drivers may choose to
  * manipulate mutable fields which will cause those fields to be updated in the
@@ -900,6 +908,9 @@ struct vm_area_struct {
 	struct anon_vma_name *anon_name;
 #endif
 	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
+#ifdef __HAVE_PFNMAP_TRACKING
+	struct pfnmap_track_ctx *pfnmap_track_ctx;
+#endif
 } __randomize_layout;
 
 #ifdef CONFIG_NUMA
diff --git a/mm/memory.c b/mm/memory.c
index 064fc55d8eab9..4cf4adb0de266 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1371,7 +1371,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 	struct mm_struct *dst_mm = dst_vma->vm_mm;
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	struct mmu_notifier_range range;
-	unsigned long next, pfn = 0;
+	unsigned long next;
 	bool is_cow;
 	int ret;
 
@@ -1381,12 +1381,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
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
@@ -1428,8 +1422,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 		raw_write_seqcount_end(&src_mm->write_protect_seq);
 		mmu_notifier_invalidate_range_end(&range);
 	}
-	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
-		untrack_pfn_copy(dst_vma, pfn);
 	return ret;
 }
 
@@ -1924,9 +1916,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 	if (vma->vm_file)
 		uprobe_munmap(vma, start, end);
 
-	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn(vma, 0, 0, mm_wr_locked);
-
 	if (start != end) {
 		if (unlikely(is_vm_hugetlb_page(vma))) {
 			/*
@@ -2872,6 +2861,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
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
@@ -2884,20 +2903,51 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
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
+	 * context from a VMA goes away. We'll keep tracking the whole pfn
+	 * range even during VMA splits and partial unmapping.
+	 *
+	 * If we only cover parts of the VMA, we'll only setup the cachemode
+	 * in the pgprot for the pfn range.
+	 */
+	if (addr == vma->vm_start && addr + size == vma->vm_end) {
+		if (vma->pfnmap_track_ctx)
+			return -EINVAL;
+		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+	} else if (pfnmap_setup_cachemode(pfn, size, &prot)) {
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
diff --git a/mm/mmap.c b/mm/mmap.c
index 50f902c08341a..09c563c951123 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1784,11 +1784,6 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 		tmp = vm_area_dup(mpnt);
 		if (!tmp)
 			goto fail_nomem;
-
-		/* track_pfn_copy() will later take care of copying internal state. */
-		if (unlikely(tmp->vm_flags & VM_PFNMAP))
-			untrack_pfn_clear(tmp);
-
 		retval = vma_dup_policy(mpnt, tmp);
 		if (retval)
 			goto fail_nomem_policy;
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
diff --git a/mm/vma_init.c b/mm/vma_init.c
index 967ca85179864..8e53c7943561e 100644
--- a/mm/vma_init.c
+++ b/mm/vma_init.c
@@ -71,7 +71,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
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
@@ -83,6 +127,11 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
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
@@ -97,5 +146,6 @@ void vm_area_free(struct vm_area_struct *vma)
 	vma_assert_detached(vma);
 	vma_numab_state_free(vma);
 	free_anon_vma_name(vma);
+	vma_pfnmap_track_ctx_release(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
-- 
2.49.0

