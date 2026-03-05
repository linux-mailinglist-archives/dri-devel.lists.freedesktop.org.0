Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEyGLYB6qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:43:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C66211E9A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708EF10EB10;
	Thu,  5 Mar 2026 12:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WJdYRe0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDC910EB09
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772714613;
 bh=U9bGCNu/cjyOP1JyDGaMJYPFsKrnyprySVrsktVQ4BY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WJdYRe0qBqLNSBDSNHNgPsuXp31BYjdjA0T5oIiypk8LQiSh+fdneSGXJafL3b8Ov
 2/vWayEcQ8zBGkU9bz+8dWXWpcvy7z5mzlxI194V7OFxd9cxa67vRYjoHMBwIanwuz
 BLUfg9ASzoH71Rlol7hluqzu58OZjNvYBiHOmkeATmcyS43EWIthJpJXHiGVaVsd6l
 2kT78VwQp0Zud/ZydKT/kVcbSYlLXGk0sdPkUQJji4i1F6223E7k55BD2fVkQN2c5U
 VqrjuMwQuij030Inp8LjZLxfJDhs163lKLLRaMyf9Wu13bXEsdSRQCbWTc5xUNpPQa
 d4oQ9lmwxt9xA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3247817E0071;
 Thu,  5 Mar 2026 13:43:33 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v4 6/9] drm/panthor: Lazily allocate pages on mmap()
Date: Thu,  5 Mar 2026 13:43:17 +0100
Message-ID: <20260305124320.156606-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305124320.156606-1-boris.brezillon@collabora.com>
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 68C66211E9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:email,collabora.com:mid,arm.com:email]
X-Rspamd-Action: no action

Defer pages allocation until their first access.

v2:
- Don't deal with FAULT_FLAG_INTERRUPTIBLE
- Make sure bo->backing.pages is never an ERR_PTR()
- Drop a useless vm_fault_t local var
- Fix comment in panthor_gem_fault()

v3:
- Collect R-bs

v4:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 115 ++++++++++++++++----------
 1 file changed, 70 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 9dacf8939507..906ecf62275a 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -604,15 +604,6 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
 	if (is_cow_mapping(vma->vm_flags))
 		return -EINVAL;
 
-	dma_resv_lock(obj->resv, NULL);
-	ret = panthor_gem_backing_get_pages_locked(bo);
-	if (!ret)
-		ret = panthor_gem_prep_for_cpu_map_locked(bo);
-	dma_resv_unlock(obj->resv);
-
-	if (ret)
-		return ret;
-
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (should_map_wc(bo))
@@ -632,82 +623,116 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
 	return res;
 }
 
-static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct page *page)
+static vm_fault_t insert_page(struct vm_fault *vmf, struct page *page)
 {
+	struct vm_area_struct *vma = vmf->vma;
+
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
 	unsigned long pfn = page_to_pfn(page);
 	unsigned long paddr = pfn << PAGE_SHIFT;
-	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
+	bool aligned = (vmf->address & ~PMD_MASK) == (paddr & ~PMD_MASK);
 
 	if (aligned &&
 	    pmd_none(*vmf->pmd) &&
 	    folio_test_pmd_mappable(page_folio(page))) {
 		pfn &= PMD_MASK >> PAGE_SHIFT;
 		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
-			return true;
+			return VM_FAULT_NOPAGE;
 	}
 #endif
 
-	return false;
+	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 }
 
-static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
+static vm_fault_t nonblocking_page_setup(struct vm_fault *vmf, pgoff_t page_offset)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct drm_gem_object *obj = vma->vm_private_data;
 	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
-	loff_t num_pages = obj->size >> PAGE_SHIFT;
 	vm_fault_t ret;
-	pgoff_t page_offset;
-	unsigned long pfn;
 
-	/* Offset to faulty address in the VMA. */
-	page_offset = vmf->pgoff - vma->vm_pgoff;
+	if (!dma_resv_trylock(bo->base.resv))
+		return VM_FAULT_RETRY;
 
