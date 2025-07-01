Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1DAEF2A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8C10E54A;
	Tue,  1 Jul 2025 09:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6FURfEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABD410E567;
 Tue,  1 Jul 2025 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360908; x=1782896908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpxSDikbkDy2F4IW3yX/uXsNStKQnbJ7iayKVZaL/kg=;
 b=N6FURfEqT6PjuGGz/vQz0x8cTO6RIZSZBSTEQNXQPJTq1M8lZoGseaFt
 uqbywrdq/bBgdPucRLcvvi+1lD4LgUoCNDb5HFNlOcSSPDFH/tGODiIhJ
 vU3Kk8SI362ahJ0dpEWTQQI2dziuiHJ/3xWbkjz7uy0Dza86J0RaMQHQy
 oELLd1wSSc5S0kwGQyXaF+364JFPaqcbgBO3Rrpbmd3M+yjPaS034wPXv
 t/KhDu0qx3pmGivaEKAtTo67PtxMCIhYWtWkQlMMuTbsWitVn/DCOrzXO
 4uGId1YJu9QUdD4/Pd74qasGnOVWxQSm78If34iTAsO5ceUQyiNlzZWuO w==;
X-CSE-ConnectionGUID: 2Q86NMcWRj+W7mnDp8ivVQ==
X-CSE-MsgGUID: kE8zfWXDQx6p+hopock3Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218482"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218482"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:28 -0700
X-CSE-ConnectionGUID: eULemfDOTE2xMR8A9zSc/Q==
X-CSE-MsgGUID: l2E+5w88QeGO+OJ3ph6H3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427174"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/19] drm/amdgpu: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:12 +0300
Message-ID: <20250701090722.13645-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

