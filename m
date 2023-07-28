Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2F87662F1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B69D10E658;
	Fri, 28 Jul 2023 04:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2E10E650;
 Fri, 28 Jul 2023 04:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517767; x=1722053767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlobYb2PSZvHr7/dJQNsDUc8E+EBjj/1bh4jlAnpU14=;
 b=RPhZxDPLV7ySIUQr2WcBC+NK59YVDIISD8YKlJYTZ+ppmj6qxPwHMlzX
 mIM77GjtA2XGn6iHHzFSUzkahCqkRb/5J6VbViHMkd/QuaB7I9XgxiVWD
 ENDiIUm6jgN1BqtEmviphAU1i4HZT+ZVoi1Qz7d4P2q+rluHq0RGxw+uL
 S98hyb7SyV99rwzl0NmVhDsxBs+e/E++G7vMe2hR7/UKAOSH4J9yrEXcS
 XIZDNDWVUVB43rw0UheOOxdD8hmh4p+NyFAzwjWInDs/qsOY1PA8f0Fp7
 fgbtwdWbeDWscQLOGS2k3XGB9E4F5oYecSjSK+6J7w5anHW9eFhfdU3EK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104220"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104220"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276510"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276510"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:16:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/20] drm/i915/dp: Check if force_dsc_output_format is
 possible
Date: Fri, 28 Jul 2023 09:41:50 +0530
Message-Id: <20230728041150.2524032-21-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently for testing an output format with DSC, we just force the
output format, without checking if it can be supported.
This also creates an issue where there is a PCON which might need to
convert from forced output format to the format to sink format.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0299b378ba6e..1aee27c0fb55 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -935,16 +935,42 @@ dfp_can_convert_from_ycbcr444(struct intel_dp *intel_dp,
 	return false;
 }
 
+static bool
+dfp_can_convert(struct intel_dp *intel_dp,
+		enum intel_output_format output_format,
+		enum intel_output_format sink_format)
+{
+	switch (output_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+		return dfp_can_convert_from_rgb(intel_dp, sink_format);
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		return dfp_can_convert_from_ycbcr444(intel_dp, sink_format);
+	default:
+		MISSING_CASE(output_format);
+		return false;
+	}
+
+	return false;
+}
+
 static enum intel_output_format
 intel_dp_output_format(struct intel_connector *connector,
 		       enum intel_output_format sink_format)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	enum intel_output_format force_dsc_output_format =
+		intel_dp->force_dsc_output_format;
 	enum intel_output_format output_format;
+	if (force_dsc_output_format) {
+		if (source_can_output(intel_dp, force_dsc_output_format) &&
+		    (!drm_dp_is_branch(intel_dp->dpcd) ||
+		     sink_format != force_dsc_output_format ||
+		     dfp_can_convert(intel_dp, force_dsc_output_format, sink_format)))
+			return force_dsc_output_format;
 
-	if (intel_dp->force_dsc_output_format)
-		return intel_dp->force_dsc_output_format;
+		drm_dbg_kms(&i915->drm, "Cannot force DSC output format\n");
+	}
 
 	if (sink_format == INTEL_OUTPUT_FORMAT_RGB ||
 	    dfp_can_convert_from_rgb(intel_dp, sink_format))
-- 
2.40.1

