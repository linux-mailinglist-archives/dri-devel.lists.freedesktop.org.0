Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F7CB2C67
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AC010E6D9;
	Wed, 10 Dec 2025 11:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6fmTf8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B2110E6FA;
 Wed, 10 Dec 2025 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364940; x=1796900940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gi9lS1Sz11CZhT+cL1X1UQoZqx1CvKaUYPQhP/9laF0=;
 b=H6fmTf8ICDoM9yakBuvKvolVsq7QfCqluKShjok4PsKjgRvK45yhXZeb
 Ayu+r+SbzW4wr5aY1gyH4gEZ7Je6lCG+VrZhZMChYZhuI+BqcTZrpKuom
 Agk0NB7x9/yB3x+p9DkKeQhxxHFRmgSwV5B626wH/v//GijL5bShdky3c
 hyY/4WXDqTcX50pwQFwsFkLtl0pyD3ADrj8+/SVKvYmRBESlV/nWA3Wsu
 +ULk8vUmAWefbLkWRXxHybcJ3iaYXtVvqsQKCgZO/hfMKJQ3hyn4HF5KI
 mqZjV9R9A4MRpNjvjggDstFqaJKdFbhxzXLVNl4nbM/jqKob54unGOCT+ w==;
X-CSE-ConnectionGUID: ib48E6uuRaeIaPiNNYSkIA==
X-CSE-MsgGUID: 5CdyFc1TRyCUHyK7l452WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221832"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:00 -0800
X-CSE-ConnectionGUID: oiGwnS2JSkia1VDu0cBbBA==
X-CSE-MsgGUID: 2A2a+ED7RkiMpacWt2dUkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196487150"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:08:58 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 13/22] drm/xe: Simplify madvise_preferred_mem_loc()
Date: Wed, 10 Dec 2025 12:07:33 +0100
Message-ID: <20251210110742.107575-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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
index 84976c793506..5d4b31e7a149 100644
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

