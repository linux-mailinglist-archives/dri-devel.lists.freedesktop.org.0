Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89FCAEB001
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACAD10E31B;
	Fri, 27 Jun 2025 07:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDx78AyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3812810E31B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751008779; x=1782544779;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=ATUIz4BzG89xgGYsIGpPJfy0rwdkRBlyNSdlldnje74=;
 b=fDx78AyFqt125r/lPuX0Dl9gru4fc5Dxk9LGlk/S9aG9m/e0+D2APmOQ
 Ubma655hF0SP4ZlpKOnNDsbWpvQPPIbkOVv2rhytkLarXWui7oRh2E5vN
 erTFDbHJ5pAb2TKVwzau/bAsf+hvaSMfu9eoixY/fTubFzGYOOt/txv6+
 4Z495Jft70SPKscQPsT2lRMmL3CzBUCXb022dInjecSf/ZEVYJTcuTSJh
 lBePqYyXh3uq9+gdiBLBNRFJX9RwgMJgEml3fkQdLXZf46j84ivzTUVav
 TEBYBe6ugVxofhIKNqi4dtzf4tOnPnKHndc9BVOvmcQmm3jMSVkHnTBTc w==;
X-CSE-ConnectionGUID: g3gPUZMMQdKEWcJaIKNeLQ==
X-CSE-MsgGUID: CtV2zmTlTMOtxsbLbCOp8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="75863969"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="75863969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:19:39 -0700
X-CSE-ConnectionGUID: e4n07gQ9RoWhPypvkieocQ==
X-CSE-MsgGUID: gFe2g6apTF+8Fb+EdEzH2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="153445234"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 00:19:36 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 27 Jun 2025 12:34:48 +0530
Subject: [PATCH RFC] drm/atomic: Return readable error value on error for
 atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-atomic-v1-1-6a9ca11d3d54@intel.com>
X-B4-Tracking: v=1; b=H4sIAI9CXmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3cSS/NzMZN3UFHNj0yRLcwMDozQloOKCotS0zAqwQdFKQW7OSrG
 1tQC802b/XQAAAA==
X-Change-ID: 20250625-atomic-ed735b97002f
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
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

There can be multiple reasons for a failure in atomic_ioctl. Most often
in these error conditions -EINVAL is returned. User/Compositor would
have to blindly take a call on failure of this ioctl so as to use
ALLOW_MODESET or any. It would be good if user/compositor gets a
readable error code on failure so they can take proper corrections in
the next commit.
The struct drm_mode_atomic is being passed by the user/compositor which
holds the properties for modeset/flip. Reusing the same struct for
returning the error code in case of failure can save by creating a new
uapi/interface for returning the error code.
There is an element reserved in the struct drm_mode_atomic which can be
used to return the user readable error code.
Here an effort is made using this reserved variable to return the error
code.

This is incomplete, just a start with returning few error codes have
been made. New flags can be added accordingly. Its a 64bit variable and
should suffice 64 error codes and should be sufficient.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      |  5 +++++
 drivers/gpu/drm/drm_atomic_uapi.c | 17 ++++++++++++-----
 include/drm/drm_atomic.h          |  7 +++++++
 include/uapi/drm/drm_mode.h       | 28 ++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 5 deletions(-)

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
index ecc73d52bfae41a7ef455a7e13649ec56c690b90..ff711c8d6ef204c1e50c6bb506af6f5adb4d9b4e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1400,6 +1400,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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
@@ -1407,16 +1412,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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
 
@@ -1424,6 +1426,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		if (!dev->mode_config.async_page_flip) {
 			drm_dbg_atomic(dev,
 				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
+			arg->reserved = DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC;
 			return -EINVAL;
 		}
 
@@ -1435,6 +1438,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
 		drm_dbg_atomic(dev,
 			       "commit failed: page-flip event requested with test-only commit\n");
+		arg->reserved = DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY;
 		return -EINVAL;
 	}
 
@@ -1541,6 +1545,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		ret = drm_atomic_commit(state);
 	}
 
+	/* update the error code if any error to allow user handling it */
+	arg->reserved = state->error_code;
+
 out:
 	complete_signaling(dev, state, fence_state, num_fences, !ret);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..55799d848408e23ae5ece2dd694d119489a87ede 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -524,6 +524,13 @@ struct drm_atomic_state {
 	 * commit without blocking.
 	 */
 	struct work_struct commit_work;
+
+	/* @error_code
+	 *
+	 * flag to convey user readable error to the user.
+	 * Error codes defined in DRM_MODE_ATOMIC_ERR_FLAGS
+	 */
+	u64 error_code;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..dccf0e8a40cd06e89b0e016356d4fef89cd93a29 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1149,6 +1149,34 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_NONBLOCK |\
 		DRM_MODE_ATOMIC_ALLOW_MODESET)
 
+/* atomic not set in the drm_file */
+#define DRM_MODE_ATOMIC_CAP_NOT_ENABLED			BIT(0)
+/* atomic flag passed not in DRM_MODE_ATOMIC_FLAGS list */
+#define DRM_MODE_ATOMIC_INVALID_FLAG			BIT(1)
+/* DRM_MODE_PAGE_FLIP_LEGACY not supported with atomic ioctl  */
+#define DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC			BIT(2)
+/* flip event with atomic check only not supported */
+#define DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY	BIT(3)
+/* atomic property change requested need full crtc modeset */
+#define DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET		BIT(4)
+/* atomic property change requested has impact on all connected crtc */
+#define DRM_MODE_ATOMIC_NEED_FULL_MODESET		BIT(5)
+
+/**
+ * DRM_MODE_ATOMIC_ERR_FLAGS
+ *
+ * Bit field of the reserved element in drm_mode_atomic will be
+ * used for returning meaningful error message to the compositor
+ * so that compositor can take necessary correction going ahead.
+ */
+#define DRM_MODE_ATOMIC_ERR_FLAGS (\
+		DRM_MODE_ATOMIC_CAP_NOT_ENABLED |\
+		DRM_MODE_ATOMIC_INVALID_FLAG |\
+		DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC |\
+		DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY |\
+		DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET |\
+		DRM_MODE_ATOMIC_NEED_FULL_MODESET)
+
 struct drm_mode_atomic {
 	__u32 flags;
 	__u32 count_objs;

---
base-commit: bd57aee20daefb7b0dfe9017663668c92115ff19
change-id: 20250625-atomic-ed735b97002f

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

