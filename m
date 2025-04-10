Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52610A849F1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879F510EA2E;
	Thu, 10 Apr 2025 16:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6hfGIyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0610EA36;
 Thu, 10 Apr 2025 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302802; x=1775838802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0sldoFZspC7NiDwMp2/qb8crQ9ba0KUHZidEy/kF48o=;
 b=c6hfGIyldTcrumQuQe1mfKcHCyezcUURerbKEjVuOzDR7uPZQd/0AH+v
 BrGvW361Cv5hwUMC0vw1ins8RljrIToR7T6ruV1fZfC90bvkfHc3qk8c5
 Ezv07HuC/JRQCiX1zUqxv2ZgSzFobaBhDsEfcV4frjjMlcgu44rXNU093
 prRbCwJAvKeXKo1Uy+1IOTA5gR1f1KMpv2xgE9+AwtF5gTdHj5j8dGowf
 FoAx+BEaAnpvlAPWKu1KQkYKczRvi7UotHMg/SXVTKpf+tU2VxMSQBl4f
 JsBQAP0sl1grEVwUg9BSHtrr5Ooeyg+xOoZcL6M3W97OuiSQepvgypN6P w==;
X-CSE-ConnectionGUID: hanyE282Rp23e2MQ0XMT6w==
X-CSE-MsgGUID: k96TRLuQQ06Rcbp45bUx6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220085"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:22 -0700
X-CSE-ConnectionGUID: N/gmerAVRDalh9xYKsiV3Q==
X-CSE-MsgGUID: A0vcI4TITbK0m/SGiRPfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129318"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/19] drm/amdgpu: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:08 +0300
Message-ID: <20250410163218.15130-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 4cbbae543e34..2bc0d9a2509f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1196,13 +1196,14 @@ static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb
 static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
 						 struct amdgpu_framebuffer *rfb,
 						 struct drm_file *file_priv,
+						 const struct drm_format_info *info,
 						 const struct drm_mode_fb_cmd2 *mode_cmd,
 						 struct drm_gem_object *obj)
 {
 	int ret;
 
 	rfb->base.obj[0] = obj;
-	drm_helper_mode_fill_fb_struct(dev, &rfb->base, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &rfb->base, info, mode_cmd);
 	/* Verify that the modifier is supported. */
 	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
@@ -1331,7 +1332,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 	}
 
 	ret = amdgpu_display_gem_fb_verify_and_init(dev, amdgpu_fb, file_priv,
-						    mode_cmd, obj);
+						    info, mode_cmd, obj);
 	if (ret) {
 		kfree(amdgpu_fb);
 		drm_gem_object_put(obj);
-- 
2.49.0

