Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30E1BDE628
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D218710E79A;
	Wed, 15 Oct 2025 12:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FuG2pK/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9CA10E791;
 Wed, 15 Oct 2025 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760529848; x=1792065848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=774ra5ixELvYNVL72Jv0sh4TrUY6YNRZC71+fQanYm8=;
 b=FuG2pK/eyCiSAYxn/idOstu5lO4Y41givRP9ZM7cU5frgfrVZc1K6kTL
 qN/Th4NFaeJbPSiCGVO45CKhOhKxIi4xdWkRhnp0i/oZJOztm07GSjAgx
 11s/DAFhm7ZewzzTlmVxf4ICxH88qY0OU0WTd3K+2c9nfWdSmtNeaaZGf
 kAn60qPL32Ym81VllmpFRof/2Hjyl9iZINdcohHfPs92gsLCwYkSoNqSb
 tK0/YS4jmNEdQcciuV2IRUscxnLc8jq2wWf4CNIJSpaSuHgahpV7qHgm3
 j7jTnNU7SD9cPUR3/TnZL70aYaWKa13Y+CAIOKkS5rLrittWEV3vUZCkx g==;
X-CSE-ConnectionGUID: Z42zFERjSoqT59Hs4YNQKQ==
X-CSE-MsgGUID: Fq7+43yBQem0OOhwqQll8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88169116"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="88169116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:04:08 -0700
X-CSE-ConnectionGUID: 3Giz+jJWQV2ZAW87hiZ8Cg==
X-CSE-MsgGUID: FYTT+REUS0qQPZHCz4AVPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182567808"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.73])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 05:04:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4] drm/gpusvm, drm/xe: Allow mixed mappings for userptr
Date: Wed, 15 Oct 2025 14:03:20 +0200
Message-ID: <20251015120320.176338-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

From: Matthew Brost <matthew.brost@intel.com>

Compute kernels often issue memory copies immediately after completion.
If the memory being copied is an SVM pointer that was faulted into the
device and then bound via userptr, it is undesirable to move that
memory. Worse, if userptr is mixed between system and device memory, the
bind operation may be rejected.

Xe already has the necessary plumbing to support userptr with mixed
mappings. This update modifies GPUSVM's get_pages to correctly locate
pages in such mixed mapping scenarios.

v2:
- Rebase (Thomas Hellström)
v3:
- Remove Fixes tag.
v4:
- Break out from series since the other patch was merged.
- Update patch subject, ensure dri-devel and Maarten are CC'd.

Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
 include/drm/drm_gpusvm.h        | 4 ++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index cb906765897e..73e550c8ff8c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1363,7 +1363,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
-			if (zdd != page->zone_device_data && i > 0) {
+			if (!ctx->allow_mixed &&
+			    zdd != page->zone_device_data && i > 0) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
@@ -1399,7 +1400,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		} else {
 			dma_addr_t addr;
 
-			if (is_zone_device_page(page) || pagemap) {
+			if (is_zone_device_page(page) ||
+			    (pagemap && !ctx->allow_mixed)) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index f16e92cd8090..0d9130b1958a 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include "xe_svm.h"
 #include "xe_userptr.h"
 
 #include <linux/mm.h>
@@ -54,7 +55,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.device_private_page_owner = NULL,
+		.device_private_page_owner = xe_svm_devm_owner(xe),
+		.allow_mixed = true,
 	};
 
 	lockdep_assert_held(&vm->lock);
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index b92faa9a26b2..632e100e6efb 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -235,6 +235,9 @@ struct drm_gpusvm {
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
  * @devmem_only: use only device memory
+ * @allow_mixed: Allow mixed mappings in get pages. Mixing between system and
+ *               single dpagemap is supported, mixing between multiple dpagemap
+ *               is unsupported.
  *
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
@@ -246,6 +249,7 @@ struct drm_gpusvm_ctx {
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
 	unsigned int devmem_only :1;
+	unsigned int allow_mixed :1;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-- 
2.51.0

