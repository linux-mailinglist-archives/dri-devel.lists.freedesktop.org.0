Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8AA5796E2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F2314B270;
	Tue, 19 Jul 2022 09:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CE114B268;
 Tue, 19 Jul 2022 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658224653; x=1689760653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qjWxo/Hr1wY/O7l2uWyacrvLYFXSrW+WJ7oIHx+q82o=;
 b=Qsvt3EQ+fAzl1J/8X+eVAv34Cg5il0dxU6IGHMOZVnotqd+Pp3u0SrWM
 t+41dIvKdRqvQ1TshSQKq8JpeX8QkHP4VFbnrpvg1MDohV/Ko9XEzQcfg
 1RPeFX+1Y71lEHHhlput+DoaNWA+S+7u9xM6FBz5fvBuXUumO/clqe3a3
 9e9LDgTmvsnU/c7fnbKIYXlqrQramdXbbNpckNk0ZiwkNTs47dvQK+Jnk
 z9dswQaaXd101EveAsRGbHvow6OsQetFz7G6fl6ATIsw4PUrnp9j1GuhB
 tT307ZEV7fkVr77BXj1jWyxFO9H1SDZe6w9PGsSvdY9K4dnUliDBM+MCT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350414171"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="350414171"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:57:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="594776465"
Received: from slinke-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.210.1])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:57:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm: New function to get luminance range based on
 static hdr metadata
Date: Tue, 19 Jul 2022 12:56:58 +0300
Message-Id: <20220719095700.14923-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719095700.14923-1-jouni.hogander@intel.com>
References: <20220719095700.14923-1-jouni.hogander@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split luminance min/max calculation using static hdr metadata from
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:update_connector_ext_caps
into drm/drm_edid.c and use it during edid parsing. Calculated range is
stored into connector->display_info->luminance_range.

Add new data structure (drm_luminance_range_inf) to store luminance range
calculated using data from EDID's static hdr metadata block. Add this new
struct as a part of drm_display_info struct.

v3: Squashed adding drm_luminance_range_info patch here
v2: Calculate range during edid parsing

Cc: Roman Li <roman.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 52 ++++++++++++++++++++++++++++++++++++-
 include/drm/drm_connector.h | 21 +++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bbc25e3b7220..90a5e26eafa8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5165,6 +5165,51 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	mode->clock = clock;
 }
 
+static void drm_calculate_luminance_range(struct drm_connector *connector)
+{
+	struct hdr_static_metadata *hdr_metadata = &connector->hdr_sink_metadata.hdmi_type1;
+	struct drm_luminance_range_info *luminance_range =
+		&connector->display_info.luminance_range;
+	static const u8 pre_computed_values[] = {
+		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
+		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98
+	};
+	u32 max_avg, min_cll, max, min, q, r;
+
+	if (!(hdr_metadata->metadata_type & BIT(HDMI_STATIC_METADATA_TYPE1)))
+		return;
+
+	max_avg = hdr_metadata->max_fall;
+	min_cll = hdr_metadata->min_cll;
+
+	/*
+	 * From the specification (CTA-861-G), for calculating the maximum
+	 * luminance we need to use:
+	 *	Luminance = 50*2**(CV/32)
+	 * Where CV is a one-byte value.
+	 * For calculating this expression we may need float point precision;
+	 * to avoid this complexity level, we take advantage that CV is divided
+	 * by a constant. From the Euclids division algorithm, we know that CV
+	 * can be written as: CV = 32*q + r. Next, we replace CV in the
+	 * Luminance expression and get 50*(2**q)*(2**(r/32)), hence we just
+	 * need to pre-compute the value of r/32. For pre-computing the values
+	 * We just used the following Ruby line:
+	 *	(0...32).each {|cv| puts (50*2**(cv/32.0)).round}
+	 * The results of the above expressions can be verified at
+	 * pre_computed_values.
+	 */
+	q = max_avg >> 5;
+	r = max_avg % 32;
+	max = (1 << q) * pre_computed_values[r];
+
+	/* min luminance: maxLum * (CV/255)^2 / 100 */
+	q = DIV_ROUND_CLOSEST(min_cll, 255);
+	min = max * DIV_ROUND_CLOSEST((q * q), 100);
+
+	luminance_range->min_luminance = min;
+	luminance_range->max_luminance = max;
+}
+
 static uint8_t eotf_supported(const u8 *edid_ext)
 {
 	return edid_ext[2] &
@@ -5196,8 +5241,12 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
 		connector->hdr_sink_metadata.hdmi_type1.max_cll = db[4];
 	if (len >= 5)
 		connector->hdr_sink_metadata.hdmi_type1.max_fall = db[5];
-	if (len >= 6)
+	if (len >= 6) {
 		connector->hdr_sink_metadata.hdmi_type1.min_cll = db[6];
+
+		/* Calculate only when all values are available */
+		drm_calculate_luminance_range(connector);
+	}
 }
 
 static void
@@ -6101,6 +6150,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 
 	info->non_desktop = 0;
 	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
+	memset(&info->luminance_range, 0, sizeof(info->luminance_range));
 
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2c6fa746efac..248206bbd975 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -323,6 +323,22 @@ struct drm_monitor_range_info {
 	u8 max_vfreq;
 };
 
+/**
+ * struct drm_luminance_range_info - Panel's luminance range for
+ * &drm_display_info. Calculated using data in EDID
+ *
+ * This struct is used to store a luminance range supported by panel
+ * as calculated using data from EDID's static hdr metadata.
+ *
+ * @min_luminance: This is the min supported luminance value
+ *
+ * @max_luminance: This is the max supported luminance value
+ */
+struct drm_luminance_range_info {
+	u32 min_luminance;
+	u32 max_luminance;
+};
+
 /**
  * enum drm_privacy_screen_status - privacy screen status
  *
@@ -624,6 +640,11 @@ struct drm_display_info {
 	 */
 	struct drm_monitor_range_info monitor_range;
 
+	/**
+	 * @luminance_range: Luminance range supported by panel
+	 */
+	struct drm_luminance_range_info luminance_range;
+
 	/**
 	 * @mso_stream_count: eDP Multi-SST Operation (MSO) stream count from
 	 * the DisplayID VESA vendor block. 0 for conventional Single-Stream
-- 
2.25.1

