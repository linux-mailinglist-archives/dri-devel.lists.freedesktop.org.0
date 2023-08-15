Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2B77D298
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 20:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AA110E281;
	Tue, 15 Aug 2023 18:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528110E276;
 Tue, 15 Aug 2023 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CUu6cUqsLaQ5HGGvMpkPKfD424cCdPwZUqRPltbOhvo=; b=U1xAdWRfkC43Ht88i8qhNko242
 V2BQ+owfjQg+NE7sV/18F4Rz3/PTgzevnf9FUiAGJdnG2dFy+1uc2Om2ODp+sRbNmwAZciN8J6vxc
 6t+uThFwTrzR7LYZVcaR44p9HAPIqH/nvBDBElWg0GuoQSwlrRCfgxfWW1RpOAg/HDOQN98hWFwFp
 UaNZvyaiaR+Ow7Uggx2Q3KXQr1LSiz3JEA0XD3TS18dl0TSGQ+ZxkBvbt5iAKlX9bJCjKhYvJVivI
 uGODB3M2aj/5+/sIxTbKoD2wf17ZY3fWynol4ezf0LKXK8V/dcrUqMo2S3KI9ZDx8N0KwkqvlJgI8
 0KPY6XhQ==;
Received: from [191.193.179.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qVzEm-001Ca3-59; Tue, 15 Aug 2023 20:57:52 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: [PATCH v6 5/6] drm: Refuse to async flip with atomic prop changes
Date: Tue, 15 Aug 2023 15:57:09 -0300
Message-ID: <20230815185710.159779-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815185710.159779-1-andrealmeid@igalia.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
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
v5: no changes
v4: new patch
---
 drivers/gpu/drm/drm_atomic_helper.c |  5 +++
 drivers/gpu/drm/drm_atomic_uapi.c   | 52 +++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_crtc_internal.h |  2 +-
 drivers/gpu/drm/drm_mode_object.c   |  2 +-
 4 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 292e38eb6218..b34e3104afd1 100644
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
index a15121e75a0a..6c423a7e8c7b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1006,13 +1006,28 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
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
@@ -1029,6 +1044,13 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
@@ -1037,6 +1059,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 	case DRM_MODE_OBJECT_CRTC: {
 		struct drm_crtc *crtc = obj_to_crtc(obj);
 		struct drm_crtc_state *crtc_state;
+		struct drm_mode_config *config = &crtc->dev->mode_config;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
 		if (IS_ERR(crtc_state)) {
@@ -1044,6 +1067,18 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
@@ -1051,6 +1086,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 	case DRM_MODE_OBJECT_PLANE: {
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
+		struct drm_mode_config *config = &plane->dev->mode_config;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1058,6 +1094,13 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
@@ -1349,6 +1392,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
+	bool async_flip = false;
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1385,6 +1429,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported with atomic\n");
 			return -EINVAL;
 		}
+
+		async_flip = true;
 	}
 
 	/* can't test and expect an event at the same time. */
@@ -1469,8 +1515,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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
index ac0d2ce3f870..0e8355063eee 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -538,7 +538,7 @@ static int set_property_atomic(struct drm_mode_object *obj,
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

