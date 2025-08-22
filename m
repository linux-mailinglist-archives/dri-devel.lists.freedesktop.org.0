Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BEB30FB5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102210EA72;
	Fri, 22 Aug 2025 06:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ft9MusFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D6A10EA6E;
 Fri, 22 Aug 2025 06:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755845996; x=1787381996;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=8INJKd7gJPe0Tsi+RH8wJ+kVluOnXbxwbFWKCKiv9kU=;
 b=Ft9MusFumsqG3amjT60JZjUXJ3YOdcrsZ7+dN+Of/UP6bDZNoc83Ey1m
 +3IfqE+JH26pocgs6g0vRalenR/GWAqi7X2Idgy7oGye6p/1OLNij4cHW
 wNN4CBYPNL0IBleIJvigD7yGCkyvS6+V+iuh7sylKonxjQyp0Jrjv3lUK
 +2Gu4RCwUZcK1APruzizFg+DA4YWU7zyrS2kT7xiQgg48dEFI5eTiCwxC
 F9JjyqbpGmrmBFVQFWeJbtpC3shBwaBDPG3er2QlJN6V6/xswvxiKYsXe
 cwDyz1ZprM9/JiEgepUKuRaSNYF8lvcn/ByUGiqRPJ0AUGpcAakGgk/Wi Q==;
X-CSE-ConnectionGUID: IUQBOI50Q02BSi2fB/Tf4w==
X-CSE-MsgGUID: paZb+FpvSR6QYDExX5hK3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68751492"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68751492"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 23:59:56 -0700
X-CSE-ConnectionGUID: HInPP2+1T8GZvcR6GVlSnw==
X-CSE-MsgGUID: CAxwxQYOSly1F1PMWDFxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192301006"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 23:59:52 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 22 Aug 2025 12:30:01 +0530
Subject: [PATCH v3 1/4] drm: Define user readable error codes for atomic ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
In-Reply-To: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
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
The element 'reserved' in the struct drm_mode_atomic is used for
returning the user readable error code. This points to the struct
drm_mode_atomic_err_code. Failure reasons have been initialized in
DRM_MODE_ATOMIC_FAILURE_REASON.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a122bea2559387576150236e3a88f99c24ad3138..f0986a3fe9a7d61e57e9a9a5ec01a604343f6930 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -45,6 +45,7 @@ extern "C" {
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
+#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
 
 #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
 #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
@@ -1157,6 +1158,47 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_NONBLOCK |\
 		DRM_MODE_ATOMIC_ALLOW_MODESET)
 
+#define DRM_MODE_ATOMIC_FAILURE_REASON \
+	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
+	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
+
+#define FAILURE_REASON(flag, reason) flag,
+typedef enum {
+	DRM_MODE_ATOMIC_FAILURE_REASON
+} drm_mode_atomic_failure_flag;
+#undef FAILURE_REASON
+
+#define FAILURE_REASON(flag, reason) #reason,
+extern const char *drm_mode_atomic_failure_string[];
+#undef FAILURE_REASON
+
+/**
+ * drm_mode_atomic_err_code - struct to store the error code
+ *
+ * pointer to this struct will be stored in reserved variable of
+ * struct drm_mode_atomic to report the failure cause to the user.
+ *
+ * @failure_flags: error codes defined in drm_atomic_failure.failure_flag
+ * @failure_string_ptr: pointer to user readable error message drm_mode_failure.failure_string
+ * @failure_obj_ptr: pointer to the drm_object that caused error
+ * @reserved: reserved for future use
+ * @count_objs: count of drm_objects if multiple drm_objects caused error
+ */
+struct drm_mode_atomic_err_code {
+	__u64 failure_flags;
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

