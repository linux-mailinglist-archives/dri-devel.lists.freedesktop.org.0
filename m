Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19D4A80E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B81410E9E1;
	Thu,  3 Feb 2022 09:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABE610E9E1;
 Thu,  3 Feb 2022 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879082; x=1675415082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ArETKnG5QbGKwv1LyRiJY1fC5lpFd+YU00o2DMBVH/Q=;
 b=Ngha8TKV2keKoICqSem4pOIVg6YS02YTHYzJG7zZxoPTjVKmovhyGI7d
 jc+8866UIshy9QorNvXbXmZhTor5VfTxtvZS1goIs9UqQacCwYmb4Gccz
 zpMRxmsQi9CeG4m+qo8KBvfwVOZZ8wLb6oGSEi26USpM7kVKN3Ue+ik2R
 EcFqudTZINDinWUxyWpnHq3Bh4W5SPz2rFngz4GO6R7NhFd83gqNn7EWB
 MfrP3WjKyQi+gpCM21VVyzAkR/kmd0MZjKX0V5fWOKLgjrSqLBoF6CROW
 QiAMD5BnmHZ4fkkQL62+K7KRqur12g7vVWF/7ktGmZ67v1BUJo7et08K/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247869598"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="247869598"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="483173579"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/i915/dp: move intel_dp_prepare_link_train() call
Date: Thu,  3 Feb 2022 11:03:53 +0200
Message-Id: <c0fffbf7213c09e42be9875d38d3001e0026b063.1643878928.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643878928.git.jani.nikula@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call it from the higher level function, as it will be shared between two
code paths.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 9451f336f28f..4e507aa75a03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1083,8 +1083,6 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
 	bool ret = true;
 	int i;
 
-	intel_dp_prepare_link_train(intel_dp, crtc_state);
-
 	for (i = lttpr_count - 1; i >= 0; i--) {
 		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
 
@@ -1127,6 +1125,8 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
 		/* Still continue with enabling the port and link training. */
 		lttpr_count = 0;
 
+	intel_dp_prepare_link_train(intel_dp, crtc_state);
+
 	if (!intel_dp_link_train_all_phys(intel_dp, crtc_state, lttpr_count))
 		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
 }
-- 
2.30.2

