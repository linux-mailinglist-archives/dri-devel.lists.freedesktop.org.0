Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6E4053AE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F816E871;
	Thu,  9 Sep 2021 12:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4341D6E84F;
 Thu,  9 Sep 2021 12:53:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="217618628"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="217618628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:53:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="504318697"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:53:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 08/13] drm/i915/dp: select 128b/132b channel encoding for
 UHBR rates
Date: Thu,  9 Sep 2021 15:52:00 +0300
Message-Id: <b4ffd0187b306c0abaa08b89ed35c993ad8145c7.1631191763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631191763.git.jani.nikula@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHBR rates and 128b/132b channel encoding go hand in hand.

v2: Fix check for >= UHBR rates using intel_dp_is_uhbr() (Ville)

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 36b35239da83..4f116cd32846 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -495,7 +495,8 @@ intel_dp_prepare_link_train(struct intel_dp *intel_dp,
 				  &rate_select, 1);
 
 	link_config[0] = crtc_state->vrr.enable ? DP_MSA_TIMING_PAR_IGNORE_EN : 0;
-	link_config[1] = DP_SET_ANSI_8B10B;
+	link_config[1] = intel_dp_is_uhbr(crtc_state) ?
+		DP_SET_ANSI_128B132B : DP_SET_ANSI_8B10B;
 	drm_dp_dpcd_write(&intel_dp->aux, DP_DOWNSPREAD_CTRL, link_config, 2);
 
 	intel_dp->DP |= DP_PORT_EN;
-- 
2.30.2

