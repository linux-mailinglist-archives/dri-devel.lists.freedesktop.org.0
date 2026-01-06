Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C0CF96CC
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858C410E518;
	Tue,  6 Jan 2026 16:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="hYQwyQJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1C410E518
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:43:16 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767717795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZw3WZZYm28dE9HQYeQea/Sbj/eWbFcqNoZFr1t7j3E=;
 b=hYQwyQJjaehQX638QU04nMw0O9SL2XsmknEL14fxotw0BZ3t3e+XOY3BH1fsGpjNFO0Str
 IPvjbMHyGLvtebPz1PlLPivalacV6q0vdrGhxivOTUkKasCLwF9rZ9tm3a7ZGNreG035jc
 4cf0bwTKuv2f1bph4miWnuaA2s5HuYg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 4/4] drm: zynqmp: Add blend mode property to graphics plane
Date: Tue,  6 Jan 2026 11:42:47 -0500
Message-Id: <20260106164247.472544-5-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

When global alpha is enabled, per-pixel alpha is ignored. Allow
userspace to explicitly specify whether to use per-pixel alpha by
exposing it through the blend mode property. The reference manual
doesn't say whether the per-pixel alpha is pre-multiplied or not, but
Anatoliy created a test case that shows alpha is not pre-multiplied [1].
By default alpha is disabled, since this matches the behavior before
this patch.

[1] https://lore.kernel.org/dri-devel/MW4PR12MB7165CDDB17CF0855EA19AACDE6A6A@MW4PR12MB7165.namprd12.prod.outlook.com/

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Advertise coverage instead of premulti, since that's what the hardware
  supports.
- Set default blend mode to none since that's what the default was
  before this series.

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 35 ++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 284acb23c53e..aadba00921c1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -62,6 +62,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc)
 		return 0;
 
+	if (new_plane_state->pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE &&
+	    new_plane_state->alpha >> 8 != 0xff) {
+		drm_dbg_kms(plane->dev,
+			    "Plane alpha must be 1.0 when using pixel alpha\n");
+		return -EINVAL;
+	}
+
 	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
@@ -118,9 +125,13 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 
 	zynqmp_disp_layer_update(layer, new_state);
 
-	if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
-		zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
+	if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
+		bool blend = plane->state->pixel_blend_mode ==
+			     DRM_MODE_BLEND_PIXEL_NONE;
+
+		zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
 						   plane->state->alpha >> 8);
+	}
 
 	/*
 	 * Unconditionally enable the layer, as it may have been disabled
@@ -137,11 +148,18 @@ static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {
 	.atomic_disable		= zynqmp_dpsub_plane_atomic_disable,
 };
 
+void zynqmp_dpsub_plane_atomic_reset(struct drm_plane *plane)
+{
+	drm_atomic_helper_plane_reset(plane);
+	if (plane->state)
+		plane->state->pixel_blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
+}
+
 static const struct drm_plane_funcs zynqmp_dpsub_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
+	.reset			= zynqmp_dpsub_plane_atomic_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
@@ -180,9 +198,20 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 			return ret;
 
 		if (i == ZYNQMP_DPSUB_LAYER_GFX) {
+			unsigned int blend_modes =
+				BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+				BIT(DRM_MODE_BLEND_COVERAGE);
+			unsigned int def = DRM_MODE_BLEND_COVERAGE;
+
 			ret = drm_plane_create_alpha_property(plane);
 			if (ret)
 				return ret;
+
+			ret = drm_plane_create_blend_mode_default(plane,
+								  blend_modes,
+								  def);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.35.1.1320.gc452695387.dirty

