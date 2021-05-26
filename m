Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FD3391444
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B4E6E183;
	Wed, 26 May 2021 10:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FD56E038;
 Wed, 26 May 2021 10:00:21 +0000 (UTC)
IronPort-SDR: mXeJumGKHcFLJVNia4CJ2WhTq/ZIwiMA78IggLhnOR39yaVbGqh1ApiDM7IpIppMNje9YaKdCV
 L78KIV+WuZ1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202441420"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="202441420"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:00:17 -0700
IronPort-SDR: cVS60Yl54gJ9BmKOGe3s3OIOf3RAdKdoz1xX3rU9EmgWGQVHzyZ/f81K2zv+8VI4z1QH0HhoFv
 vD+qYXX8WBeg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="443945073"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:00:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/params: Align visibility of device level and global
 modparams
Date: Wed, 26 May 2021 11:00:06 +0100
Message-Id: <20210526100006.2205062-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We have a few modparams which get conditionaly exposed based on a Kconfig
options and in most cases this also means portions of the driver
implementing the respective feature are also left out.

Align the visibility of device level and global modparams to make them
consistent in this respect.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_params.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 14cd64cc61d0..dee1db50c31a 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -71,18 +71,18 @@ struct drm_printer;
 	param(int, fastboot, -1, 0600) \
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
-	param(unsigned long, fake_lmem_start, 0, 0400) \
-	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, 0600) \
+	param(unsigned long, fake_lmem_start, 0, IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM ? 0400 : 0)) \
+	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \
 	/* leave bools at the end to not create holes */ \
 	param(bool, enable_hangcheck, true, 0600) \
 	param(bool, load_detect_test, false, 0600) \
 	param(bool, force_reset_modeset_test, false, 0600) \
-	param(bool, error_capture, true, 0600) \
+	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
 	param(bool, disable_display, false, 0400) \
 	param(bool, verbose_state_checks, true, 0) \
 	param(bool, nuclear_pageflip, false, 0400) \
 	param(bool, enable_dp_mst, true, 0600) \
-	param(bool, enable_gvt, false, 0400)
+	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
 
 #define MEMBER(T, member, ...) T member;
 struct i915_params {
-- 
2.30.2

