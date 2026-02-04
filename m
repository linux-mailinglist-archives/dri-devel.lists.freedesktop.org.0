Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EZsFwAxg2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:44:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A3E541B
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5189F10E5ED;
	Wed,  4 Feb 2026 11:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SONFhUkI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QqtP6VUt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SONFhUkI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QqtP6VUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FB210E5ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 11:43:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DBCA3E70B;
 Wed,  4 Feb 2026 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770205427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+A5QWqoW6d1rO2c2JIsl4NsgDOsKOprgGQq2z6U+QEs=;
 b=SONFhUkIJgt02zWFvIjmMfbCsPqjzHb18sIyG7XJ9FeUkx7qjgz1Cqr2SmrUxWp5bcHAVR
 YV4XTCGOCFoYD1csAETUFI++dxXnLYOHlmSHAo9MqbuLmA5ghwmFDJ6CNuKbXnoX9z0iVp
 6kyHW6TULp5x59v4/4Gcw912e4dJmzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770205427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+A5QWqoW6d1rO2c2JIsl4NsgDOsKOprgGQq2z6U+QEs=;
 b=QqtP6VUtsKILY3OoCyz3kw1pU69XU4JRSTPxX1HFiIbNGnbqeVqMfBT2bzrQsMx4CYZDMv
 S+BY1dt8FM4Pe/DA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SONFhUkI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QqtP6VUt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770205427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+A5QWqoW6d1rO2c2JIsl4NsgDOsKOprgGQq2z6U+QEs=;
 b=SONFhUkIJgt02zWFvIjmMfbCsPqjzHb18sIyG7XJ9FeUkx7qjgz1Cqr2SmrUxWp5bcHAVR
 YV4XTCGOCFoYD1csAETUFI++dxXnLYOHlmSHAo9MqbuLmA5ghwmFDJ6CNuKbXnoX9z0iVp
 6kyHW6TULp5x59v4/4Gcw912e4dJmzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770205427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+A5QWqoW6d1rO2c2JIsl4NsgDOsKOprgGQq2z6U+QEs=;
 b=QqtP6VUtsKILY3OoCyz3kw1pU69XU4JRSTPxX1HFiIbNGnbqeVqMfBT2bzrQsMx4CYZDMv
 S+BY1dt8FM4Pe/DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D0DF3EA63;
 Wed,  4 Feb 2026 11:43:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gAt2DfMwg2ldawAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Feb 2026 11:43:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 willy@infradead.org, frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/4] drm/gem-shmem: Map pages in mmap fault handler
Date: Wed,  4 Feb 2026 12:39:30 +0100
Message-ID: <20260204114341.195143-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204114341.195143-1-tzimmermann@suse.de>
References: <20260204114341.195143-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 063A3E541B
X-Rspamd-Action: no action

Gem-shmem operates on pages instead of I/O memory ranges, so use them
for mmap. This will allow for tracking page dirty/accessed flags. If
hugepage support is available, insert the page's folio if possible.
Otherwise fall back to mapping individual pages.

As the PFN is no longer required for hugepage mappings, simplify the
related code and make it depend on CONFIG_TRANSPARENT_HUGEPAGE. Prepare
for tracking folio status.

v2:
- do not look up the page before testing page-array bounds (Matthew)
- simplify error handling in drm_gem_shmem_fault() (Boris)
- adapt to changes in drm_gem_shmem_try_mmap_pmd()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 49 +++++++++++++++-----------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e7316dc7e921..24553dec070d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -553,16 +553,17 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 static vm_fault_t drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
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
-		return vmf_insert_pfn_pmd(vmf, pfn, false);
+	if (aligned && pmd_none(*vmf->pmd)) {
+		struct folio *folio = page_folio(page);
+
+		if (folio_test_pmd_mappable(folio)) {
+			/* Read-only mapping; split upon write fault */
+			return vmf_insert_folio_pmd(vmf, folio, false);
+		}
 	}
 #endif
 
@@ -575,13 +576,10 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
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
+	struct page *page;
+	vm_fault_t ret;
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
@@ -592,14 +590,25 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 		goto out;
 	}
 
-	ret = drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset]);
-	if (ret == VM_FAULT_NOPAGE)
+	page = pages[page_offset];
+	if (!page) {
+		ret = VM_FAULT_SIGBUS;
 		goto out;
+	}
+
+	ret = drm_gem_shmem_try_map_pmd(vmf, vmf->address, page);
+	if (ret != VM_FAULT_NOPAGE) {
+		struct folio *folio = page_folio(page);
+
+		get_page(page);
 
-	pfn = page_to_pfn(pages[page_offset]);
-	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+		folio_lock(folio);
+
+		vmf->page = page;
+		ret = VM_FAULT_LOCKED;
+	}
 
- out:
+out:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
@@ -689,7 +698,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	if (ret)
 		return ret;
 
-	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-- 
2.52.0

