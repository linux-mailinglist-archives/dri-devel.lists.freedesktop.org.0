Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC56B70F8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF67410E4A2;
	Mon, 13 Mar 2023 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785910E158
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 23:42:32 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso9755832wmq.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 16:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678664551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+mP9OxDgYsiVDAz5z+bfOZyYeqjlm5fObrSUjf3HHE=;
 b=L1EvxvspnWq8VbJ/cBPuwim/GfX7GyDcQh25eB8GiiGs7xV6czGIVCDJwylbb/WhpH
 jDFWtcEGZEkI905j9O6EBHcKvsGVqjZK04JkCGnQY528FTc/xGSKUQoJ1yY0pPvKCbzb
 IBNvOTkgsqZyZycwsx8m2Sth1E7Aozlkfg5MUoZCKaaMJPw/6tRWZDo07r5CQODqxUMT
 1IeCaq70mfPubXlyZAz0EF4+uo1ZBp0Z928tN4A3fNLcS0TV/nntMus6BBh64bjYsk9h
 tNxjHKAtpE6j09aXXplCYPYqgmxOLm6RPMn+1oaBSQ4+kPQxO6ASvcd39FdgX1bjTARn
 4pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678664551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q+mP9OxDgYsiVDAz5z+bfOZyYeqjlm5fObrSUjf3HHE=;
 b=2mJTU3JDYqvCS9q+ZCE48kMmeAc7GCSvIp5HXcKiOwqa9aSsPEr6O/7LN2Ef95HI9+
 6RWRUnG3qhJVgRZm7fl557oSsmd5Pe2UL0hMBSbco0uubw+V7KvZaspydVfewz1qx/kF
 sBobOoPBdD+xl2Z60KpALEj/mmgP4FzqzqXg0sPd6Y2ET9AwwGuZvygDZZ+H1WXRhdHM
 +HDjSxBar1nN8DBEVArPKKoq4/+gaaAXHm3CRGS1IEj4KOIg1L3FeC0jL3UxQTwwR3E9
 uti50jyc6xg/orY6FkwfkrlGYN6+QS6BVcJ5kM+7TG025Ypska8VZheo/29HZzUSQMB1
 GDSw==
X-Gm-Message-State: AO0yUKXdkeaxuOBZuojW3Zfl2KHpOj9PS+RY+eAUKiMx04rig0vBh5YX
 xHcogkIKdppBLZpyb9kRBjM=
X-Google-Smtp-Source: AK7set+tGc+DGYJtdNRAq9fRAAuOfnBu6NAnqmDjDmjxC2dzIZIZWRmGTBsrN67MRDZeVRNHzuZI8g==
X-Received: by 2002:a05:600c:350c:b0:3eb:3692:6450 with SMTP id
 h12-20020a05600c350c00b003eb36926450mr10229727wmq.18.1678664550942; 
 Sun, 12 Mar 2023 16:42:30 -0700 (PDT)
Received: from lucifer.home (host86-146-209-214.range86-146.btcentralplus.com.
 [86.146.209.214]) by smtp.googlemail.com with ESMTPSA id
 iz20-20020a05600c555400b003ed201ddef2sm3698376wmb.2.2023.03.12.16.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:42:30 -0700 (PDT)
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] mm: remove unused vmf_insert_mixed_prot()
Date: Sun, 12 Mar 2023 23:40:13 +0000
Message-Id: <a069644388e6f1593a7020d15840e6fc9f39bcaf.1678661628.git.lstoakes@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678661628.git.lstoakes@gmail.com>
References: <cover.1678661628.git.lstoakes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 08:17:55 +0000
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Konig <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sole user of vmf_insert_mixed_prot(), the drm ttm module, stopped using
this in commit f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
citing use of VM_MIXEDMAP in this case being terribly broken.

Remove this now-dead code and references to it, but retain the useful
description of the prot != vma->vm_page_prot case, moving it to
vmf_insert_pfn_prot() instead.

Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
---
 include/linux/mm.h       |  2 --
 include/linux/mm_types.h |  7 +----
 mm/memory.c              | 57 +++++++++++++---------------------------
 3 files changed, 19 insertions(+), 47 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ce1590933995..ee755bb4e1c1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3330,8 +3330,6 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn, pgprot_t pgprot);
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 			pfn_t pfn);
-vm_fault_t vmf_insert_mixed_prot(struct vm_area_struct *vma, unsigned long addr,
-			pfn_t pfn, pgprot_t pgprot);
 vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 		unsigned long addr, pfn_t pfn);
 int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long len);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3a028db80ffb..5ef0d0da328a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -502,12 +502,7 @@ struct vm_area_struct {
 	};
 
 	struct mm_struct *vm_mm;	/* The address space we belong to. */
