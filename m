Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6ACF6AD9
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 05:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909510E472;
	Tue,  6 Jan 2026 04:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCxsRr+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD2910E46B;
 Tue,  6 Jan 2026 04:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767674398; x=1799210398;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vKY0nSIZVk5vJgsHVciBfT4QVuDemQ1v/8L7VgDUfY4=;
 b=PCxsRr+2co3uZebufhGh4U/c6hwK1xSvoAe4ZPDRNlVzn3hcRr1looEs
 YoqVM2bXX+TdVrPYmB0pylg2yqaIJMxQK6x1Oss4Lyyjisur9Dai2QaZn
 sDcBtGV5J4jabruexZEBDW61ZkRzGWnkqHROxBzAzgv3dn1oqBEBxu8Ru
 hQ2pMe5j1Q0kjjqul7MbWlF4RV+Uv0uTVKufutM67EfUfMP1DyWXJJCS2
 UUUnt9EwOJT9aBkpI+KbL3DAWHK1720NB+2cpznmnMzflSmn1JLtKwCJY
 tGCUcAkBW6B4lOFfYfENEBDX4FopaXOmFlH9mtYCQ4UQJknlK6gICh/vE w==;
X-CSE-ConnectionGUID: 7eS9neWMQBKAdpNeLO0X9w==
X-CSE-MsgGUID: gRUT1KzsR4KlABi4iKc1+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86459288"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="86459288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:39:57 -0800
X-CSE-ConnectionGUID: V7oAE0u3QgadQ4qR50JAEg==
X-CSE-MsgGUID: DwOLZm+oQBWmc/E0S8cKlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207034324"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 05 Jan 2026 20:39:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 06 Jan 2026 10:07:56 +0530
Subject: [PATCH v7 1/5] drm: Define user readable error codes for atomic ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-atomic-v7-1-d51d9a351684@intel.com>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-0-d51d9a351684@intel.com>
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

There can be multiple reasons for a failure in atomic_ioctl. Most often
in these error conditions -EINVAL is returned. User/Compositor would
have to blindly take a call on failure of this ioctl so as to use
ALLOW_MODESET or retry. It would be good if user/compositor gets a
readable error code on failure so they can take proper corrections in
the next commit.
The struct drm_mode_atomic is being passed by the user/compositor which
holds the properties for modeset/flip. Reusing the same struct for
returning the error code in case of failure, thereby creation of new
uapi/interface for returning the error code is not required.
The element 'reserved' in the struct drm_mode_atomic is used for
returning the user readable error code. This points to the struct
drm_mode_atomic_err_code. Failure reasons as a string can also be added
on need basis by the variable failure_string in the same struct
drm_mode_atomic_err_code.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbbbfc1dfe2b806c641c720b0215e825e350bd03..024c39eba6b25e14a99b14224d96b7254ccebd61 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -45,6 +45,7 @@ extern "C" {
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
+#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	128
 
 #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
 #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
@@ -1339,6 +1340,46 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_NONBLOCK |\
 		DRM_MODE_ATOMIC_ALLOW_MODESET)
 
+/**
+ * enum drm_mode_atomic_err_code -  error codes for failures in atomic_ioctl
+ * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
+ *				       enabled, invalid falg, page_flip event
+ *				       with test-only, etc)
+ * @DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET: Need full modeset on this crtc
+ * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all connected crtc's
+ * @DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE: Aync flip not supported on this plane
+ * DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP: Modifier not supported by async flip
+ * @DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED: Property changed in async flip
+ */
+enum drm_mode_atomic_failure_codes {
+	DRM_MODE_ATOMIC_INVALID_API_USAGE,
+	DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+	DRM_MODE_ATOMIC_NEED_FULL_MODESET,
+	DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
+	DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
+	DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+};
+
+/**
+ * drm_mode_atomic_err_code - struct to store the error code
+ *
+ * pointer to this struct will be stored in reserved variable of
+ * struct drm_mode_atomic to report the failure cause to the user.
+ *
+ * @failure_code: error codes defined in enum drm_moide_atomic_failure_code
+ * @failure_string_ptr: pointer to user readable error message string
+ * @failure_obj_ptr: pointer to the drm_object that caused error
+ * @reserved: reserved for future use
+ * @count_objs: count of drm_objects if multiple drm_objects caused error
+ */
+struct drm_mode_atomic_err_code {
+	__u64 failure_code;
+	__u64 failure_objs_ptr;
+	__u64 reserved;
+	__u32 count_objs;
+	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
+};
+
 struct drm_mode_atomic {
 	__u32 flags;
 	__u32 count_objs;

-- 
2.25.1

