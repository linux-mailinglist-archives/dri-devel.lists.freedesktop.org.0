Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0A4A9C0A4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D799610E2E0;
	Fri, 25 Apr 2025 08:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b7mZWJGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8C710E8B0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Va9GMEIBRGZSICWJDrjnUC4vZ0n+XJyTsP+h0wQhX1w=;
 b=b7mZWJGfDQgzSynBQVa3X2oQEv+45ccUPEPRbMmqB4Eiypr4eD/Dsb5Nr+hjbjVTqm7xU+
 dUqdCGho2D56w0pPHbttKriL1XgfVvqdPeW2tbIOA4iGIjXI4yvFtSESQ7gfsdAdJTC8dg
 c7Hj+SEWH83247P0tcg5cy9pelUJNBs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-uNRmVFjuOryptGLkqEaNjg-1; Fri, 25 Apr 2025 04:17:24 -0400
X-MC-Unique: uNRmVFjuOryptGLkqEaNjg-1
X-Mimecast-MFC-AGG-ID: uNRmVFjuOryptGLkqEaNjg_1745569044
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so9149845e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569043; x=1746173843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Va9GMEIBRGZSICWJDrjnUC4vZ0n+XJyTsP+h0wQhX1w=;
 b=PsHLf+tmwlB3cMAUYGzxAyud8yITZX9wyOtrlUlHiAPGsF4z36CstFFxzKSynMO05e
 wIBhu1qsS/kaqBQPcf4fJPthn9yEhUZeZuGUjVc6LwFCCv4mdu5hB+9+g1vRr6hGknoD
 CS8qXuzuD8Ru/sFVAWrEIfMDiYKR4VgpC5TQaIdofPLmSY05gv4pRDP2G4ARYliw34dV
 wPnQThgHrqQnPvLE7RXtq5ekKtAla6SRhL5Z9oGnfwvC6+LkH0L3KpT3eK0zk8QiAPEH
 vCBIQzo8R+ZmPmUiw16CEtw78sBgW2pfsBueSY+V9bJegKSlsscO8g24+hO4fdlAkVp8
 lN9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6xcEMlIUygvgUuwSMD9cTodwAnp0cHvxSXAsUfhsNNYyXLoLEgFDCfYgviGHHR30+IWt6KWp1JHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrrFnvC+DQiI1QmySkyZLGlRrIn872D6WdqW6hHvVINrUArR2l
 DIjWXtUPB/Z+jWjYTwZZfKUTZGrtdMKWYHW4qUARgseSAoxTeMQwE3xh2ot3eQSZyQ8+Ciw2NXH
 2hX6y4qQ5alS4rlP3zqudpm0FNbwHqw1u7TuKRyec5NUx5U3LcXYJBbHTSkDitxfx4w==
X-Gm-Gg: ASbGnctWZyoX7l+tigOqxbG3hWP7DjJrRw0ePsFG9Tap3IPb4+13XoU65l51Hf4bypP
 iaUn5mX9+JyjTHsGYlpbeSyM3CTs8DTCbPp001B6j3t+Tj6jgL489TPSVAbHhAqKzRGSIou8q+1
 RvEmw2IYynHXuh805gbtnhXeB9WFAgzmulKjKB0y9aR7WTUMfMc/lIpPNcLwaFfrMetUsDzGzrg
 ULfaLecgnKGN2JkmSl405R9QcvVlU2ZDu0oz5GlPHHYgDzS7Ig98XGWjOskD0geRRlhQIGiV6wp
 MCIIckIiMjPtekelzBDtijIfBBDZzx/iW4nISIGD5Du7g4eWcgP77LfEt224EBswjFpfd4g=
X-Received: by 2002:a05:600c:468c:b0:43c:f616:f08 with SMTP id
 5b1f17b1804b1-440a65dedaemr9657355e9.8.1745569043626; 
 Fri, 25 Apr 2025 01:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI2/wK7u3Fl0eXpHmAGhyuo+dEfVtSzaDltjMj3X9fGs+yaHAUGB9HAX3epv5bPb/ULJhkQA==
X-Received: by 2002:a05:600c:468c:b0:43c:f616:f08 with SMTP id
 5b1f17b1804b1-440a65dedaemr9657095e9.8.1745569043248; 
 Fri, 25 Apr 2025 01:17:23 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4409d2e0241sm48926175e9.37.2025.04.25.01.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:22 -0700 (PDT)
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
Subject: [PATCH v1 02/11] mm: convert track_pfn_insert() to
 pfnmap_sanitize_pgprot()
