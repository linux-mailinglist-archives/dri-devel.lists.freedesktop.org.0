Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658076082B8
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7186510E376;
	Sat, 22 Oct 2022 00:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D68610E333;
 Sat, 22 Oct 2022 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397271; x=1697933271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8oyV4gUd/Pxd9QPWj0zjyyFFb5WEsFxJw5HZb+RDvrs=;
 b=MNSr4M8lLIa70w8R47JuCxn3mIqyuUHgKjiILeHy6HRujEF3PtZfHep5
 qUBqpdaNRk2o8LSDVWhhSSBWa6QlvczKQLzw62xFru9/56k0EnLe5g4Rs
 tG1otlSBY3y786lqoZNGuGPue1MEluwbRiqtD4g6sjYXE0sYuWNem1GEa
 YTp3yDl8MAapB0sOK1uXsPZaLCqP/3ZFi6LK2LYLEQK/wVKV09rn9J7/u
 uLqq/ujCDL2Jg50ph1sCF8g8WXZhOZswgtpvYEEj3EEJiyP6o03Jnyqeu
 qrpGyPqP55ZWoyvmaq3ENZspIn8PD/7jnqyIlmEzcQtE7nANpJ4Bi1hpj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354931"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354931"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917246"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917246"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:50 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915/guc: define media GT GuC send regs
Date: Fri, 21 Oct 2022 17:10:07 -0700
Message-Id: <20221022001008.2340224-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The media GT shares the G-unit with the root GT, so a second set of
communication registers is required for the media GuC.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 14 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 27b09ba1d295..b3600be61a9a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -156,7 +156,8 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 
 void intel_guc_init_early(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
 
 	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
 	intel_guc_ct_init_early(&guc->ct);
@@ -168,12 +169,17 @@ void intel_guc_init_early(struct intel_guc *guc)
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
 	if (GRAPHICS_VER(i915) >= 11) {
-		guc->notify_reg = GEN11_GUC_HOST_INTERRUPT;
 		guc->interrupts.reset = gen11_reset_guc_interrupts;
 		guc->interrupts.enable = gen11_enable_guc_interrupts;
 		guc->interrupts.disable = gen11_disable_guc_interrupts;
-		guc->send_regs.base =
-			i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
+		if (gt->type == GT_MEDIA) {
+			guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT;
+			guc->send_regs.base = i915_mmio_reg_offset(MEDIA_SOFT_SCRATCH(0));
+		} else {
+			guc->notify_reg = GEN11_GUC_HOST_INTERRUPT;
+			guc->send_regs.base = i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
+		}
+
 		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
 
 	} else {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index a7092f711e9c..9915de32e894 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -36,6 +36,7 @@
 #define SOFT_SCRATCH_COUNT		16
 
 #define GEN11_SOFT_SCRATCH(n)		_MMIO(0x190240 + (n) * 4)
+#define MEDIA_SOFT_SCRATCH(n)		_MMIO(0x190310 + (n) * 4)
 #define GEN11_SOFT_SCRATCH_COUNT	4
 
 #define UOS_RSA_SCRATCH(i)		_MMIO(0xc200 + (i) * 4)
@@ -101,6 +102,7 @@
 #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
 #define   GUC_SEND_TRIGGER		  (1<<0)
 #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
+#define MEDIA_GUC_HOST_INTERRUPT	_MMIO(0x190304)
 
 #define GEN12_GUC_SEM_INTR_ENABLES	_MMIO(0xc71c)
 #define   GUC_SEM_INTR_ROUTE_TO_GUC	BIT(31)
-- 
2.37.3

