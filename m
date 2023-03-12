Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B955B6B70F7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592E10E4A3;
	Mon, 13 Mar 2023 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3342310E440
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 23:42:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id ay8so1525025wmb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678664552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5BwzPdb3pP6HQP4bpfNX6Ih3sOxfK6TuzT4vYnYmzI=;
 b=maz9e2QTegb5aGWaMrUn0W1T4Yb7pAPV4qShHMkAP0jmTAZnGYuceUYaHypxk3ZK3n
 ZDBqAaSh4+ktG95WP3CVzvvsS2QYlwldP0jD7mTJmW1UGRN168RC1lxMVOZZ1PQh6TOP
 +y2rQ91YejaLYBVYdHPFlUg3gA+SBPTgCXZkunTCQq/KKrnRLP5bUKBFIC/AQiIgFbRE
 9s1UuvtwQdsPaN9SJ22GP58vW9sS051TMmx+qiNlQayml8SjCelQJT8pch0Nw/dG8/SL
 tYw6OY+zWYtLnjRJ7LUlFPQgbzFk8ileybTIoNKp4/+CPVyIglWvzyNCWtisu9Kn/kcB
 nHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678664552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5BwzPdb3pP6HQP4bpfNX6Ih3sOxfK6TuzT4vYnYmzI=;
 b=5atoY1PiMiLetrusRR7NrCr6Agmlm0e3840cjG1MBXfrqSPvSyOrfY0HwXj8oEGtIc
 1D/JMeWufhuc5BWUDggGPnUONd1N44TAlymxq8xLdG+TDWrwhL1687w0HfpgMsSsw8ac
 tgLozYaxS0E1Ev44UGhu3iuqumPL/MU0mUKc90lZ4ZeO/qeEKdehnh8hHrDJcdEpY4Nm
 VZ8feZkt7AUcTl7oBE6inGeEYCInJ/kHHIMiaWe2jhkfIHcs7sVPFQ+VJS56VrbFO6gn
 A5Zch8+Ij531vISD03q29HhkktmBuoj7zeVXwbYq4LegwyzUHSegMAxBFB73YgtQICmz
 NG7g==
X-Gm-Message-State: AO0yUKXoqhDkx0C5qHUgPZfx2m2ErHGWaT8bIUsRe6MpFRmN1ETikl5q
 Xc+Yt2WE77MbIM1C0xm6GxY=
X-Google-Smtp-Source: AK7set88QQ6jrd1M0hrmNofJDYtEfX1glIjDn7W2t6EdL0uThkNjlqD3H5zcW/MHqEOtS/rhvVi/CQ==
X-Received: by 2002:a05:600c:1d29:b0:3eb:3945:d3f4 with SMTP id
 l41-20020a05600c1d2900b003eb3945d3f4mr10055016wms.2.1678664552343; 
 Sun, 12 Mar 2023 16:42:32 -0700 (PDT)
Received: from lucifer.home (host86-146-209-214.range86-146.btcentralplus.com.
 [86.146.209.214]) by smtp.googlemail.com with ESMTPSA id
 iz20-20020a05600c555400b003ed201ddef2sm3698376wmb.2.2023.03.12.16.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:42:31 -0700 (PDT)
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] mm: Remove vmf_insert_pfn_xxx_prot() for huge page-table
 entries
Date: Sun, 12 Mar 2023 23:40:14 +0000
Message-Id: <604c2ad79659d4b8a6e3e1611c6219d5d3233988.1678661628.git.lstoakes@gmail.com>
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

This functionality's sole user, the drm ttm module, removed support for it
in commit 0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()") as the
whole approach is currently unworkable without a PMD/PUD special bit and
updates to GUP.

Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
---
 include/linux/huge_mm.h | 39 ++-------------------------------------
 mm/huge_memory.c        | 31 +++++++++++++------------------
 2 files changed, 15 insertions(+), 55 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 70bd867eba94..3c52fc9d85dc 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -39,44 +39,9 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
 		    unsigned long cp_flags);
-vm_fault_t vmf_insert_pfn_pmd_prot(struct vm_fault *vmf, pfn_t pfn,
-				   pgprot_t pgprot, bool write);
 
