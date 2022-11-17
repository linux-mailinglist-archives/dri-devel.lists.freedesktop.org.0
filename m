Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9F62D4D8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 09:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707510E571;
	Thu, 17 Nov 2022 08:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3910E571;
 Thu, 17 Nov 2022 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668672722; x=1700208722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5/yntYGdhiGBk7M8JZ3DwDY6Knowo4GI0Rk0dqyjuQw=;
 b=a270TG+7+P/zT1T0c8O66k22EBsrFk12g5Ug9ErnXy67whA9K1RCB6re
 +9sfaCEiS+J4ZnXGzAixzOraVYWmdGUWk6tauuyEkmd+nRPlidAmcnLwa
 xiI+bedc17tSeA88vRywZ711U02uE2wpluuS4ST+lwvKs3us533RroLV8
 SoTiNHrzlk5rIjVx4aetN28sZZBL9Hsn7F5B4iWziMp2j2R6XLlpg1udk
 qDgDnPBTd3OjAEcIdW1mK/SFr+od8L48/kpWALnSmBS410qpERkonRCh2
 3+1zNzURw6N9pE0f4bHLLCxhB6Qki/bdj5H+go2n8HVj6WPOyY12MQNmU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="313939037"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="313939037"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 00:12:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="968776011"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="968776011"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 00:11:58 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Date: Thu, 17 Nov 2022 13:45:46 +0530
Message-Id: <20221117081546.218463-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: radhakrishna.sripada@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

By defaut idle mesaging is disabled for GSC CS so to unblock RC6
entry on media tile idle messaging need to be enabled.

v2:
 - Fix review comments (Vinay)
 - Set GSC idle hysteresis (Badal)
v3:
 - Fix review comments (Rodrigo)

Bspec: 71496

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index b0a4a2dbe3ee..fad0d97a9d79 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -15,6 +15,22 @@
 #include "intel_rc6.h"
 #include "intel_ring.h"
 #include "shmem_utils.h"
+#include "intel_gt_regs.h"
+
+static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
+{
+	struct drm_i915_private *i915 = engine->i915;
+
+	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
+		intel_uncore_write(engine->gt->uncore,
+				   RC_PSMI_CTRL_GSCCS,
+				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
+		/* 5 us hysteresis */
+		intel_uncore_write(engine->gt->uncore,
+				   PWRCTX_MAXCNT_GSCCS,
+				   0xA);
+	}
+}
 
 static void dbg_poison_ce(struct intel_context *ce)
 {
@@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
 
 	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
 	intel_engine_init_heartbeat(engine);
+
+	intel_gsc_idle_msg_enable(engine);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 07031e03f80c..011e3afff0d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -913,6 +913,10 @@
 #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
 #define  MSG_IDLE_FW_SHIFT	9
 
+#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
+#define	  IDLE_MSG_DISABLE	REG_BIT(0)
+#define	PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
+
 #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
 #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
 
-- 
2.25.1

