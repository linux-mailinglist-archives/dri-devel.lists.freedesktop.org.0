Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D754D182A2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBE310E4A0;
	Tue, 13 Jan 2026 10:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrqn2P3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB7810E49E;
 Tue, 13 Jan 2026 10:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301327; x=1799837327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbuGO6tkIMo4IH9d/mtz7RLf8pS5209+bUVgnZrPmS8=;
 b=jrqn2P3IdKb+9cZFwqCjUhBmvSX6lqR6WRh+ObegTFaBxZDwJV3HsejR
 n6o2BFDtF09hjOre3Ou68AZppbNv74QcZnCjed5eL0cu5HoZkSsgsZs7W
 cBNNA06lBv0HkU2wuEIC1GGo54g42t/rh31JfKDpnbElLDUhAfkg+qpKg
 WBW30+Cotnx0ve5Jp+1UjLI3/ETNksVMMqV+NuHMlBvR6W12QMrWQtq75
 CXWlTewFEvT2+sMT/GirZ2RCJfsf9oRHo+1Mg62jlBg2hI/POQqe90StN
 JdnUGCdxMVM12R+1NC4R/wLLK71CK1gLxxJ0LyIeEG1wB5UY//b0lET0K w==;
X-CSE-ConnectionGUID: 1REfPl4PS9CudDEh1jYN7Q==
X-CSE-MsgGUID: foZUBj4BQ6Kx5XKA4dpNQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165202"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165202"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:48:47 -0800
X-CSE-ConnectionGUID: l26+d0UHT1OpUj08rt7oJQ==
X-CSE-MsgGUID: JCTpfpgWSz65cII57CvcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554598"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:48:43 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 04/13] drm/i915/display: Fix color pipeline enum name leak
Date: Tue, 13 Jan 2026 15:52:54 +0530
Message-Id: <20260113102303.724205-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
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

intel_color_pipeline_plane_init() allocates enum names for color
pipelines, which are copied by drm_property_create_enum(). The temporary
strings were not freed, resulting in a memory leak.

Allocate enum names only after successful pipeline construction and free
them on all exit paths.

Fixes: ef105316819d ("drm/i915/color: Create a transfer function color pipeline")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_color_pipeline.c    | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 684641c8323b..04af552b3648 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -34,7 +34,6 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 		return ret;
 
 	list->type = colorop->base.base.id;
-	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
 
 	/* TODO: handle failures and clean up */
 	prev_op = &colorop->base;
@@ -74,6 +73,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 
 	drm_colorop_set_next_property(prev_op, &colorop->base);
 
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", list->type);
+
 	return 0;
 }
 
@@ -81,9 +82,10 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 {
 	struct drm_device *dev = plane->dev;
 	struct intel_display *display = to_intel_display(dev);
-	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] = {};
 	int len = 0;
-	int ret;
+	int ret = 0;
+	int i;
 
 	/* Currently expose pipeline only for HDR planes */
 	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
@@ -92,8 +94,14 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 	/* Add pipeline consisting of transfer functions */
 	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
 	if (ret)
-		return ret;
+		goto out;
 	len++;
 
-	return drm_plane_create_color_pipeline_property(plane, pipelines, len);
+	ret = drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	for (i = 0; i < len; i++)
+		kfree(pipelines[i].name);
+
+out:
+	return ret;
 }
-- 
2.25.1

