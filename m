Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B38BC8534
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5E310E9B1;
	Thu,  9 Oct 2025 09:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSkUuZSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819F610E9B2;
 Thu,  9 Oct 2025 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760002370; x=1791538370;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=spY0WVM8M/bc3DCWkWz1OrPF6vy0XFYM/+ppkartCvU=;
 b=iSkUuZSa6C74lTFy+qvmOY+jqiQDKRQ4vNCg2RYD6hNqFNyjTRwpccoo
 390Txsy2UwWrH1dJeHxYOgS0AmVdWbM+KfzFDJJqBsJq6p6sZYSqB8NBN
 2AAshRZhyDM46HjRsjZcfvZy7E3rjbe3er1cQG449hnlNwT8bYIG/+LLF
 6vAA6wA96N21U/j2XMFZFwjyhQq+D3dqRplHJgvBn4EHSbRxEFolK18XB
 C4shtM/AvakFJwp2rVl9sQeuBURJEmzzdzWu+We886nT4t/uR+8JlVVWb
 PKbwuefgVE86HXogShYyhqktOHt/U3GvUmcozFtXS8uA6gpOAEBR6CqlO Q==;
X-CSE-ConnectionGUID: l8pg/irMQDKI8vMUX8V5Ww==
X-CSE-MsgGUID: P214TBQaSUeYDp7wLHKFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66060875"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="66060875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:32:50 -0700
X-CSE-ConnectionGUID: VVShs+v8Q1uvMP76rLVJGQ==
X-CSE-MsgGUID: ntcjdePbTo20mjumNdeADA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="185789622"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 02:32:44 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 09 Oct 2025 15:02:52 +0530
Subject: [PATCH v6 4/5] drm/atomic: Return user readable error in atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-atomic-v6-4-d209709cc3ba@intel.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Add user readable error codes for failure cases in drm_atomic_ioctl() so
that user can decode the error code and take corrective measurements.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 71 ++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3ef478e717bec917d1b8803c72bbcc8d6409d745..3d4e9709e8e289cf302413e171b1336812d65c1c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1036,6 +1036,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			ret = drm_atomic_connector_get_property(connector, connector_state,
 								prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret) {
+				drm_mode_atomic_add_error_msg(&state->error_code,
+							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+							      "property change not allowed in async flip");
+			}
 			break;
 		}
 
@@ -1058,6 +1063,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
 							   prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret) {
+				drm_mode_atomic_add_error_msg(&state->error_code,
+							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+							      "property change not allowed in async flip");
+			}
 			break;
 		}
 
@@ -1096,9 +1106,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 					ret = plane_funcs->atomic_async_check(plane, state, true);
 
 				if (ret) {
-					drm_dbg_atomic(prop->dev,
-						       "[PLANE:%d:%s] does not support async flips\n",
-						       obj->id, plane->name);
+					drm_mode_atomic_add_error_msg(&state->error_code,
+								      DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
+								      "[PLANE:%d:%s] does not support async flip",
+								      obj->id, plane->name);
 					break;
 				}
 			}
@@ -1393,6 +1404,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
+	struct drm_mode_atomic_err_code __user *error_code_ptr;
 	int ret = 0;
 	unsigned int i, j, num_fences = 0;
 	bool async_flip = false;
@@ -1401,6 +1413,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	if (!arg->reserved)
+		drm_dbg_atomic(dev,
+			       "memory not allocated for drm_atomic error reporting\n");
+	else
+		/* update the error code if any error to allow user handling it */
+		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
+				 (unsigned long)arg->reserved;
+
 	state = drm_atomic_state_alloc(dev);
 	if (!state)
 		return -ENOMEM;
@@ -1409,31 +1429,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 
+	memset(&state->error_code, 0, sizeof(struct drm_mode_atomic_err_code));
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
 	 */
 	if (!file_priv->atomic) {
-		drm_dbg_atomic(dev,
-			       "commit failed: atomic cap not enabled\n");
-		return -EINVAL;
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "DRM_ATOMIC capability not enabled");
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
-		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
-		return -EINVAL;
-	}
-
-	if (arg->reserved) {
-		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
-		return -EINVAL;
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "invalid flag");
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
 		if (!dev->mode_config.async_page_flip) {
-			drm_dbg_atomic(dev,
-				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
-			return -EINVAL;
+			drm_mode_atomic_add_error_msg(&state->error_code,
+						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+						      "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl");
+			ret = -EINVAL;
+			goto out;
 		}
 
 		async_flip = true;
@@ -1442,9 +1466,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	/* can't test and expect an event at the same time. */
 	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
 			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
-		drm_dbg_atomic(dev,
-			       "commit failed: page-flip event requested with test-only commit\n");
-		return -EINVAL;
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "page-flip event requested with test-only commit");
+		ret = -EINVAL;
+		goto out;
 	}
 
 retry:
@@ -1543,6 +1569,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 out:
+	/* update the error code if any error to allow user handling it */
+	if (ret < 0 && arg->reserved) {
+		if (copy_to_user(error_code_ptr, &state->error_code,
+				 sizeof(state->error_code)))
+			return -EFAULT;
+	}
+
 	if (num_fences)
 		complete_signaling(dev, state, fence_state, num_fences, !ret);
 

-- 
2.25.1

