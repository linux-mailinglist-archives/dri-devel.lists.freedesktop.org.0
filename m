Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564177793C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51B210E53A;
	Thu, 10 Aug 2023 13:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CB510E532;
 Thu, 10 Aug 2023 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672901; x=1723208901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/c7r6p2+fePHQGU2Dnb04FWfMcAok5/lAafZI1IsstM=;
 b=PRuKy50rj/ttdzeiPb0NyxgP/y7qDtjrieZaZ+o8jlX6DT3iMKcXZQxx
 78yNk2UTHyHHVH4coxb4JIifn7D/GB8/O4Ql13nX3bmB7FFbK9Dk9zLF4
 F81D8p5U35UKQZJs2PlrtjtATnJ3nyf5rJhobPwOFi8zIOyeP3x/FV4XZ
 Xwe/esoEV4xA02WpluTv2Gxr810B7FdlunxsthpKJiN1Zz7ncp1qH8w6A
 d2euTv3oaoPBq2MCaTAG15p5lRW/+I81cEtxDX0qnQ5Hynv6w21zTE4xf
 zBPmsBU9MqXdio7BRlfQXW/JGxFL6F83YMbgPhzmUDki+bUSRqqUPFRai g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358666"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143667"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143667"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:23 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/20] drm/i915/dp: Check if force_dsc_output_format is
 possible
Date: Thu, 10 Aug 2023 18:33:18 +0530
Message-Id: <20230810130319.3708392-20-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8c2e5393c6ec..9e904bb4ac5c 100644
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

