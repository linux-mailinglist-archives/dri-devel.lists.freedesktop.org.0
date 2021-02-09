Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BF73149EA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD246EB31;
	Tue,  9 Feb 2021 07:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1CF6E2C8;
 Tue,  9 Feb 2021 01:14:29 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0c80000>; Mon, 08 Feb 2021 17:09:28 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:27 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:27 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 2/9] mm/migrate.c: Allow pfn flags to be passed to
 migrate_vma_setup()
Date: Tue, 9 Feb 2021 12:07:15 +1100
Message-ID: <20210209010722.13839-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832968; bh=iKGh0Em+q0SV2cD8tosOGsNNeFRDCVNZNzeMEYUMuKY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=C3dPDOP+AZYYPiUDaU8tmyIQKU0atPQPf0P8bxkKmEleXzrnWlxwA6cPTpzjRHxEw
 yjQU2wttE/M65pLMYv4hEABvsKiInM0Lbvb9GC/vgyKDfOtElNlUiIxXmGHGAdYk1K
 EzUcT+kxdkGr6MSirU2Qm96A54p4W+NJ4MHIQt9hzenYZeBUVEhs5B0esyZkLMU6b+
 yO0kVMs6S8bX+GEKSKWOJjco0oQr3SuSMzXHTJhxr0GQoq8dW+TGbdHkXkTVTgr/As
 a1ccJhtxb23aKMFHeK97TewZeIPHFo62wBpSrxD7mqbISrdBfUV9e5kY+cvhgKWXtY
 uYSRX6/5DdaEw==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently migrate_vma_setup() zeros both src and dst pfn arrays. This
means it is not possible to pass per-pfn flags to migrate_vma_setup(). A
future patch introduces per-pfn flags for migrate_vma_setup(), so ensure
existing callers will not be affected by having the caller zero both src
and dst pfn arrays.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 4 ++--
 lib/test_hmm.c                     | 6 ++++--
 mm/migrate.c                       | 1 -
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 84e5a2dc8be5..d434783b272a 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -506,7 +506,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 		unsigned long end, unsigned long page_shift,
 		struct kvm *kvm, unsigned long gpa)
 {
-	unsigned long src_pfn, dst_pfn = 0;
+	unsigned long src_pfn = 0, dst_pfn = 0;
 	struct migrate_vma mig;
 	struct page *dpage, *spage;
 	struct kvmppc_uvmem_page_pvt *pvt;
@@ -732,7 +732,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		unsigned long page_shift,
 		bool pagein)
 {
-	unsigned long src_pfn, dst_pfn = 0;
+	unsigned long src_pfn = 0, dst_pfn = 0;
 	struct migrate_vma mig;
 	struct page *spage;
 	unsigned long pfn;
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 80a78877bd93..98848b96ff09 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -696,6 +696,8 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
+		memset(src_pfns, 0, ARRAY_SIZE(src_pfns));
+		memset(dst_pfns, 0, ARRAY_SIZE(dst_pfns));
 		args.vma = vma;
 		args.src = src_pfns;
 		args.dst = dst_pfns;
@@ -1025,8 +1027,8 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
-	unsigned long src_pfns;
-	unsigned long dst_pfns;
+	unsigned long src_pfns = 0;
+	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
 	vm_fault_t ret;
diff --git a/mm/migrate.c b/mm/migrate.c
index 053228559fd3..fe8bb322e2e3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2874,7 +2874,6 @@ int migrate_vma_setup(struct migrate_vma *args)
 	if (!args->src || !args->dst)
 		return -EINVAL;
 
-	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
 	args->npages = 0;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
