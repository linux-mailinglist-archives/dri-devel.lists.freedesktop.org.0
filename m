Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB57D07E50
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F2010E826;
	Fri,  9 Jan 2026 08:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APiAFQC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAA710E821;
 Fri,  9 Jan 2026 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948187; x=1799484187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KUg0dL0ShMnTuFyNBMDJY3aA3aXmP44Z7H43qB+OZ0o=;
 b=APiAFQC47M+KiQqCJVctUt7q5DZ/HOURxL2crPrA9u1gihoV9rIbk+B+
 b8ZGNF6Z/P1nCsvTacp0cm3RUiijrlogb91HR87lQhzzyHmOc+3h8P0sR
 I8j0D3PxAyWq7SlJaoPgYwV5w/xjLQoId/6zAFbcSxCaUwv+83qojmlj6
 vhAbdOTZs4bPFbkvbPI/OUdOT/6QiDLO6bV7NGIAZQu096Xf3SqF0x7oo
 CzdC3Fch3gBueXAkbgGXxLiAt4AphuNBIb3nlH8zLZd5W1aa2AoxRN1PF
 eZBURuSzl2YDl7vqdDAWVkk7Qlq1MllWq94iOhxCYkebh3i7NGUN6tuWM Q==;
X-CSE-ConnectionGUID: HYNnkod0S3eDWQg32Z+rJg==
X-CSE-MsgGUID: bKovjIpHRGyxOHPR2QgpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69241397"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69241397"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:43:07 -0800
X-CSE-ConnectionGUID: xs1jtuJxSG+FBSB9SrFU3Q==
X-CSE-MsgGUID: K/HasflKQOGeuzTi4GwRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="240924490"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 00:43:02 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 02/13] drm/amd/display: Fix color pipeline enum name leak
Date: Fri,  9 Jan 2026 13:47:17 +0530
Message-Id: <20260109081728.478844-3-chaitanya.kumar.borah@intel.com>
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

dm_plane_init_colorops() allocates enum names for color pipelines.
These are eventually passed to drm_property_create_enum() which create
its own copies of the string. Free the strings after initialization
is done.

Also, allocate color pipeline enum names only after successfully creating
color pipeline.

Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM block")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c   |  4 +++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index d585618b8064..a2de3bba8346 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -79,7 +79,6 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 
 	list->type = ops[i]->base.id;
-	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
 
 	i++;
 
@@ -197,6 +196,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 
 	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
+
 	return 0;
 
 cleanup:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 2e3ee78999d9..7c4496fb4b9d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1790,12 +1790,13 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 static int
 dm_plane_init_colorops(struct drm_plane *plane)
 {
-	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] = {};
 	struct drm_device *dev = plane->dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dc *dc = adev->dm.dc;
 	int len = 0;
-	int ret;
+	int ret = 0;
+	int i;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return 0;
@@ -1806,7 +1807,7 @@ dm_plane_init_colorops(struct drm_plane *plane)
 		if (ret) {
 			drm_err(plane->dev, "Failed to create color pipeline for plane %d: %d\n",
 				plane->base.id, ret);
-			return ret;
+			goto out;
 		}
 		len++;
 
@@ -1814,7 +1815,11 @@ dm_plane_init_colorops(struct drm_plane *plane)
 		drm_plane_create_color_pipeline_property(plane, pipelines, len);
 	}
 
-	return 0;
+out:
+	for (i = 0; i < len; i++)
+		kfree(pipelines[i].name);
+
+	return ret;
 }
 #endif
 
-- 
2.25.1

