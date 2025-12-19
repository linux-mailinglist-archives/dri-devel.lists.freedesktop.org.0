Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B51CCEC0A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9150310EE9E;
	Fri, 19 Dec 2025 07:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN0ImyCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEA210EE8E;
 Fri, 19 Dec 2025 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128414; x=1797664414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BvoZaxNUDBvuHzUt1JjAkDEKUOIDMkkGPmcNKQGcXmI=;
 b=CN0ImyCvFnf+OKQqz+oOntEEoKs4tMX5hOTdAOYO02KLeLpvS0bsywZ0
 iCPgtRdGYnoXLjHYfGC2/FPEx216+Rh2WbvHzNoIcOfPFzTVaPaMJmTxz
 a/I5okoULQJZDiyU9G7s3I8J+uTouUcSMfCKpki7vBxB9EgyiBUcnkz6k
 znUPpGUyE4pM0YduTir5fxmOkEWO8zhIUxQ08yazr2mw0y8Hmm2gPQOlr
 ZHYI0bX6qQ+NvlBcVbTZAlZp4OwdaMJiUt69PQYkvsbaOaH6Jx9KjfT4g
 2aEupYOOLBmn/wKx5lj7pDR8tx58OQ0EJpWDKcukKIcXuZxHcbsBEipnV w==;
X-CSE-ConnectionGUID: ige3LALVR/O9DSKDRWZhpA==
X-CSE-MsgGUID: 05b7M/vaTq2PwOp/O4+wdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562359"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562359"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:34 -0800
X-CSE-ConnectionGUID: SfbDsGfKQvS9TVAIILDP8A==
X-CSE-MsgGUID: w3ifzuyTSNG+wFOQOJ8s0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209531"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:30 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 08/13] drm/vkms: Hook up colorop destroy helper for plane
 pipelines
Date: Fri, 19 Dec 2025 12:26:09 +0530
Message-Id: <20251219065614.190834-9-chaitanya.kumar.borah@intel.com>
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

Provide a drm_colorop_funcs instance for vkms color pipeline
objects and hook up the common drm_colorop_destroy() helper as the
destroy callback.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 9e9dd0494628..ba826ad384b7 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -12,6 +12,10 @@ static const u64 supported_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
 
+static const struct drm_colorop_funcs vkms_colorop_funcs = {
+	.destroy = drm_colorop_destroy,
+};
+
 #define MAX_COLOR_PIPELINE_OPS 4
 
 static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
@@ -31,7 +35,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &vkms_colorop_funcs,
+					      supported_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
@@ -48,7 +53,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, &vkms_colorop_funcs,
 					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
@@ -65,7 +70,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, &vkms_colorop_funcs,
 					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
@@ -82,7 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &vkms_colorop_funcs,
+					      supported_tfs,
 					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
 	if (ret)
 		goto cleanup;
-- 
2.25.1

