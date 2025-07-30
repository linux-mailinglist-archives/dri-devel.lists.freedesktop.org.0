Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D525FB15E4A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 12:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D869410E444;
	Wed, 30 Jul 2025 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLYMyu/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720A710E35E;
 Wed, 30 Jul 2025 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753871767; x=1785407767;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vs3WHAjUnWAXo+e4l9T+NyaVGyEuXIyC6T2IqBowSNo=;
 b=ZLYMyu/5t6wDe8KbMWptAcPJRjCS4c8Qvby0NLY2d3ONBaoFbP38dryz
 gzTWfaMBkuj4iAhanhGxGtBM1LXoO0vWF69SJp2Y95wwHu/rnOPdBDQ2N
 O1MdgNgG9QXZSamD1uwhlWrK56fiNiUx4C8D8RV6K6JmqIa9WkJfQWknt
 5J3426vKlu/TYKaaQyJnT24o4x/m1g21yPGsqom+otUeJGdAh0abGZ5Np
 fapdL2WHU/9ybe3Q1DCZEqE4Vi8qjRwenlQ1iK6WtJSXciDChYtEhltpF
 Mjjx78lpV6QWHjazl6sMmeu078J6oql44VsrZHTAEPSk0svdKvwWZhV+t g==;
X-CSE-ConnectionGUID: hkAN2rvTQCGim80wHIvsjg==
X-CSE-MsgGUID: EyoRNPf7SBm61kyJIdjTbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81617765"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81617765"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:36:07 -0700
X-CSE-ConnectionGUID: IOtf8G4HQW2MC98KgTA/VQ==
X-CSE-MsgGUID: IPYnutqKSqq4yZIxzGdMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162222506"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 03:36:04 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 30 Jul 2025 15:46:36 +0530
Subject: [PATCH v2 1/4] drm: Define user readable error codes for atomic ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
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
returning the user readable error code.Its a 64bit variable and
should suffice 64 error codes that should be sufficient.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a122bea2559387576150236e3a88f99c24ad3138..87e8f623bfaaab09135be104db04996f0be4dcb4 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1157,6 +1157,46 @@ struct drm_mode_destroy_dumb {
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
+/* async flip supported on only primary plane */
+#define DRM_MODE_ATOMIC_ASYNC_NOT_PRIMARY		BIT(6)
+/* modifier not supported by async flip */
+#define DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED	BIT(7)
+/* async flip with pipe joiner not allowed */
+#define DRM_MODE_ATOMIC_ASYNC_PIPEJOINER_NOTALLOWED	BIT(8)
+/* No properties can be changed with async flip */
+#define DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED		BIT(9)
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
+		DRM_MODE_ATOMIC_NEED_FULL_MODESET |\
+		DRM_MODE_ATOMIC_ASYNC_NOT_PRIMARY |\
+		DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED |\
+		DRM_MODE_ATOMIC_ASYNC_PIPEJOINER_NOTALLOWED |\
+		DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED)
+
 struct drm_mode_atomic {
 	__u32 flags;
 	__u32 count_objs;

-- 
2.25.1

