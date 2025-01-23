Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFFBA1A6B5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2F210E85D;
	Thu, 23 Jan 2025 15:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIUbeyfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5397E10E84A;
 Thu, 23 Jan 2025 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644984; x=1769180984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1J64d3BSz/Q9jUEGRoAK5luuBg4HbsYlSkrA7K6BmgA=;
 b=cIUbeyfm2DD1qEnz6evHIZdiEn+voh+YL4bIw0zL1f0bcJo/AYyPXFPH
 df2wEfo43asMx3LJbIga8W3d9pVdgLpbA/79Gd1jb+X/RvYQ7RUCDNyeB
 FwzsjgTYSn1V9G25NH8/j2KlHG/qfgcTvE9KMX2RnhyRTko+2f0kJ6iwK
 VSNSpob9AdaL0mVBuek6vYSBzIH3ZHtw6/JV4yXRUWFAwvmp2ZlSkghkK
 O0P6l+1w0+3jm7YTrzwvWf8kfvPa1EZqWMQk2d4Vx8yJuFIAg9GzQoBAv
 /uUhQn+5EtbTwoZ6EzIEJeDOlE173+5cNfzEgkPV+qBb3ziMkWjjHv8vK w==;
X-CSE-ConnectionGUID: HjxJioPsThGfhVXoZ308Jg==
X-CSE-MsgGUID: 7Pla8YIJS4u9H3S6RJNNgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49542447"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49542447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:44 -0800
X-CSE-ConnectionGUID: Bre/g3keRzycipvT+DVTMg==
X-CSE-MsgGUID: VPsdWuc0TryNWmQkVwHFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108350347"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 5/5] drm/print: require struct drm_device for drm_err() and
 friends
Date: Thu, 23 Jan 2025 17:09:12 +0200
Message-Id: <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The expectation is that the struct drm_device based logging helpers get
passed an actual struct drm_device pointer rather than some random
struct pointer where you can dereference the ->dev member.

Add a static inline helper to convert struct drm_device to struct
device, with the main benefit being the type checking of the macro
argument.

As a side effect, this also reduces macro argument double references.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_print.h | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9732f514566d..f31eba1c7cab 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
  * Prefer drm_device based logging over device or prink based logging.
  */
 
+/* Helper to enforce struct drm_device type */
+static inline struct device *__drm_to_dev(const struct drm_device *drm)
+{
+	return drm ? drm->dev : NULL;
+}
+
 /* Helper for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)			\
-	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
+	dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
 
 
 #define drm_info(drm, fmt, ...)					\
@@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 
 
 #define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg_driver(drm, fmt, ...)						\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
+#define drm_dbg_driver(drm, fmt, ...)					\
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
 #define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
 
@@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
 #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
 ({												\
 	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
-	const struct drm_device *drm_ = (drm);							\
 												\
 	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
+		drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __VA_ARGS__);		\
 })
 
 #define drm_dbg_ratelimited(drm, fmt, ...) \
@@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
 /* Helper for struct drm_device based WARNs */
 #define drm_WARN(drm, condition, format, arg...)			\
 	WARN(condition, "%s %s: [drm] " format,				\
-			dev_driver_string((drm)->dev),			\
-			dev_name((drm)->dev), ## arg)
+			dev_driver_string(__drm_to_dev(drm)),		\
+			dev_name(__drm_to_dev(drm)), ## arg)
 
 #define drm_WARN_ONCE(drm, condition, format, arg...)			\
 	WARN_ONCE(condition, "%s %s: [drm] " format,			\
-			dev_driver_string((drm)->dev),			\
-			dev_name((drm)->dev), ## arg)
+			dev_driver_string(__drm_to_dev(drm)),		\
+			dev_name(__drm_to_dev(drm)), ## arg)
 
 #define drm_WARN_ON(drm, x)						\
 	drm_WARN((drm), (x), "%s",					\
-- 
2.39.5

