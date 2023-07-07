Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6E74B9AA
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 00:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241F10E60C;
	Fri,  7 Jul 2023 22:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6810E60B;
 Fri,  7 Jul 2023 22:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=de0EjBF+hzGDM+i69O+/YEHpbFntjniyjiLFzME0BgQ=; b=pr7i6ElhPBq4hMwP1RxSfNRX3w
 FhHG0ElDBsFZbPU01vkXlK9eefxtD4SfCwMUHWmB3apmHAY2qXSWmqP6jXYEmUNror8Fdw6zJx/cK
 AE85Rdafqq/WLNl/+UrMeQRtOEq28/mvF/GKJpXGNvCGhAxGHEd0czxQvd6H1nKvay0zQrJLwf5sO
 RQm93ORQZY2JeJsRM2iWh1X9nV+rU9ZehYloxyf6vk+hq1/gqsFSqnlSw+I2FHBHiP0wweZZu/eY/
 w6VFWVeV8SZA/iAMWB1yN8k6KS8yfSUZN3IPo0e+k/komiehe4FoMM/Vv8lmfXRKnnAym+OsmiUi3
 T0DG+0eg==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qHu8u-00AP6e-RH; Sat, 08 Jul 2023 00:41:37 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: [PATCH v5 5/6] drm: Refuse to async flip with atomic prop changes
Date: Fri,  7 Jul 2023 19:40:58 -0300
Message-ID: <20230707224059.305474-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707224059.305474-1-andrealmeid@igalia.com>
References: <20230707224059.305474-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 hwentlan@amd.com, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Given that prop changes may lead to modesetting, which would defeat the
fast path of the async flip, refuse any atomic prop change for async
flips in atomic API. The only exceptions are the framebuffer ID to flip
to and the mode ID, that could be referring to an identical mode.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: new patch
---
 drivers/gpu/drm/drm_atomic_helper.c |  5 +++
 drivers/gpu/drm/drm_atomic_uapi.c   | 52 +++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_crtc_internal.h |  2 +-
 drivers/gpu/drm/drm_mode_object.c   |  2 +-
 4 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2c2c9caf0be5..1e2973f0e1f6 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -629,6 +629,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
 
 		if (!drm_mode_equal(&old_crtc_state->mode, &new_crtc_state->mode)) {
+			if (new_crtc_state->async_flip) {
+				drm_dbg_atomic(dev, "[CRTC:%d:%s] no mode changes allowed during async flip\n",
+					       crtc->base.id, crtc->name);
+				return -EINVAL;
+			}
 			drm_dbg_atomic(dev, "[CRTC:%d:%s] mode changed\n",
 				       crtc->base.id, crtc->name);
 			new_crtc_state->mode_changed = true;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dfd4cf7169df..536c21f53b5f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -972,13 +972,28 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
 	return ret;
 }
 
+static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
+					 struct drm_property *prop)
+{
+	if (ret != 0 || old_val != prop_value) {
+		drm_dbg_atomic(prop->dev,
+			       "[PROP:%d:%s] No prop can be changed during async flip\n",
+			       prop->base.id, prop->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int drm_atomic_set_property(struct drm_atomic_state *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
 			    struct drm_property *prop,
-			    uint64_t prop_value)
+			    uint64_t prop_value,
+			    bool async_flip)
 {
 	struct drm_mode_object *ref;
+	uint64_t old_val;
 	int ret;
 
 	if (!drm_property_change_valid_get(prop, prop_value, &ref))
@@ -995,6 +1010,13 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
+		if (async_flip) {
+			ret = drm_atomic_connector_get_property(connector, connector_state,
+								prop, &old_val);
+			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			break;
+		}
+
 		ret = drm_atomic_connector_set_property(connector,
 				connector_state, file_priv,
 				prop, prop_value);
@@ -1003,6 +1025,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 	case DRM_MODE_OBJECT_CRTC: {
 		struct drm_crtc *crtc = obj_to_crtc(obj);
 		struct drm_crtc_state *crtc_state;
+		struct drm_mode_config *config = &crtc->dev->mode_config;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
 		if (IS_ERR(crtc_state)) {
@@ -1010,6 +1033,18 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
+		/*
+		 * We allow mode_id changes here for async flips, because we
+		 * check later on drm_atomic_helper_check_modeset() callers if
+		 * there are modeset changes or they are equal
+		 */
+		if (async_flip && prop != config->prop_mode_id) {
+			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
+							   prop, &old_val);
+			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			break;
+		}
+
 		ret = drm_atomic_crtc_set_property(crtc,
 				crtc_state, prop, prop_value);
 		break;
@@ -1017,6 +1052,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 	case DRM_MODE_OBJECT_PLANE: {
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
+		struct drm_mode_config *config = &plane->dev->mode_config;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1024,6 +1060,13 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
+		if (async_flip && prop != config->prop_fb_id) {
+			ret = drm_atomic_plane_get_property(plane, plane_state,
+							    prop, &old_val);
+			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			break;
+		}
+
 		ret = drm_atomic_plane_set_property(plane,
 				plane_state, file_priv,
 				prop, prop_value);
@@ -1312,6 +1355,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
+	bool async_flip = false;
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1348,6 +1392,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported with atomic\n");
 			return -EINVAL;
 		}
+
+		async_flip = true;
 	}
 
 	/* can't test and expect an event at the same time. */
@@ -1427,8 +1473,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 				goto out;
 			}
 
-			ret = drm_atomic_set_property(state, file_priv,
-						      obj, prop, prop_value);
+			ret = drm_atomic_set_property(state, file_priv, obj,
+						      prop, prop_value, async_flip);
 			if (ret) {
 				drm_mode_object_put(obj);
 				goto out;
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 501a10edd0e1..381130cebe81 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -251,7 +251,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
 			    struct drm_property *prop,
-			    uint64_t prop_value);
+			    uint64_t prop_value, bool async_flip);
 int drm_atomic_get_property(struct drm_mode_object *obj,
 			    struct drm_property *property, uint64_t *val);
 
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index ba1608effc0f..64f519254895 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -536,7 +536,7 @@ static int set_property_atomic(struct drm_mode_object *obj,
 						       obj_to_connector(obj),
 						       prop_value);
 	} else {
-		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value);
+		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value, false);
 		if (ret)
 			goto out;
 		ret = drm_atomic_commit(state);
-- 
2.41.0

