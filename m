Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4335318DF90
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DE86E301;
	Sat, 21 Mar 2020 10:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE34A6E1B6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 16:58:29 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m15so1547263iob.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUocKGblQb2o2HFawCMp9Ld437bYJFvJgxJJBk7FIc4=;
 b=YntWPst0Bm7GqdqydwDPVPh011j6Lp9KcXvBtgIr9yGF3uuqLumDqHdiKD5YwJlwfL
 lW2XHPMTnoxwS2MertMZQQFfC3UCl0LR+pvNIRNPdT8RvAzcraDuwRlIHm5NffT5dD4v
 5oQ3tsMUsB0uRC3JL/mPG9xXs3zOAeyxfgvbrzFcXjjaL98sR+oUX3ef5BaN8+9pJdJm
 BKstP+/1WLzBvBn1pq9PZ2QcfPaMVrB0tO+aSG7pYUuyBxB+8XaufyLrcNrcoMqi7TPF
 MrzrW0GAFjobUQICorGpUtMk9tj58wZf+SBtb9JVTMrTgmBY5/P2aVNyoFemJt+xJePd
 us6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUocKGblQb2o2HFawCMp9Ld437bYJFvJgxJJBk7FIc4=;
 b=kGcbsooDbLlg57eR1+Froh4l3TmAN+2p7Elb0c3IZY6bABmEjmf5TSVoJFvkYfNeL6
 nuWnzlsAPpXazg5Ze6xMq7TbyLJ9vuts7gqkaHLuEEupnLEnuMbFFW/oAhSHb7aLNbCZ
 IlYpsgD+MNAH+40+vXWcfJWLkcDVkJG9WVekd0pBgP7jCehpnVHljPcdubYXFbYI7htG
 60Wc3Z/X3GTcftXBzw5kCBFHA6GSTifVnJU90aKMRvxjNMqvhJBIgDzwrvmzwQ/vgwpn
 17DktHGv/RdK0rSJObPytxlEFpAa+HhKdo5TpxxGJ10mfM6L7+28yy9xg+h6/qoYurm9
 ikhQ==
X-Gm-Message-State: ANhLgQ2pKjb7EiipWbGJvWtf2NXCFdBYMjwz1EPEb3xuoACNuDxICZQ3
 zEVAOcKty7Vf6nR+dEzbRU29XgXeK3Uwng==
X-Google-Smtp-Source: ADFU+vsA7VjEQHoh/wxAGR7V+aaNfS2RnIkoq04zcGb+pjCRPYSK7O2+s9r+eM4YcA2K+jR1obAW6g==
X-Received: by 2002:aed:39c9:: with SMTP id m67mr9438609qte.107.1584723026546; 
 Fri, 20 Mar 2020 09:50:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id h11sm2171811qtr.38.2020.03.20.09.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 09:50:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFKql-0005kI-BT; Fri, 20 Mar 2020 13:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 4/6] mm/hmm: remove HMM_FAULT_SNAPSHOT
Date: Fri, 20 Mar 2020 13:49:03 -0300
Message-Id: <20200320164905.21722-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320164905.21722-1-jgg@ziepe.ca>
References: <20200320164905.21722-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:29 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Now that flags are handled on a fine-grained per-page basis this global
flag is redundant and has a confusing overlap with the pfn_flags_mask and
default_flags.

Normalize the HMM_FAULT_SNAPSHOT behavior into one place. Callers needing
the SNAPSHOT behavior should set a pfn_flags_mask and default_flags that
always results in a cleared HMM_PFN_REQ_FAULT. Then no pages will be
faulted, and HMM_FAULT_SNAPSHOT is not a special flow that overrides the
masking mechanism.

As this is the last flag, also remove the flags argument. If future flags
are needed they can be part of the struct hmm_range function arguments.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 Documentation/vm/hmm.rst                | 12 +++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  2 +-
 include/linux/hmm.h                     |  5 +----
 mm/hmm.c                                | 17 +++++++++--------
 5 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 95fec596836262..4e3e9362afeb10 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -161,13 +161,11 @@ device must complete the update before the driver callback returns.
 When the device driver wants to populate a range of virtual addresses, it can
 use::
 
-  long hmm_range_fault(struct hmm_range *range, unsigned int flags);
+  long hmm_range_fault(struct hmm_range *range);
 
