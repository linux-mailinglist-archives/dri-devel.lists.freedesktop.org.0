Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C3D18283
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752110E4A2;
	Tue, 13 Jan 2026 10:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsZyF+ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FB310E4A3;
 Tue, 13 Jan 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301319; x=1799837319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KUg0dL0ShMnTuFyNBMDJY3aA3aXmP44Z7H43qB+OZ0o=;
 b=GsZyF+yeUI8rC6uI/+1ELQe2PH5IcvlXzH33IkWOJdaviT8thYLHpnQW
 URHJF55bqfCcvYUz0wwCCj6/uIwMY7NDknUF+42CIkwo90AqvVjwUUszM
 TmZSUgLwL9XjDhRCQ9DmsDdJlKnJRO1Tbj4YZ9X6eYdT6nQRFthX2SoNB
 jyFB+LBcadBUCZJjeMaUVwOyyUIGJ0joKsTnd7EKozL+k5zE3P6t8PIAZ
 AfJkwGN6NeXYrt+WHZaJTbDCtV6ieJNBblla3qR6d4wERvI/5kTYQ+zxx
 EDjppmLZX8z068atvkT0v0TbDb1keYvUazpIrzlfMEQpkkqbS8I+mdB2o w==;
X-CSE-ConnectionGUID: b5hZh20dQRKOOgCB/fqnrA==
X-CSE-MsgGUID: 4Awk6Z9ZQQOzUZyiRaHA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165180"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:48:39 -0800
X-CSE-ConnectionGUID: xoSxme8GQy2A2eRCj/OUBw==
X-CSE-MsgGUID: b6U++K4fTUmjou5W6AVdUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554586"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:48:34 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 02/13] drm/amd/display: Fix color pipeline enum name leak
Date: Tue, 13 Jan 2026 15:52:52 +0530
Message-Id: <20260113102303.724205-3-chaitanya.kumar.borah@intel.com>
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

