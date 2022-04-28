Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F364512A64
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 06:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B8E10E366;
	Thu, 28 Apr 2022 04:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30D710E16E;
 Thu, 28 Apr 2022 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651119583; x=1682655583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XybL2HMDvMnhpnqktXlJaAEIGUZOL806mvIPTZ3Scqg=;
 b=V08GSCnigGrqAA+agvTn48S81VxT74ByTe7rK1hCSdNZdQQ/s+3HfD/5
 mAf+OsubDpR7n6oagfaqSrlMcrjW/iy34aJH+vt/98D4eSpjm9Gfn38lc
 UCtKdaJeuzAiaCoAED6AevIX4fYnsIfjE28m7Thn+ck+WmD5Nac1DF6fs
 h9TjkJjpIE1uQgyuiFsMdLIJDTcDfZ3JSQB8pzYiDrLSS+4+g4KazJZpW
 pWG5M4pATCAvixeJ55yc4Fl9wQj/51PHU/yfKrwt1+WSYvnFUD/cWVzb6
 PmW+LoEwl+dM+6G4oHWoVDLco2TECl8nGgk6DCDV1FQFKcb4PtY3YklVC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326645783"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="326645783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559403046"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines
Date: Wed, 27 Apr 2022 21:19:26 -0700
Message-Id: <20220428041926.1483683-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428041926.1483683-1-matthew.d.roper@intel.com>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index b60492826478..7739d6c33481 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1037,7 +1037,8 @@ static const struct intel_device_info xehpsdv_info = {
 		BIT(RCS0) | BIT(BCS0) |
 		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
 		BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) |
-		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7),
+		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7) |
+		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
 	.require_force_probe = 1,
 };
 
@@ -1056,7 +1057,8 @@ static const struct intel_device_info xehpsdv_info = {
 	.platform_engine_mask = \
 		BIT(RCS0) | BIT(BCS0) | \
 		BIT(VECS0) | BIT(VECS1) | \
-		BIT(VCS0) | BIT(VCS2)
+		BIT(VCS0) | BIT(VCS2) | \
+		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3)
 
 static const struct intel_device_info dg2_info = {
 	DG2_FEATURES,
-- 
2.35.1

