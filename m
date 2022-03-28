Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8334E90F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEC210EB3F;
	Mon, 28 Mar 2022 09:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8722510EB11;
 Mon, 28 Mar 2022 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459075; x=1679995075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N6l01Kyco4r2aWrwUAvFqb8gjScec7KUeRUlXv/3j2c=;
 b=QOHG0XAFUUCwNULeE4KtxldVChhF26sJ3O13A1kow++zrY/pU+A7MzZ/
 Mx/hRwrFgQDvJVbqacZZVK8wWh3alUl94Sz6Nhp06veYOD0J4J34/FAoI
 pMIY9MrGmXsZ1vkJZvt2/zyj4NHRrqge6gZa5+Pbhdp9zaA5spTDfQdnb
 XnyAJK7BtegOTL0CLQQVdksHBBaw67il86LA4qE3LbE0CLNAxqjT/p1kb
 iQHSI50tlN/H1B2CF8epuehNxdbefkbZcJ98ndO2K2OjDs/OcE9LYh8Ou
 x7E7dNWyfK5WriXmeU25+/NlnFdg3YRvYn6xA+NLniXm2CKF/ioqOI+HG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="259140263"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="259140263"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="585128981"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/11] drm/edid: pass a timing pointer to
 is_display_descriptor()
Date: Mon, 28 Mar 2022 12:17:18 +0300
Message-Id: <b76b41f6b09cd5b1156cd2c01d63cff4f6d0c51f.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use struct member access instead of direct offsets to avoid lots of
casts all over the place.

Use BUILD_BUG_ON() for sanity check.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ac80681d64f6..586b0ed3b3dc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2331,10 +2331,15 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_mode_find_dmt);
 
-static bool is_display_descriptor(const u8 d[18], u8 tag)
+static bool is_display_descriptor(const struct detailed_timing *descriptor, u8 tag)
 {
-	return d[0] == 0x00 && d[1] == 0x00 &&
-		d[2] == 0x00 && d[3] == tag;
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.descriptor.pad0) != 0);
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.descriptor.pad1) != 2);
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.descriptor.type) != 3);
+
+	return descriptor->data.descriptor.pad0 == 0 &&
+		descriptor->data.descriptor.pad1 == 0 &&
+		descriptor->data.descriptor.type == tag;
 }
 
 static bool is_detailed_timing_descriptor(const u8 d[18])
@@ -2405,7 +2410,7 @@ is_rb(struct detailed_timing *t, void *data)
 {
 	u8 *r = (u8 *)t;
 
-	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
 	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
@@ -2431,7 +2436,7 @@ find_gtf2(struct detailed_timing *t, void *data)
 {
 	u8 *r = (u8 *)t;
 
-	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
 	if (r[10] == 0x02)
@@ -2987,7 +2992,7 @@ do_inferred_modes(struct detailed_timing *timing, void *c)
 	struct edid_display_descriptor *data = &timing->data.descriptor;
 	struct detailed_data_monitor_range *range = &data->data.range;
 
-	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
 	closure->modes += drm_dmt_modes_for_range(closure->connector,
@@ -3067,7 +3072,7 @@ do_established_modes(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
-	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_EST_TIMINGS))
+	if (!is_display_descriptor(timing, EDID_DETAIL_EST_TIMINGS))
 		return;
 
 	closure->modes += drm_est3_modes(closure->connector, timing);
@@ -3122,7 +3127,7 @@ do_standard_modes(struct detailed_timing *timing, void *c)
 	struct edid *edid = closure->edid;
 	int i;
 
-	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_STD_MODES))
+	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
 		return;
 
 	for (i = 0; i < 6; i++) {
@@ -3231,7 +3236,7 @@ do_cvt_mode(struct detailed_timing *timing, void *c)
 {
 	struct detailed_mode_closure *closure = c;
 
-	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_CVT_3BYTE))
+	if (!is_display_descriptor(timing, EDID_DETAIL_CVT_3BYTE))
 		return;
 
 	closure->modes += drm_cvt_modes(closure->connector, timing);
@@ -4491,7 +4496,7 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 static void
 monitor_name(struct detailed_timing *t, void *data)
 {
-	if (!is_display_descriptor((const u8 *)t, EDID_DETAIL_MONITOR_NAME))
+	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_NAME))
 		return;
 
 	*(u8 **)data = t->data.descriptor.data.str.str;
@@ -5226,7 +5231,7 @@ void get_monitor_range(struct detailed_timing *timing,
 	const struct edid_display_descriptor *data = &timing->data.descriptor;
 	const struct detailed_data_monitor_range *range = &data->data.range;
 
-	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANGE))
+	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
 	/*
-- 
2.30.2

