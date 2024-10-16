Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C1199FF76
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619710E674;
	Wed, 16 Oct 2024 03:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hm75kds3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5DE10E652;
 Wed, 16 Oct 2024 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eTXNwt4ohW1Ul1+kM3O45oOKJpWi5ziikETnzlU1Etg=;
 b=hm75kds3r4M8tZqakkf4M83Pu2EODPddUjx4PA+TxOSY7p2jlujvjy3Q
 oezXAoNfVAnFHlGorSWS+IbwRzNgQGIBx5ICQOOlwM0XQj2IM1bjbsWtO
 CDsxGkR4XWVQ6ETRoU0DZpK7DjwB0V3nksVoTs5TfYRlX2ozWeiTljfaX
 AnYsKoYNXCWmkGq5etPMFu/HlC0ZvSSdlszG7lupX/MG6BHeErzm0TsZo
 JoNOEfXvQrF0U2riN7ILXV5jp0OAonwsERlwJRlunK8lxL6q2TiGrR9ye
 pIVS3DYW09lZD21LR13YM17V2tHDz+c3dgUS8ga6bTQNFPkyih77yEcAA A==;
X-CSE-ConnectionGUID: oymZj8JTTcyFWDf07XdaQw==
X-CSE-MsgGUID: soweXvw7QBimXXJDLfwanQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056489"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: 0wmjHhOzR7OHGYKm03dtKg==
X-CSE-MsgGUID: z2fHJcLSS920pIwZlvYo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930279"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 27/29] drm/xe: Add modparam for SVM notifier size
Date: Tue, 15 Oct 2024 20:25:16 -0700
Message-Id: <20241016032518.539495-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Useful to experiment with notifier size and how it affects performance.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c    | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 161a5e6f717f..5a3bfea8b7b4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -22,6 +22,7 @@ struct xe_modparam {
 	unsigned int max_vfs;
 #endif
 	int wedged_mode;
+	u32 svm_notifier_size;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index acf2a3750f38..16e34aaead79 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -8,6 +8,7 @@
 #include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
+#include "xe_module.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_ttm_vram_mgr.h"
@@ -573,8 +574,8 @@ int xe_svm_init(struct xe_vm *vm)
 
 	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 			       current->mm, xe_svm_devm_owner(vm->xe), 0,
-			       vm->size, SZ_512M, &gpusvm_ops,
-			       fault_chunk_sizes,
+			       vm->size, xe_modparam.svm_notifier_size * SZ_1M,
+			       &gpusvm_ops, fault_chunk_sizes,
 			       ARRAY_SIZE(fault_chunk_sizes));
 }
 
-- 
2.34.1

