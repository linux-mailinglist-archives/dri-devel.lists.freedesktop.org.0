Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F1CCCBAA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CC910EA43;
	Thu, 18 Dec 2025 16:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2yd/90e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEBF10EA4E;
 Thu, 18 Dec 2025 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074947; x=1797610947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4UeDIb3/cddUEdQpuCET4maZibb4XfW6iIWqZ3yuXPo=;
 b=D2yd/90e3qPL0R12k6e4kZtxt+bXQqQqhWz5HWyuGgzUehaApKsvEvvq
 njyxdiayL7LzFuhg/pD0QEgx0AnS5lDpXzBeKz0VSsmORiXOknE78qo+b
 549xkPp+37xLIYc+NuD6yo1nC2jndOZlC/TjWXU8njKFTC/R7lw5o/vPO
 RBj4R6qW3/aGfCUwjy6F0KqYfQX/qj1mDx+GZwudjOkO9B1GyebeWrHTH
 zeZFy+41yqq/um4i2Q9iHaBOKBAh4XeceoTPvjwyeWV6/oI6Z1Zzk8qHb
 VHjtXTVHw1hanw/mONoTGrXT1mHR+gynb++Or4iSafAPtuH0Rys6fpGNL A==;
X-CSE-ConnectionGUID: MyBIwdsyR76uzVz6kLFn4w==
X-CSE-MsgGUID: 3xuIw9H4RIqGV+C3fCvv8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607662"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:26 -0800
X-CSE-ConnectionGUID: YN9Zo26MRB6S0I55C2wo+g==
X-CSE-MsgGUID: B0uNPNyyQ7K2OWIrGl6erg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705725"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:23 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v5 14/24] drm/xe: Simplify madvise_preferred_mem_loc()
Date: Thu, 18 Dec 2025 17:20:51 +0100
Message-ID: <20251218162101.605379-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

Simplify madvise_preferred_mem_loc by removing repetitive patterns
in favour of local variables.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 21 +++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 9553008409d1..d6f47c8e146d 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -81,21 +81,22 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
 
 	for (i = 0; i < num_vmas; i++) {
+		struct xe_vma *vma = vmas[i];
+		struct xe_vma_preferred_loc *loc = &vma->attr.preferred_loc;
+
 		/*TODO: Extend attributes to bo based vmas */
-		if ((vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
-		     vmas[i]->attr.preferred_loc.migration_policy ==
-		     op->preferred_mem_loc.migration_policy) ||
-		    !xe_vma_is_cpu_addr_mirror(vmas[i])) {
-			vmas[i]->skip_invalidation = true;
+		if ((loc->devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		     loc->migration_policy == op->preferred_mem_loc.migration_policy) ||
+		    !xe_vma_is_cpu_addr_mirror(vma)) {
+			vma->skip_invalidation = true;
 		} else {
-			vmas[i]->skip_invalidation = false;
-			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			vma->skip_invalidation = false;
+			loc->devmem_fd = op->preferred_mem_loc.devmem_fd;
 			/* Till multi-device support is not added migration_policy
 			 * is of no use and can be ignored.
 			 */
-			vmas[i]->attr.preferred_loc.migration_policy =
-						op->preferred_mem_loc.migration_policy;
-			vmas[i]->attr.preferred_loc.dpagemap = NULL;
+			loc->migration_policy = op->preferred_mem_loc.migration_policy;
+			loc->dpagemap = NULL;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 594555f1669a..437f64202f3b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -56,7 +56,7 @@ struct xe_vm_pgtable_update_op;
  */
 struct xe_vma_mem_attr {
 	/** @preferred_loc: preferred memory_location */
-	struct {
+	struct xe_vma_preferred_loc {
 		/** @preferred_loc.migration_policy: Pages migration policy */
 		u32 migration_policy;
 
-- 
2.51.1

