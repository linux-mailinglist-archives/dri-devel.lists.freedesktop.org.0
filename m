Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99800680AA2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 11:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9101D10E20F;
	Mon, 30 Jan 2023 10:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323E10E0DA;
 Mon, 30 Jan 2023 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675073874; x=1706609874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+PvPGmMHglYpglm65+fEXIafAYFe0KTSgTBfts6EAEg=;
 b=idwph9ON6sI4dI/pQ8/hXlAlVsbvFvSoN9m02Bbs8ex41G9Z2Fqnw6A+
 AIAXi5TVtuozSTtd8ZomPqYOGmtYiftBQlBk4MEKTB+c6ks3txl27LuFa
 yJxM9AG7jTFJ1Du7xlnN2bj7prNBeeTxxoaPtCPMWXvl03Ss419lLS9xG
 4UoJIWYMnLhAkbRJOBgtElA1MFwSXD4kQvrRMxk+ZltA0HyMqjA1pSL9I
 F7CQdGQV8Q9sT35EQ7hSIZTDe2Rn7AwEnuGzNOZGbrUArhxcusKHo2XRN
 yPfKPvcCZFcfM+nbNonbVRtI9FmuLFd1qlAnp3pFVXoRKLd4Ph4SUvZPE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328798963"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="328798963"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:17:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696350129"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="696350129"
Received: from dscheepe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:14:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915/ttm: fix sparse warning
Date: Mon, 30 Jan 2023 10:12:25 +0000
Message-Id: <20230130101230.25347-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse complains with:

drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1066:21: sparse:
	expected restricted vm_fault_t [assigned] [usertype] ret
drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1066:21: sparse: got int

Fixes: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 7420276827a5..4758f21c91e1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1067,11 +1067,12 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 			.interruptible = true,
 			.no_wait_gpu = true, /* should be idle already */
 		};
+		int err;
 
 		GEM_BUG_ON(!bo->ttm || !(bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED));
 
-		ret = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
-		if (ret) {
+		err = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
+		if (err) {
 			dma_resv_unlock(bo->base.resv);
 			return VM_FAULT_SIGBUS;
 		}
-- 
2.39.1

