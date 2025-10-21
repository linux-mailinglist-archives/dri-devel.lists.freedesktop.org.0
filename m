Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F3CBF608B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2810E5B5;
	Tue, 21 Oct 2025 11:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jkEGlLvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F7010E5B8;
 Tue, 21 Oct 2025 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761046257;
 bh=KOWDNuw2RyynKmJ4ZsE60XfwYk9U21BJtK/dnqbhV5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jkEGlLvJpL5ipkJhIbJS1NwsbTwZgBAiguvdFmT0Nrqj06FOVmUzTIWBEcuNmQBk8
 GEDWAi9ffa5cUQhGgT5n7+VowfmdGSL99UAfy4SCACh7QyOhfvA+q+Sx4VNM6vah1p
 TZyULGL0sK0Gf8OSBJDt1Z6OSbOo1x5ck3NP+Go821cvK0Cp22bfiYQ1T9QI65iGXT
 KT90nErM0JkINFpGUfL1KglP4AaAgr1ukN37aLDcsHac/I3VzPt9Bx+cLChW1OjxSa
 rZRTmqatrZkOTx02CzNmrOSNrtB0O7nhwSis/C/pHb6G6jeTfn993Bl0m+kSqjot2q
 z5hExxJfWZ56g==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BB76A17E1404;
 Tue, 21 Oct 2025 13:30:56 +0200 (CEST)
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
Subject: [PATCH v5 02/12] drm/shmem-helper: Implement map_pages fault-around
 handler
Date: Tue, 21 Oct 2025 13:30:39 +0200
Message-ID: <20251021113049.17242-3-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021113049.17242-1-loic.molinari@collabora.com>
References: <20251021113049.17242-1-loic.molinari@collabora.com>
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

This gives the mm subsystem the ability to increase fault handling
performance by proposing the insertion of a range of pages around the
faulty address in a single batch.

v4:
- implement map_pages instead of huge_fault

v5:
- improve patch series progression
- use dma_resv_trylock() in map_pages (many thanks to Matthew Wilcox)
- validate map_pages range based on end_pgoff instead of start_pgoff

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 72 ++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index be89be1c804c..2a9fbc9c3712 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -567,31 +567,82 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
-static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
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
+static vm_fault_t drm_gem_shmem_map_pages(struct vm_fault *vmf,
+					  pgoff_t start_pgoff,
+					  pgoff_t end_pgoff)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	loff_t num_pages = obj->size >> PAGE_SHIFT;
+	struct page **pages = shmem->pages;
+	unsigned long addr, pfn;
 	vm_fault_t ret;
-	struct page *page;
+
+	start_pgoff -= vma->vm_pgoff;
+	end_pgoff -= vma->vm_pgoff;
+	addr = vma->vm_start + (start_pgoff << PAGE_SHIFT);
+
+	/* map_pages is called with the RCU lock for reading (sleep isn't
+	 * allowed) so just fall through to the more heavy-weight fault path.
+	 */
+	if (unlikely(!dma_resv_trylock(shmem->base.resv)))
+		return 0;
+
+	if (unlikely(!drm_gem_shmem_fault_is_valid(obj, end_pgoff))) {
+		ret = VM_FAULT_SIGBUS;
+		goto out;
+	}
+
+	/* Map a range of pages around the faulty address. */
+	do {
+		pfn = page_to_pfn(pages[start_pgoff]);
+		ret = vmf_insert_pfn(vma, addr, pfn);
+		addr += PAGE_SIZE;
+	} while (++start_pgoff <= end_pgoff && ret == VM_FAULT_NOPAGE);
+
+ out:
+	dma_resv_unlock(shmem->base.resv);
+
+	return ret;
+}
+
+static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *obj = vma->vm_private_data;
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
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
-
-		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
+		goto out;
 	}
 
+	pfn = page_to_pfn(pages[page_offset]);
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+
+ out:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
@@ -632,6 +683,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 }
 
 const struct vm_operations_struct drm_gem_shmem_vm_ops = {
+	.map_pages = drm_gem_shmem_map_pages,
 	.fault = drm_gem_shmem_fault,
 	.open = drm_gem_shmem_vm_open,
 	.close = drm_gem_shmem_vm_close,
-- 
2.47.3

