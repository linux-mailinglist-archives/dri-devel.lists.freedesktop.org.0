Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B238961C5C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B6410E484;
	Wed, 28 Aug 2024 02:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV6FLgwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EE310E44E;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813291; x=1756349291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sMk/7YX2p/2MK0vK2YrTbxN0/jQNK9Tnxet3NvVWjS0=;
 b=bV6FLgwS55VuKmmNLWUR5f89eGYTEDROLpvTBcTonx4edxxBkE3OEw8C
 p17WRYKYP3aUQNthKcy1Peo78hlVRClFUqjbBX0DW4HJxHS/OW6p3tKeK
 6l7r0JZgSm0P8QUVWszVPz2BbkKemXNLSdyeSJ307TZMaeWYIB2ppFnqG
 c+MCbvoMSwumh+clQQqhPSfshAoOhYsvpz3gx8rrvBDorKqHm0YhRugdw
 yCH5b7m1F5IKmzRhiwjTtl2XQ9cdiXsmM7P/WgScUk4q9mJMAudfl7wVc
 rtCpgXBnQJ0EdPbw7eaZ+3Ffbbg/WPHuuc78AFHeIENAefmNrD+1xpTKV g==;
X-CSE-ConnectionGUID: kLMyFBrRTzOxdf6vpktZlQ==
X-CSE-MsgGUID: 0fi5XLrWQfCCIC0xG9xp8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251938"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
X-CSE-ConnectionGUID: yeKZ6j5/RlGNe0G+ovNGyw==
X-CSE-MsgGUID: c8/3JMfkS3G1gTVyeQ3cXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224658"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 22/28] drm/xe: Add BO flags required for SVM
Date: Tue, 27 Aug 2024 19:48:55 -0700
Message-Id: <20240828024901.2582335-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Add XE_BO_FLAG_SYSTEM_ALLOC to indicate BO is tied to SVM range.

Add XE_BO_FLAG_SKIP_CLEAR to indicate BO does not need to cleared.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_bo.h |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b6c6a4a3b4d4..ad804b6f9e84 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -704,9 +704,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
 
 	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
-	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
+	needs_clear = !(bo->flags & XE_BO_FLAG_SKIP_CLEAR) &&
+		((ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
-		clear_system_pages;
+		clear_system_pages);
 
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(ttm);
@@ -1284,7 +1285,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
+	xe_assert(xe, !tile || type == ttm_bo_type_kernel ||
+		  flags & XE_BO_FLAG_SYSTEM_ALLOC);
 
 	if (XE_WARN_ON(!size)) {
 		xe_bo_free(bo);
@@ -2292,7 +2294,8 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	 * can't be used since there's no CCS storage associated with
 	 * non-VRAM addresses.
 	 */
-	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+	    (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC)))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dbfb3209615d..fe2ce641b256 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,6 +39,8 @@
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
+#define XE_BO_FLAG_SYSTEM_ALLOC		BIT(18)
+#define XE_BO_FLAG_SKIP_CLEAR		BIT(19)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
-- 
2.34.1

