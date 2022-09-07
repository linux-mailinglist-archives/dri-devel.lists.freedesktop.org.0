Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1DF5B1057
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 01:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2F10E90D;
	Wed,  7 Sep 2022 23:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A960610E914;
 Wed,  7 Sep 2022 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662593212; x=1694129212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bsamh6HRA8OGIo7L9XMdW8AC1jNjVQxiiACcwmCP6Zw=;
 b=OX6rqoe2HjqDwCSJyn5r89SSSoNsVPFc9UragcE06em5jPsZJOP7fp3Y
 BIILJzbazSuazm9fawhe9Qur21u8QW1gfwIQPKK3sqnsAeEiEhOZOY9qZ
 YKf272lpOsSWR0gOzlxPcXsINH1ABU9Z9U0ohR+DdCsAvBx9pJwteuJ+f
 4h+gtBDiQAtdjRfzHb1rZdQVJkv1aNf8QPaVjqfua8JOUlN0Akjv9fOUN
 fGy0r/fIg+IvGZtQEyyzgWKTStW7nPRrijCEoq8GBWP8JeiopZ2/3wvZa
 CaMzxBGbxM+1zpthKfecm0GEAX4iHJouv5gtOC99iwgHWcmkBMPPcbaUL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="298357488"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="298357488"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:26:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="644829234"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:26:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] Revert "drm/i915/dg2: extend Wa_1409120013 to DG2"
Date: Wed,  7 Sep 2022 16:25:42 -0700
Message-Id: <20220907232541.1720966-1-lucas.demarchi@intel.com>
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
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 487970e8bb776c989013bb59d6cbb22e45b9afc6.

Updated bspec and workaround database note Wa_1409120013 is not needed
for DG2 (or any Xe_LPD) platform. Simply check by display version 12.

v2: Simplify condition check to display version (Matt Roper)

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Clint Taylor <Clinton.A.Taylor@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 210c1f78cc90..eb9c54bbf51f 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -7614,9 +7614,8 @@ static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
 
 static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
 {
-	/* Wa_1409120013:tgl,rkl,adl-s,dg1,dg2 */
-	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv) ||
-	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv) || IS_DG2(dev_priv))
+	/* Wa_1409120013 */
+	if (DISPLAY_VER(dev_priv) == 12)
 		intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN(INTEL_FBC_A),
 				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
 
-- 
2.37.2

