Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56F5A5036B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C23210E7BB;
	Wed,  5 Mar 2025 15:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PebotOcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F810E7BB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741188414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mzd4XGn+uFEzS0vbdAuX3w3DrwjWbNhsj0Skkz0C+/o=;
 b=PebotOcVmC9YAcwygE5/4wsjDFv7kI4VCur3gCwuLhw+DcOZsTxClEWRlXplU1NQbQGgSy
 DTzAQXn2R0stywxihYWq1koTIA1BK6KSBEDmm02uTLvbgMdYa0w8ntT/rawYWp2YUF2b6H
 dYGFsIqUPnCOQwcFw0EOmi661G+fAYs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-Egn3VflhPL6gsa7bQsnN2A-1; Wed, 05 Mar 2025 10:26:42 -0500
X-MC-Unique: Egn3VflhPL6gsa7bQsnN2A-1
X-Mimecast-MFC-AGG-ID: Egn3VflhPL6gsa7bQsnN2A_1741188401
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-223725aa321so41638355ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 07:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741188401; x=1741793201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mzd4XGn+uFEzS0vbdAuX3w3DrwjWbNhsj0Skkz0C+/o=;
 b=g4PbM5kE4yvckiuWFmRRgY85KzTkyi6nlsSG26Ja5nh8CHpMHGcOOXJQaMjXiG/N3H
 vGpjpl1Onb++3BiuoHTmfmQoSD0gVLldCrI6afzkvj5jPmj0oMdHxzx0x5a57x3BecrC
 jBgCTrXHsDRsY6UCS72t3MXrb/24LxD1CqAuapm8epwk2prZekLC/yb6b5jXGsyOOSME
 s1agayIjEWZF0PGETZe+JAva/ebDk7YTVISgrgZgqxxgVeEE9F/K+YR6xw1tN8mzADYt
 FJFtaWz9n+3MVi7hA2Zul9yNZpLw27vU6iB01gEr36p04Rs2tlT6n1bV9zRl/HBdRfQL
 ZmYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC3s0h2nf7AZlQ4Sz1nbf9TJKLHv/St11KojuFdG1CtmpUqm+r9S+YOiQUljbtrulZ38kQ1uVDdAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx99A9jdpux3W9eMPAydZWBXmavb/lQZcDJDhUWMOH8Aln5NGtA
 tLcB6KZvqNas83xdZB6vx/+YEcRglLCCUoU2GZM5V2V1LHERB3M5OB7jHrHAl+jWeJD1KtNDK4I
 aVVXPWkfRgsse67A0pUjF1nib1Xt/5PA6Y84pvBNKiLLLttfkN5SlMOhu70e1MbseCQ==
X-Gm-Gg: ASbGncvXpHjbyLFXMDgqi81iQsB22UzIyRRLdfkcION3OLA/0jsMUG/9tbJTghK02iP
 w11tnw4saUdbVTmZNe84jinQ2TJSW9Kdx9+0Aaw0/LZF2xUvgXN1WAxOC4C9aEejrZaTbABzglP
 81jhk32oIMXWZ6FYT+3dQ8RRpok2CYzRn3oNax0MBtlhueqMxjDcB+fn1rDZvqIBeeTKtRiF09v
 xgdgY7b/TQkcUrYGutMkQkn2CJUDCvR5BfWURQ2AM5UozCgXK1IAyAT8seP1RsE6E/V8stspxO/
 Y3PPPxdv1op03Og8
X-Received: by 2002:a17:902:d4c5:b0:220:ea90:1925 with SMTP id
 d9443c01a7336-223f1d20313mr60493165ad.35.1741188401116; 
 Wed, 05 Mar 2025 07:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECC+BX4uW9YAdKPYnu6dCDuOObXXtjhxLSSHWa2EsQXKtadkIakYvJhvOdDY/oZGXAYMQVLw==
X-Received: by 2002:a17:902:d4c5:b0:220:ea90:1925 with SMTP id
 d9443c01a7336-223f1d20313mr60492655ad.35.1741188400762; 
 Wed, 05 Mar 2025 07:26:40 -0800 (PST)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7364b4eff66sm6983292b3a.83.2025.03.05.07.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:26:40 -0800 (PST)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, akpm@linux-foundation.org,
 urezki@gmail.com, hch@infradead.org, dmitry.osipenko@collabora.com,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
Subject: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
Date: Thu,  6 Mar 2025 00:25:53 +0900
Message-ID: <20250305152555.318159-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305152555.318159-1-ryasuoka@redhat.com>
References: <20250305152555.318159-1-ryasuoka@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WcPjfJNvEyymBvb3yWKzwrKOW1kwEQUX8aXISy_IfFo_1741188401
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

Some drivers can use vmap in drm_panic, however, vmap is sleepable and
takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
requests pages with GFP_ATOMIC and maps KVA without locks and sleep.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 include/linux/vmalloc.h |   2 +
 mm/internal.h           |   5 ++
 mm/vmalloc.c            | 105 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 31e9ffd936e3..c7a2a9a1976d 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -190,6 +190,8 @@ void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
 