-/**
- * vmf_insert_pfn_pmd - insert a pmd size pfn
- * @vmf: Structure describing the fault
- * @pfn: pfn to insert
- * @pgprot: page protection to use
- * @write: whether it's a write fault
- *
- * Insert a pmd size pfn. See vmf_insert_pfn() for additional info.
- *
- * Return: vm_fault_t value.
- */
-static inline vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn,
-					    bool write)
-{
-	return vmf_insert_pfn_pmd_prot(vmf, pfn, vmf->vma->vm_page_prot, write);
-}
-vm_fault_t vmf_insert_pfn_pud_prot(struct vm_fault *vmf, pfn_t pfn,
-				   pgprot_t pgprot, bool write);
-
-/**
- * vmf_insert_pfn_pud - insert a pud size pfn
- * @vmf: Structure describing the fault
- * @pfn: pfn to insert
- * @pgprot: page protection to use
- * @write: whether it's a write fault
- *
- * Insert a pud size pfn. See vmf_insert_pfn() for additional info.
- *
- * Return: vm_fault_t value.
- */
-static inline vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn,
-					    bool write)
-{
-	return vmf_insert_pfn_pud_prot(vmf, pfn, vmf->vma->vm_page_prot, write);
-}
+vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
+vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
 
 enum transparent_hugepage_flag {
 	TRANSPARENT_HUGEPAGE_NEVER_DAX,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b0ab247939e0..5a0e5e84ab13 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -889,23 +889,20 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 }
 
 /**
- * vmf_insert_pfn_pmd_prot - insert a pmd size pfn
+ * vmf_insert_pfn_pmd - insert a pmd size pfn
  * @vmf: Structure describing the fault
  * @pfn: pfn to insert
- * @pgprot: page protection to use
  * @write: whether it's a write fault
  *
- * Insert a pmd size pfn. See vmf_insert_pfn() for additional info and
- * also consult the vmf_insert_mixed_prot() documentation when
- * @pgprot != @vmf->vma->vm_page_prot.
+ * Insert a pmd size pfn. See vmf_insert_pfn() for additional info.
  *
  * Return: vm_fault_t value.
  */
-vm_fault_t vmf_insert_pfn_pmd_prot(struct vm_fault *vmf, pfn_t pfn,
-				   pgprot_t pgprot, bool write)
+vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 {
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
+	pgprot_t pgprot = vma->vm_page_prot;
 	pgtable_t pgtable = NULL;
 
 	/*
@@ -933,7 +930,7 @@ vm_fault_t vmf_insert_pfn_pmd_prot(struct vm_fault *vmf, pfn_t pfn,
 	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
 	return VM_FAULT_NOPAGE;
 }
-EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd_prot);
+EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
@@ -944,9 +941,10 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 }
 
 static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, pfn_t pfn, pgprot_t prot, bool write)
+		pud_t *pud, pfn_t pfn, bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	pgprot_t prot = vma->vm_page_prot;
 	pud_t entry;
 	spinlock_t *ptl;
 
@@ -980,23 +978,20 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
 }
 
 /**
- * vmf_insert_pfn_pud_prot - insert a pud size pfn
+ * vmf_insert_pfn_pud - insert a pud size pfn
  * @vmf: Structure describing the fault
  * @pfn: pfn to insert
- * @pgprot: page protection to use
  * @write: whether it's a write fault
  *
- * Insert a pud size pfn. See vmf_insert_pfn() for additional info and
- * also consult the vmf_insert_mixed_prot() documentation when
- * @pgprot != @vmf->vma->vm_page_prot.
+ * Insert a pud size pfn. See vmf_insert_pfn() for additional info.
  *
  * Return: vm_fault_t value.
  */
-vm_fault_t vmf_insert_pfn_pud_prot(struct vm_fault *vmf, pfn_t pfn,
-				   pgprot_t pgprot, bool write)
+vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 {
 	unsigned long addr = vmf->address & PUD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
+	pgprot_t pgprot = vma->vm_page_prot;
 
 	/*
 	 * If we had pud_special, we could avoid all these restrictions,
@@ -1014,10 +1009,10 @@ vm_fault_t vmf_insert_pfn_pud_prot(struct vm_fault *vmf, pfn_t pfn,
 
 	track_pfn_insert(vma, &pgprot, pfn);
 
-	insert_pfn_pud(vma, addr, vmf->pud, pfn, pgprot, write);
+	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
 	return VM_FAULT_NOPAGE;
 }
-EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud_prot);
+EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 static void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-- 
2.39.2

