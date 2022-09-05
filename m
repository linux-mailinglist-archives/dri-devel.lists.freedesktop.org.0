Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE05AD0A8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB3B10E2A8;
	Mon,  5 Sep 2022 10:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017BA10E28E;
 Mon,  5 Sep 2022 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662375217; x=1693911217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KLC/FW9KIe16SKVDU+/OtuamUatCXKhRTpO7Ttv3yrE=;
 b=ka5Pf/1owUyE+PCLG1iRjz1gZpPJh+TfhBuUbf+G9KkrkhvFebJ1Hm1H
 7ZnHfrq/U/5d7EQrxgD9c3o0WOq2dNU29O58V4c8h2HopV0yB+xGHtVnz
 AhyPbjDXDuD8YdxyLvUx97+oDtG3EtT5QnHyEZcbS0YRoqmWWFJyQqv29
 0aapjcLUShf8h+TNpvbWJ+zu0JBw7Ds2FAUeBTVyyYCfcuvANQIjEXOyN
 RedeLB3lExjdbVMvGXlpS1gWklmCW6nTCNhvS8woPQthqD8V0c59RQxtD
 VVIuABS0ZyHw3MHCJ8cjtODOx9lxYjEnQCkAxgyJwRxZx8yIZ+gF5tnIg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="358079231"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="358079231"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 03:53:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="675242538"
Received: from icoco-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.248])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 03:53:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages
Date: Mon,  5 Sep 2022 11:53:29 +0100
Message-Id: <20220905105329.41455-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just move the HAS_FLAT_CCS() check into needs_ccs_pages. This also then
fixes i915_ttm_memcpy_allowed() which was incorrectly reporting true on
DG1, even though it doesn't have small-BAR or flat-CCS.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6605
Fixes: efeb3caf4341 ("drm/i915/ttm: disallow CPU fallback mode for ccs pages")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 3 +++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 389e9f157ca5..85482a04d158 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -723,6 +723,9 @@ bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
 	bool lmem_placement = false;
 	int i;
 
+	if (!HAS_FLAT_CCS(to_i915(obj->base.dev)))
+		return false;
+
 	for (i = 0; i < obj->mm.n_placements; i++) {
 		/* Compression is not allowed for the objects with smem placement */
 		if (obj->mm.placements[i]->type == INTEL_MEMORY_SYSTEM)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index bc9c432edffe..f64a3deb12fc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -297,7 +297,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		i915_tt->is_shmem = true;
 	}
 
-	if (HAS_FLAT_CCS(i915) && i915_gem_object_needs_ccs_pages(obj))
+	if (i915_gem_object_needs_ccs_pages(obj))
 		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
 						      NUM_BYTES_PER_CCS_BYTE),
 					 PAGE_SIZE);
-- 
2.37.3

