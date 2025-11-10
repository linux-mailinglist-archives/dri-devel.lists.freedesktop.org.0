Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A0C472D4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A110E3DC;
	Mon, 10 Nov 2025 14:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OxCbqYd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB7210E2C5;
 Mon, 10 Nov 2025 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762784873;
 bh=PO8gWy+x68NFPFgtgxVVBpssyG+zZ/+aShO0x1+KKAs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OxCbqYd+X4Xei4wP5jPblEpPZjh7Yge5V8c/orz2hpookmHm+vCpV2VaFCodPXrfQ
 NBiirtgbRhXTKlROfcrDoG/0mDd+LC83UP1iP2IzC/NxBJWlMPS5mCjoXSQSBzvG7r
 PH4qlXtX9L7lh52RhZzATj1RetnwlB8+wCoTKFyQZ0dJ0WzP/vLDqm8DtV+t5CtTNa
 dSZsdsz79UMAuVGH+xsWXDNXULXwQr7EMso16moe49fvQkbVP4CclRgJH+RzKpBvnF
 1SPn5YMs2t4sghp1jWtLvIBKV5RfuIlM3Nm7ImQG8kBUzJJEOl6rsWDB6kqIVxdto1
 MkdHCSXPvxAqw==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:2e0:4cff:fe03:d8c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6181E17E12C4;
 Mon, 10 Nov 2025 15:27:52 +0100 (CET)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v6 02/11] drm/shmem-helper: Map huge pages in fault handler
Date: Mon, 10 Nov 2025 15:27:37 +0100
Message-ID: <20251110142746.3490-3-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251110142746.3490-1-loic.molinari@collabora.com>
References: <20251110142746.3490-1-loic.molinari@collabora.com>
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

Attempt a PMD sized PFN insertion into the VMA if the faulty address
of the fault handler is part of a huge page.

On builds with CONFIG_TRANSPARENT_HUGEPAGE enabled, if the mmap() user
address is PMD size aligned, if the GEM object is backed by shmem
buffers on mountpoints setting the 'huge=' option and if the shmem
backing store manages to allocate a huge folio, CPU mapping would then
benefit from significantly increased memcpy() performance. When these
conditions are met on a system with 2 MiB huge pages, an aligned copy
of 2 MiB would raise a single page fault instead of 4096.

v4:
- implement map_pages instead of huge_fault

v6:
- get rid of map_pages handler for now (keep it for another series
  along with arm64 contpte support)

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 55 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index be89be1c804c..81f4ac7cb8f6 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -567,31 +567,68 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
+static bool drm_gem_shmem_fault_is_valid(struct drm_gem_object *obj,
+					 pgoff_t pgoff)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
+	    pgoff >= (obj->size >> PAGE_SHIFT) ||
+	    shmem->madv < 0)
+		return false;
+
+	return true;
+}
+
+static bool drm_gem_shmem_map_pmd(struct vm_fault *vmf, unsigned long addr,
+				  struct page *page)
+{
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+	unsigned long pfn = page_to_pfn(page);
+	unsigned long paddr = pfn << PAGE_SHIFT;
+	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
+
+	if (aligned &&
+	    pmd_none(*vmf->pmd) &&
+	    folio_test_pmd_mappable(page_folio(page))) {
+		pfn &= PMD_MASK >> PAGE_SHIFT;
+		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
+			return true;
+	}
+#endif
+
+	return false;
+}
+
 static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	loff_t num_pages = obj->size >> PAGE_SHIFT;
-	vm_fault_t ret;
-	struct page *page;
+	struct page **pages = shmem->pages;
 	pgoff_t page_offset;
+	unsigned long pfn;
+	vm_fault_t ret;
 
 	/* Offset to faulty address in the VMA (without the fake offset). */
 	page_offset = vmf->pgoff - vma->vm_pgoff;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
-	if (page_offset >= num_pages ||
-	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
-	    shmem->madv < 0) {
+	if (unlikely(!drm_gem_shmem_fault_is_valid(obj, page_offset))) {
 		ret = VM_FAULT_SIGBUS;
-	} else {
-		page = shmem->pages[page_offset];
+		goto out;
+	}
 
-		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
+	if (drm_gem_shmem_map_pmd(vmf, vmf->address, pages[page_offset])) {
+		ret = VM_FAULT_NOPAGE;
+		goto out;
 	}
 
+	pfn = page_to_pfn(pages[page_offset]);
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+
+ out:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
-- 
2.47.3