-	dma_resv_lock(bo->base.resv, NULL);
+	if (bo->backing.pages)
+		ret = insert_page(vmf, bo->backing.pages[page_offset]);
+	else
+		ret = VM_FAULT_RETRY;
 
-	if (page_offset >= num_pages ||
-	    drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages)) {
-		ret = VM_FAULT_SIGBUS;
-		goto out;
+	dma_resv_unlock(bo->base.resv);
+	return ret;
+}
+
+static vm_fault_t blocking_page_setup(struct vm_fault *vmf,
+				      struct panthor_gem_object *bo,
+				      pgoff_t page_offset, bool mmap_lock_held)
+{
+	vm_fault_t ret;
+	int err;
+
+	err = dma_resv_lock_interruptible(bo->base.resv, NULL);
+	if (err)
+		return mmap_lock_held ? VM_FAULT_NOPAGE : VM_FAULT_RETRY;
+
+	err = panthor_gem_backing_get_pages_locked(bo);
+	if (!err)
+		err = panthor_gem_prep_for_cpu_map_locked(bo);
+
+	if (err) {
+		ret = mmap_lock_held ? VM_FAULT_SIGBUS : VM_FAULT_RETRY;
+	} else {
+		struct page *page = bo->backing.pages[page_offset];
+
+		if (mmap_lock_held)
+			ret = insert_page(vmf, page);
+		else
+			ret = VM_FAULT_RETRY;
 	}
 
-	if (try_map_pmd(vmf, vmf->address, bo->backing.pages[page_offset])) {
-		ret = VM_FAULT_NOPAGE;
-		goto out;
-	}
-
-	pfn = page_to_pfn(bo->backing.pages[page_offset]);
-	ret = vmf_insert_pfn(vma, vmf->address, pfn);
-
- out:
 	dma_resv_unlock(bo->base.resv);
 
 	return ret;
 }
 
-static void panthor_gem_vm_open(struct vm_area_struct *vma)
+static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
 {
+	struct vm_area_struct *vma = vmf->vma;
 	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+	loff_t num_pages = bo->base.size >> PAGE_SHIFT;
+	pgoff_t page_offset;
+	vm_fault_t ret;
 
-	drm_WARN_ON(bo->base.dev, drm_gem_is_imported(&bo->base));
+	/* Offset to faulty address in the VMA. */
+	page_offset = vmf->pgoff - vma->vm_pgoff;
+	if (page_offset >= num_pages)
+		return VM_FAULT_SIGBUS;
 
-	dma_resv_lock(bo->base.resv, NULL);
+	ret = nonblocking_page_setup(vmf, page_offset);
+	if (ret != VM_FAULT_RETRY)
+		return ret;
 
-	/* We should have already pinned the pages when the buffer was first
-	 * mmap'd, vm_open() just grabs an additional reference for the new
-	 * mm the vma is getting copied into (ie. on fork()).
-	 */
-	drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages);
+	/* Check if we're allowed to retry. */
+	if (fault_flag_allow_retry_first(vmf->flags)) {
+		/* If we're allowed to retry but not wait here, return
+		 * immediately, the wait will be done when the fault
+		 * handler is called again, with the mmap_lock held.
+		 */
+		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
+			return VM_FAULT_RETRY;
 
-	dma_resv_unlock(bo->base.resv);
+		/* Wait with the mmap lock released, if we're allowed to. */
+		drm_gem_object_get(&bo->base);
+		mmap_read_unlock(vmf->vma->vm_mm);
+		ret = blocking_page_setup(vmf, bo, page_offset, false);
+		drm_gem_object_put(&bo->base);
+		return ret;
+	}
 
-	drm_gem_vm_open(vma);
+	return blocking_page_setup(vmf, bo, page_offset, true);
 }
 
 const struct vm_operations_struct panthor_gem_vm_ops = {
 	.fault = panthor_gem_fault,
-	.open = panthor_gem_vm_open,
+	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
 };
 
-- 
2.53.0

