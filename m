Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA6D07E5F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0A510E82B;
	Fri,  9 Jan 2026 08:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OemDsLVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E9710E82A;
 Fri,  9 Jan 2026 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948192; x=1799484192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xwA4e9eMrAjErIxW2La5HDBfzQ4+PJ8XQNQ6kA/mum8=;
 b=OemDsLVcFOOc+Up1HCmA0RjRSWXnYhsQYprtpHERTh1TV0wb20PpMBfe
 rNTAFQ+blljGhI44U2xMHooCRqO7iI1UCSyzEjFcOArAu/OGMOEu+if/9
 HUhp/0e+gNJgBWr2veabrmGeqYX233DRLwWOnibZAEBYfsg/qCFlcak/b
 jwNlLqPFAsFVSxGikqa58obY4xllSXDBiDK48+/qcTrX8ABd8eJhpqmwW
 DDZiw7MRY8T+HQabidfDgQ6XI/X9OCumqQlXkcbXIAneczlA03tYZPOMo
 sNatUlFbCgW869nKc3/tz+j6dPxz5dysTIC6t1CC7PO8ALWtPJo9TjWpl Q==;
X-CSE-ConnectionGUID: fO3C56/FSEmZ6KOAcO6I1A==
X-CSE-MsgGUID: CZ34i6FsRkyM2MvgL1976g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241404"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:11 -0800
X-CSE-ConnectionGUID: 10Ds79iFQBKpc7m+t9ImkQ==
X-CSE-MsgGUID: 6mUSTQK+SfeI1cIIPimGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924501"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:08 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 03/13] drm/vkms: Fix color pipeline enum name leak
Date: Fri,  9 Jan 2026 13:47:18 +0530
Message-Id: <20260109081728.478844-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
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

vkms_initialize_colorops() allocates enum names for color pipelines,
which are copied by drm_property_create_enum(). The temporary strings
were not freed, resulting in a memory leak.

Allocate enum names only after successful pipeline construction and
free them on all exit paths

Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 5c3ffc78aea0..d03a1f2e9c41 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -37,7 +37,6 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 
 	list->type = ops[i]->base.id;
-	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
 	i++;
 
@@ -88,6 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i - 1], ops[i]);
 
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
+
 	return 0;
 
 cleanup:
@@ -103,18 +104,18 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
 int vkms_initialize_colorops(struct drm_plane *plane)
 {
-	struct drm_prop_enum_list pipeline;
-	int ret;
+	struct drm_prop_enum_list pipeline = {};
+	int ret = 0;
 
 	/* Add color pipeline */
 	ret = vkms_initialize_color_pipeline(plane, &pipeline);
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Create COLOR_PIPELINE property and attach */
 	ret = drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
-	if (ret)
-		return ret;
 
-	return 0;
+	kfree(pipeline.name);
+out:
+	return ret;
 }
-- 
2.25.1

