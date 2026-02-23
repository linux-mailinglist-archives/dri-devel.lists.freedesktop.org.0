Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ATnIEkbnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:18:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6A173BA7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7899310E2AE;
	Mon, 23 Feb 2026 09:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgfZIsc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578CE10E2A6;
 Mon, 23 Feb 2026 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838278; x=1803374278;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/NmbOJ0YVyQpS+u/mCcIY6Yo4L364VLyKcRDgI6vfoQ=;
 b=LgfZIsc5s6NwB9mtBOv3ttRz6t7RcMOE1hzaebQ+dXFrcMqjxJ4MNnPp
 Wcc5GhIZF0yIhnKBmK+B+/QI05S+raQZIIfCTN82x3ztkT2QSbcjXa99G
 JtckUUT/RUZogB5gBSA4q7UquI1kcmBcXXlN+vs+O0BQgrpHkKG9Ok17O
 g4iWWBxP/e+0K5mt8nqcO46nFIzASjgYBp1pi+NtDXdMb++VZdc5X9eLq
 5tcF30rAnMGCDTd/ZpSyWRjAgBCVrCVkhy8gfnUdLWoY+C9c8ISkzWPXU
 Rbhwm2TYPQ0yv2KoMi/J2yCze7xGwNAq20EVn88cwY7GOrcPLODtqYdV4 w==;
X-CSE-ConnectionGUID: 0yg4BibRT7GOgQeHv/RcGA==
X-CSE-MsgGUID: Ghg3sI4AQc2RaI7r1scr4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76690792"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76690792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:17:58 -0800
X-CSE-ConnectionGUID: RbvyX/vwShSzAm27dtJoJw==
X-CSE-MsgGUID: uvqvHQD3QgaUNmGArv/WNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220048818"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 01:17:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 23 Feb 2026 14:46:03 +0530
Subject: [PATCH v10 5/7] drm/atomic: Return user readable error in atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-atomic-v10-5-f59c8def2e70@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
In-Reply-To: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: "Imported from f20260210-atomic-v9-5-525c88fd2402"@intel.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 36E6A173BA7
X-Rspamd-Action: no action

Add user readable error codes for failure cases in drm_atomic_ioctl() so
that user can decode the error code and take corrective measurements.

v8: Replaced DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
    DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP with INVALID_API_USAGE
    (Xaver)
v9: Move free atomic_state on error to patch 3 (Suraj)
v10: on copy_to_user error free atomic_state and drop acquired locks
(Suraj)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 58 +++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f295a397c26c24c6414a25bacff051bd694260c5..0a4a8e8033d21a78efaeda0dca3e018dc3ae542a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1196,6 +1196,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
 
@@ -1218,6 +1223,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
 
@@ -1256,9 +1266,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 					ret = plane_funcs->atomic_async_check(plane, state, true);
 
 				if (ret) {
-					drm_dbg_atomic(prop->dev,
-						       "[PLANE:%d:%s] does not support async flips\n",
-						       obj->id, plane->name);
+					drm_mode_atomic_add_error_msg(&state->error_code,
+								      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+								      "[PLANE:%d:%s] does not support async flip",
+								      obj->id, plane->name);
 					break;
 				}
 			}
@@ -1568,6 +1579,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
+	struct drm_mode_atomic_err_code __user *error_code_ptr;
 	int ret = 0;
 	unsigned int i, j, num_fences = 0;
 	bool async_flip = false;
@@ -1576,6 +1588,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	if (!arg->reserved)
+		drm_dbg_atomic(dev,
+			       "memory not allocated for drm_atomic error reporting\n");
+	else
+		/* Update the error code if any error to allow user handling it */
+		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
+				 (unsigned long)arg->reserved;
+
 	state = drm_atomic_state_alloc(dev);
 	if (!state)
 		return -ENOMEM;
@@ -1584,11 +1604,16 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 
+	memset(&state->error_code, 0, sizeof(*error_code_ptr));
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
 	 */
 	if (!file_priv->atomic) {
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "drm atomic capability not enabled");
 		drm_dbg_atomic(dev,
 			       "commit failed: atomic cap not enabled\n");
 		ret = -EINVAL;
@@ -1596,21 +1621,18 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
-		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (arg->reserved) {
-		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "invalid flag");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
 		if (!dev->mode_config.async_page_flip) {
-			drm_dbg_atomic(dev,
-				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
+			drm_mode_atomic_add_error_msg(&state->error_code,
+						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+						      "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl");
 			ret = -EINVAL;
 			goto out;
 		}
@@ -1621,8 +1643,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	/* can't test and expect an event at the same time. */
 	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
 			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
-		drm_dbg_atomic(dev,
-			       "commit failed: page-flip event requested with test-only commit\n");
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "page-flip event requested with test-only commit");
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1725,6 +1748,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 out:
+	/* Update the error code if any error to allow user handling it */
+	if (ret < 0 && arg->reserved) {
+		if (copy_to_user(error_code_ptr, &state->error_code,
+				 sizeof(state->error_code)))
+			ret = -EFAULT;
+	}
+
 	if (num_fences)
 		complete_signaling(dev, state, fence_state, num_fences, !ret);
 

-- 
2.25.1

