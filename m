Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2D63DA17
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE8C10E066;
	Wed, 30 Nov 2022 15:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D4E10E066;
 Wed, 30 Nov 2022 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669823947; x=1701359947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwx9EXHGlNuhNn3eCKfbiHHpPPVDVOPX07LN4uOCP7E=;
 b=islI5x1gdydl8SDn/hCk42eGAH3J60krSx0isiJ+GO5jtcCX3MRd8Aat
 mY8Zhegzcg1WN3ypUw0fT/VAb8CtI9nA7T5t2mUuZT26qOx7Crmf5Vara
 Xeg7v26IcAuDW8lopIx2wgJekrXFUQjn5BIi4HH0rWFs2Xg/xOulvCNdf
 OuHVMO6sTYSUE6i60tXnAtE3JPb0JSZyKkjd7kdr9Y0hXKW+V2SbsWDZ6
 wkmeyOKLRjFuOlZ+zF5l2PuB30pdI96U1TgbafOdosSzNbGvwVQe9vrz5
 2cLewEnq5uUrVIZBDZXuo06rLqZBT6r2cTPh7GkzKRnyx1NsYvaqWFvf5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="379710996"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="379710996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 07:59:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="594707012"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="594707012"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 07:59:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/i915/mtl: Hold forcewake and MCR lock over PPAT
 setup
Date: Wed, 30 Nov 2022 07:58:52 -0800
Message-Id: <20221130155852.19601-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y4d76483JRj5d4RL@bala-ubuntu>
References: <Y4d76483JRj5d4RL@bala-ubuntu>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PPAT setup involves a series of multicast writes.  This can be optimized
slightly be acquiring forcewake and the steering lock just once for the
entire sequence.

v2:
 - We should use FW_REG_WRITE instead of FW_REG_READ.  (Bala)

Suggested-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 2ba3983984b9..e37164a60d37 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -482,14 +482,25 @@ static void tgl_setup_private_ppat(struct intel_uncore *uncore)
 
 static void xehp_setup_private_ppat(struct intel_gt *gt)
 {
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
-	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
+	enum forcewake_domains fw;
+	unsigned long flags;
+
+	fw = intel_uncore_forcewake_for_reg(gt->uncore, _MMIO(XEHP_PAT_INDEX(0).reg),
+					    FW_REG_WRITE);
+	intel_uncore_forcewake_get(gt->uncore, fw);
+
+	intel_gt_mcr_lock(gt, &flags);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
+	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
+	intel_gt_mcr_unlock(gt, flags);
+
+	intel_uncore_forcewake_put(gt->uncore, fw);
 }
 
 static void icl_setup_private_ppat(struct intel_uncore *uncore)
-- 
2.38.1

