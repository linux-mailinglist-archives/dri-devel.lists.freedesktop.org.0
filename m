Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4C5BCB49
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 13:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B729710E607;
	Mon, 19 Sep 2022 11:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996C910E60C;
 Mon, 19 Sep 2022 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663588597; x=1695124597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPbes8+eGettTP2pig6OYSB7rzTLOcnrapqI4x0rido=;
 b=F/k5XE0lDaQk69Uyeg61bV9QW11TQJuozG8rxApfIDB2LM2vCBH33UEA
 r8D9HznPb3tnxTb9CO/ca/RKhMMcOEkEiVJ3Yhjtg2ywalnpj3XaBqBy+
 30zn39bYWU+1T7+eTjeXIEgju0XnbJFjTtjnrpAUqm9oQqEPfZJ/MIwYC
 nxIkELjvRKhqykIfdoO3accX+Aq4u7ugkLrIaO2jdfrpbV4Lj0Qhx7BIK
 MWCvPUKijsQvUGXGfOnfdmPBz2TmImJFp14jyiQyK7tA087lGev4EayZj
 qTZyQgnKkQHpiSgc9qBJVVDpVbE+BnZ2MUHoR8FuBtCB88+KOkdzXB5oS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299371193"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="299371193"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:56:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="947189985"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:56:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/mtl: Modify CAGF functions for MTL
Date: Mon, 19 Sep 2022 17:29:05 +0530
Message-Id: <20220919115906.1264041-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919115906.1264041-1-badal.nilawar@intel.com>
References: <20220919115906.1264041-1-badal.nilawar@intel.com>
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
Cc: andi.shyti@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updated the CAGF functions to get actual resolved frequency of
3D and SAMedia

Bspec: 66300

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 8 ++++++++
 drivers/gpu/drm/i915/gt/intel_rps.c     | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 2275ee47da95..7819d32db956 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1510,6 +1510,14 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+/*
+ * MTL: Workpoint reg to get Core C state and act freq of 3D, SAMedia/
+ * 3D - 0x0C60 , SAMedia - 0x380C60
+ * Intel uncore handler redirects transactions for SAMedia to MTL_MEDIA_GSI_BASE
+ */
+#define MTL_MIRROR_TARGET_WP1          _MMIO(0x0C60)
+#define   MTL_CAGF_MASK                REG_GENMASK(8, 0)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 17b40b625e31..c2349949ebae 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2075,6 +2075,8 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 
 	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = (rpstat >> 8) & 0xff;
+	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		cagf = rpstat & MTL_CAGF_MASK;
 	else if (GRAPHICS_VER(i915) >= 9)
 		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
 	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
@@ -2098,7 +2100,9 @@ static u32 read_cagf(struct intel_rps *rps)
 		vlv_punit_get(i915);
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
-	} else if (GRAPHICS_VER(i915) >= 6) {
+	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);
+	else if (GRAPHICS_VER(i915) >= 6) {
 		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
 	} else {
 		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
-- 
2.25.1

