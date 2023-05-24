Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE470F8A6
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3610E685;
	Wed, 24 May 2023 14:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54010E686;
 Wed, 24 May 2023 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938406; x=1716474406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KyAX2o1oM1oMQ9BfPZsfGz/aptxVbv89bxZ0UNamRzM=;
 b=nmMQ0aXnqbHGbQeHlwoVu+Gt5pRYsW0zwp0QySc7kDWkj4lW0ufvzVl9
 rkzXyuR0nBlImeuWTBQxkTsshVI4rn7TUu07Pdawgx7lTf2vbNX5ESCJz
 Qm7d7qNolbv2kc5Dm/NmQJfMkc+xpTI+LoN47mfqkG+jvt4ujdgDzzddg
 wGFfSHiQzjnP1Zgi+3LjqceL3+9f2BFMUb2y+WQsOFwu7Q1jlnofgWcUk
 di5vW7XD0q2f2qE3S1b6AKi9ogNQRiv0Smmoqj9eMpnqfKlSpiTSYn8pU
 gCla8jmQYRRMr3ZViOZ2ODf1a77t/c5igWZyDGaK3FC757syjygLfxtf7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806372"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806372"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556016"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556016"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:41 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] drm/i915/display: Account for DSC not split case while
 computing cdclk
Date: Wed, 24 May 2023 19:52:01 +0530
Message-Id: <20230524142210.3779331-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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

Currently we assume 2 Pixels Per Clock (PPC) while computing
plane cdclk and min_cdlck. In cases where DSC single engine
is used the throughput is 1 PPC.

So account for the above case, while computing cdclk.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 6 +++++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 7 +++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 6bed75f1541a..14ccda8a0bf1 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2494,8 +2494,12 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	int pixel_rate = crtc_state->pixel_rate;
 
+	/*
+	 * If single VDSC engine is used, it uses one pixel per clock
+	 * otherwise we use two pixels per clock.
+	 */
 	if (DISPLAY_VER(dev_priv) >= 10)
-		return DIV_ROUND_UP(pixel_rate, 2);
+		return crtc_state->dsc.dsc_split? pixel_rate : DIV_ROUND_UP(pixel_rate, 2);
 	else if (DISPLAY_VER(dev_priv) == 9 ||
 		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
 		return pixel_rate;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 110401aab038..2da43ce5c302 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -263,8 +263,11 @@ static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 {
 	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
 
-	/* two pixels per clock */
-	return DIV_ROUND_UP(pixel_rate, 2);
+	/*
+	 * If single VDSC engine is used, it uses one pixel per clock
+	 * otherwise we use two pixels per clock.
+	 */
+	return crtc_state->dsc.dsc_split? pixel_rate : DIV_ROUND_UP(pixel_rate, 2);
 }
 
 static void
-- 
2.25.1

