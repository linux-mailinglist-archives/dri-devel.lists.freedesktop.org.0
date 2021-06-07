Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E399739DE2E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 15:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7AB6E8D7;
	Mon,  7 Jun 2021 13:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8011E6E8D8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 13:58:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c9so9060017wrt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0swNO7/mQr434mal3049fJXTuFIMnKCbkWhIv3ghFV0=;
 b=f1xwSkAyXu1Y1Gjg2ykzyGuf48gBF18HceOAH7EO2RVKwtrri2heArPFJIw6E6l7Rh
 Uy0dh+LMVMmSzOhh4lD/KvqMFucwAG0UkT+X3tRGzMHl0CzkdbuEAgeWjUMS6elST2m2
 bgEEjPmoGhk8MuWOJV+y8gotnXCz2+/Kcd0iD3RoSL9Ls/pX/rpjWlJnOeRE42KFqWDI
 ic2iDtp9q3qlC8k17iooril6xeIIhg0qtpL8008ktYgCW3wZHMLyBQYfu+UAa8Fgmcfx
 MKmD38WTiJa7f0mSqPVKslrLYwDo0/pqjsRqmiqWhf8S5xjm17r0q+mNXog5YHte7G0g
 iV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0swNO7/mQr434mal3049fJXTuFIMnKCbkWhIv3ghFV0=;
 b=YmhdhBaW2ismOIxsxrjfkUhd3ubW9tfXy4Uclv6uN2BV4G4t0e+VV/OXbxCYiTNVxt
 J7PjpuVnsi8uUiBv62mAnUCJeh8n0zYhNAc+9kOGonn8ScyNj7hEsNg+yx8CJZjvOqZZ
 C9UTxC5FkbEmctZbG7FNrCvGLSmKK8gRGw2SRJm+K8jrvq6pul7bq5eQ+vHad1ykyASu
 OtU75P5NO2q0ntAwhMkaQq5dlBeuf51cGYO14KpXHoQL9d9+GMqHvo19OQdrurzHy/wD
 Kk7WrxZXNrQzO9FydvevJoEUgZlq6pM+YdYId4dbBC6PCVOHX5Sxj235WmrbRt1HhNpz
 6MyA==
X-Gm-Message-State: AOAM5311Fi1N1RXKKLJnxe6rfDL1nvLiZtbWhN6zKwPY82pf68juIKd+
 +zjbjhU+gW+7wiVdKhQa3vc=
X-Google-Smtp-Source: ABdhPJydP9fuoT/MWRdH8Gx4OEPflB+NClInxvdOS61gbhQL0lJ9uf390hhf251PPPYcPpbMWZ6qxQ==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr16952858wrv.280.1623074312227; 
 Mon, 07 Jun 2021 06:58:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:42:5458:dcb5:a4dd])
 by smtp.gmail.com with ESMTPSA id v16sm15865429wrr.6.2021.06.07.06.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 06:58:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org, thomas.hellstrom@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings v2
Date: Mon,  7 Jun 2021 15:58:30 +0200
Message-Id: <20210607135830.8574-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We discussed if that is really the right approach for quite a while now, but
digging deeper into a bug report on arm turned out that this is actually
horrible broken right now.

The reason for this is that vmf_insert_mixed_prot() always tries to grab
a reference to the underlaying page on architectures without
ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.

So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.

Also make sure to reject mappings without VM_SHARED.

v2: reject COW mappings, merge function with only caller

Signed-off-by: Christian König <christian.koenig@amd.com>
Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 44 +++++++++++----------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 61828488ae2b..c9edb75626d9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -359,12 +359,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		 * at arbitrary times while the data is mmap'ed.
 		 * See vmf_insert_mixed_prot() for a discussion.
 		 */
-		if (vma->vm_flags & VM_MIXEDMAP)
-			ret = vmf_insert_mixed_prot(vma, address,
-						    __pfn_to_pfn_t(pfn, PFN_DEV),
-						    prot);
-		else
-			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
+		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
 
 		/* Never error on prefaulted PTEs */
 		if (unlikely((ret & VM_FAULT_ERROR))) {
@@ -411,15 +406,9 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
 	pfn = page_to_pfn(page);
 
 	/* Prefault the entire VMA range right away to avoid further faults */
-	for (address = vma->vm_start; address < vma->vm_end; address += PAGE_SIZE) {
-
-		if (vma->vm_flags & VM_MIXEDMAP)
-			ret = vmf_insert_mixed_prot(vma, address,
-						    __pfn_to_pfn_t(pfn, PFN_DEV),
-						    prot);
-		else
-			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
-	}
+	for (address = vma->vm_start; address < vma->vm_end;
+	     address += PAGE_SIZE)
+		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
 
 	return ret;
 }
@@ -560,8 +549,16 @@ static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.access = ttm_bo_vm_access,
 };
 
-static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_struct *vma)
+int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
+	/* Enforce VM_SHARED here since without it we would have really strange
+	 * behavior on COW.
+	 */
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
+	ttm_bo_get(bo);
+
 	/*
 	 * Drivers may want to override the vm_ops field. Otherwise we
 	 * use TTM's default callbacks.
@@ -576,21 +573,8 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_s
 
 	vma->vm_private_data = bo;
 
-	/*
-	 * We'd like to use VM_PFNMAP on shared mappings, where
-	 * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
-	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
-	 * bad for performance. Until that has been sorted out, use
-	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
-	 */
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_PFNMAP;
 	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-}
-
-int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
-{
-	ttm_bo_get(bo);
-	ttm_bo_mmap_vma_setup(bo, vma);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_mmap_obj);
-- 
2.25.1

