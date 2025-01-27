Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E2A1DD19
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172CB10E5AF;
	Mon, 27 Jan 2025 20:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Xni3L5bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80A410E0D4;
 Mon, 27 Jan 2025 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Mlk5/7N/mwemi/mYAvH4Yr81WGeVFOIka3DOb6HH44=; b=Xni3L5bzKYhB5KmRPoYfA1fSoo
 PmEo+xA2V56wehL9K3jQmsP7d5dFcGiZr9QSBc+ZV7MkZOg+EgEOLWh/1Ye0qqbi6PpJF+UAvPdSw
 jocmG2uLi1Wf/M6KuklCNcOHwi2SMjlnHLcqbfVkGH7eYKxf6mkhn6DFwYKWJ3tgyiNO1SYfURw3O
 muhIMiWzGmv1bfh+2pmDv7/bzyT+ssj/49sTFelw1BVgSWZ1fmZzTSD6tLsGgmHayOqC2tgGWpcdm
 9LkRBRBEVSYwfYtjRRMYVCST23DdGacrWpN7W7b17v2fodRbIxW6Zhz/Y1/Q2qIn5DulnDb5nQjJI
 WALc5Uzw==;
Received: from 189-68-33-219.dsl.telesp.net.br ([189.68.33.219]
 helo=[192.168.15.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tcVHG-003NsK-Gm; Mon, 27 Jan 2025 21:00:10 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Mon, 27 Jan 2025 16:59:39 -0300
Subject: [PATCH v12 1/2] drm/atomic: Let drivers decide which planes to
 async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-tonyk-async_flip-v12-1-0f7f8a8610d3@igalia.com>
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
In-Reply-To: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es, 
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Christopher Snowhill <chris@kode54.net>
X-Mailer: b4 0.14.2
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

Currently, DRM atomic uAPI allows only primary planes to be flipped
asynchronously. However, each driver might be able to perform async
flips in other different plane types. To enable drivers to set their own
restrictions on which type of plane they can or cannot flip, use the
existing atomic_async_check() from struct drm_plane_helper_funcs to
enhance this flexibility, thus allowing different plane types to be able
to do async flips as well.

Create a new parameter for the atomic_async_check(), `bool flip`. This
parameter is used to distinguish when this function is being called from
a plane update from a full page flip.

In order to prevent regressions and such, we keep the current policy: we
skip the driver check for the primary plane, because it is always
allowed to do async flips on it.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Christopher Snowhill <chris@kode54.net>
Tested-by: Christopher Snowhill <chris@kode54.net> (Radeon RX 7700 XT)
---
 drivers/gpu/drm/drm_atomic_helper.c         |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c           | 37 +++++++++++++++++++++--------
 drivers/gpu/drm/loongson/lsdc_plane.c       |  3 ++-
 drivers/gpu/drm/mediatek/mtk_plane.c        |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  2 +-
 drivers/gpu/drm/tegra/dc.c                  |  3 ++-
 drivers/gpu/drm/vc4/vc4_plane.c             |  2 +-
 include/drm/drm_modeset_helper_vtables.h    |  7 +++++-
 9 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a503701e228e382cc45180b0c578d0c..8a5d62c3faecfd764fd485434858fa3933104918 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1928,7 +1928,7 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
 		return -EBUSY;
 	}
 
-	ret = funcs->atomic_async_check(plane, state);
+	ret = funcs->atomic_async_check(plane, state, false);
 	if (ret != 0)
 		drm_dbg_atomic(dev,
 			       "[PLANE:%d:%s] driver async check failed\n",
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 370dc676e3aa543c9827b50df20df78f02b738c9..2765ba90ad8faec6f1c1db112ef667e794d465c2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -27,8 +27,9 @@
  * Daniel Vetter <daniel.vetter@ffwll.ch>
  */
 
-#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_drv.h>
@@ -1063,6 +1064,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
 		struct drm_mode_config *config = &plane->dev->mode_config;
+		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1070,15 +1072,30 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip &&
-		    (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY ||
-		     (prop != config->prop_fb_id &&
-		      prop != config->prop_in_fence_fd &&
-		      prop != config->prop_fb_damage_clips))) {
-			ret = drm_atomic_plane_get_property(plane, plane_state,
-							    prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
+		if (async_flip) {
+			/* check if the prop does a nop change */
+			if ((prop != config->prop_fb_id &&
+			     prop != config->prop_in_fence_fd &&
+			     prop != config->prop_fb_damage_clips)) {
+				ret = drm_atomic_plane_get_property(plane, plane_state,
+								    prop, &old_val);
+				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			}
+
+			/* ask the driver if this non-primary plane is supported */
+			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+				ret = -EINVAL;
+
+				if (plane_funcs && plane_funcs->atomic_async_check)
+					ret = plane_funcs->atomic_async_check(plane, state, true);
+
+				if (ret) {
+					drm_dbg_atomic(prop->dev,
+						       "[PLANE:%d:%s] does not support async flips\n",
+						       obj->id, plane->name);
+					break;
+				}
+			}
 		}
 
 		ret = drm_atomic_plane_set_property(plane,
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index d227a2c1dcf16a3d5190de3893a55228ec70b254..aa9a97f9c4dc28eea3098507ce52e6aa6caa46eb 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -171,7 +171,8 @@ static const struct drm_plane_helper_funcs lsdc_primary_helper_funcs = {
 };
 
 static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
-						struct drm_atomic_state *state)
+						struct drm_atomic_state *state,
+						bool flip)
 {
 	struct drm_plane_state *new_state;
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 8a48b3b0a95676c9823daa2052aefb7f86f629ff..655106bbb76d3300edb71fa027591b2f943bbe68 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -101,7 +101,7 @@ static void mtk_plane_destroy_state(struct drm_plane *plane,
 }
 
 static int mtk_plane_atomic_async_check(struct drm_plane *plane,
-					struct drm_atomic_state *state)
+					struct drm_atomic_state *state, bool flip)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 62de248ed1b09ae479327691eea4866391977b85..bb16019219387e7c5e714106b2fb8054d0db85c1 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -368,7 +368,7 @@ static void mdp5_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
-					 struct drm_atomic_state *state)
+					 struct drm_atomic_state *state, bool flip)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 57747f1cff26e444ef3569983d6a7f7922f03ff7..e3596e2b557d042dcc660adbed14a468f2b1d484 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1072,7 +1072,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int vop_plane_atomic_async_check(struct drm_plane *plane,
-					struct drm_atomic_state *state)
+					struct drm_atomic_state *state, bool flip)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 430b2eededb2b5a3aa0c71022240076c027f5d90..798507a8ae56d6789feb95dccdd23b2e63d9c148 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1025,7 +1025,8 @@ static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 }
 
