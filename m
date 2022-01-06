Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB684863A3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 12:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576C10E6FC;
	Thu,  6 Jan 2022 11:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4A10E75F;
 Thu,  6 Jan 2022 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641468045; x=1673004045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYmFGUZUQmsuiiMhTM3+0FrldAQob4FPAHSWtOh9p14=;
 b=ROR7yKWUjQsCGDqvg0UUQRY110xxS3whtXxXI41w0eafynr56Jqii9RZ
 WyAaUEZKFqYPSRhRbtZUr3tgUxZcx3WTarQoq+ehuKIhkULM1jhoKifkn
 RbqMKq3YDp5NBjKtkCr9yC0kat0N3Ni88GQZQvxQsxjrCbcPA6xiZfxg3
 FZQ2Rz0vXZd0WkXxolK1df2v+5ni00GymqjxowVTTTbTc2L35Fdlxq9NY
 0GALsjPKh89oYPUZSreoibAwt/i5poZpYWn4NP80BrEBb2M4AeqH6D0px
 dTnWD5dvquEb+al8kgIYSfKqs3jMM+XUnF74PSA519i9mK8pDIrsuD2YY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="305992104"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="305992104"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 03:20:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="556892141"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.65.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 03:20:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/i915/ttm: only fault WILLNEED objects
Date: Thu,  6 Jan 2022 11:20:24 +0000
Message-Id: <20220106112026.247459-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220106112026.247459-1-matthew.auld@intel.com>
References: <20220106112026.247459-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't attempt to fault and re-populate purged objects. By some fluke
this passes the dontneed-after-mmap IGT, but for the wrong reasons.

Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 923cc7ad8d70..8d61d4538a64 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -883,6 +883,11 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (ret)
 		return ret;
 
+	if (obj->mm.madv != I915_MADV_WILLNEED) {
+		dma_resv_unlock(bo->base.resv);
+		return VM_FAULT_SIGBUS;
+	}
+
 	if (drm_dev_enter(dev, &idx)) {
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
-- 
2.31.1

