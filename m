Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D75875899
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA41A10F547;
	Thu,  7 Mar 2024 20:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOJ5g6oL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA0210F3E0;
 Thu,  7 Mar 2024 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709843994; x=1741379994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9VRMDZs2so6uens7UxeyglnWJWDACHcLZLvZuVtOzY=;
 b=DOJ5g6oL3iyRhlMSse3ybqPnsAU5S25466r4fGw8HrpnCU+zHyog2+4z
 RWzuPtrnU9TE3A5rphjrZZpkx9gbb/RITTRyX/K/QP6skdC8vtinNQL1h
 zMG/nOmf1s8PZ6x8XQWFt5xpgokp/vqNGRS6VDIIbYVV+SO1wtfCTBpcY
 h5hiKo93CvvzbKiClzjv+O+1VKxFv2sgcV1zo4fuGOUEFP8QtKuIUsNbT
 wzPwwkq0YrEOac9dMkUvN9DdTrpmSbn5jfNSUUpBi1oi0ZGHdq3L2N6FG
 +8yYm6e33vimvJXq5x9lnCJfMV8Yx1xs9b0OQecLVwoKx5THA63pDSefG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4664224"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4664224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10675527"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 1/6] drm/modes: add drm_mode_print() to dump mode in
 drm_printer
Date: Thu,  7 Mar 2024 22:39:33 +0200
Message-Id: <54199d36993bfb00e29cc059ab9a215495405a99.1709843865.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
References: <cover.1709843865.git.jani.nikula@intel.com>
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

Add a printer based function for dumping the modeline, so it's not
limited to KMS debug.

Note: The printed output intentionally does not have the "Modeline"
prefix. Prefix, if any, is for the caller to decide when initializing
drm_printer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_modes.c | 13 +++++++++++++
 include/drm/drm_modes.h     |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index c4f88c3a93b7..711750ab57c7 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -49,6 +49,19 @@
 
 #include "drm_crtc_internal.h"
 
+/**
+ * drm_mode_print - print a mode to drm printer
+ * @p: drm printer
+ * @mode: mode to print
+ *
+ * Write @mode description to struct drm_printer @p.
+ */
+void drm_mode_print(struct drm_printer *p, const struct drm_display_mode *mode)
+{
+	drm_printf(p, DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+}
+EXPORT_SYMBOL(drm_mode_print);
+
 /**
  * drm_mode_debug_printmodeline - print a mode to dmesg
  * @mode: mode to print
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b029..10c45014fbff 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_connector.h>
 
+struct drm_printer;
 struct videomode;
 
 /*
@@ -460,6 +461,7 @@ int drm_mode_convert_umode(struct drm_device *dev,
 			   struct drm_display_mode *out,
 			   const struct drm_mode_modeinfo *in);
 void drm_mode_probed_add(struct drm_connector *connector, struct drm_display_mode *mode);
+void drm_mode_print(struct drm_printer *p, const struct drm_display_mode *mode);
 void drm_mode_debug_printmodeline(const struct drm_display_mode *mode);
 bool drm_mode_is_420_only(const struct drm_display_info *display,
 			  const struct drm_display_mode *mode);
-- 
2.39.2

