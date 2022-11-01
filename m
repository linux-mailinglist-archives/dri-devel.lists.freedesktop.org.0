Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4086143B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 04:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF0010E0BE;
	Tue,  1 Nov 2022 03:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D110E0BE;
 Tue,  1 Nov 2022 03:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667273619; x=1698809619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gyLwiiWnXm7h8Fet5yh4O+HF/WZLT6zrQdUZ+Z4MmDM=;
 b=Q/j6JbU/fW4JTAhS7asOHN5hRar6OBiJGBpOuXkWQINTCbOE5/FM/vSK
 6KF0NmTgduT8hg54hL8IOqUAfYSethQjr41sDukc16FzhLBp6QwCLWY25
 UNNZ+nsD77OZo1022wFgxEg8MMjCZaM+ZYQPOhZZhPpHEW3HcwDFpk9F9
 xgOyuMMFxnKvFkn2JZE3PgiUwZiyEwJI0Os6u73xOvc0NZe0SEK2x6ent
 NrumbloYRvDY2rn1A3wNj2ddbp8bg2m3k6telhEdfKYEAcBJI2EAmxOoj
 T32LpwbWyGDBrBf15ZW+/3b3pcQRFW8Je1ZnYZylO0yoqtquCfvJePEfS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="307782729"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="307782729"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 20:33:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="739193634"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="739193634"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 20:33:35 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/mtl: Enable Idle Messaging for GSC CS
Date: Tue,  1 Nov 2022 09:06:34 +0530
Message-Id: <20221101033634.1900331-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101033634.1900331-1-badal.nilawar@intel.com>
References: <20221101033634.1900331-1-badal.nilawar@intel.com>
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

Bspec: 71496

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 12 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index b0a4a2dbe3ee..8d391f8fd861 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -15,6 +15,7 @@
 #include "intel_rc6.h"
 #include "intel_ring.h"
 #include "shmem_utils.h"
+#include "intel_gt_regs.h"
 
 static void dbg_poison_ce(struct intel_context *ce)
 {
@@ -271,10 +272,21 @@ static const struct intel_wakeref_ops wf_ops = {
 
 void intel_engine_init__pm(struct intel_engine_cs *engine)
 {
+	struct drm_i915_private *i915 = engine->i915;
 	struct intel_runtime_pm *rpm = engine->uncore->rpm;
 
 	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
 	intel_engine_init_heartbeat(engine);
+
+	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
+		intel_uncore_write(engine->gt->uncore,
+				   RC_PSMI_CTRL_GSCCS,
+				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
+		drm_dbg(&i915->drm,
+			"Set GSC CS Idle Reg to: 0x%x",
+			intel_uncore_read(engine->gt->uncore, RC_PSMI_CTRL_GSCCS));
+	}
+
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index f4624262dc81..176902a9f2a2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -908,6 +908,9 @@
 #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
 #define  MSG_IDLE_FW_SHIFT	9
 
+#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
+#define	 IDLE_MSG_DISABLE	BIT(0)
+
 #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
 #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
 
-- 
2.25.1

