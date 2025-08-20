Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0118AB2DF89
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5D810E764;
	Wed, 20 Aug 2025 14:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a9j11TZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CF310E760;
 Wed, 20 Aug 2025 14:37:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so34459355e9.1; 
 Wed, 20 Aug 2025 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755700663; x=1756305463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NS+snXBcWjGuXc6US/FxZrRV7iA+zaPJ5+OdkY9krl0=;
 b=a9j11TZ1swBDYh8wwnrWZ2w6LNFluIn3IyQP8rT2xtHMjhPYKyzFmxhfYIvEUgp5pL
 v5JRoQnxQLf42FxZtvdQINcFOmyksVe18fjrk1E1BBW0K+VnkvufYdVmUxTcQuGeIe5a
 /FZbllKY/y5h8eiCzg6RnSofuHYz/D6jqvB0Dy9KTVGEcx3R4fMmLbEQtbSGShI8nBNi
 vHmtx6aGd2IGubtEljWT3S7D2WIiqF8XT7lRWnbXo01+RFdACc7IULZow4njiX7H08uy
 8WCtqBIWuWrNXWNfUmVxYYbL8Tt35TCzziQOd4j5feTrXZQastumUrWo1wGJdtQjbbvj
 kUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755700663; x=1756305463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NS+snXBcWjGuXc6US/FxZrRV7iA+zaPJ5+OdkY9krl0=;
 b=MN4R82VhRFilUcZy1wctaHme7T6XkE/N0fjLyAmllIisEqkwtihww4GJc0NR+lUSFz
 9JDEyKujYkyc59uqxdqOp70s+v78uKYbXrD6rH2Z8hqCM32dVG9SxnCK5UOp8rTVQe2k
 3jc2Jc2TdHCZ0Jt80FyRD85P9cM9qDTA4EXxvpGK+sQtL6yWxonqTlGQSohpHy+YLacG
 HdKG6DEf1DDp9WAihDG7Q/1hSE5rBNlotMl5pACZ7CMn74GttI2ebC1vvO0+8dIBfhh2
 0ly14SclyHeWWPcuQDM8l6lI+h8DVFd7RfAQ7LNu/mlfVZthmQwfWeMNU1tlaCgxFEIN
 vPbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsFoDCKnUH0YMmS59rG7ndgtAbTVF/u7imDH4FBToS3S7sTXnXfJzlcM7MpNhVkz3NSk2rpouz9jQM@lists.freedesktop.org,
 AJvYcCVbj7kK8vOqP0AwYejrjNdLbOPvK+m728ySdCIZxSf2r+GxpNRNI0WgQolRp7nf3k6opUdLcW826GEI@lists.freedesktop.org,
 AJvYcCXKgFWkAzqWa1j6uzx2cx31VIsXFjAdc3mm72Bc+iOl8/Qww33fFjN0hHuDsnHdNI5TaagPlpPu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0vVO8wJMWFilaTXKqA3k6LUiCU2q6XVntAYB6g0k+1IW/FS0S
 /TlqqZNoRzhLLorqgL+lbolzf0rgjLBHFxAyINCKtA+TrgL8Y/OTPFW1ifPZcg==
X-Gm-Gg: ASbGnctUiBlTKm1v5AsOY61WmlZMDQKG8eVCKFTmxwQz2LoxH8bDbx2OCjQNRIPPMIo
 5nyCG05TzIciH+y8RRZHjN4d/700HvI9bEZ+tMPAPjoiUPHHXeSDLowJw8fEgRtGApUufvoOafA
 fVfCucztwnb5avvXQNGD0AtkVW8lUcRI96j6BZZPX9fwE85WbzkqAgRlQG+yNSp5INf68p8p9sd
 NS3IheN1QH5ic/jZyrAql1yijB2u0lxBG+KMHpenkN/v41cV8FC1js+vtfof+rv4H0uZBDn9G1j
 zgcjtpw8CeE+OuKZTM2YuStHcQAJcSOyLObiJtx8f7VW9Jkv8oju9QtcwyVFpg0dysi/WWMtiJu
 IPDCu675zNfL2gB57CxmmPPO8V7cTZq4ugs4=