-static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_atomic_state *state)
+static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_atomic_state *state,
+					   bool flip)
 {
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index d608860d525f6a813c7e4c46c8f8aaed16dc735c..c5e84d3494d273d969a041e9200c06de2c10105a 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -2338,7 +2338,7 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 }
 
 static int vc4_plane_atomic_async_check(struct drm_plane *plane,
-					struct drm_atomic_state *state)
+					struct drm_atomic_state *state, bool flip)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ec59015aec3cf3ba01510031c55df8c0b3e0b382..0939ace53e7eb51db54dc133d2a8f898d31fc950 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1400,13 +1400,18 @@ struct drm_plane_helper_funcs {
 	 * given update can be committed asynchronously, that is, if it can
 	 * jump ahead of the state currently queued for update.
 	 *
+	 * This function is also used by drm_atomic_set_property() to determine
+	 * if the plane can be flipped in async. The flip flag is used to
+	 * distinguish if the function is used for just the plane state or for a
+	 * flip.
+	 *
 	 * RETURNS:
 	 *
 	 * Return 0 on success and any error returned indicates that the update
 	 * can not be applied in asynchronous manner.
 	 */
 	int (*atomic_async_check)(struct drm_plane *plane,
-				  struct drm_atomic_state *state);
+				  struct drm_atomic_state *state, bool flip);
 
 	/**
 	 * @atomic_async_update:

-- 
2.48.0

