Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E796B6B1B7B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EDA10E79B;
	Thu,  9 Mar 2023 06:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEDC10E79B;
 Thu,  9 Mar 2023 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678343393; x=1709879393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8mHYT0gPw9zY7lvjpEG57Gre5RQZ9K6RRjLojOHRHk=;
 b=C8SJ38FE4iviABJnq8E2bQVfrKdFbovQq9IaxttAFjSQT1R4S4ks/lGI
 WeYiCkQptSj/yeg3fq1onyWqDUNCWs1P6p2ylS9SoIdUiE2nONj8GMM/M
 0ipFAWuRMUSjSK49Jq3JKa9TWP7eY53xkWLc4qml6amcaA1IIlilPr+Th
 ZmyGlDGVWWaEclvuyr5X9GJcMlLUODExybblMZfcNUi6zdLS2c8voSJNB
 H2ovjljpPg3FBDeIGNEDO++Ig1cGaiZ6wde07VMZY0/UfcrnxjMlXL598
 YvZ4ERXpVmarrWcMxamlTeK9qbK5cRn77r75MsVCua2DXs4F/BbDBW6Ri g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335070004"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="335070004"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 22:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006614856"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="1006614856"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 22:29:51 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/dp_helper: Add helper to check DSC support with
 given o/p format
Date: Thu,  9 Mar 2023 11:58:49 +0530
Message-Id: <20230309062855.393087-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309062855.393087-1-suraj.kandpal@intel.com>
References: <20230309062855.393087-1-suraj.kandpal@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Add helper to check if the DP sink supports DSC with the given
o/p format.

v2: Add documentation for the helper. (Uma Shankar)

v3: /** instead of  /* (Uma Shankar)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 include/drm/display/drm_dp_helper.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2c..533d3ee7fe05 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -194,6 +194,19 @@ drm_dp_dsc_sink_max_slice_width(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 		DP_DSC_SLICE_WIDTH_MULTIPLIER;
 }
 
+/**
+ * drm_dp_dsc_sink_supports_format() - check if sink supports DSC with given output format
+ * @dsc_dpcd : DSC-capability DPCDs of the sink
+ * @output_format: output_format which is to be checked
+ *
+ * Returns true if the sink supports DSC with the given output_format, false otherwise.
+ */
+static inline bool
+drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
+{
+	return dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] & output_format;
+}
+
 /* Forward Error Correction Support on DP 1.4 */
 static inline bool
 drm_dp_sink_supports_fec(const u8 fec_capable)
-- 
2.25.1

