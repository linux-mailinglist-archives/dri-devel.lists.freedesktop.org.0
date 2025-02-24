Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213CA42996
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B9E10E490;
	Mon, 24 Feb 2025 17:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOKR3i2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188F10E490;
 Mon, 24 Feb 2025 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418020; x=1771954020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15bVnZqp0pq5j31G+Q5yND4HYvvrxU7+WBbeybGegzE=;
 b=kOKR3i2wpusIwN2EmDY8NdQCTSpT1QtRbTL9naIEWLzgBzNSvAJGh7d1
 n1Rs/ZzpKDcY5urLFigjJIG6TWuqzTnIaK3UAGKwSR9GveRWJ3Mcl6rmo
 UbrccTK6BEbjP2Xcgba08ZPkZuCAGPc1c1vsSCk3Btn5WXsxloBODqOi4
 LI0mX/zZIE+5TeaIQZBIcD9u/9lSkoHIyqtbSYJg96TC/a5Bp9nFlh3MP
 bbypYIc8TI9OuLc7mlRH4WmfOE2+O9dM5oM/NsCZnwrcHVzFR1IK9c7WP
 QApQYbNU53PGOcGS0v5kahYNGd01XJHyjlGS/+hNX1dv4GA5ZJEjsEYq0 w==;
X-CSE-ConnectionGUID: V6qwmVVKT82wxdZIik1BSg==
X-CSE-MsgGUID: NcA5xrJBRWS92J67z4F8zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601729"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:00 -0800
X-CSE-ConnectionGUID: dvqnjI0WSI6FPZNch3Cgew==
X-CSE-MsgGUID: ivBAIuvQSrCc4f51YTIxiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374117"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:26:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:26:56 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915/dp: Clear DPCD training pattern before
 transmitting the idle pattern
Date: Mon, 24 Feb 2025 19:26:39 +0200
Message-ID: <20250224172645.15763-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We are supposed to switch off the training pattern in DPCD before
we start transmitting the idle pattern. For LTTPRs we do that
correctly, but for the sink DPRX we only do this correctly
for some platforms.

On pre-HSW (where we don't implement the .set_idle_link_train()
hook), we directly switch from transmitting the training pattern
to normal pixel transmission (the hardware should guarantee that
the minimum number of required idle patters will be transmitted
during this transition).

For HSW+ we start transmitting the idle pattern earlier, and only
switch off the DPCD training pattern after we switch from the idle
pattern to normal pixel transmission. Adjust the code to disable
the DPCD training pattern before we start transmitting the idle
patter.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 11953b03bb6a..b2fb641e4e96 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1125,7 +1125,9 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 {
 	intel_dp->link_trained = true;
 
-	intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
+	if (!intel_dp->set_idle_link_train)
+		intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
+
 	intel_dp_program_link_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX,
 					       DP_TRAINING_PATTERN_DISABLE);
 
@@ -1357,8 +1359,10 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
 	if (ret)
 		ret = intel_dp_link_train_phy(intel_dp, crtc_state, DP_PHY_DPRX);
 
-	if (intel_dp->set_idle_link_train)
+	if (intel_dp->set_idle_link_train) {
+		intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
 		intel_dp->set_idle_link_train(intel_dp, crtc_state);
+	}
 
 	return ret;
 }
-- 
2.45.3

