Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F001551E432
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 06:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E02C11241C;
	Sat,  7 May 2022 04:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53511241A;
 Sat,  7 May 2022 04:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651899525; x=1683435525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oaLGjlPU3rnYFojyGh2EiKiR3CCBAvTvqHrCOOYe7fs=;
 b=HbZrGVAs7Rtv1C9t9p2k27Pt1E6yfeVuXPVq7Zor1kbkVSwU71qRUDbC
 Ib7ZCEISVO+0amOSEwQG8P81ylTeJlmQasbjQ0pOnTs0f7xlS4I7j6Biz
 Mr3SSIf6lOA1rW5YeF49EEB0F+IDW5lleoWbmw5hGyFXTHKGCCLrDDOhN
 +fJf2hiRRELajB9pf6DdTbmkvPz40DRkRjaPq7cwYQLfrshxu8WaB9mHc
 QH/g3Xe1nGqwqS1GC+ycSvDeXLrZ8N2gZo7V6qYIpM33gCjc5TROZugLA
 z+2fI+54H8SCKrU9cCyZFZMnxvcVBd/qJIT9nghXPQmu5/w2vB/QAJkBu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="329199726"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="329199726"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 21:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="633249419"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 06 May 2022 21:58:43 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/guc: Remove unnecessary GuC err capture noise
Date: Fri,  6 May 2022 21:58:47 -0700
Message-Id: <20220507045847.862261-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507045847.862261-1-alan.previn.teres.alexis@intel.com>
References: <20220507045847.862261-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC error capture blurts some debug messages about empty
register lists for certain register types on engines during
firmware initialization.

These are not errors or warnings, so get rid of them.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 77 +------------------
 1 file changed, 2 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index c4e25966d3e9..97a32e610c30 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -420,72 +420,6 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 	return default_lists;
 }
 
-static const char *
-__stringify_owner(u32 owner)
-{
-	switch (owner) {
-	case GUC_CAPTURE_LIST_INDEX_PF:
-		return "PF";
-	case GUC_CAPTURE_LIST_INDEX_VF:
-		return "VF";
-	default:
-		return "unknown";
-	}
-
-	return "";
-}
-
-static const char *
-__stringify_type(u32 type)
-{
-	switch (type) {
-	case GUC_CAPTURE_LIST_TYPE_GLOBAL:
-		return "Global";
-	case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
-		return "Class";
-	case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
-		return "Instance";
-	default:
-		return "unknown";
-	}
-
-	return "";
-}
-
-static const char *
-__stringify_engclass(u32 class)
-{
-	switch (class) {
-	case GUC_RENDER_CLASS:
-		return "Render";
-	case GUC_VIDEO_CLASS:
-		return "Video";
-	case GUC_VIDEOENHANCE_CLASS:
-		return "VideoEnhance";
-	case GUC_BLITTER_CLASS:
-		return "Blitter";
-	case GUC_COMPUTE_CLASS:
-		return "Compute";
-	default:
-		return "unknown";
-	}
-
-	return "";
-}
-
-static void
-guc_capture_warn_with_list_info(struct drm_i915_private *i915, char *msg,
-				u32 owner, u32 type, u32 classid)
-{
-	if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
-		drm_dbg(&i915->drm, "GuC-capture: %s for %s %s-Registers.\n", msg,
-			__stringify_owner(owner), __stringify_type(type));
-	else
-		drm_dbg(&i915->drm, "GuC-capture: %s for %s %s-Registers on %s-Engine\n", msg,
-			__stringify_owner(owner), __stringify_type(type),
-			__stringify_engclass(classid));
-}
-
 static int
 guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 		      struct guc_mmio_reg *ptr, u16 num_entries)
@@ -501,11 +435,8 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 		return -ENODEV;
 
 	match = guc_capture_get_one_list(reglists, owner, type, classid);
-	if (!match) {
-		guc_capture_warn_with_list_info(i915, "Missing register list init", owner, type,
-						classid);
+	if (!match)
 		return -ENODATA;
-	}
 
 	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
 		ptr[i].offset = match->list[i].reg.reg;
@@ -556,7 +487,6 @@ int
 intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 			      size_t *size)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct intel_guc_state_capture *gc = guc->capture;
 	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
 	int num_regs;
@@ -570,11 +500,8 @@ intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 cl
 	}
 
 	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
-	if (!num_regs) {
-		guc_capture_warn_with_list_info(i915, "Missing register list size",
-						owner, type, classid);
+	if (!num_regs)
 		return -ENODATA;
-	}
 
 	*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
 			   (num_regs * sizeof(struct guc_mmio_reg)));
-- 
2.25.1

