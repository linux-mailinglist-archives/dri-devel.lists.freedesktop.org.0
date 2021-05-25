Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6566A3901EB
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B276EA1F;
	Tue, 25 May 2021 13:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10A66EA13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:23 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c10so24989191lfm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dps8mBaW+NRScEhN61bzRPUv4m804yGC8EdadK0JwYg=;
 b=Lor17bfyQYap7oTadxv+fenCORIJdDY4subGe7Rs+jUr7M2m/yDjkl8zSTMDKvuLj4
 VvKLvE+wVH8WfKGlLXakly1Bzh/UExx+lFeg2oOJ1tFYKp6BHV05R5rkJLEq8nAzfvAf
 K5g8S5JIT2H5KL/HkLqqkiWMYxBRpvnYBMSG0T0qgcKMFNHyy74mrk3Q/aDQeHawu6vI
 LKkm1fVxmKGMjGUM0iVCCoFZvXpm6I5GbTl1PD6ohuUMiihOLnd9HuIr8D9fyHzITn8L
 c39BbeqWiv/+Ei0zlB+1uggzZL2RzQg9HTzMRnIy4r9JhqmWwubNnnZiskxw/EbI50/T
 qZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dps8mBaW+NRScEhN61bzRPUv4m804yGC8EdadK0JwYg=;
 b=Kos5IdXefYMbhEuCsf5aDmfD3p6Vmzp526WYWXSUTvjmmSELklG5oqqo7lqP+kWvKd
 7co4+YWNf04Ex9B7Jm54g5ecAkXUWDnbfVCsBNl7TIk9OmdeKRQf0048UxMyuI0Oz7Kp
 FWFFcDj1DkJWHGIYQ/kgm3eO1VQzHsZEv67YVn13SFUNrfnkObGCQwA6lFsrIhzts43H
 /YICa5t53aTdRAZQ8w3EsNsVVpDMLXN5wxEiiphEuo2YQ4ram0Ijfo/YMK/o7TQYvhxZ
 2MCT8naqyNyIcv0qnVAN9Pwq6kkRklP1WtYmoCXBOBsII2nF2GM2sSU5Bk5AP8gkgzhk
 YbXQ==
X-Gm-Message-State: AOAM533ngAm1y9dbNWqAtL5y4cN08b9ONICtbKMg2Mza0HVh/dUbn9RS
 N4aASjm9j0GJjNSiUHHua35SAQ==
X-Google-Smtp-Source: ABdhPJyw6KakyzIni+X9blEDwaSUw61y+E3UE7WF7iReU0EgbNwbl7Jri87OGCqyYqhFYvBGnvK69Q==
X-Received: by 2002:a19:c93:: with SMTP id 141mr14986652lfm.594.1621948402110; 
 Tue, 25 May 2021 06:13:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 5/7] drm/msm/mdp5: switch to standard zpos property
Date: Tue, 25 May 2021 16:13:14 +0300
Message-Id: <20210525131316.3117809-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of implemeting zpos property on our own, use standard zpos
property support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   |   3 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 114 ++-------------------
 3 files changed, 10 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index ed4d91420417..f482e0911d03 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -650,7 +650,7 @@ static int pstate_cmp(const void *a, const void *b)
 {
 	struct plane_state *pa = (struct plane_state *)a;
 	struct plane_state *pb = (struct plane_state *)b;
-	return pa->state->zpos - pb->state->zpos;
+	return pa->state->base.normalized_zpos - pb->state->base.normalized_zpos;
 }
 
 /* is there a helper for this? */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index d124c9bcdc60..ac269a6802df 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -98,9 +98,6 @@ struct mdp5_plane_state {
 	struct mdp5_hw_pipe *hwpipe;
 	struct mdp5_hw_pipe *r_hwpipe;	/* right hwpipe */
 
-	/* aligned with property */
-	uint8_t zpos;
-
 	/* assigned by crtc blender */
 	enum mdp_mixer_stage_id stage;
 };
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 9c678e336e7a..c6b69afcbac8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -44,8 +44,9 @@ static void mdp5_plane_destroy(struct drm_plane *plane)
 	kfree(mdp5_plane);
 }
 
