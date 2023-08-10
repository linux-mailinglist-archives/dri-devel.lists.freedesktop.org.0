Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA8777927
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E16F10E52D;
	Thu, 10 Aug 2023 13:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0710E520;
 Thu, 10 Aug 2023 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672891; x=1723208891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=95pfhRMr6w2aaT3OenXCyMJYJDIfluYcCIiaKqFaXCM=;
 b=FrEau0nqp2UPc72q3mC3Ea0VWNqN8i51eokcc+12hDgzMSZ4xkg/RQZh
 wr7uDz+4h1cDEIu+yvG7JVISwPpBO6pXCvgEhWVgJB1fRGq4jjDPjZ2ig
 u+rbgPoBfGZWF6l5tRisiccvvBUmt09xAaciYcA9EGHwUF87W6GKPwyIb
 zeh+1AFDbPQfyqwzqa2dVcaJmRExOkunPJG8UIeY0SYBUNTVO3UBD1j8C
 7eTdYcXDeqkuXq/KJa29ea6Bp3AWsE2nD0UnmA8Mf3dTYjzrztx8tHF39
 LLw5/z6fKlY3Y6sqoUYbdAKj2O2RdkA8OakS/7Vz0//bB4Wofj/G9PGD2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358544"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358544"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143072"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143072"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:50 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/20] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Date: Thu, 10 Aug 2023 18:33:04 +0530
Message-Id: <20230810130319.3708392-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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

v5: Added note for 2 PPC. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35608b9de573..fc08fc85d665 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -802,8 +802,11 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
 
 	if (bigjoiner) {
+		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
+		/* With bigjoiner multiple dsc engines are used in parallel so PPC is 2 */
+		int ppc = 2;
 		u32 max_bpp_bigjoiner =
-			i915->display.cdclk.max_cdclk_freq * 48 /
+			i915->display.cdclk.max_cdclk_freq * ppc * bigjoiner_interface_bits /
 			intel_dp_mode_to_fec_clock(mode_clock);
 
 		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
-- 
2.40.1

