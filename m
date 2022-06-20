Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F170C551170
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07A10E298;
	Mon, 20 Jun 2022 07:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EBD10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 07:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655709905; x=1687245905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S+x7hi2yNkWdeidWxcBSFnym6Pw1epCC2UE9VqGnbjs=;
 b=gYfw36hUYP/ESQ2k37LZ9rQQf4eLJa6MxeUB+xNoZyGUxvJI5Tf591nk
 XSemY1k+Io4zEGVyxKcVSvt2GEY87mrUVUXGEhjybEM6CUkexehxFJVVK
 igvYpQL1217nukjQ7rsi3/iaCrkJK9bc7MDiqgdLnkoEil3mB5cnU9lNW
 7k8ZrK/zOS7wrMASGmj1uNrugjJZ1G0xnMF75gyxnEzZI2gYdZT1v4jTv
 yMSVrR535QueZ54RVjDBGmO+9dUe9otdtAUqpd0BkjCBZCRysLMcAwQb2
 M5jEGlv0s06n7cA1NYz/5/x60ysQeLFd+auSGbPlnfwEi5o4J+cSNNpdz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268545339"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268545339"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:25:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642986800"
Received: from gpetrea-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.41.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:25:02 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/amdgpu_dm: Rely on split out luminance calculation
 function
Date: Mon, 20 Jun 2022 10:20:18 +0300
Message-Id: <20220620072019.2710652-4-jouni.hogander@intel.com>
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
index 428bb041f92c..896a6b5eb2ed 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2813,15 +2813,12 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 
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
@@ -2843,8 +2840,6 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	caps = &dm->backlight_caps[i];
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
 	caps->aux_support = false;
-	max_avg = conn_base->hdr_sink_metadata.hdmi_type1.max_fall;
-	min_cll = conn_base->hdr_sink_metadata.hdmi_type1.min_cll;
 
 	if (caps->ext_caps->bits.oled == 1 /*||
 	    caps->ext_caps->bits.sdr_aux_backlight_control == 1 ||
@@ -2856,31 +2851,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
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