Date: Fri, 25 Apr 2025 10:17:06 +0200
Message-ID: <20250425081715.1341199-3-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LORig3qHFtw888lXN_Uyt7PkdzU0REMgrDm5JdzlOQQ_1745569044
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

... by factoring it out from track_pfn_remap().

For PMDs/PUDs, actually check the full range, and trigger a fallback
if we run into this "different memory types / cachemodes" scenario.

Add some documentation.

Will checking each page result in undesired overhead? We'll have to
learn. Not checking each page looks wrong, though. Maybe we could
optimize the lookup internally.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 24 ++++++++----------------
 include/linux/pgtable.h   | 28 ++++++++++++++++++++--------
 mm/huge_memory.c          |  7 +++++--
 mm/memory.c               |  4 ++--
 4 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index edec5859651d6..193e33251b18f 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1031,7 +1031,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 		    unsigned long pfn, unsigned long addr, unsigned long size)
 {
 	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
-	enum page_cache_mode pcm;
 
 	/* reserve the whole chunk starting from paddr */
 	if (!vma || (addr == vma->vm_start
@@ -1044,13 +1043,17 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 		return ret;
 	}
 
+	return pfnmap_sanitize_pgprot(pfn, size, prot);
+}
+
+int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size, pgprot_t *prot)
+{
+	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+	enum page_cache_mode pcm;
+
 	if (!pat_enabled())
 		return 0;
 
-	/*
-	 * For anything smaller than the vma size we set prot based on the
-	 * lookup.
-	 */
 	pcm = lookup_memtype(paddr);
 
 	/* Check memtype for the remaining pages */
@@ -1065,17 +1068,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 	return 0;
 }
 
-void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
-{
-	enum page_cache_mode pcm;
-
-	if (!pat_enabled())
-		return;
-
-	pcm = lookup_memtype(pfn_t_to_phys(pfn));
-	pgprot_set_cachemode(prot, pcm);
-}
-
 /*
  * untrack_pfn is called while unmapping a pfnmap for a region.
  * untrack can be called for a specific region indicated by pfn and size or
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c921..91aadfe2515a5 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1500,13 +1500,10 @@ static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 	return 0;
 }
 
-/*
- * track_pfn_insert is called when a _new_ single pfn is established
- * by vmf_insert_pfn().
- */
-static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
-				    pfn_t pfn)
+static inline int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
+		pgprot_t *prot)
 {
+	return 0;
 }
 
 /*
@@ -1556,8 +1553,23 @@ static inline void untrack_pfn_clear(struct vm_area_struct *vma)
 extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 			   unsigned long pfn, unsigned long addr,
 			   unsigned long size);
-extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
-			     pfn_t pfn);
+
+/**
+ * pfnmap_sanitize_pgprot - sanitize the pgprot for a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range
+ * @prot: the pgprot to sanitize
+ *
+ * Sanitize the given pgprot for a pfn range, for example, adjusting the
+ * cachemode.
+ *
+ * This function cannot fail for a single page, but can fail for multiple
+ * pages.
+ *
+ * Returns 0 on success and -EINVAL on error.
+ */
+int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
+		pgprot_t *prot);
 extern int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn);
 extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index fdcf0a6049b9f..b8ae5e1493315 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1455,7 +1455,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 			return VM_FAULT_OOM;
 	}
 
-	track_pfn_insert(vma, &pgprot, pfn);
+	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
+		return VM_FAULT_FALLBACK;
+
 	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
 	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
 			pgtable);
@@ -1577,7 +1579,8 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, pfn);
+	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
+		return VM_FAULT_FALLBACK;
 
 	ptl = pud_lock(vma->vm_mm, vmf->pud);
 	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
diff --git a/mm/memory.c b/mm/memory.c
index 424420349bd3c..c737a8625866a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2563,7 +2563,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 	if (!pfn_modify_allowed(pfn, pgprot))
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
+	pfnmap_sanitize_pgprot(pfn, PAGE_SIZE, &pgprot);
 
 	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
 			false);
@@ -2626,7 +2626,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, pfn);
+	pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot);
 
 	if (!pfn_modify_allowed(pfn_t_to_pfn(pfn), pgprot))
 		return VM_FAULT_SIGBUS;
-- 
2.49.0

