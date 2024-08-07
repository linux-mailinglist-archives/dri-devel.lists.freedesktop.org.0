Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13BC94A613
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDC210E4A1;
	Wed,  7 Aug 2024 10:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtiYiS6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1F210E4A1;
 Wed,  7 Aug 2024 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723027574; x=1754563574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e+nFKwejeXfkFoDOgLCsOuT6nnUh6AUOXBM9TIykZTk=;
 b=AtiYiS6Ud9HGIdaaojrXDEFU0rkubyXAS0rkaoQWyDmsgoiTUgYCValD
 RTMrgQfdDAhd+hhVtCBwFYWOyQf0Icm8/Kk9n8ol0rfFvowaFHVIo+EGw
 F8W6KbPajvsK18waNlBP/H9Y/RBBh+0lKEoCyZnmLG2BeEhOSRFAJwx+2
 DA+V30TctB34ztqzQeBJc+Kx76aDPq0dmpR3IuQab292/xmVJCr+XxJ/D
 n/zb7oodm6TIrg54wCFBJpKBx/8oA17bX9BXFzEFhaK0weStJp5J4WTOh
 R0NIW4x2bE4F4Fl4zcDeBK6u3TpsmQZql8bzrc3Yfk1Q/267gCdZBv6dP Q==;
X-CSE-ConnectionGUID: x/I+98zcRWSxnNdptrdSwQ==
X-CSE-MsgGUID: QUlFvPUIRW64sLzsJ7p0DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="43612112"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="43612112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:46:13 -0700
X-CSE-ConnectionGUID: fcTzClzQQw29Ab0YuG1NYA==
X-CSE-MsgGUID: Ol1th6elQQmBv7Oi/lqx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="60939902"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.245])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:46:11 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <Jonathan.cavitt@intel.com>
Subject: [PATCH] drm/i915/gem: Improve pfn calculation readability in
 vm_fault_gtt()
Date: Wed,  7 Aug 2024 11:45:53 +0100
Message-ID: <20240807104553.481763-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

By moving the pfn calculation to the set_address_limits()
function we improve code readability. This way,
set_address_limits() is responsible for calculating all memory
mapping paramenters: "start", "end" and "pfn".

This suggestion from Jonathan was made during the review of
commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix Virtual Memory mapping
boundaries calculation"), which I liked, but it got lost on the
way.

Suggested-by: Jonathan Cavitt <Jonathan.cavitt@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index cac6d4184506..e9b2424156f0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -293,8 +293,10 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 static void set_address_limits(struct vm_area_struct *area,
 			       struct i915_vma *vma,
 			       unsigned long obj_offset,
+			       resource_size_t gmadr_start,
 			       unsigned long *start_vaddr,
-			       unsigned long *end_vaddr)
+			       unsigned long *end_vaddr,
+			       unsigned long *pfn)
 {
 	unsigned long vm_start, vm_end, vma_size; /* user's memory parameters */
 	long start, end; /* memory boundaries */
@@ -323,6 +325,10 @@ static void set_address_limits(struct vm_area_struct *area,
 	/* Let's move back into the "<< PAGE_SHIFT" domain */
 	*start_vaddr = (unsigned long)start << PAGE_SHIFT;
 	*end_vaddr = (unsigned long)end << PAGE_SHIFT;
+
+	*pfn = (gmadr_start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
+	*pfn += (*start_vaddr - area->vm_start) >> PAGE_SHIFT;
+	*pfn += obj_offset - vma->gtt_view.partial.offset;
 }
 
 static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
@@ -441,11 +447,13 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	if (ret)
 		goto err_unpin;
 
-	set_address_limits(area, vma, obj_offset, &start, &end);
-
-	pfn = (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
-	pfn += (start - area->vm_start) >> PAGE_SHIFT;
-	pfn += obj_offset - vma->gtt_view.partial.offset;
+	/*
+	 * Dump all the necessary parameters in this function to perform the
+	 * arithmetic calculation for the virtual address start and end and
+	 * the PFN (Page Frame Number).
+	 */
+	set_address_limits(area, vma, obj_offset, ggtt->gmadr.start,
+			   &start, &end, &pfn);
 
 	/* Finally, remap it using the new GTT offset */
 	ret = remap_io_mapping(area, start, pfn, end - start, &ggtt->iomap);
-- 
2.45.2