-static void mdp5_plane_install_rotation_property(struct drm_device *dev,
-		struct drm_plane *plane)
+/* helper to install properties which are common to planes and crtcs */
+static void mdp5_plane_install_properties(struct drm_plane *plane,
+		struct drm_mode_object *obj)
 {
 	drm_plane_create_rotation_property(plane,
 					   DRM_MODE_ROTATE_0,
@@ -53,109 +54,12 @@ static void mdp5_plane_install_rotation_property(struct drm_device *dev,
 					   DRM_MODE_ROTATE_180 |
 					   DRM_MODE_REFLECT_X |
 					   DRM_MODE_REFLECT_Y);
-}
-
-/* helper to install properties which are common to planes and crtcs */
-static void mdp5_plane_install_properties(struct drm_plane *plane,
-		struct drm_mode_object *obj)
-{
-	struct drm_device *dev = plane->dev;
-	struct msm_drm_private *dev_priv = dev->dev_private;
-	struct drm_property *prop;
-
-#define INSTALL_PROPERTY(name, NAME, init_val, fnc, ...) do { \
-		prop = dev_priv->plane_property[PLANE_PROP_##NAME]; \
-		if (!prop) { \
-			prop = drm_property_##fnc(dev, 0, #name, \
-				##__VA_ARGS__); \
-			if (!prop) { \
-				dev_warn(dev->dev, \
-					"Create property %s failed\n", \
-					#name); \
-				return; \
-			} \
-			dev_priv->plane_property[PLANE_PROP_##NAME] = prop; \
-		} \
-		drm_object_attach_property(&plane->base, prop, init_val); \
-	} while (0)
-
-#define INSTALL_RANGE_PROPERTY(name, NAME, min, max, init_val) \
-		INSTALL_PROPERTY(name, NAME, init_val, \
-				create_range, min, max)
-
-#define INSTALL_ENUM_PROPERTY(name, NAME, init_val) \
-		INSTALL_PROPERTY(name, NAME, init_val, \
-				create_enum, name##_prop_enum_list, \
-				ARRAY_SIZE(name##_prop_enum_list))
-
-	INSTALL_RANGE_PROPERTY(zpos, ZPOS, 1, 255, 1);
-
-	mdp5_plane_install_rotation_property(dev, plane);
 	drm_plane_create_alpha_property(plane);
 	drm_plane_create_blend_mode_property(plane,
 			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 			BIT(DRM_MODE_BLEND_PREMULTI) |
 			BIT(DRM_MODE_BLEND_COVERAGE));
-
-#undef INSTALL_RANGE_PROPERTY
-#undef INSTALL_ENUM_PROPERTY
-#undef INSTALL_PROPERTY
-}
-
-static int mdp5_plane_atomic_set_property(struct drm_plane *plane,
-		struct drm_plane_state *state, struct drm_property *property,
-		uint64_t val)
-{
-	struct drm_device *dev = plane->dev;
-	struct mdp5_plane_state *pstate;
-	struct msm_drm_private *dev_priv = dev->dev_private;
-	int ret = 0;
-
-	pstate = to_mdp5_plane_state(state);
-
-#define SET_PROPERTY(name, NAME, type) do { \
-		if (dev_priv->plane_property[PLANE_PROP_##NAME] == property) { \
-			pstate->name = (type)val; \
-			DBG("Set property %s %d", #name, (type)val); \
-			goto done; \
-		} \
-	} while (0)
-
-	SET_PROPERTY(zpos, ZPOS, uint8_t);
-
-	DRM_DEV_ERROR(dev->dev, "Invalid property\n");
-	ret = -EINVAL;
-done:
-	return ret;
-#undef SET_PROPERTY
-}
-
-static int mdp5_plane_atomic_get_property(struct drm_plane *plane,
-		const struct drm_plane_state *state,
-		struct drm_property *property, uint64_t *val)
-{
-	struct drm_device *dev = plane->dev;
-	struct mdp5_plane_state *pstate;
-	struct msm_drm_private *dev_priv = dev->dev_private;
-	int ret = 0;
-
-	pstate = to_mdp5_plane_state(state);
-
-#define GET_PROPERTY(name, NAME, type) do { \
-		if (dev_priv->plane_property[PLANE_PROP_##NAME] == property) { \
-			*val = pstate->name; \
-			DBG("Get property %s %lld", #name, *val); \
-			goto done; \
-		} \
-	} while (0)
-
-	GET_PROPERTY(zpos, ZPOS, uint8_t);
-
-	DRM_DEV_ERROR(dev->dev, "Invalid property\n");
-	ret = -EINVAL;
-done:
-	return ret;
-#undef SET_PROPERTY
+	drm_plane_create_zpos_property(plane, 1, 1, 255);
 }
 
 static void
@@ -172,7 +76,8 @@ mdp5_plane_atomic_print_state(struct drm_printer *p,
 			   pstate->r_hwpipe ? pstate->r_hwpipe->name :
 					      "(null)");
 	drm_printf(p, "\tblend_mode=%u\n", pstate->base.pixel_blend_mode);
-	drm_printf(p, "\tzpos=%u\n", pstate->zpos);
+	drm_printf(p, "\tzpos=%u\n", pstate->base.zpos);
+	drm_printf(p, "\tnormalized_zpos=%u\n", pstate->base.normalized_zpos);
 	drm_printf(p, "\talpha=%u\n", pstate->base.alpha);
 	drm_printf(p, "\tstage=%s\n", stage2name(pstate->stage));
 }
@@ -188,9 +93,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-		mdp5_state->zpos = STAGE_BASE;
+		mdp5_state->base.zpos = STAGE_BASE;
 	else
-		mdp5_state->zpos = STAGE0 + drm_plane_index(plane);
+		mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
+	mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
 
 	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
 }
@@ -228,8 +134,6 @@ static const struct drm_plane_funcs mdp5_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
 		.destroy = mdp5_plane_destroy,
-		.atomic_set_property = mdp5_plane_atomic_set_property,
-		.atomic_get_property = mdp5_plane_atomic_get_property,
 		.reset = mdp5_plane_reset,
 		.atomic_duplicate_state = mdp5_plane_duplicate_state,
 		.atomic_destroy_state = mdp5_plane_destroy_state,
-- 
2.30.2

