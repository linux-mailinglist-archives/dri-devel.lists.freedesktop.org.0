Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C005F543B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 14:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213EE10E20C;
	Wed,  5 Oct 2022 12:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1B210E15A;
 Wed,  5 Oct 2022 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664971952; x=1696507952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/zWmBU68ls65H5xyS1GbMS/BYKxTHKA1Ldx7MDi5OXI=;
 b=T6b1UJe5GO50VjaJC8Pi9dqLVc/gBubyCrSHNqEjc0EqqS7SwGr1QrT+
 owRpZjMK7XsHFD0ILWQu0N+FfYuofAAHBMvMn+oVSZgf7mbDuRSTnt5lk
 aED+GKlMLhF70rruKi8mc5Zf1A9qyiI5Q8O9LGOlFdOLswyYQqQyv5gfB
 G9xNxijxOEo+4KGcX5J2RtyXZlqQuXFYvtk/YyWecrXBugniNWrhS3jph
 xhGRXXHczVseaJ50b7fYVEzZgDhruZeYqb+J8m21qiqvAfl0ZN4QgJBgS
 w5Ignct15D5r9RK199KPJ7D6oPFIG3nnZCDRtyzYiJgNBjuSwiL1jTi65 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="282856732"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="282856732"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 05:12:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="713390490"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="713390490"
Received: from mgrodzic-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 05:12:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH RESEND] drm/i915: Fix display problems after resume
Date: Wed,  5 Oct 2022 14:11:59 +0200
Message-Id: <20221005121159.340245-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.37.3
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
 Kevin Boulain <kevinboulain@gmail.com>, David de Sousa <davidesousa@gmail.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt
binding / unbinding") introduced a regression that due to the vma resource
tracking of the binding state, dpt ptes were not correctly repopulated.
Fix this by clearing the vma resource state before repopulating.
The state will subsequently be restored by the bind_vma operation.

Fixes: 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt binding / unbinding")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220912121957.31310-1-thomas.hellstrom@linux.intel.com
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.18+
Reported-and-tested-by: Kevin Boulain <kevinboulain@gmail.com>
Tested-by: David de Sousa <davidesousa@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index b31fe0fb013f..5c67e49aacf6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1275,10 +1275,16 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 			atomic_read(&vma->flags) & I915_VMA_BIND_MASK;
 
 		GEM_BUG_ON(!was_bound);
-		if (!retained_ptes)
+		if (!retained_ptes) {
+			/*
+			 * Clear the bound flags of the vma resource to allow
+			 * ptes to be repopulated.
+			 */
+			vma->resource->bound_flags = 0;
 			vma->ops->bind_vma(vm, NULL, vma->resource,
 					   obj ? obj->cache_level : 0,
 					   was_bound);
+		}
 		if (obj) { /* only used during resume => exclusive access */
 			write_domain_objs |= fetch_and_zero(&obj->write_domain);
 			obj->read_domains |= I915_GEM_DOMAIN_GTT;
-- 
2.37.3

