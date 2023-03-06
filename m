Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3F6ABF14
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 13:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1300410E2F4;
	Mon,  6 Mar 2023 12:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0B110E2E2;
 Mon,  6 Mar 2023 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678104459; x=1709640459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zgLNq/paUsqMZFb1FBSNxkKwFW13p02FUzPpBRxF7fg=;
 b=SyiQM9vgIoUMg1gApf6yrFzHLqzxgUM/o5ytqiMupSMUTtXC2u6J0okd
 SFWZekdpQ4u5zq5vOhYkmCs+kpNll7RXZatWNx/vimdb1BGa4M1D5MHq1
 6OoFhWYrD5LS0O0cEIoVfWM0pyUgUJHEC/yLqCqd/aj0cmQfUxlDd21C2
 SKc/VgCRl/AVNAMMKFMkPqf6cOFh7INjh+Qc5tDm3lXcyFSECdivCV2n+
 LEe2KbsSssq51tjf/aP+b9ylDhVCIdYgK7lUn/6SIsiwVtZ4UO+6UhVSV
 sBgoYLTdA/v2m1vEk0aLQpjjy73h27cGb/Wwu8liER9HGoW19MAVB6m+8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315196911"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="315196911"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 04:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819278236"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="819278236"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 04:07:38 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Set I915_BO_ALLOC_USER for framebuffer
Date: Mon,  6 Mar 2023 13:07:30 +0100
Message-Id: <20230306120732.28656-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: andrzej.hajda@intel.com, andi.shyti@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Framebuffer is exposed to userspace so set I915_BO_ALLOC_USER
flag for it. This also make sure that ttm allocates offset
for lmem objects.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 +++-
 drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index ad1a37b515fb..2e6238881860 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -254,7 +254,9 @@ intel_dpt_create(struct intel_framebuffer *fb)
 
 	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
 
-	dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
+	dpt_obj = i915_gem_object_create_lmem(i915, size,
+					      I915_BO_ALLOC_CONTIGUOUS |
+					      I915_BO_ALLOC_USER);
 	if (IS_ERR(dpt_obj) && i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 		dpt_obj = i915_gem_object_create_stolen(i915, size);
 	if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 3659350061a7..98ae3a3a986a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	obj = ERR_PTR(-ENODEV);
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
-						  I915_BO_ALLOC_CONTIGUOUS);
+						  I915_BO_ALLOC_CONTIGUOUS |
+						  I915_BO_ALLOC_USER);
 	} else {
 		/*
 		 * If the FB is too big, just don't use it since fbdev is not very
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index bb6ea7de5c61..4a3680f6a3f5 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -110,7 +110,8 @@ initial_plane_vma(struct drm_i915_private *i915,
 	    size * 2 > i915->dsm.usable_size)
 		return NULL;
 
-	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
+	obj = i915_gem_object_create_region_at(mem, phys_base, size,
+					       I915_BO_ALLOC_USER);
 	if (IS_ERR(obj))
 		return NULL;
 
-- 
2.39.0