X-Google-Smtp-Source: AGHT+IF8iz35hgCcCz1RTUJMw9kuzXS7w9QwarlL5tFhY+fqrTX4qOdl95Jtp8yhsFp2+u4+MAw/8w==
X-Received: by 2002:a05:600c:4ecf:b0:458:be62:dcd3 with SMTP id
 5b1f17b1804b1-45b4a3016e4mr23119775e9.17.1755700662628; 
 Wed, 20 Aug 2025 07:37:42 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1579:3800:9446:56c7:e203:3b9c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43ba5sm8090404f8f.22.2025.08.20.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:37:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, david@redhat.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org
Subject: [PATCH 1/3] drm/ttm: use apply_page_range instead of
 vmf_insert_pfn_prot
Date: Wed, 20 Aug 2025 16:33:11 +0200
Message-ID: <20250820143739.3422-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820143739.3422-1-christian.koenig@amd.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
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

Thomas pointed out that i915 is using apply_page_range instead of
vm_insert_pfn_prot to circumvent the PAT lookup and generally speed up
the page fault handling.

I've thought I give it a try and measure how much this can improve
things and it turned that mapping a 1GiB buffer is now more than 4x times
faster than before.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 130 ++++++++++++++++----------------
 1 file changed, 64 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index a194db83421d..93764b166678 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -160,6 +160,38 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_vm_reserve);
 
+/* State bag for calls to ttm_bo_vm_apply_cb */
+struct ttm_bo_vm_bag {
+	struct mm_struct		*mm;
+	struct ttm_buffer_object	*bo;
+	struct ttm_tt			*ttm;
+	unsigned long			page_offset;
+	pgprot_t			prot;
+};
+
+/* Callback to fill in a specific PTE */
+static int ttm_bo_vm_apply_cb(pte_t *pte, unsigned long addr, void *data)
+{
+        struct ttm_bo_vm_bag *bag = data;
+	struct ttm_buffer_object *bo = bag->bo;
+	unsigned long pfn;
+
+	if (bo->resource->bus.is_iomem) {
+		pfn = ttm_bo_io_mem_pfn(bo, bag->page_offset);
+	} else {
+		struct page *page = bag->ttm->pages[bag->page_offset];
+
+		if (unlikely(!page))
+			return -ENOMEM;
+		pfn = page_to_pfn(page);
+	}
+
+        /* Special PTE are not associated with any struct page */
+        set_pte_at(bag->mm, addr, pte, pte_mkspecial(pfn_pte(pfn, bag->prot)));
+	bag->page_offset++;
+	return 0;
+}
+
 /**
  * ttm_bo_vm_fault_reserved - TTM fault helper
  * @vmf: The struct vm_fault given as argument to the fault callback
@@ -183,101 +215,67 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgoff_t num_prefault)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct ttm_buffer_object *bo = vma->vm_private_data;
-	struct ttm_device *bdev = bo->bdev;
-	unsigned long page_offset;
-	unsigned long page_last;
-	unsigned long pfn;
-	struct ttm_tt *ttm = NULL;
-	struct page *page;
+	struct ttm_bo_vm_bag bag = {
+		.mm = vma->vm_mm,
+		.bo = vma->vm_private_data
+	};
+	unsigned long size;
+	vm_fault_t ret;
 	int err;
-	pgoff_t i;
-	vm_fault_t ret = VM_FAULT_NOPAGE;
-	unsigned long address = vmf->address;
 
 	/*
 	 * Wait for buffer data in transit, due to a pipelined
 	 * move.
 	 */
-	ret = ttm_bo_vm_fault_idle(bo, vmf);
+	ret = ttm_bo_vm_fault_idle(bag.bo, vmf);
 	if (unlikely(ret != 0))
 		return ret;
 
