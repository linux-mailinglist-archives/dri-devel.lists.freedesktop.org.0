Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2762FCC8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 19:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92DE10E79B;
	Fri, 18 Nov 2022 18:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033110E244;
 Fri, 18 Nov 2022 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668796211; x=1700332211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tYXHTLTvDAPzEeOoZksbFTH/CSpiUwyW6DJIdAHjvUw=;
 b=cpF0lf6BdN0/VkJpUb8xYrBJ/9g4jG+SHgC9HcfZFxuHqtEjGVpQhwVY
 FxMVg2/BG0rsdFmTrwNBLaCaOtrMzsRQwQz8I35uGt3smfhKs1FnnCD0L
 7w4HQ77K8vH+NEwz6kOqVRPpUwpC0EO5Z3UV/xhQboYfUnZqgDiDzVNhp
 mzMuAXJgIQykwT5LcZ1xFI4u8hNKSBGrN2fgurOmJFvKS2iTvuJzRUUpL
 AbzR1p5ATUZKbZi7jhYoPmxRFtr1/GqbEtyM6olnMWIhMoAz5Q/Moe1RV
 URn19n/GPk6oahx+pO4KfdcUqum6Plg+tOrYS8KGB1eSa3wWwdHtQ7UPX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="311906126"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="311906126"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 10:30:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="640298168"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="640298168"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 10:30:04 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Date: Sat, 19 Nov 2022 00:03:54 +0530
Message-Id: <20221118183354.1047829-1-badal.nilawar@intel.com>
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
Cc: anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

By defaut idle messaging is disabled for GSC CS so to unblock RC6
entry on media tile idle messaging need to be enabled.

v2:
 - Fix review comments (Vinay)
 - Set GSC idle hysteresis as per spec (Badal)
v3:
 - Fix review comments (Rodrigo)

Bspec: 71496

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index b0a4a2dbe3ee..e971b153fda9 100644
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
+		/* hysteresis 0xA=5us as recommended in spec*/
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
index c3cd92691795..80a979e6f6be 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -917,6 +917,10 @@
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

