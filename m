Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFDD8243EA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4C710E498;
	Thu,  4 Jan 2024 14:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF9610E493;
 Thu,  4 Jan 2024 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704378983; x=1735914983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DC5wUxyUZuDXqHwb6BLbsrDJRiz4sPLtJ5GVpqfvxUU=;
 b=GrkZOafbwM0KXS7yV5GXbFB5nT+AB1rZ6UY7Ijy74pc59FcF87KTfbHf
 1o9+L3vGVY7LeQHBR/6/2hyMTnX1Qh/z8VzpfOWaYXjyougGt3nm22z3j
 eb3ZEJMRoCjX2SKUngWGiYyvTLT1rqwmipBZ5jFzz3TnD+dLmn4Ce5aZB
 ImHD6eupft4bBdzfghe6F9lOqwizTaiEneiVBtfMnl//ptiKillUIm1qH
 MI+ZCtlZYJ/C+iWMeRwBa3iktyEiAYyvC90E9V1Ih3dWbrixuh68WdOpF
 5BtORBFR+HGmMurgFxdrA9FMLGLmDZ1MclWIqGV4v+yKbp4B8hmS+0ap0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4072835"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4072835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846271880"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="846271880"
Received: from unknown (HELO intel.com) ([10.252.52.99])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:36:18 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/i915/gt: Disable HW load balancing for CCS
Date: Thu,  4 Jan 2024 15:35:57 +0100
Message-ID: <20240104143558.193694-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104143558.193694-1-andi.shyti@linux.intel.com>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware is not able to dynamically balance the load between
CCS engines. Wa_16016805146 suggests disabling it for all
platforms.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 3e558d6d5e89..edaa446abd91 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1478,6 +1478,7 @@
 
 #define GEN12_RCU_MODE				_MMIO(0x14800)
 #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
+#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
 
 #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3eacbc50caf8..a7718f7d2925 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2978,6 +2978,12 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
 	}
+
+	/*
+	 * Wa_16016805146: disable the CCS load balancing
+	 * indiscriminately for all the platforms
+	 */
+	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
 }
 
 static void
-- 
2.43.0

