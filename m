Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6C517458
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C3110F034;
	Mon,  2 May 2022 16:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BF710F02B;
 Mon,  2 May 2022 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509262; x=1683045262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UO4yfbyLBtT8ltB4MShn+Pzd/rvgaeyUbABeWY9B/7o=;
 b=GpQTQ08YibfVGFu54zUdzUPXVduAzus/dacRubMZVmq40ZxpnUiGm2QC
 xUJtuzHLmliQdYqO4vgBXXIp5QnttHXNBkBANjv97QVOJT7p032Y2ug0Z
 eiDHA5QIqDAvw56me4Y768/ESmxwEEkJch9VYtG0JGu7qGYQ/WTZplH5X
 ftnXCsZGblfM0VMaO8s1Mi7YjerdSPSAmK/9kYXuciCfUIwQy/YQaCqie
 6+ibj1/i6hQ/AU8dByyyUGbtohRz1wNodiUV3CIFywOhjryZ6yH4QA9zD
 Z0120aS7nfwTmxGqMKTL9coibiKLQsNJ+CTuizgZ3bLqfFt9ptHvYacdI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266105004"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266105004"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781849"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] drm/i915/pvc: Interrupt support for new copy engines
Date: Mon,  2 May 2022 09:34:14 -0700
Message-Id: <20220502163417.2635462-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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

This patch adds the interrupt handler support for
new copy engines.

Bspec: 54030
Original-author: CQ Tang
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 16 ++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 88b4becfcb17..3a72d4fd0214 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -193,6 +193,14 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK,	~0);
 	intel_uncore_write(uncore, GEN11_BCS_RSVD_INTR_MASK,	~0);
+	if (HAS_ENGINE(gt, BCS1) || HAS_ENGINE(gt, BCS2))
+		intel_uncore_write(uncore, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, BCS3) || HAS_ENGINE(gt, BCS4))
+		intel_uncore_write(uncore, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, BCS5) || HAS_ENGINE(gt, BCS6))
+		intel_uncore_write(uncore, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, BCS7) || HAS_ENGINE(gt, BCS8))
+		intel_uncore_write(uncore, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
 	intel_uncore_write(uncore, GEN11_VCS0_VCS1_INTR_MASK,	~0);
 	intel_uncore_write(uncore, GEN11_VCS2_VCS3_INTR_MASK,	~0);
 	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
@@ -248,6 +256,14 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
 	intel_uncore_write(uncore, GEN11_BCS_RSVD_INTR_MASK, ~smask);
+	if (HAS_ENGINE(gt, BCS1) || HAS_ENGINE(gt, BCS2))
+		intel_uncore_write(uncore, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, BCS3) || HAS_ENGINE(gt, BCS4))
+		intel_uncore_write(uncore, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, BCS5) || HAS_ENGINE(gt, BCS6))
+		intel_uncore_write(uncore, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, BCS7) || HAS_ENGINE(gt, BCS8))
+		intel_uncore_write(uncore, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
 	intel_uncore_write(uncore, GEN11_VCS0_VCS1_INTR_MASK, ~dmask);
 	intel_uncore_write(uncore, GEN11_VCS2_VCS3_INTR_MASK, ~dmask);
 	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index aa2c0974b02c..fe09288a3145 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1529,6 +1529,10 @@
 #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
 #define GEN12_CCS0_CCS1_INTR_MASK		_MMIO(0x190100)
 #define GEN12_CCS2_CCS3_INTR_MASK		_MMIO(0x190104)
+#define XEHPC_BCS1_BCS2_INTR_MASK		_MMIO(0x190110)
+#define XEHPC_BCS3_BCS4_INTR_MASK		_MMIO(0x190114)
+#define XEHPC_BCS5_BCS6_INTR_MASK		_MMIO(0x190118)
+#define XEHPC_BCS7_BCS8_INTR_MASK		_MMIO(0x19011c)
 
 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
 
-- 
2.35.1

