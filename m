Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76FD1828D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B51B10E4AA;
	Tue, 13 Jan 2026 10:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7U8t7XU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2A510E4AA;
 Tue, 13 Jan 2026 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301323; x=1799837323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48BF35lcmr09wrBXC3c6k6HUjw5OuyWkLtc69E/ST54=;
 b=i7U8t7XUw3v7AGgOEJwL+caiy09yvX0pgzpWmAT+r0qcwoOx08MokVgq
 v2ppad3bX8bkv1Sw9jyf5VWl5MEq623w3opANVO4grX3zvh/PHmE+7wo6
 xHr/5ry9/HieboQdD6MOGINlMP6a2PNfxgCQz5f86gvxDdoTi5OD8uX2v
 Ufv/ilEKlriWQuBumxGXGfVee1yCUWJ1EQewkCfQhEz0CGPL+LQKmtwwm
 wmrhI4RzySCyoW6bz9Pco99uR3aBnrGlsSlgVR5SYPdKyAdvjTv7Dpkez
 Dob9gPFw7dRxbdbB1dejt+sDjhRWYG8/ZCl0xykVBtQG3oHShYIrmkdPf w==;
X-CSE-ConnectionGUID: gwtn9VSuRqW8SQ7+40/Zdw==
X-CSE-MsgGUID: ig2HxCXzQA+jg4s4LhoaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165189"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:48:43 -0800
X-CSE-ConnectionGUID: tzazq86aQXaPwEkqB4y9Tg==
X-CSE-MsgGUID: w0Vj894jSHqLTyAcYoU7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554592"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:48:39 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 03/13] drm/vkms: Fix color pipeline enum name leak
Date: Tue, 13 Jan 2026 15:52:53 +0530
Message-Id: <20260113102303.724205-4-chaitanya.kumar.borah@intel.com>
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

vkms_initialize_colorops() allocates enum names for color pipelines,
which are copied by drm_property_create_enum(). The temporary strings
were not freed, resulting in a memory leak.

Allocate enum names only after successful pipeline construction and
free them on all exit paths

Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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