-With the HMM_RANGE_SNAPSHOT flag, it will only fetch present CPU page table
-entries and will not trigger a page fault on missing or non-present entries.
-Without that flag, it does trigger a page fault on missing or read-only entries
-if write access is requested (see below). Page faults use the generic mm page
-fault code path just like a CPU page fault.
+It will trigger a page fault on missing or read-only entries if write access is
+requested (see below). Page faults use the generic mm page fault code path just
+like a CPU page fault.
 
 Both functions copy CPU page table entries into their pfns array argument. Each
 entry in that array corresponds to an address in the virtual range. HMM
@@ -197,7 +195,7 @@ The usage pattern is::
  again:
       range.notifier_seq = mmu_interval_read_begin(&interval_sub);
       down_read(&mm->mmap_sem);
-      ret = hmm_range_fault(&range, HMM_RANGE_SNAPSHOT);
+      ret = hmm_range_fault(&range);
       if (ret) {
           up_read(&mm->mmap_sem);
           if (ret == -EBUSY)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 90821ce5e6cad0..c520290709371b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -856,7 +856,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	range->notifier_seq = mmu_interval_read_begin(&bo->notifier);
 
 	down_read(&mm->mmap_sem);
-	r = hmm_range_fault(range, 0);
+	r = hmm_range_fault(range);
 	up_read(&mm->mmap_sem);
 	if (unlikely(r <= 0)) {
 		/*
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 39c731a99937c6..e3797b2d4d1759 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -540,7 +540,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		range.default_flags = 0;
 		range.pfn_flags_mask = -1UL;
 		down_read(&mm->mmap_sem);
-		ret = hmm_range_fault(&range, 0);
+		ret = hmm_range_fault(&range);
 		up_read(&mm->mmap_sem);
 		if (ret <= 0) {
 			if (ret == 0 || ret == -EBUSY)
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 184a8633260f9d..6b4004905aac89 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -167,13 +167,10 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
 	return pfn_to_page(entry >> range->pfn_shift);
 }
 
-/* Don't fault in missing PTEs, just snapshot the current state. */
-#define HMM_FAULT_SNAPSHOT		(1 << 1)
-
 /*
  * Please see Documentation/vm/hmm.rst for how to use the range API.
  */
-long hmm_range_fault(struct hmm_range *range, unsigned int flags);
+long hmm_range_fault(struct hmm_range *range);
 
 /*
  * HMM_RANGE_DEFAULT_TIMEOUT - default timeout (ms) when waiting for a range
diff --git a/mm/hmm.c b/mm/hmm.c
index 687d21c675ee60..7f77fb6e35cf78 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -29,7 +29,6 @@
 struct hmm_vma_walk {
 	struct hmm_range	*range;
 	unsigned long		last;
-	unsigned int		flags;
 };
 
 enum {
@@ -111,9 +110,6 @@ static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 {
 	struct hmm_range *range = hmm_vma_walk->range;
 
-	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
-		return 0;
-
 	/*
 	 * So we not only consider the individual per page request we also
 	 * consider the default flags requested for the range. The API can
@@ -146,10 +142,17 @@ hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 		     const uint64_t *pfns, unsigned long npages,
 		     uint64_t cpu_flags)
 {
+	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned int required_fault = 0;
 	unsigned long i;
 
-	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
+	/*
+	 * If there is no way for valid to be set in hmm_pte_need_fault() then
+	 * don't bother to call it.
+	 */
+	if (!(((range->flags[HMM_PFN_VALID] & range->pfn_flags_mask) |
+	       range->default_flags) &
+	      range->flags[HMM_PFN_VALID]))
 		return 0;
 
 	for (i = 0; i < npages; ++i) {
@@ -559,7 +562,6 @@ static const struct mm_walk_ops hmm_walk_ops = {
 /**
  * hmm_range_fault - try to fault some address in a virtual address range
  * @range:	range being faulted
- * @flags:	HMM_FAULT_* flags
  *
  * Return: the number of valid pages in range->pfns[] (from range start
  * address), which may be zero.  On error one of the following status codes
@@ -583,12 +585,11 @@ static const struct mm_walk_ops hmm_walk_ops = {
  * On error, for one virtual address in the range, the function will mark the
  * corresponding HMM pfn entry with an error flag.
  */
-long hmm_range_fault(struct hmm_range *range, unsigned int flags)
+long hmm_range_fault(struct hmm_range *range)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
 		.last = range->start,
-		.flags = flags,
 	};
 	struct mm_struct *mm = range->notifier->mm;
 	int ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
