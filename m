Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22995B3369
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A7B10EC41;
	Fri,  9 Sep 2022 09:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FDF10EC41
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 09:20:46 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWaBo-0002V4-Rh; Fri, 09 Sep 2022 11:20:44 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: switch to PFN mappings
Date: Fri,  9 Sep 2022 11:20:44 +0200
Message-Id: <20220909092044.3441775-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no reason to use page based mappings, as the established
mappings are special driver mappings anyways and should not be
handled like normal pages.

Be consistent with what other drivers do and use raw PFN based
mappings.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index d45bf0368339..68e4446a94ad 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -130,7 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 {
 	pgprot_t vm_page_prot;
 
-	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 
 	vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
@@ -165,7 +165,8 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	struct page **pages, *page;
+	struct page **pages;
+	unsigned long pfn;
 	pgoff_t pgoff;
 	int err;
 
@@ -189,12 +190,12 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
 	/* We don't use vmf->pgoff since that has the fake offset: */
 	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
-	page = pages[pgoff];
+	pfn = page_to_pfn(pages[pgoff]);
 
 	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
-	     page_to_pfn(page), page_to_pfn(page) << PAGE_SHIFT);
+	     pfn, pfn << PAGE_SHIFT);
 
-	return vmf_insert_page(vma, vmf->address, page);
+	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset)
-- 
2.30.2

