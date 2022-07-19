Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C35796E6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 11:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC19E14B291;
	Tue, 19 Jul 2022 09:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4E114B27C;
 Tue, 19 Jul 2022 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658224657; x=1689760657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H9CGcoIZb+T3fa6H2h0hUH5jEXRefXyLNSn2p5+Rpz0=;
 b=TYpUyKoKoOOiwM7P3WlOKSrkOhceuhesh/kP8WyHi1iKwuUDv8axqSQe
 E+dwJlYDpEXApfM0vPu0yoHb3crr3K5lx/r18xJvXbemzNBSVLTA8nz8I
 txV8fSN9lEYenEitnjX0uaTvGadViOMFhJHYKn9DwkG61W0lSeBozZAxO
 3Y6ULm320hNzixNhysaZo8hcIsl3DFaI3nsnGVF9Rhktg6L9GHUgPkBhU
 J+D+E83oM/1xrEoYyvZ9k495mPjjuI1EU11AL14tffzYQh2JISIi0MuqD
 QP/Dhk3xv1ifzOGSK58WL3XnMEwBh7wHLZrjc9ln/Z82rMwEf7QACuQLP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350414184"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="350414184"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:57:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="594776487"
Received: from slinke-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.210.1])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 02:57:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/amdgpu_dm: Rely on split out luminance calculation
 function
Date: Tue, 19 Jul 2022 12:56:59 +0300
Message-Id: <20220719095700.14923-3-jouni.hogander@intel.com>
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

Luminance range calculation was split out into drm_edid.c and is now
part of edid parsing. Rely on values calculated during edid parsing and
use these for caps->aux_max_input_signal and caps->aux_min_input_signal.

v2: Use values calculated during edid parsing

Cc: Roman Li <roman.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 +++----------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3e83fed540e8..eb7abdeb8653 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2903,15 +2903,12 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 {
-	u32 max_avg, min_cll, max, min, q, r;
 	struct amdgpu_dm_backlight_caps *caps;
 	struct amdgpu_display_manager *dm;
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
 	struct dc_link *link = NULL;
-	static const u8 pre_computed_values[] = {
-		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
-		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
+	struct drm_luminance_range_info *luminance_range;
 	int i;
 
 	if (!aconnector || !aconnector->dc_link)
@@ -2933,8 +2930,6 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	caps = &dm->backlight_caps[i];
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
 	caps->aux_support = false;
-	max_avg = conn_base->hdr_sink_metadata.hdmi_type1.max_fall;
-	min_cll = conn_base->hdr_sink_metadata.hdmi_type1.min_cll;
 
 	if (caps->ext_caps->bits.oled == 1 /*||
 	    caps->ext_caps->bits.sdr_aux_backlight_control == 1 ||
@@ -2946,31 +2941,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	else if (amdgpu_backlight == 1)
 		caps->aux_support = true;
 
-	/* From the specification (CTA-861-G), for calculating the maximum
-	 * luminance we need to use:
-	 *	Luminance = 50*2**(CV/32)
-	 * Where CV is a one-byte value.
-	 * For calculating this expression we may need float point precision;
-	 * to avoid this complexity level, we take advantage that CV is divided
-	 * by a constant. From the Euclids division algorithm, we know that CV
-	 * can be written as: CV = 32*q + r. Next, we replace CV in the
-	 * Luminance expression and get 50*(2**q)*(2**(r/32)), hence we just
-	 * need to pre-compute the value of r/32. For pre-computing the values
-	 * We just used the following Ruby line:
-	 *	(0...32).each {|cv| puts (50*2**(cv/32.0)).round}
-	 * The results of the above expressions can be verified at
-	 * pre_computed_values.
-	 */
-	q = max_avg >> 5;
-	r = max_avg % 32;
-	max = (1 << q) * pre_computed_values[r];
-
-	// min luminance: maxLum * (CV/255)^2 / 100
-	q = DIV_ROUND_CLOSEST(min_cll, 255);
-	min = max * DIV_ROUND_CLOSEST((q * q), 100);
-
-	caps->aux_max_input_signal = max;
-	caps->aux_min_input_signal = min;
+	luminance_range = &conn_base->display_info.luminance_range;
+	caps->aux_min_input_signal = luminance_range->min_luminance;
+	caps->aux_max_input_signal = luminance_range->max_luminance;
 }
 
 void amdgpu_dm_update_connector_after_detect(
-- 
2.25.1

