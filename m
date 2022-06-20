Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E0A55116F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A68210E2FD;
	Mon, 20 Jun 2022 07:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A6310E298
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655709901; x=1687245901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=23CyU7SvI79nC0M4YbDojzUIjh/4f24Zcs0a64Qv/2Y=;
 b=fN8UNGcbjmKcN/76S+OlW83LM1Z8P5niGRyy7HaHpusxYChzX/NSFQB7
 6WVBbCulS/FvehzbGTqRt7VPY6ycPzxOyuzqxkO17RB3okvjv5Ww82WIS
 gzbUP6U1Q+spNKqWTE5k6rU+CCI3m4eTsoN8GCxG3pe2XMZ20dwBLDSmz
 B7W1Nh0v3exjNYn21IG5jpjHlnNBWbv3JbHkT7WKGSMQxVGBeDOXo/JOX
 2FEXfokgbeIQMXNJEUHBygYnxmx3eLxJN7miaKp7OluXIh1yPLktNLpZN
 8817D7Wlb2G5zn+Nrgw50CuBJVGMTqEn9tgB57Iqjip7O+xMB1trvGRyw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268545331"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268545331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:25:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642986664"
Received: from gpetrea-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.41.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:24:58 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm: New function to get luminance range based on
 static hdr metadata
Date: Mon, 20 Jun 2022 10:20:17 +0300
Message-Id: <20220620072019.2710652-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620072019.2710652-1-jouni.hogander@intel.com>
References: <20220620072019.2710652-1-jouni.hogander@intel.com>
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

v2: Calculate range during edid parsing

Cc: Roman Li <roman.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2bdaf1e34a9d..3b367100290f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5014,6 +5014,49 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 	mode->clock = clock;
 }
 
+static void drm_calculate_luminance_range(struct drm_connector *connector)
+{
+	struct hdr_static_metadata *hdr_metadata = &connector->hdr_sink_metadata.hdmi_type1;
+	struct drm_luminance_range_info *luminance_range =
+		&connector->display_info.luminance_range;
+	static const u8 pre_computed_values[] = {
+		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
+		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
+	u32 max_avg, min_cll, max, min, q, r;
+
+	if (!(hdr_metadata->metadata_type & BIT(HDMI_STATIC_METADATA_TYPE1)))
+		return;
+
+	max_avg = hdr_metadata->max_fall;
+	min_cll = hdr_metadata->min_cll;
+
+	/* From the specification (CTA-861-G), for calculating the maximum
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
@@ -5045,8 +5088,12 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
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
@@ -5951,6 +5998,7 @@ drm_reset_display_info(struct drm_connector *connector)
 
 	info->non_desktop = 0;
 	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
+	memset(&info->luminance_range, 0, sizeof(info->luminance_range));
 
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
-- 
2.25.1