-
-	/*
-	 * Access permissions of this VMA.
-	 * See vmf_insert_mixed_prot() for discussion.
-	 */
-	pgprot_t vm_page_prot;
+	pgprot_t vm_page_prot;          /* Access permissions of this VMA. */
 
 	/*
 	 * Flags, see mm.h.
diff --git a/mm/memory.c b/mm/memory.c
index 7ca7951adcf5..ee6bcd747867 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2147,8 +2147,20 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
  * vmf_insert_pfn_prot should only be used if using multiple VMAs is
  * impractical.
  *
- * See vmf_insert_mixed_prot() for a discussion of the implication of using
- * a value of @pgprot different from that of @vma->vm_page_prot.
+ * pgprot typically only differs from @vma->vm_page_prot when drivers set
+ * caching- and encryption bits different than those of @vma->vm_page_prot,
+ * because the caching- or encryption mode may not be known at mmap() time.
+ *
+ * This is ok as long as @vma->vm_page_prot is not used by the core vm
+ * to set caching and encryption bits for those vmas (except for COW pages).
+ * This is ensured by core vm only modifying these page table entries using
+ * functions that don't touch caching- or encryption bits, using pte_modify()
+ * if needed. (See for example mprotect()).
+ *
+ * Also when new page-table entries are created, this is only done using the
+ * fault() callback, and never using the value of vma->vm_page_prot,
+ * except for page-table entries that point to anonymous pages as the result
+ * of COW.
  *
  * Context: Process context.  May allocate using %GFP_KERNEL.
  * Return: vm_fault_t value.
@@ -2223,9 +2235,9 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
 }
 
 static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
-		unsigned long addr, pfn_t pfn, pgprot_t pgprot,
-		bool mkwrite)
+		unsigned long addr, pfn_t pfn, bool mkwrite)
 {
+	pgprot_t pgprot = vma->vm_page_prot;
 	int err;
 
 	BUG_ON(!vm_mixed_ok(vma, pfn));
@@ -2268,43 +2280,10 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	return VM_FAULT_NOPAGE;
 }
 
-/**
- * vmf_insert_mixed_prot - insert single pfn into user vma with specified pgprot
- * @vma: user vma to map to
- * @addr: target user address of this page
- * @pfn: source kernel pfn
- * @pgprot: pgprot flags for the inserted page
- *
- * This is exactly like vmf_insert_mixed(), except that it allows drivers
- * to override pgprot on a per-page basis.
- *
- * Typically this function should be used by drivers to set caching- and
- * encryption bits different than those of @vma->vm_page_prot, because
- * the caching- or encryption mode may not be known at mmap() time.
- * This is ok as long as @vma->vm_page_prot is not used by the core vm
- * to set caching and encryption bits for those vmas (except for COW pages).
- * This is ensured by core vm only modifying these page table entries using
- * functions that don't touch caching- or encryption bits, using pte_modify()
- * if needed. (See for example mprotect()).
- * Also when new page-table entries are created, this is only done using the
- * fault() callback, and never using the value of vma->vm_page_prot,
- * except for page-table entries that point to anonymous pages as the result
- * of COW.
- *
- * Context: Process context.  May allocate using %GFP_KERNEL.
- * Return: vm_fault_t value.
- */
-vm_fault_t vmf_insert_mixed_prot(struct vm_area_struct *vma, unsigned long addr,
-				 pfn_t pfn, pgprot_t pgprot)
-{
-	return __vm_insert_mixed(vma, addr, pfn, pgprot, false);
-}
-EXPORT_SYMBOL(vmf_insert_mixed_prot);
-
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 		pfn_t pfn)
 {
-	return __vm_insert_mixed(vma, addr, pfn, vma->vm_page_prot, false);
+	return __vm_insert_mixed(vma, addr, pfn, false);
 }
 EXPORT_SYMBOL(vmf_insert_mixed);
 
@@ -2316,7 +2295,7 @@ EXPORT_SYMBOL(vmf_insert_mixed);
 vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 		unsigned long addr, pfn_t pfn)
 {
-	return __vm_insert_mixed(vma, addr, pfn, vma->vm_page_prot, true);
+	return __vm_insert_mixed(vma, addr, pfn, true);
 }
 EXPORT_SYMBOL(vmf_insert_mixed_mkwrite);
 
-- 
2.39.2

