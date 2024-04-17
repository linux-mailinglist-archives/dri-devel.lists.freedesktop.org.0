Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5128A85D2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 16:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F9E113582;
	Wed, 17 Apr 2024 14:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/3izpA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E165113582;
 Wed, 17 Apr 2024 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713363545; x=1744899545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+FCa5qvS26MzPEhvh2KI/7Q0Pi3gyvCy5z9Gr65XXFo=;
 b=F/3izpA29LCB8yWiawBjIh6ZW1jYjpdRhGVhvhV57d06kqT6WsOw2Q39
 ZA1o+6fczzw8yb1Xle6lXYwJx0XDgHh42dukIi5cNbp8X4p4EFDb3itRj
 ApdZGjG/o+7pJVKsQIMisHXNTShD9eFNQJ9PqxTBZKR5NErYUgosiokB4
 VFtHf4oXZlLy+t5rJ2M9nG/0cb9zn9nBajrNoUry2/BMURn2xxgDBemwm
 DricRl0V0whWyfuW4a0aGbGuADZVBFJJOVchFttH5sFvL84PcX97uE3UY
 vhzUNYqYWnUpM70SKJEXnwt1pYwf6OEV4Ih2xt1M/g+isBaNp4seNDUDi Q==;
X-CSE-ConnectionGUID: f4asS/YLT+2cQEFQ4/MM9Q==
X-CSE-MsgGUID: OxH2I2w2SvOsKJrTWkcoqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9408294"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9408294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:19:05 -0700
X-CSE-ConnectionGUID: mzTQvoYYToq7wruYje1miA==
X-CSE-MsgGUID: b5MA+iRERUCapY630IZDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="27429292"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:19:03 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 07/11] drm/dp: Add drm_dp_128b132b_supported()
Date: Wed, 17 Apr 2024 17:19:35 +0300
Message-ID: <20240417141936.457796-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240416221010.376865-8-imre.deak@intel.com>
References: <20240416221010.376865-8-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out a function to check for 128b/132b channel coding support used
by a follow-up patch in the patchset.

v2: s/drm_dp_uhbr_channel_coding_supported()/drm_dp128b132b_supported()
    (Jani)

Cc: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 23808e9d41d5d..e05e25cd4a940 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -225,7 +225,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
 	 * rates and 10 Gbps.
 	 */
-	if (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B) {
+	if (drm_dp_128b132b_supported(intel_dp->dpcd)) {
 		u8 uhbr_rates = 0;
 
 		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index baf9949ff96fc..8bed890eec2c6 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -251,6 +251,12 @@ drm_dp_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
 }
 
+static inline bool
+drm_dp_128b132b_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B;
+}
+
 static inline bool
 drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-- 
2.43.3

