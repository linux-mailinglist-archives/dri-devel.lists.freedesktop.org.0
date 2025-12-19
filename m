Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3ACCEBE3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB8510EE66;
	Fri, 19 Dec 2025 07:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWWtiCsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE81E10EE66;
 Fri, 19 Dec 2025 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128395; x=1797664395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RYFz56kPS/hCD+ggHjSCRm4bg+ZN2ZotuxqtpS+GFrA=;
 b=JWWtiCsTO2/P+4VAlp5abS7uC6mQhzzP3JXG+W7OuDZGaJKMCAbUUi2Q
 VkyqPQDUchitOu+as/9n6YHZTGroIw7hkjN4XHbCmeZyhD8gOn3UDlAnV
 j2z5lprvR1xjsdAjC0fvtrBx8CHXCTI0vjNlk/4GSlD8P1mt+hAcXS/Tq
 pXJFUDJZifGDT2wGWwpMysRSdwO01R3aGZXw7kxXqF3mp4o1+6a2gZVid
 gN0ung5UMYDDbcGPDrBnqkJlihbXzFWKteTTZfr66E9UYI+vXvzI+P+Hw
 PFKclNEmTfsjoSvyiXZPLpfDYqMqsrVH3CNGs/Qhi1fESv4paDJpGemqe A==;
X-CSE-ConnectionGUID: NC84xhh+SiOstP9/vjN/Yg==
X-CSE-MsgGUID: hHxggeqRSrWBwFmqMnQ3hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562304"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:15 -0800
X-CSE-ConnectionGUID: o10xvJB/Taaemcr/IrN6Gw==
X-CSE-MsgGUID: exs9AN/8R0GwPAC7aibMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209454"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:11 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name leak
Date: Fri, 19 Dec 2025 12:26:05 +0530
Message-Id: <20251219065614.190834-5-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

