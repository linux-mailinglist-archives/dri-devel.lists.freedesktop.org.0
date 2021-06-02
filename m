Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F984398428
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87146EB7A;
	Wed,  2 Jun 2021 08:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D3A6EB7A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 08:30:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o5so1913599edc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YPUwjx4Z79OyDEiYopYdZw9IoD5SaH4MolHIa5oNR6A=;
 b=KT6SLVWTkYAkIwrncsPJowle7xjbbWNyZ1fmTKY96BhNPctvrPFRUdi/0ebEt/CYvP
 6bPow929J0vANVwKvEzyW08Hfy9+haqE6grkFuVVd0PRjl+Gb3IKwfmGXt3MumpJeaCz
 EhQghFVUUhpS5Z1zGsAiK1edzlpZMv0wgitk3qA5zNMg7A4tgop4gtVLrpj7mlnFVkgr
 SCdlEn4g5b3wUVE4Q6yoab10eamnTIet13X5OHHIvyUb7MVP57oLEMGzIC/VfytSlofw
 e/PhRhET5OTqIM51o+YoeschvE2/npPhlXDnEk/AefbOIh39lwVK/LTQJ/TwH7DhUVaE
 RDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YPUwjx4Z79OyDEiYopYdZw9IoD5SaH4MolHIa5oNR6A=;
 b=WxfgjrBuFxYTfVlLKvdpznvx1bJJb35SkfLsym2FiId3FAwdUseEH060e/AeYYnbf+
 w9j0wysuwiyQoovv/OZp3tEQJewC3Io/weyYMxm+ViVlKFMGjir8Xd+f9+UldYnKtNHp
 mwJ/r+xSkGzO2xqAAtS8LqFkypO7j9A6uRgU3o3pjvok9fifHbvl5qdCJ85sKrPn8DaM
 vvY+lhjuX4SP4mY3YZ45A7Z5XQKxe7utPH1ckqK3hMvYztUZJOEjIkRoFgDwAezE7Kvn
 nv4uDT263UiFXNInn3AvbUQDY95Hr86qojAXXXbs0CaTnWwOxM+Zn2mNgDQL26Rn44lT
 dPLw==
X-Gm-Message-State: AOAM531anM7OTGMwCTnNo1MT4IqTKRp8C7axCySxgd8+b03JHd3it20t
 6ObhfaydRiBBbLkXVRBt5lk=
X-Google-Smtp-Source: ABdhPJyovm+EI3GJ6lE3TU1yvKmqAZdf+HINt17yHjSZHfSOnoJDW9m8oFIPNUKfXDnfgST1JxKOfQ==
X-Received: by 2002:a05:6402:22f3:: with SMTP id
 dn19mr17187887edb.240.1622622615198; 
 Wed, 02 Jun 2021 01:30:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id u17sm850633edx.16.2021.06.02.01.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 01:30:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	jgg@ziepe.ca,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
Date: Wed,  2 Jun 2021 10:30:13 +0200
Message-Id: <20210602083013.1561-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We discussed if that is really the right approach for quite a while now, but
digging deeper into a bug report on arm turned out that this is actually
horrible broken right now.

The reason for this is that vmf_insert_mixed_prot() always tries to grab
a reference to the underlaying page on architectures without
ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.

So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.

Also set VM_SHARED, not 100% sure if that is needed with VM_PFNMAP, but better
save than sorry.

Signed-off-by: Christian König <christian.koenig@amd.com>
Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 9bd15cb39145..bf86ae849340 100644
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
@@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_s
 
 	vma->vm_private_data = bo;
 
-	/*
-	 * We'd like to use VM_PFNMAP on shared mappings, where
-	 * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
-	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
-	 * bad for performance. Until that has been sorted out, use
-	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
+	/* Enforce VM_SHARED here since no driver backend actually supports COW
+	 * on TTM buffer object mappings.
 	 */
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_PFNMAP | VM_SHARED;
 	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
 }
 
-- 
2.25.1

