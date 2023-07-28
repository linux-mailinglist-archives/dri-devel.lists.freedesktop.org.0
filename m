Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD17662DA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9596010E643;
	Fri, 28 Jul 2023 04:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303910E63D;
 Fri, 28 Jul 2023 04:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517733; x=1722053733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ln/8rqXPIdfCEaqVXfC5WaNvMdNpEYL3UuyVqgre8qE=;
 b=C/MeWyHwXDw8eZch/78U2w4iBe+VObzkVuwqBVf/BI7fUoiUm5hqu/Bk
 6lMPtFipO9XNF+9VtmX0oYuVjDKT0kLqtdFfAbOcYrvBsGIRa3w9I0v5a
 qd4YhL+XTtU16jGc99gFlHQZmXi++/9iEEoNia3Bpo7tpQlk5DFy79Qvk
 QkxZADmWWH/dKqiPWV8HRw7oT0HXzRp3UfceIsR+XmrLKX38eknLgRsU6
 l8OdXJ1hKtmNh0GStjt4lq1LC1wyAdCybDfp421a5UE8JJ9TR496IWRF6
 1r0KL6lO0AYJErWbcUTH0w8dvuhJBlceH4/pqOVG7Dium22SXTrc6XSUo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104163"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104163"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276290"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276290"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/20] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
Date: Fri, 28 Jul 2023 09:41:35 +0530
Message-Id: <20230728041150.2524032-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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
index 19768ac658ba..c80744e7ecdf 100644
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

