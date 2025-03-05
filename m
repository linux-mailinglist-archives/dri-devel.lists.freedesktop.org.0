Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6BA4FFF7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50D510E78B;
	Wed,  5 Mar 2025 13:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSCZ555p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7110E7B6;
 Wed,  5 Mar 2025 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180509; x=1772716509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcfEdNHxrmGz+WEpkSVkyNgjCjaaXvyyv7Kcz1aWKec=;
 b=iSCZ555pXBXF8m6cb0V0yv6kS6klQ3hBKGusIDLcc3NasuIGKcbNuvz+
 zKuje5Tfx7RB5EXbE2wzPHTl/9pKKny3XI0M58yahQphrM3HkCTYLCZ8z
 LeC5jRz049H2a13ZeGQkhSBWnBS+VKMQMh8nQnWuCZ5zrVWluVRgJ4qno
 hQQ5Axys80/xlxFw3qscM1PTr70f3HNfdSc4Gk+BtlvyAn6iX75lYtVoW
 0jKO68R65vjAtlfFPeUF18ISyBNDm8Pt7lyAOgRkN0hz8BdQWFKMaTojd
 XkjfHzzpyAtr2D6w5YpUPltRxTSnnw+DmBubi/F1vui3aqqsf2DXvvYWv g==;
X-CSE-ConnectionGUID: 38R4zVP7TLSEGRmRBiijNg==
X-CSE-MsgGUID: Y1axIu+HTzS/s1IWWtWdOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685568"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:08 -0800
X-CSE-ConnectionGUID: nfLLKd0JQs+28YY3zLp26Q==
X-CSE-MsgGUID: /3np1BR6QNal0mkCXthRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701205"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:05 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 15/23] drm/i915/color: Add new color callbacks for Xelpd
Date: Wed,  5 Mar 2025 18:56:00 +0530
Message-ID: <20250305132608.2379253-16-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Since we intend to add plane color callbacks from Xelpd(D13 and beyond),
create a different structure for it.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ac4bf97741a3..45f46d7db15b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3874,6 +3874,17 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.get_config = skl_get_config,
 };
 
+static const struct intel_color_funcs xelpd_color_funcs = {
+	.color_check = icl_color_check,
+	.color_commit_noarm = icl_color_commit_noarm,
+	.color_commit_arm = icl_color_commit_arm,
+	.load_luts = icl_load_luts,
+	.read_luts = icl_read_luts,
+	.lut_equal = icl_lut_equal,
+	.read_csc = icl_read_csc,
+	.get_config = skl_get_config,
+};
+
 static const struct intel_color_funcs icl_color_funcs = {
 	.color_check = icl_color_check,
 	.color_commit_noarm = icl_color_commit_noarm,
@@ -4305,7 +4316,9 @@ void intel_color_init_hooks(struct intel_display *display)
 		else
 			display->funcs.color = &i9xx_color_funcs;
 	} else {
-		if (DISPLAY_VER(display) >= 12)
+		if (DISPLAY_VER(display) >= 13)
+			display->funcs.color = &xelpd_color_funcs;
+		else if (DISPLAY_VER(display) == 12)
 			display->funcs.color = &tgl_color_funcs;
 		else if (DISPLAY_VER(display) == 11)
 			display->funcs.color = &icl_color_funcs;
-- 
2.42.0

