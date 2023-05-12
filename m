Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE870006E
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F810E62E;
	Fri, 12 May 2023 06:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598510E629;
 Fri, 12 May 2023 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872940; x=1715408940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aws0/h+QmE+tKRQRPKKh3SGrOhkdkLZC9uZS1bBh0tY=;
 b=g6u+lSuJ44New/Jl7r0xBvap9ueRqxXVVJL7d562v4nQ/+rHaIHliaFc
 DhVpdDVVdLIiMkE+lLprf/Sterdy2N4i0bdEWgcNGf9JKgmhQv2U+0nyl
 GmaKfguZ9haJXQuEOrhzyl66/JueGvMaaz4LqYU8XPwAS2B5LvCRtV28O
 orlBe/eETGYrPf1sbnAB2go7FvLiW31QnZXFrOegwbSxoxXbn4n6DA+ab
 0j7F/wAB4HjZ3GO+qR7c4nr1uYk7LOpQlQLtKRthf+sacAp/R68+75f1b
 aRO+YSecIVuAYrgNgJ4ivaNnKXgyhpMFCpgK7rxmY7wa49CB1aqHPF9al g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741933"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741933"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941283"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941283"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:28:58 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Date: Fri, 12 May 2023 11:54:08 +0530
Message-Id: <20230512062417.2584427-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
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

In Bigjoiner check for DSC, bigjoiner interface bits for DP for
DISPLAY > 13 is 36 (Bspec: 49259).

v2: Corrected Display ver to 13.

v3: Follow convention for conditional statement. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 24de25551a49..bca80c0793e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -783,8 +783,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
 
 	if (bigjoiner) {
+		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
 		u32 max_bpp_bigjoiner =
-			i915->display.cdclk.max_cdclk_freq * 48 /
+			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
 			intel_dp_mode_to_fec_clock(mode_clock);
 
 		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
-- 
2.25.1

