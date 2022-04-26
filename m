Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A395D50FD0C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A4310E3FF;
	Tue, 26 Apr 2022 12:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E438110E464
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650976279; x=1682512279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/he197+ijhYJIkXIWOMmjed28cSvJyuLubAAKobn6N4=;
 b=j+ZncWdbjgTxh1Q0QH3EKH98xIkIoNoryL1L4CzCR7YWAeLr9boX9/dw
 RNO4gmUkSdU6XAaKzLoEDnCffhQMW+gMwRYvjSF2B2+f2+MRjKobJoz7Q
 6jwoXfKD59NxPoR3BVQneHkfPwSZDpn2MR4o0yJfKAQtXEvAkrLGLAvZ6
 MBrn470pyI4nllIo1kekz58Ml+HBzF/EDEhI3qKDzoK3IaQlzoI0bbvps
 Vb5wFsNqD2SXFQvmqbxaa6ms7yG6d1vV9qqdwZQGlM5ZQlILYJfc2TLar
 PULTdSbE/K8Q7hmF0MowGrWZynrM111JmOQIpaLyuNP4ibvixieW/gW8G Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="263154666"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="263154666"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558287587"
Received: from pbasx-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.32.62])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:15 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu_dm: Use split out luminance calculation
 function
Date: Tue, 26 Apr 2022 15:30:43 +0300
Message-Id: <20220426123044.320415-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426123044.320415-1-jouni.hogander@intel.com>
References: <20220426123044.320415-1-jouni.hogander@intel.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Luminance range was split out into drm_edid.c to share the calculation
function. Use this new interface for caps->aux_max_input_signal and
caps->aux_min_input_signal.

Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 +++----------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2ade82cfb1ac..49c03400e962 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2836,15 +2836,11 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 {
-	u32 max_cll, min_cll, max, min, q, r;
 	struct amdgpu_dm_backlight_caps *caps;
 	struct amdgpu_display_manager *dm;
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
 	struct dc_link *link = NULL;
-	static const u8 pre_computed_values[] = {
-		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
-		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
 	int i;
 
 	if (!aconnector || !aconnector->dc_link)
@@ -2866,8 +2862,6 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	caps = &dm->backlight_caps[i];
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
 	caps->aux_support = false;
-	max_cll = conn_base->hdr_sink_metadata.hdmi_type1.max_cll;
-	min_cll = conn_base->hdr_sink_metadata.hdmi_type1.min_cll;
 
 	if (caps->ext_caps->bits.oled == 1 /*||
 	    caps->ext_caps->bits.sdr_aux_backlight_control == 1 ||
@@ -2879,31 +2873,10 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
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
-	q = max_cll >> 5;
-	r = max_cll % 32;
-	max = (1 << q) * pre_computed_values[r];
-
-	// min luminance: maxLum * (CV/255)^2 / 100
-	q = DIV_ROUND_CLOSEST(min_cll, 255);
-	min = max * DIV_ROUND_CLOSEST((q * q), 100);
-
-	caps->aux_max_input_signal = max;
-	caps->aux_min_input_signal = min;
+	if (!drm_luminance_range_from_static_hdr_metadata(conn_base,
+							  &caps->aux_min_input_signal,
+							  &caps->aux_max_input_signal))
+		DRM_ERROR("No backligt range in static hdr metadata\n");
 }
 
 void amdgpu_dm_update_connector_after_detect(
-- 
2.25.1