+extern void *atomic_vmap(struct page **pages, unsigned int count,
+			 unsigned long flags, pgprot_t prot);
 extern void *vmap(struct page **pages, unsigned int count,
 			unsigned long flags, pgprot_t prot);
 void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot);
diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..134b332bf5b9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1278,6 +1278,11 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 void free_zone_device_folio(struct folio *folio);
 int migrate_device_coherent_folio(struct folio *folio);
 
+struct vm_struct *atomic_get_vm_area_node(unsigned long size, unsigned long align,
+					  unsigned long shift, unsigned long flags,
+					  unsigned long start, unsigned long end, int node,
+					  gfp_t gfp_mask, const void *caller);
+
 struct vm_struct *__get_vm_area_node(unsigned long size,
 				     unsigned long align, unsigned long shift,
 				     unsigned long flags, unsigned long start,
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a6e7acebe9ad..f5c93779c60a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1945,6 +1945,57 @@ static inline void setup_vmalloc_vm(struct vm_struct *vm,
 	va->vm = vm;
 }
 
+static struct vmap_area *atomic_alloc_vmap_area(unsigned long size,
+						unsigned long align,
+						unsigned long vstart, unsigned long vend,
+						int node, gfp_t gfp_mask,
+						unsigned long va_flags, struct vm_struct *vm)
+{
+	struct vmap_node *vn;
+	struct vmap_area *va;
+	unsigned long addr;
+
+	if (unlikely(!size || offset_in_page(size) || !is_power_of_2(align)))
+		return ERR_PTR(-EINVAL);
+
+	if (unlikely(!vmap_initialized))
+		return ERR_PTR(-EBUSY);
+
+	va = kmem_cache_alloc_node(vmap_area_cachep, gfp_mask, node);
+	if (unlikely(!va))
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Only scan the relevant parts containing pointers to other objects
+	 * to avoid false negatives.
+	 */
+	kmemleak_scan_area(&va->rb_node, SIZE_MAX, gfp_mask);
+
+	addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
+				 size, align, vstart, vend);
+
+	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
+
+	va->va_start = addr;
+	va->va_end = addr + size;
+	va->vm = NULL;
+	va->flags = va_flags;
+
+	vm->addr = (void *)va->va_start;
+	vm->size = va_size(va);
+	va->vm = vm;
+
+	vn = addr_to_node(va->va_start);
+
+	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
+
+	BUG_ON(!IS_ALIGNED(va->va_start, align));
+	BUG_ON(va->va_start < vstart);
+	BUG_ON(va->va_end > vend);
+
+	return va;
+}
+
 /*
  * Allocate a region of KVA of the specified size and alignment, within the
  * vstart and vend. If vm is passed in, the two will also be bound.
@@ -3106,6 +3157,33 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
 	vm->flags &= ~VM_UNINITIALIZED;
 }
 
+struct vm_struct *atomic_get_vm_area_node(unsigned long size, unsigned long align,
+					  unsigned long shift, unsigned long flags,
+					  unsigned long start, unsigned long end, int node,
+					  gfp_t gfp_mask, const void *caller)
+{
+	struct vmap_area *va;
+	struct vm_struct *area;
+
+	size = ALIGN(size, 1ul << shift);
+	if (unlikely(!size))
+		return NULL;
+
+	area = kzalloc_node(sizeof(*area), gfp_mask, node);
+	if (unlikely(!area))
+		return NULL;
+
+	size += PAGE_SIZE;
+	area->flags = flags;
+	area->caller = caller;
+
+	va = atomic_alloc_vmap_area(size, align, start, end, node, gfp_mask, 0, area);
+	if (IS_ERR(va))
+		return NULL;
+
+	return area;
+}
+
 struct vm_struct *__get_vm_area_node(unsigned long size,
 		unsigned long align, unsigned long shift, unsigned long flags,
 		unsigned long start, unsigned long end, int node,
@@ -3418,6 +3496,33 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+void *atomic_vmap(struct page **pages, unsigned int count,
+		  unsigned long flags, pgprot_t prot)
+{
+	struct vm_struct *area;
+	unsigned long addr;
+	unsigned long size;		/* In bytes */
+
+	if (count > totalram_pages())
+		return NULL;
+
+	size = (unsigned long)count << PAGE_SHIFT;
+	area = atomic_get_vm_area_node(size, 1, PAGE_SHIFT, flags,
+				       VMALLOC_START, VMALLOC_END,
+				       NUMA_NO_NODE, GFP_ATOMIC,
+				       __builtin_return_address(0));
+	if (!area)
+		return NULL;
+
+	addr = (unsigned long)area->addr;
+	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
+			     pages, PAGE_SHIFT) < 0) {
+		return NULL;
+	}
+
+	return area->addr;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
-- 
2.48.1

