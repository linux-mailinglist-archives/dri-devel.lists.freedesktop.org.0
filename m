Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACBCAEF2BA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E7510E57C;
	Tue,  1 Jul 2025 09:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar1UUrvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425B10E56F;
 Tue,  1 Jul 2025 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360951; x=1782896951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s1etjWAx3H9zgLTg3gh80iVJktf9M391p0WMGYxUPUA=;
 b=ar1UUrvf8ufkHCSl74826rfIhuzbnHx8trDq+axtuQ6FWiH2PtBbvMMq
 9cUhw7LhzNOACM10inre/7wwR2sluZ06Je+Q+0V+x7+1CpBPKz5jVZOc8
 3RzPW0cQ8t20OZgm/PyTz94lMrDb1QqwU37QVSAI5AxpBrQVeBxtZiaff
 IkSBKvVW4H78AzzVz7FFmi8wRE3QaLGjCVQOtlpio9STjMnU5dL47PQSX
 Z4SQLQQf009Hw/ngPCTs5ayT+b9EV15k+swvkhty/OWM57bKwMhkUaewh
 2kcrvxq9qkhBcZRPIu+Wbs9djunFp0GU1Fmzo406E2J1+mITJyDKM+SyU g==;
X-CSE-ConnectionGUID: TU8FvphISy+VoNfncFoC7Q==
X-CSE-MsgGUID: iFX8KfF+ROCcXeYYLns4tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218633"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:09:10 -0700
X-CSE-ConnectionGUID: ZZe+7sW6TDqAiYIYFHbnVQ==
X-CSE-MsgGUID: r2L1kaOQSfSdcesxZTS42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427384"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:09:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:09:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 18/19] drm/vmwgfx: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:21 +0300
Message-ID: <20250701090722.13645-19-ville.syrjala@linux.intel.com>
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

Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 14 +++++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 35965e29e408..54ea1b513950 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -500,6 +500,7 @@ static const struct drm_framebuffer_funcs vmw_framebuffer_surface_funcs = {
 static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 					   struct vmw_user_object *uo,
 					   struct vmw_framebuffer **out,
+					   const struct drm_format_info *info,
 					   const struct drm_mode_fb_cmd2
 					   *mode_cmd)
 
@@ -548,7 +549,7 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 		goto out_err1;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, info, mode_cmd);
 	memcpy(&vfbs->uo, uo, sizeof(vfbs->uo));
 	vmw_user_object_ref(&vfbs->uo);
 
@@ -602,6 +603,7 @@ static const struct drm_framebuffer_funcs vmw_framebuffer_bo_funcs = {
 static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 				      struct vmw_bo *bo,
 				      struct vmw_framebuffer **out,
+				      const struct drm_format_info *info,
 				      const struct drm_mode_fb_cmd2
 				      *mode_cmd)
 
@@ -634,7 +636,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 	}
 
 	vfbd->base.base.obj[0] = &bo->tbo.base;
-	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, info, mode_cmd);
 	vfbd->base.bo = true;
 	vfbd->buffer = vmw_bo_reference(bo);
 	*out = &vfbd->base;
@@ -679,11 +681,13 @@ vmw_kms_srf_ok(struct vmw_private *dev_priv, uint32_t width, uint32_t height)
  * @dev_priv: Pointer to device private struct.
  * @uo: Pointer to user object to wrap the kms framebuffer around.
  * Either the buffer or surface inside the user object must be NULL.
+ * @info: pixel format information.
  * @mode_cmd: Frame-buffer metadata.
  */
 struct vmw_framebuffer *
 vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 			struct vmw_user_object *uo,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct vmw_framebuffer *vfb = NULL;
@@ -692,10 +696,10 @@ vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 	/* Create the new framebuffer depending one what we have */
 	if (vmw_user_object_surface(uo)) {
 		ret = vmw_kms_new_framebuffer_surface(dev_priv, uo, &vfb,
-						      mode_cmd);
+						      info, mode_cmd);
 	} else if (uo->buffer) {
 		ret = vmw_kms_new_framebuffer_bo(dev_priv, uo->buffer, &vfb,
-						 mode_cmd);
+						 info, mode_cmd);
 	} else {
 		BUG();
 	}
@@ -742,7 +746,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 	}
 
 
-	vfb = vmw_kms_new_framebuffer(dev_priv, &uo, mode_cmd);
+	vfb = vmw_kms_new_framebuffer(dev_priv, &uo, info, mode_cmd);
 	if (IS_ERR(vfb)) {
 		ret = PTR_ERR(vfb);
 		goto err_out;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 511e29cdb987..445471fe9be6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -399,6 +399,7 @@ int vmw_kms_readback(struct vmw_private *dev_priv,
 struct vmw_framebuffer *
 vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 			struct vmw_user_object *uo,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd);
 void vmw_guess_mode_timing(struct drm_display_mode *mode);
 void vmw_kms_update_implicit_fb(struct vmw_private *dev_priv);
-- 
2.49.0

