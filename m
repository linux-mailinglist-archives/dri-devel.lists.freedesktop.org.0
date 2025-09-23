Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2BB9557A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4324010E5D5;
	Tue, 23 Sep 2025 09:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mx1joolp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942C710E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758621407;
 bh=L9xHB++TV1/Wkj2GcGjYAFCSpWvVAvQPngfLfzDCvJU=;
 h=From:To:Cc:Subject:Date:From;
 b=mx1joolplSgvM76KwykfK/T+qRY+/x814MTrqKi5vGXumxo3czBBewyuGM1rCzOas
 BhMMYzwCjEAI4Wuc+J0gc8iwHaz+v1FcZk3ZMtRY2WyHBoUR9Rowm31anrlaUpgu/Y
 HSiu/aQpIhMCkAFyHeV+Pvn6Ee9Nb3A7e1UV4oaq2reKMk2NmW8Z8WCEURFMzbAerv
 cARho/LwUIAorLkyxlXkQxjqNsAmShToa7dU3LjAoq9HSgKAnG/K8U0UOOCAVzTPJl
 Pj15tzd2ATlTYwQr54JQ1GQm71Oxyp2f8q+XCCTSOuhA4QlnII6/7e9HcH1t3t/zDM
 R4Uh9uhQq9osA==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:2e0:4cff:fe03:d8c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 05EAA17E0299;
 Tue, 23 Sep 2025 11:56:46 +0200 (CEST)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
Subject: [PATCH] drm/shmem-helper: Add huge page fault handler
Date: Tue, 23 Sep 2025 11:56:34 +0200
Message-ID: <20250923095634.50051-1-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
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

This gives the mm subsystem the ability to propose the insertion of a
PMD or PUD mapping for the faulting address.

If the virtual address provided from userspace with mmap() using the
address hint parameter is aligned to a huge page size, if the GEM
object is backed by a tmpfs mount point using Transparent Hugepage and
if the shmem backing store manages to allocate enough contiguous
physical pages to fit within a huge page, the CPU mapping will then
benefit from significantly increased memcpy() performance. For
instance, when these conditions are met on a system with 2 MiB huge
pages, a (fresh) aligned copy of 2 MiB would raise a single page fault
instead of 4096.

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 51 ++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 50594cf8e17c..30aa0d72093b 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -573,7 +573,8 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
-static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
+static vm_fault_t drm_gem_shmem_huge_fault(struct vm_fault *vmf,
+					   unsigned int order)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
@@ -582,6 +583,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	struct page *page;
 	pgoff_t page_offset;
+	unsigned long pfn, paddr;
 
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
@@ -592,17 +594,55 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
 	    shmem->madv < 0) {
 		ret = VM_FAULT_SIGBUS;
-	} else {
-		page = shmem->pages[page_offset];
+		goto out;
+	}
+
+	page = shmem->pages[page_offset];
+	pfn = page_to_pfn(page);
+
+	switch (order) {
+	case 0:
+		ret = vmf_insert_pfn(vma, vmf->address, pfn);
+		break;
+
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+	case PMD_ORDER:
+		paddr = pfn << PAGE_SHIFT;
+		if (((vmf->address & ~PMD_MASK) == (paddr & ~PMD_MASK)) &&
+		    (folio_order(page_folio(page)) == PMD_ORDER))
+			ret = vmf_insert_pfn_pmd(
+				    vmf, pfn & (PMD_MASK >> PAGE_SHIFT), false);
+		else
+			ret = VM_FAULT_FALLBACK;
+		break;
+#endif
+
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+	case PUD_ORDER:
+		paddr = pfn << PAGE_SHIFT;
+		if (((vmf->address & ~PUD_MASK) == (paddr & ~PUD_MASK)) &&
+		    (folio_order(page_folio(page)) == PUD_ORDER))
+			ret = vmf_insert_pfn_pud(
+				    vmf, pfn & (PUD_MASK >> PAGE_SHIFT), false);
+		else
+			ret = VM_FAULT_FALLBACK;
+		break;
+#endif
 
-		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
+	default:
 	}
 
+ out:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
 
+static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
+{
+	return drm_gem_shmem_huge_fault(vmf, 0);
+}
+
 static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
@@ -639,6 +679,9 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 
 const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 	.fault = drm_gem_shmem_fault,
+#if defined(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) || defined(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP)
+	.huge_fault = drm_gem_shmem_huge_fault,
+#endif
 	.open = drm_gem_shmem_vm_open,
 	.close = drm_gem_shmem_vm_close,
 };
-- 
2.47.3

