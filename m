Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF7838BCD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D7F10EFBA;
	Tue, 23 Jan 2024 10:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737E910EB4C;
 Tue, 23 Jan 2024 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005725; x=1737541725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vip63RD/2s+1G9VzFNK9k2dQp3LIoby+R7cXniTTTpY=;
 b=b6qULlIGzw9f1LGR//yXsfcV6RP3p2uTdToKb6pq8rWW7HjbXRMsx3J2
 LPl67vVIG4upRIv2nFzuqoSvjf1JcoaH/c472NEpbJFjGV2tEmA/0y5eB
 tUA+k9ZpPn3l9wZ5le2UivmKswKnNCbONewVN1+Qf+S/yIaP2v3qsCGsb
 34KYsNNb/nldBdA/9OCZX0sOj3ntkQRko88RscTK0FEV5RiNVY6DmZ0gW
 VtRpPu1/bMEwOS/FKnzXuBm5MyhmD9w696JOkYAeMKLOSNghSAd26yTN1
 4QwqKC9TVK7QgM17larNGWAtg6abiUWwUkpdP0YL5sDxF06CJdEUF9Ti1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134149"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134149"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283384"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283384"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:44 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/19] drm/i915/dp: Export
 intel_dp_max_common_rate/lane_count()
Date: Tue, 23 Jan 2024 12:28:37 +0200
Message-Id: <20240123102850.390126-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export intel_dp_max_common_rate() and intel_dp_max_lane_count() used by
a follow-up patch enabling the DP tunnel BW allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a5c60428ffb7..f40706c5d1aad 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -309,7 +309,7 @@ static int intel_dp_common_rate(struct intel_dp *intel_dp, int index)
 }
 
 /* Theoretical max between source and sink */
-static int intel_dp_max_common_rate(struct intel_dp *intel_dp)
+int intel_dp_max_common_rate(struct intel_dp *intel_dp)
 {
 	return intel_dp_common_rate(intel_dp, intel_dp->num_common_rates - 1);
 }
@@ -326,7 +326,7 @@ static int intel_dp_max_source_lane_count(struct intel_digital_port *dig_port)
 }
 
 /* Theoretical max between source and sink */
-static int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
+int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	int source_max = intel_dp_max_source_lane_count(dig_port);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 37274e3c2902f..a7906d8738c4a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -104,6 +104,8 @@ int intel_dp_max_link_rate(struct intel_dp *intel_dp);
 int intel_dp_max_lane_count(struct intel_dp *intel_dp);
 int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
+int intel_dp_max_common_rate(struct intel_dp *intel_dp);
+int intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
 
 void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
 			   u8 *link_bw, u8 *rate_select);
-- 
2.39.2

