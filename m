Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F86151FC18
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDA810EEF9;
	Mon,  9 May 2022 12:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3E10E487;
 Mon,  9 May 2022 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097903; x=1683633903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wc8hNVmaBYkdQ6rSRpf1GF1qqlCU2JBshnNhGtTCXvs=;
 b=NrOU3IcwkagJddbkgGuOtiRLorf6FwszV6zA6/9wRMpAVf2d3BuojqPt
 QSoodGKyDAub24RHJ+lfFr2EL5MsJnrJiElOJLvBrqDh+NIrkmffzCs05
 OJvo/l8kT/xmFe6Kk99T9LaPf/7JqxORtMFOIfpVJ158mhf2a7pV8HE/x
 egIMQbkuzaGKJxxnkJIDfdThHgLu5ZYR44MxnRw6qqYN+HuivIAK9ZXZG
 4zJMfmsp+f4o+pVTrzFG80wAVxEBsdjfR1pxkGrD8XOu5j01Y38lCDpEQ
 PDPiV33+znVvc7z0wioF43f4SI+YhBCoYNHLN1ipk803knBd1KswmGQ/p A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="251074488"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="251074488"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="669115883"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/25] drm/edid: convert drm_for_each_detailed_block() to
 drm_edid
Date: Mon,  9 May 2022 15:03:15 +0300
Message-Id: <bfd06d64235393012b2f3626d5764350de5f5321.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

v2: Fix checkpatch warning on superfluous parens

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e3ff0f31a614..61551ce0db88 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2598,20 +2598,20 @@ vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
 		cb((const struct detailed_timing *)(det_base + 18 * i), closure);
 }
 
-static void
-drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *closure)
+static void drm_for_each_detailed_block(const struct drm_edid *drm_edid,
+					detailed_cb *cb, void *closure)
 {
 	struct drm_edid_iter edid_iter;
 	const u8 *ext;
 	int i;
 
-	if (edid == NULL)
+	if (!drm_edid)
 		return;
 
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
-		cb(&(edid->detailed_timings[i]), closure);
+		cb(&drm_edid->edid->detailed_timings[i], closure);
 
-	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
 	drm_edid_iter_for_each(ext, &edid_iter) {
 		switch (*ext) {
 		case CEA_EXT:
@@ -2650,7 +2650,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_edid)
 	if (drm_edid->edid->revision >= 4) {
 		bool ret = false;
 
-		drm_for_each_detailed_block(drm_edid->edid, is_rb, &ret);
+		drm_for_each_detailed_block(drm_edid, is_rb, &ret);
 		return ret;
 	}
 
@@ -2677,7 +2677,7 @@ drm_gtf2_hbreak(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
 
@@ -2689,7 +2689,7 @@ drm_gtf2_2c(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
 
@@ -2701,7 +2701,7 @@ drm_gtf2_m(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
 
@@ -2713,7 +2713,7 @@ drm_gtf2_k(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
 
@@ -2725,7 +2725,7 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
 {
 	const struct detailed_timing *descriptor = NULL;
 
-	drm_for_each_detailed_block(drm_edid->edid, find_gtf2, &descriptor);
+	drm_for_each_detailed_block(drm_edid, find_gtf2, &descriptor);
 
 	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
 
@@ -3265,7 +3265,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 	};
 
 	if (version_greater(drm_edid->edid, 1, 0))
-		drm_for_each_detailed_block(drm_edid->edid, do_inferred_modes, &closure);
+		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
 
 	return closure.modes;
 }
@@ -3342,7 +3342,7 @@ static int add_established_modes(struct drm_connector *connector,
 	}
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block(drm_edid->edid, do_established_modes,
+		drm_for_each_detailed_block(drm_edid, do_established_modes,
 					    &closure);
 
 	return modes + closure.modes;
@@ -3397,7 +3397,7 @@ static int add_standard_modes(struct drm_connector *connector,
 	}
 
 	if (version_greater(drm_edid->edid, 1, 0))
-		drm_for_each_detailed_block(drm_edid->edid, do_standard_modes,
+		drm_for_each_detailed_block(drm_edid, do_standard_modes,
 					    &closure);
 
 	/* XXX should also look for standard codes in VTB blocks */
@@ -3477,7 +3477,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 	};
 
 	if (version_greater(drm_edid->edid, 1, 2))
-		drm_for_each_detailed_block(drm_edid->edid, do_cvt_mode, &closure);
+		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
 
@@ -3536,7 +3536,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 		closure.preferred =
 		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
-	drm_for_each_detailed_block(drm_edid->edid, do_detailed_mode, &closure);
+	drm_for_each_detailed_block(drm_edid, do_detailed_mode, &closure);
 
 	return closure.modes;
 }
@@ -4838,7 +4838,7 @@ static int get_monitor_name(const struct drm_edid *drm_edid, char name[13])
 	if (!drm_edid || !name)
 		return 0;
 
-	drm_for_each_detailed_block(drm_edid->edid, monitor_name, &edid_name);
+	drm_for_each_detailed_block(drm_edid, monitor_name, &edid_name);
 	for (mnl = 0; edid_name && mnl < 13; mnl++) {
 		if (edid_name[mnl] == 0x0a)
 			break;
@@ -5559,7 +5559,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 	if (!version_greater(drm_edid->edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
+	drm_for_each_detailed_block(drm_edid, get_monitor_range,
 				    &info->monitor_range);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
-- 
2.30.2

