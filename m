Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9695FF6DC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90010E1BC;
	Fri, 14 Oct 2022 23:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3BE10E1BC;
 Fri, 14 Oct 2022 23:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665790208; x=1697326208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m+GUrotbCn7nLU/zbSnj/3rk5uV1wz75FIpC6fzL5IU=;
 b=kbBrg4MLOnquVbFfDElbuh6fXiQy2mu9VpSn5HVfe9ir7Go1gTpZ5On9
 eRmb72cS7JT1nFVGcoXa3Irymps7bXrMjxMNzkxdq7MDmcdbdADyw6Lof
 ncwvN1tl9EZykiHx2d7HH51GT0r1QC2Rs6rLrg8Lo0VOwmB+IopZiTfr5
 THIgWpSPGUtTCd2pnGw+Ik4peofBzkXe1B5sv3S/fURWSSw/rhQRxG9Nw
 f1l1ixwa9+ukF99z+EWlo5Ba5SAIIHpEWlRdyvS5So2I82kwizhMe5bKa
 FVQrR3jTW39ueITJWO9eNiRmIEN2Qn6yvGZYmn1sUhrZBCBfcuKfger0H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="306576665"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="306576665"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:30:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696477561"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696477561"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:30:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pvc: Update forcewake domain for CCS register ranges
Date: Fri, 14 Oct 2022 16:30:04 -0700
Message-Id: <20221014233004.1053678-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bspec was just updated with a correction to the forcewake domain
required when accessing registers in the CCS engine ranges (0x1a000 -
0x1ffff and 0x26000 - 0x27fff) on PVC; these ranges require a wake on
the RENDER domain, not the GT domain.

Bspec: 67609
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index c058cdc6d8a0..2a3e2869fe71 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1682,25 +1682,27 @@ static const struct intel_forcewake_range __pvc_fw_ranges[] = {
 	GEN_FW_RANGE(0x12000, 0x12fff, 0), /*
 		0x12000 - 0x127ff: always on
 		0x12800 - 0x12fff: reserved */
-	GEN_FW_RANGE(0x13000, 0x23fff, FORCEWAKE_GT), /*
+	GEN_FW_RANGE(0x13000, 0x19fff, FORCEWAKE_GT), /*
 		0x13000 - 0x135ff: gt
 		0x13600 - 0x147ff: reserved
 		0x14800 - 0x153ff: gt
-		0x15400 - 0x19fff: reserved
-		0x1a000 - 0x1ffff: gt
-		0x20000 - 0x21fff: reserved
-		0x22000 - 0x23fff: gt */
+		0x15400 - 0x19fff: reserved */
+	GEN_FW_RANGE(0x1a000, 0x21fff, FORCEWAKE_RENDER), /*
+		0x1a000 - 0x1ffff: render
+		0x20000 - 0x21fff: reserved */
+	GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_GT),
 	GEN_FW_RANGE(0x24000, 0x2417f, 0), /*
 		24000 - 0x2407f: always on
 		24080 - 0x2417f: reserved */
-	GEN_FW_RANGE(0x24180, 0x3ffff, FORCEWAKE_GT), /*
+	GEN_FW_RANGE(0x24180, 0x25fff, FORCEWAKE_GT), /*
 		0x24180 - 0x241ff: gt
 		0x24200 - 0x251ff: reserved
 		0x25200 - 0x252ff: gt
-		0x25300 - 0x25fff: reserved
-		0x26000 - 0x27fff: gt
-		0x28000 - 0x2ffff: reserved
-		0x30000 - 0x3ffff: gt */
+		0x25300 - 0x25fff: reserved */
+	GEN_FW_RANGE(0x26000, 0x2ffff, FORCEWAKE_RENDER), /*
+		0x26000 - 0x27fff: render
+		0x28000 - 0x2ffff: reserved */
+	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT),
 	GEN_FW_RANGE(0x40000, 0x1bffff, 0),
 	GEN_FW_RANGE(0x1c0000, 0x1c3fff, FORCEWAKE_MEDIA_VDBOX0), /*
 		0x1c0000 - 0x1c2bff: VD0
-- 
2.37.3

