Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3783DA24
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CE710F9F8;
	Fri, 26 Jan 2024 12:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EF310F9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272089; x=1737808089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/RIPk35VguLgg9bTJLdzzTyw4vT0cJPWv9q2k5ivYg=;
 b=T8yk36eNc89GY+t/7nswmO2JbcHOlGVwi2XO5olSnjyYrcBSR9E0vhF/
 mNrMbIOCM4OxFt8uMdiLG1Pwq85QgPS7Pajae68IkS5NozBmIUCuRE90K
 +GlDlD75UJOMUdnAl/g7l17lvPxCa550V1Z3BpIYtzwKJLKdgXWPBYHYM
 WZ/+mDZtL1pHPEobYZp1+HMLaT2vMdngPu/l2tUMaifZl5D1PpMSiPj56
 7PbZ+qbuVSPk+f1/1Y0Kc/N7cCqQO4shWMXI49aWNHgHqFpyHa7NrWSZu
 YIJtX5n8qYeOYJJ0vtBKxxE4KFZ1GVnuav+SZVSAK4I3qucaqW+07DF01 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207417"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207417"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731890"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:08 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] accel/ivpu: Force snooping for MMU writes
Date: Fri, 26 Jan 2024 13:27:58 +0100
Message-ID: <20240126122804.2169129-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Set AW_SNOOP_OVERRIDE bit in VPU_37/40XX_HOST_IF_TCU_PTW_OVERRIDES
to force snooping for MMU write accesses (setting event queue events).

MMU event queue buffer is the only buffer written by MMU and
mapped as write-back which break cache coherency. Force write
transactions to be snooped solving the problem.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 2 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c | 2 +-
 drivers/accel/ivpu/ivpu_mmu.c     | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index f15a93d83057..77accd029c4a 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -525,7 +525,7 @@ static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
 
 	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, NOSNOOP_OVERRIDE_EN, val);
-	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AW_NOSNOOP_OVERRIDE, val);
+	val = REG_CLR_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AW_NOSNOOP_OVERRIDE, val);
 	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AR_NOSNOOP_OVERRIDE, val);
 
 	REGV_WR32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, val);
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 704288084f37..86b89b94f9f3 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -530,7 +530,7 @@ static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 	u32 val = REGV_RD32(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES);
 
 	val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, SNOOP_OVERRIDE_EN, val);
-	val = REG_CLR_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AW_SNOOP_OVERRIDE, val);
+	val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AW_SNOOP_OVERRIDE, val);
 	val = REG_CLR_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AR_SNOOP_OVERRIDE, val);
 
 	REGV_WR32(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, val);
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 9a3122ffce03..8df78adeee33 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -560,7 +560,6 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	mmu->cmdq.cons = 0;
 
 	memset(mmu->evtq.base, 0, IVPU_MMU_EVTQ_SIZE);
-	clflush_cache_range(mmu->evtq.base, IVPU_MMU_EVTQ_SIZE);
 	mmu->evtq.prod = 0;
 	mmu->evtq.cons = 0;
 
@@ -877,8 +876,6 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
 	if (!CIRC_CNT(IVPU_MMU_Q_IDX(evtq->prod), IVPU_MMU_Q_IDX(evtq->cons), IVPU_MMU_Q_COUNT))
 		return NULL;
 
-	clflush_cache_range(evt, IVPU_MMU_EVTQ_CMD_SIZE);
-
 	evtq->cons = (evtq->cons + 1) & IVPU_MMU_Q_WRAP_MASK;
 	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, evtq->cons);
 
-- 
2.43.0

