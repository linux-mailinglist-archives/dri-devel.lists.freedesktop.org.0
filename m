Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77925B0E46
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA07C10E886;
	Wed,  7 Sep 2022 20:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000510E885;
 Wed,  7 Sep 2022 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662583198; x=1694119198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5uadGIqxEW5Gq9xLieIBpeJN4jts8CoMCQSrsV3hfQQ=;
 b=K4+rEc+3x40OjjsCZUHwtWJJKP3zESU4Qhogx27/4xTSh3VEUUgyZxyI
 T1NoJF8Rq0YTnY9L4GZyQr1sn42mgx8S74bQMyer6AmdvloJhpbP6oWGm
 I9DdfV7qBP3nkaiDPYJFwBiEu+ZvWa2eEdA5rSxDEISrtNJ7KBUN3nJaT
 Z/Ys5DhtGVspUjZ8JEcoMYjAB5vAKDp5Asbc3dIVs1GGEkBoYNgLi/rDk
 oTMbHF5S8NjmHu16wZOD9AEBgvJSTdJMWNqtnZT8DOi4gLi85H3DpJuoI
 mM4BSq2q+6fP6oal21/HSvMClV4FX6ARewPg4DkrgK3BSXDdn0GkS8OG/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297798406"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="297798406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:39:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="859778756"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:39:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gt: Use MEDIA_VER() when handling media fuses
Date: Wed,  7 Sep 2022 13:39:10 -0700
Message-Id: <20220907203911.1662804-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check for media IP version instead of graphics since this is figuring
out the media engines' configuration. Currently the only platform with
non-matching graphics/media version is Meteor Lake: update the check in
gen11_vdbox_has_sfc() so it considers not only version 12, but also any
later version which then includes that platform.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 275ad72940c1..5cddee7c2f1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -654,13 +654,14 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
 	 */
 	if ((gt->info.sfc_mask & BIT(physical_vdbox / 2)) == 0)
 		return false;
-	else if (GRAPHICS_VER(i915) == 12)
+	else if (MEDIA_VER(i915) >= 12)
 		return (physical_vdbox % 2 == 0) ||
 			!(BIT(physical_vdbox - 1) & vdbox_mask);
-	else if (GRAPHICS_VER(i915) == 11)
+	else if (MEDIA_VER(i915) == 11)
 		return logical_vdbox % 2 == 0;
 
-	MISSING_CASE(GRAPHICS_VER(i915));
+	MISSING_CASE(MEDIA_VER(i915));
+
 	return false;
 }
 
@@ -747,14 +748,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	 * and bits have disable semantices.
 	 */
 	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
-	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
 		media_fuse = ~media_fuse;
 
 	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
 	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
 		      GEN11_GT_VEBOX_DISABLE_SHIFT;
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
 		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
 		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
 	} else {
-- 
2.37.2

