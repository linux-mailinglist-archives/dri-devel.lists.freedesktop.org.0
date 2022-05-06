Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9F51D555
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC310FAFC;
	Fri,  6 May 2022 10:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B6B10FAFC;
 Fri,  6 May 2022 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831914; x=1683367914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVpEfLpW2uxsHKPgEAboBmLcZnTPsqHegeGO/kcu/pI=;
 b=L+pCSUIVnqtH9uWiIdXr17Cva4DN2R74iQYj6Ix+ibYfWCPiogMsE0vC
 Tk16ZQh8mdFDDyTRp5eVwUEayANDpucRn81RC/bB0tqf4PGV0pw2Lobfw
 wo/RdK3AgIDeXlKkDLMlHI70YD4RzSLdAqw3TKK0T1kqO7jtlk30Y967A
 m7XyKoNAJL92qOAm7Cs6CWE98wgzkwoux/lttqk+Dnmppuo6Znli7iMod
 k+/zXY9Hj9oxLGHEgagB9sDnU72TFaNArrzU2iMohEhvADlXnIWFMps/u
 EWXbk6Lb7Zz5Qtyr1A9I63bVaMnMIfIQ1CXlZH0ehkB5YaSYL/K0R90o8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268570797"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268570797"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="665423263"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/25] drm/edid: convert mode_in_range() and
 drm_monitor_supports_rb() to drm_edid
Date: Fri,  6 May 2022 13:10:21 +0300
Message-Id: <835a4b82d2dbec9134bed2d58176a50f38eb85ed.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4b2d3453fc5c..b8deced8de01 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2627,16 +2627,16 @@ is_rb(const struct detailed_timing *descriptor, void *data)
 
 /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
 static bool
-drm_monitor_supports_rb(const struct edid *edid)
+drm_monitor_supports_rb(const struct drm_edid *drm_edid)
 {
-	if (edid->revision >= 4) {
+	if (drm_edid->edid->revision >= 4) {
 		bool ret = false;
 
-		drm_for_each_detailed_block(edid, is_rb, &ret);
+		drm_for_each_detailed_block(drm_edid->edid, is_rb, &ret);
 		return ret;
 	}
 
-	return ((edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
+	return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
 }
 
 static void
@@ -2820,7 +2820,7 @@ static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
 	}
 
 	/* check whether it can be found in default mode table */
-	if (drm_monitor_supports_rb(drm_edid->edid)) {
+	if (drm_monitor_supports_rb(drm_edid)) {
 		mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate,
 					 true);
 		if (mode)
@@ -3059,10 +3059,11 @@ range_pixel_clock(const struct edid *edid, const u8 *t)
 	return t[9] * 10000 + 5001;
 }
 
-static bool
-mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
-	      const struct detailed_timing *timing)
+static bool mode_in_range(const struct drm_display_mode *mode,
+			  const struct drm_edid *drm_edid,
+			  const struct detailed_timing *timing)
 {
+	const struct edid *edid = drm_edid->edid;
 	u32 max_clock;
 	const u8 *t = (const u8 *)timing;
 
@@ -3081,7 +3082,7 @@ mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
 		if (t[13] && mode->hdisplay > 8 * (t[13] + (256 * (t[12]&0x3))))
 			return false;
 
-	if (mode_is_rb(mode) && !drm_monitor_supports_rb(edid))
+	if (mode_is_rb(mode) && !drm_monitor_supports_rb(drm_edid))
 		return false;
 
 	return true;
@@ -3114,7 +3115,7 @@ static int drm_dmt_modes_for_range(struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 
 	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
-		if (mode_in_range(drm_dmt_modes + i, drm_edid->edid, timing) &&
+		if (mode_in_range(drm_dmt_modes + i, drm_edid, timing) &&
 		    valid_inferred_mode(connector, drm_dmt_modes + i)) {
 			newmode = drm_mode_duplicate(dev, &drm_dmt_modes[i]);
 			if (newmode) {
@@ -3156,7 +3157,7 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
 			return modes;
 
 		drm_mode_fixup_1366x768(newmode);
-		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
+		if (!mode_in_range(newmode, drm_edid, timing) ||
 		    !valid_inferred_mode(connector, newmode)) {
 			drm_mode_destroy(dev, newmode);
 			continue;
@@ -3176,7 +3177,7 @@ static int drm_cvt_modes_for_range(struct drm_connector *connector,
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
-	bool rb = drm_monitor_supports_rb(drm_edid->edid);
+	bool rb = drm_monitor_supports_rb(drm_edid);
 
 	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
 		const struct minimode *m = &extra_modes[i];
@@ -3186,7 +3187,7 @@ static int drm_cvt_modes_for_range(struct drm_connector *connector,
 			return modes;
 
 		drm_mode_fixup_1366x768(newmode);
-		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
+		if (!mode_in_range(newmode, drm_edid, timing) ||
 		    !valid_inferred_mode(connector, newmode)) {
 			drm_mode_destroy(dev, newmode);
 			continue;
-- 
2.30.2

