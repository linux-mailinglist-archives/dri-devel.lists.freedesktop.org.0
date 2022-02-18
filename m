Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B504BBFD0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD2410E7BD;
	Fri, 18 Feb 2022 18:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105110E71F;
 Fri, 18 Feb 2022 18:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210064; x=1676746064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C+MkOqiwP4I7fA/1aBEuuIAuM7+18btfM7ehJPLyiQA=;
 b=XdIEDToNVfXBF0Kb8x8hsXoPHMhB7lQ81wM0KtIL2w24cf52z+2mRokK
 CZjTNx+pt1RWJpMlsDVaYfnI3LZSFK6+EfhFMFohOG2JjTLKmWHzEGrE3
 6LcJ5dWnjuZSyqbR/CjAGDCOCP24bDarZPRpAI5M/YQ+DnMv5TI+N4gTR
 LaClacDG+DjD0SEnJIZ4nBwmKeSfp0NjGCw9dIgRxzvt8sK7YX54p+WWD
 aRo/rEikPAS5rsW6VN8Jht7eiPYG4iYuuphr7ZasaYsb4vn9UJjoI8vUo
 cWN596bP3SDKGzirBg0ZLUaZExstaN9nOP5n4p6Eoyy5d75dzUy4+7LTU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238592933"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238592933"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642047"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:41 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/15] drm/i915: Fix for PHY_MISC_TC1 offset
Date: Sat, 19 Feb 2022 00:17:39 +0530
Message-Id: <20220218184752.7524-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
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
Cc: lucas.demarchi@intel.com, Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jouni Högander <jouni.hogander@intel.com>

Currently ICL_PHY_MISC macro is returning offset 0x64C10 for PHY_E.
The PORT_TC1 port is not yet enabled properly in the driver, but
intel_phy_snps.c is relying on intel_phy_is_snps() to filter out
unavailable phys. That function was already considering the last phy as
available. Just correct the offset of the last phy to 0x64C14 as the
rest of the support for it is coming on next commits.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_snps_phy.c | 2 +-
 drivers/gpu/drm/i915/i915_reg.h               | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
index 8fd00de981fc..4cdce0116883 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
@@ -32,7 +32,7 @@ void intel_snps_phy_wait_for_calibration(struct drm_i915_private *i915)
 		if (!intel_phy_is_snps(i915, phy))
 			continue;
 
-		if (intel_de_wait_for_clear(i915, ICL_PHY_MISC(phy),
+		if (intel_de_wait_for_clear(i915, DG2_PHY_MISC(phy),
 					    DG2_PHY_DP_TX_ACK_MASK, 25))
 			drm_err(&i915->drm, "SNPS PHY %c failed to calibrate after 25ms.\n",
 				phy_name(phy));
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e2e9f543fb83..cc13918fe246 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9361,8 +9361,10 @@ enum skl_power_gate {
 
 #define _ICL_PHY_MISC_A		0x64C00
 #define _ICL_PHY_MISC_B		0x64C04
-#define ICL_PHY_MISC(port)	_MMIO_PORT(port, _ICL_PHY_MISC_A, \
-						 _ICL_PHY_MISC_B)
+#define _DG2_PHY_MISC_TC1	0x64C14 /* TC1="PHY E" but offset as if "PHY F" */
+#define ICL_PHY_MISC(port)	_MMIO_PORT(port, _ICL_PHY_MISC_A, _ICL_PHY_MISC_B)
+#define DG2_PHY_MISC(port)	((port) == PHY_E ? _MMIO(_DG2_PHY_MISC_TC1) : \
+				 ICL_PHY_MISC(port))
 #define  ICL_PHY_MISC_MUX_DDID			(1 << 28)
 #define  ICL_PHY_MISC_DE_IO_COMP_PWR_DOWN	(1 << 23)
 #define  DG2_PHY_DP_TX_ACK_MASK			REG_GENMASK(23, 20)
-- 
2.20.1

