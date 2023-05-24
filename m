Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5B70F899
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6A110E684;
	Wed, 24 May 2023 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EA910E681;
 Wed, 24 May 2023 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938404; x=1716474404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8oodpfR1D12Umjrsztrti1fW2TRrPi8AgE1Nn/eWZc=;
 b=EyfjeNLCAB/4rfFBUeaKilQl5xqINpnW6c0Pq2VjixtQklbvAjXm2Wjo
 rJ2ikBJEIYq3mMutYpaG8PUkjp3BaxxKrDaX9Z5l1PhZurHn40nLMtgid
 0hkGBnyM6BWNjD4yM6wKOqNlHVyI44ss4C38usm7Teu500FtsdJwzJzWv
 yhXz1tJPLCDovrttOXjSOezlxH5DWFYuSLlMPEw5+GOTOAdjImRpBPs/i
 u4zk5N+gTgyZBbDC8i0sghw9VPV/BxAcoJcjpwCChw7JO8PXByvsMxKri
 jiXLSVNtc6PPg2qT7EbvFHmHZqc5jZX3JEgzs4Hi1cUygPsp7bMaidYHf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806355"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806355"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556011"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556011"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:39 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/14] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Date: Wed, 24 May 2023 19:52:00 +0530
Message-Id: <20230524142210.3779331-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In Bigjoiner check for DSC, bigjoiner interface bits for DP for
DISPLAY > 13 is 36 (Bspec: 49259).

v2: Corrected Display ver to 13.

v3: Follow convention for conditional statement. (Ville)

v4: Fix check for display ver. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 969a22e140c4..424005ab9f73 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -784,8 +784,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
 
 	if (bigjoiner) {
+		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
 		u32 max_bpp_bigjoiner =
-			i915->display.cdclk.max_cdclk_freq * 48 /
+			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
 			intel_dp_mode_to_fec_clock(mode_clock);
 
 		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
-- 
2.25.1

