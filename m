Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3188A777D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EDC112EB2;
	Tue, 16 Apr 2024 22:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nv5U2P6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3493112EB3;
 Tue, 16 Apr 2024 22:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713305387; x=1744841387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CehbAt/+gn4naKc4KR36grWFyIic0bmBXgkYinHvbDs=;
 b=nv5U2P6aefyvt6s18dGJjULO0ef0dufcg7u1eijYVJsHHRfzsuNRpD1S
 FTvMFSvWiSUmkn+EXE+8yQk6UxncazYSXjaa9CrwcKq108iCShzj2fYq9
 GSjyNbmWF1QeQWh+5saAeZ6JPiveb9wml+4N8wUzldHrEqVZnkW1REi2w
 t0f1vIJPtyAhBoXB6Kz3kkN6HjsfAvt75VGBy1NHUiL9RoTO8Z8X2ZGNE
 b9GSkeKBLWvCoU5JJwEqbDcWtDu0TKcCVZ2dCSZVH7QOaBfNugqwi5LoR
 RcMFH/e7oTd8cAoe3Ok9BnemQNrWG5n1C6nOrVWMPpqPWihStlC5FwBTP w==;
X-CSE-ConnectionGUID: 9cpUnJeuQAeS7UGBDdEqgg==
X-CSE-MsgGUID: jXGuvSUwTYGrLbGpg/PK6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20165169"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="20165169"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:09:46 -0700
X-CSE-ConnectionGUID: MKzvqEisTsqUWp2eVwjefQ==
X-CSE-MsgGUID: q7uWgtFxT2WCzrXAccB5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="26965497"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:09:45 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 07/11] drm/dp: Add drm_dp_uhbr_channel_coding_supported()
Date: Wed, 17 Apr 2024 01:10:06 +0300
Message-ID: <20240416221010.376865-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240416221010.376865-1-imre.deak@intel.com>
References: <20240416221010.376865-1-imre.deak@intel.com>
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

Factor out a function to check for UHBR channel coding support used by a
follow-up patch in the patchset.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 include/drm/display/drm_dp_helper.h     | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 23808e9d41d5d..41127069b55e4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -225,7 +225,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
 	 * rates and 10 Gbps.
 	 */
-	if (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B) {
+	if (drm_dp_uhbr_channel_coding_supported(intel_dp->dpcd)) {
 		u8 uhbr_rates = 0;
 
 		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index baf9949ff96fc..8a64fe8d97af2 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -251,6 +251,12 @@ drm_dp_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
 }
 
+static inline bool
+drm_dp_uhbr_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B;
+}
+
 static inline bool
 drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-- 
2.43.3