-	err = ttm_mem_io_reserve(bdev, bo->resource);
+	err = ttm_mem_io_reserve(bag.bo->bdev, bag.bo->resource);
 	if (unlikely(err != 0))
 		return VM_FAULT_SIGBUS;
 
-	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
-		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
-	page_last = vma_pages(vma) + vma->vm_pgoff -
-		drm_vma_node_start(&bo->base.vma_node);
-
-	if (unlikely(page_offset >= PFN_UP(bo->base.size)))
+	bag.page_offset = ((vmf->address - vma->vm_start) >> PAGE_SHIFT) +
+		vma->vm_pgoff - drm_vma_node_start(&bag.bo->base.vma_node);
+	if (unlikely(bag.page_offset >= PFN_UP(bag.bo->base.size)))
 		return VM_FAULT_SIGBUS;
 
-	prot = ttm_io_prot(bo, bo->resource, prot);
-	if (!bo->resource->bus.is_iomem) {
+	prot = ttm_io_prot(bag.bo, bag.bo->resource, prot);
+	if (!bag.bo->resource->bus.is_iomem) {
 		struct ttm_operation_ctx ctx = {
 			.interruptible = true,
 			.no_wait_gpu = false,
 			.force_alloc = true
 		};
 
-		ttm = bo->ttm;
-		err = ttm_bo_populate(bo, &ctx);
-		if (err) {
-			if (err == -EINTR || err == -ERESTARTSYS ||
-			    err == -EAGAIN)
-				return VM_FAULT_NOPAGE;
-
-			pr_debug("TTM fault hit %pe.\n", ERR_PTR(err));
-			return VM_FAULT_SIGBUS;
-		}
+		bag.ttm = bag.bo->ttm;
+		err = ttm_bo_populate(bag.bo, &ctx);
+		if (err)
+			goto error;
 	} else {
 		/* Iomem should not be marked encrypted */
 		prot = pgprot_decrypted(prot);
 	}
+	bag.prot = prot;
 
-	/*
-	 * Speculatively prefault a number of pages. Only error on
-	 * first page.
-	 */
-	for (i = 0; i < num_prefault; ++i) {
-		if (bo->resource->bus.is_iomem) {
-			pfn = ttm_bo_io_mem_pfn(bo, page_offset);
-		} else {
-			page = ttm->pages[page_offset];
-			if (unlikely(!page && i == 0)) {
-				return VM_FAULT_OOM;
-			} else if (unlikely(!page)) {
-				break;
-			}
-			pfn = page_to_pfn(page);
-		}
+	/* Speculatively prefault a number of pages. */
+	size = min(num_prefault << PAGE_SHIFT, vma->vm_end - vmf->address);
+	err = apply_to_page_range(vma->vm_mm, vmf->address, size,
+				  ttm_bo_vm_apply_cb, &bag);
 
-		/*
-		 * Note that the value of @prot at this point may differ from
-		 * the value of @vma->vm_page_prot in the caching- and
-		 * encryption bits. This is because the exact location of the
-		 * data may not be known at mmap() time and may also change
-		 * at arbitrary times while the data is mmap'ed.
-		 * See vmf_insert_pfn_prot() for a discussion.
-		 */
-		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
+error:
+	if (err == -EINTR || err == -ERESTARTSYS || err == -EAGAIN)
+		return VM_FAULT_NOPAGE;
 
-		/* Never error on prefaulted PTEs */
-		if (unlikely((ret & VM_FAULT_ERROR))) {
-			if (i == 0)
-				return VM_FAULT_NOPAGE;
-			else
-				break;
-		}
+	if (err == -ENOMEM)
+		return VM_FAULT_OOM;
 
-		address += PAGE_SIZE;
-		if (unlikely(++page_offset >= page_last))
-			break;
+	if (err) {
+		pr_debug("TTM fault hit %pe.\n", ERR_PTR(err));
+		return VM_FAULT_SIGBUS;
 	}
-	return ret;
+
+	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
 
-- 
2.43.0

