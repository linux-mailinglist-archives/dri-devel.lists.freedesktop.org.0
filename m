Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B4D7C8316
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B402010E5CD;
	Fri, 13 Oct 2023 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028E210E5CD;
 Fri, 13 Oct 2023 10:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697193119; x=1728729119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X++2G+YUqWczaUzQS65eL9UdoWL/0d4/ZPEZXAE4zGc=;
 b=i+atOeMSP/J7MSyI0ypN6BPPJRX0K49tJQyMWfypVHjV6iAzbysNP+zy
 uorL+ktz4m/6oYlTvcWro76IUX/YwaURrpzcN80SPkHnZ8eHjbX/BdqWg
 9yNE+j4N6FSEybIYP9B615nR3qXDTaYy74KTz1H4UPz1V5rPfNlkQwpI6
 JWlUFsoyw8A6/lGSjxgOI2dGLwRlLLb9NRgreeYydS95ELCYvxtvDJHMf
 Hsu6MfMLBBJMn8qvxbw5P83am6Z5X/KKTfr2M5+SkLvaV3/O5szdfxGgf
 o0s92arzCu8hanW7XPf4NQX1rTLN/y9k0Hx62h6ZbxBDxv6OasLEsZ/pe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3749859"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="3749859"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825014124"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="825014124"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:31:49 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Flush WC GGTT only on required platforms
Date: Fri, 13 Oct 2023 12:31:40 +0200
Message-ID: <20231013103140.12192-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gen8_ggtt_invalidate() is only needed for limitted set of platforms
where GGTT is mapped as WC otherwise this can cause unwanted
side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
valid.

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 4d7d88b92632..c2858d434bce 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -197,13 +197,17 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
 
 static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
 {
+	struct drm_i915_private *i915 = ggtt->vm.i915;
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
 
 	/*
 	 * Note that as an uncached mmio write, this will flush the
 	 * WCB of the writes into the GGTT before it triggers the invalidate.
+	 *
+	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
 	 */
-	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
+	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
+		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
 }
 
 static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
-- 
2.41.0

