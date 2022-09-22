Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A585E6F75
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7510E4D7;
	Thu, 22 Sep 2022 22:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E826610E476;
 Thu, 22 Sep 2022 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884631; x=1695420631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zoWJzO5D2gYU0QnS9giATlxGX6+CUJXisLpX26rsNk=;
 b=gQaMHEtfTQApg9tg7iFZj2KqoR7AVU3tvPUssBleQA9OWJFJaQYju8rV
 hQl1nOFrcXW0JAMhwLOgq81cB9w+jOUDLOtNZUIa/hu65OMOMaYsHgA+a
 mr6++TSuqd9zBX3F4R4BYT/obl+5qTwgZYvgSai9F3FKZ0LZYats5WuSN
 NNbQaFJQHlyJeJKpe8mnprmdPxzECA8c0gRM8xourIT3xicQ1Nk3e8NKA
 blgn/CDiBqTc5HkLgjtyAsrm6FEm3rsYR4WhSjpTMwQVo8qPsQsTxtDnV
 7Lp5xNNXsnnlP2xIgqy7dzsdhR9+O4x2y88Dh8aFVsA87l4Ar/vASpstZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815516"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815516"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416259"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:31 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915/guc: define media GT GuC send regs
Date: Thu, 22 Sep 2022 15:11:16 -0700
Message-Id: <20220922221117.458087-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
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
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 14 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index bac06e3d6f2c..b0beab44b34c 100644
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

