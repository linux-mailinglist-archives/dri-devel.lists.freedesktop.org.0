Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A26251CB6F
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6210710FA98;
	Thu,  5 May 2022 21:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B902910E24A;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786702; x=1683322702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IFkYyNaXAU4EpuScwGbMbfVvSZD2WpCv8HcNE5UQuUY=;
 b=QmxCH7RryK0PBL/Fe824VANqHw0nv89voWYAMF7Zr9aOCBxY41CyI2aD
 SYJhUqnJi6dMLIjjLglFJYt1BC97G3BGBrTWFPSQqfByNkG7rvNErUxlc
 9DKAraBGPxX+dB5YvCXbJdfjsDhCjgIFDgbaVErImTBOArxN6cKBPlBW6
 1lfyPvHZMHjSoTIHXs1liP0JHb7AeSGLBDiHvSvprHArllW8OVultFUsF
 OBJDO8b8L5dJAgz3PgzdjovLLu6vhfQNCVo5LwHdDn5uHL+ueanK3+TWH
 uZS8dLxQ2kzBf8PVA+3eZz/70J+DndA85E26R3RrbT411/95Me9ilyH/9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="265851849"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="265851849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553287"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/12] drm/i915/pvc: Interrupt support for new copy engines
Date: Thu,  5 May 2022 14:38:09 -0700
Message-Id: <20220505213812.3979301-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the interrupt handler support for new copy engines.

Bspec: 54030
Original-author: CQ Tang
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
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

