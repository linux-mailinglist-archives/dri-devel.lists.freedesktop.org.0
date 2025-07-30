Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D800B15E4D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 12:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EBF10E2D4;
	Wed, 30 Jul 2025 10:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr19Hu2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2238810E445;
 Wed, 30 Jul 2025 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753871775; x=1785407775;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=1KNPoL6jC59AwmHYy7tSYj73N3SnvwhJyHMwTY9WRo0=;
 b=Rr19Hu2E7+iDvaGmL3P+AjPs6JPdxtasctREh8nVtifzF7oaS6HuqJMU
 BuAA0H5H2SAQNtvc3waPoMskm2TYkq2vSfZyN3v6TdqQL6QJKKOgoTfjM
 ilPSO3qUSB7o7+/0sD9TzZSyYMq8tYVPEa2g10rZHHBBZ/4Zmg8Px5EsZ
 mQaVD6hka8mUwxfOje/QLPHSqkpwMOY0n5cfh7OA5kI+1vAvz9OoAQZxg
 cBnYpV+BQfFkDbcKXnIYBBSx0yaGBHbt7f8+CAuoQX4MGRROLLyAkGryt
 AqRhXnYD8OI54X4xv8d/fnFLIyp213SqR49aN/Ktcw5FkPppaNzTRtq02 A==;
X-CSE-ConnectionGUID: oSGvlpCdQZGihpKapciRDw==
X-CSE-MsgGUID: on+Yr9uaSnCL16+SjUvbGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81617779"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81617779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:36:14 -0700
X-CSE-ConnectionGUID: L0xF6YZBSDSjFo/sr/cd3g==
X-CSE-MsgGUID: sfVLYtScTku8L1ox1px3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162222518"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 03:36:11 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 30 Jul 2025 15:46:38 +0530
Subject: [PATCH v2 3/4] drm/atomic: Return user readable error in atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-atomic-v2-3-cc02ce0263dd@intel.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
In-Reply-To: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com, 
 xaver.hugl@kde.org, uma.shankar@intel.com, harry.wentland@amd.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
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
 drivers/gpu/drm/drm_atomic.c      |  5 +++++
 drivers/gpu/drm/drm_atomic_uapi.c | 20 +++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..0cf73022955437260d138c6a1e2bb9a8a4eca2f0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1513,6 +1513,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
 				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
 					       crtc->base.id, crtc->name);
+				state->error_code = DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET;
+
 				return -EINVAL;
 			}
 		}
@@ -1537,8 +1539,11 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		drm_dbg_atomic(dev,
 			       "driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
 			       requested_crtc, affected_crtc);
+		state->error_code = DRM_MODE_ATOMIC_NEED_FULL_MODESET;
 		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
 		     requested_crtc, affected_crtc);
+
+		return -EINVAL;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ecc73d52bfae41a7ef455a7e13649ec56c690b90..b96707ca23ac01878c3df25b8a4a026f6c6c31d2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1058,6 +1058,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
 							   prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret)
+				state->error_code = DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED;
 			break;
 		}
 
@@ -1089,6 +1091,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 
 			/* ask the driver if this non-primary plane is supported */
 			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+				state->error_code = DRM_MODE_ATOMIC_ASYNC_NOT_PRIMARY;
 				ret = -EINVAL;
 
 				if (plane_funcs && plane_funcs->atomic_async_check)
@@ -1400,6 +1403,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	if (arg->reserved) {
+		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
+		return -EINVAL;
+	}
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
@@ -1407,16 +1415,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!file_priv->atomic) {
 		drm_dbg_atomic(dev,
 			       "commit failed: atomic cap not enabled\n");
+		arg->reserved = DRM_MODE_ATOMIC_CAP_NOT_ENABLED;
 		return -EINVAL;
 	}
 
 	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
 		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
-		return -EINVAL;
-	}
-
-	if (arg->reserved) {
-		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
+		arg->reserved = DRM_MODE_ATOMIC_INVALID_FLAG;
 		return -EINVAL;
 	}
 
@@ -1424,6 +1429,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		if (!dev->mode_config.async_page_flip) {
 			drm_dbg_atomic(dev,
 				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
+			arg->reserved = DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC;
 			return -EINVAL;
 		}
 
@@ -1435,6 +1441,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
 		drm_dbg_atomic(dev,
 			       "commit failed: page-flip event requested with test-only commit\n");
+		arg->reserved = DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY;
 		return -EINVAL;
 	}
 
@@ -1541,6 +1548,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		ret = drm_atomic_commit(state);
 	}
 
+	/* update the error code if any error to allow user handling it */
+	arg->reserved = state->error_code;
+
 out:
 	complete_signaling(dev, state, fence_state, num_fences, !ret);
 

-- 
2.25.1

