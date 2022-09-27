Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D715ECA56
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB5F10E13B;
	Tue, 27 Sep 2022 17:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F73E10E103;
 Tue, 27 Sep 2022 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664298044; x=1695834044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEF5uG1UF6TkFE3myQTivZYvAC9u4SQ0kVGKVCmJh1c=;
 b=FYzUnFZ24wVuqsRokq8tCB1JvwM+pse/zt0vPBaApNQG6LKAiUFlFDSr
 Hsj/0QA4qr9TJbbDxkibhZMR9sCxG8zPEQbVY+EtAqChlMK/4qjrli5Ip
 v8XU2Nd8tqrPwScW99AV9jahQu/cPGiJlMcwAB1Dv5l5aXqqBgxSHImEu
 G3vFbzMz4PRXrgd/84BNPkAJLPsfICE7BBBNar4WYiCrOXUe9QTc9oNcU
 VJY+OqiBtNz1+MQSpExtLrVe87CBLccwoa/gGOf8EJCJmi+BQM8vaMzU+
 JuWUigWI6ArIYYrw3L+1pGfoUsP/ecPAq1MCPolAJq1g/T8mOQ2yhMPSO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="387656867"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="387656867"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 10:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623821963"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623821963"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 27 Sep 2022 10:00:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Sep 2022 20:00:28 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/edid: Use the correct formula for standard timings
Date: Tue, 27 Sep 2022 20:00:03 +0300
Message-Id: <20220927170006.27855-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
References: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Prefer the timing formula indicated by the range
descriptor for generating the non-DMT standard timings.

Previously we just used CVT for all EDID 1.4 continuous
frequency displays without even checking if the range
descriptor indicates otherwise. Now we check the range
descriptor first, and fall back to CVT if nothing else
was indicated. EDID 1.4 more or less deprecates GTF/GTF2
but there are still a lot of 1.4 EDIDs out there that
don't advertise CVT support, so seems safer to use the
formula the EDID actually reports as supported.

For EDID 1.3 we use GTF2 if indicated (as before), and for
EDID 1.2+ we now just use GTF without even checking the
feature flag. There seem to be quite a few EDIDs out there that
don't set the GTF feature flag but still include a GTF range
descriptor and non-DMT standard timings.

This to me seems to be roughly what appendix B of EDID 1.4
suggests should be done.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 49 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index efe8d5e76875..60e68d27371d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3077,20 +3077,53 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
 	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.j : 0;
 }
 
+static void
+get_timing_level(const struct detailed_timing *descriptor, void *data)
+{
+	int *res = data;
+
+	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
+		return;
+
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
+
+	switch (descriptor->data.other_data.data.range.flags) {
+	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
+		*res = LEVEL_GTF;
+		break;
+	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
+		*res = LEVEL_GTF2;
+		break;
+	case DRM_EDID_CVT_SUPPORT_FLAG:
+		*res = LEVEL_CVT;
+		break;
+	default:
+		break;
+	}
+}
+
 /* Get standard timing level (CVT/GTF/DMT). */
 static int standard_timing_level(const struct drm_edid *drm_edid)
 {
 	const struct edid *edid = drm_edid->edid;
 
-	if (edid->revision >= 2) {
-		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
-			return LEVEL_CVT;
-		if (drm_gtf2_hbreak(drm_edid))
-			return LEVEL_GTF2;
-		if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
-			return LEVEL_GTF;
+	if (edid->revision >= 4) {
+		/*
+		 * If the range descriptor doesn't
+		 * indicate otherwise default to CVT
+		 */
+		int ret = LEVEL_CVT;
+
+		drm_for_each_detailed_block(drm_edid, get_timing_level, &ret);
+
+		return ret;
+	} else if (edid->revision >= 3 && drm_gtf2_hbreak(drm_edid)) {
+		return LEVEL_GTF2;
+	} else if (edid->revision >= 2) {
+		return LEVEL_GTF;
+	} else {
+		return LEVEL_DMT;
 	}
-	return LEVEL_DMT;
 }
 
 /*
-- 
2.35.1

