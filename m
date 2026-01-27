Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDjaKNK9eGn6sgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:29:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910F94E96
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3210E008;
	Tue, 27 Jan 2026 13:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3E910E008
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 13:29:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E50A533723;
 Tue, 27 Jan 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48CD03EA61;
 Tue, 27 Jan 2026 13:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yEqWEMu9eGmeDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jan 2026 13:29:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, frank.binns@imgtec.com,
 matt.coster@imgtec.com
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm/gem-shmem: Map pages in mmap fault handler
Date: Tue, 27 Jan 2026 14:16:36 +0100
Message-ID: <20260127132938.429288-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127132938.429288-1-tzimmermann@suse.de>
References: <20260127132938.429288-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 3910F94E96
X-Rspamd-Action: no action

Gem-shmem operates on pages instead of I/O memory ranges, so use them
for mmap. This will allow for tracking page dirty/accessed flags. If
hugepage support is available, insert the page's folio if possible.
Otherwise fall back to mapping individual pages.

As the PFN is no longer required for hugepage mappings, simplify the
related code and make it depend on CONFIG_TRANSPARENT_HUGEPAGE. Prepare
for tracking folio status.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 58 ++++++++++++++++----------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 3871a6d92f77..b6ddabbfcc52 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -553,17 +553,18 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
 				      struct page *page)
 {
-#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
-	unsigned long pfn = page_to_pfn(page);
-	unsigned long paddr = pfn << PAGE_SHIFT;
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	phys_addr_t paddr = page_to_phys(page);
 	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
 
-	if (aligned &&
-	    pmd_none(*vmf->pmd) &&
-	    folio_test_pmd_mappable(page_folio(page))) {
-		pfn &= PMD_MASK >> PAGE_SHIFT;
-		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
-			return true;
+	if (aligned && pmd_none(*vmf->pmd)) {
+		struct folio *folio = page_folio(page);
+
+		if (folio_test_pmd_mappable(folio)) {
+			/* Read-only mapping; split upon write fault */
+			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE)
+				return true;
+		}
 	}
 #endif
 
@@ -576,13 +577,10 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	loff_t num_pages = obj->size >> PAGE_SHIFT;
-	vm_fault_t ret;
 	struct page **pages = shmem->pages;
-	pgoff_t page_offset;
-	unsigned long pfn;
-
-	/* Offset to faulty address in the VMA. */
-	page_offset = vmf->pgoff - vma->vm_pgoff;
+	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
+	struct page *page = pages[page_offset];
+	vm_fault_t ret;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
@@ -590,21 +588,35 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
 	    shmem->madv < 0) {
 		ret = VM_FAULT_SIGBUS;
-		goto out;
+		goto err_dma_resv_unlock;
 	}
 
-	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
-		ret = VM_FAULT_NOPAGE;
-		goto out;
+	page = pages[page_offset];
+	if (!page) {
+		ret = VM_FAULT_SIGBUS;
+		goto err_dma_resv_unlock;
 	}
 
-	pfn = page_to_pfn(pages[page_offset]);
-	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
+		ret = VM_FAULT_NOPAGE;
+	} else {
+		struct folio *folio = page_folio(page);
+
+		get_page(page);
+
+		folio_lock(folio);
+
+		vmf->page = page;
+		ret = VM_FAULT_LOCKED;
+	}
 
- out:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
+
+err_dma_resv_unlock:
+	dma_resv_unlock(shmem->base.resv);
+	return ret;
 }
 
 static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
@@ -691,7 +703,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	if (ret)
 		return ret;
 
-	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-- 
2.52.0

