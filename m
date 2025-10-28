Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089AC133E8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D12110E596;
	Tue, 28 Oct 2025 07:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDxweav7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F367310E597
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761635249; x=1793171249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NZ7KHzvGDpxiHv5xnZ6VyjU9GBm2KKz4frhIIZ6DjgA=;
 b=KDxweav7RS9kygku9q2J+uO0f7sNsk1vK1kCqYmycypA5nPBHM9QBKu0
 +nDv+r0RATfO05T+L6qlUgu3QF7Hq0pLeC/+i+OD/if20TfryRHxiy33n
 6XAs5RDHTrimyEv/UuEugPe/NN4dRxHN4YFuUcfvSN1nNSWX2hVU3G5Ud
 hUVw76AeHmlCl58GKS/lBjDSsT1EmB5QwOUEsERbDD1U6SE2pHP5ckWue
 SJYEqQRr3zp2SY3gZbXNmcpnd0Dex7d46FmsC6Hk2pMmVswQCGM6Q0Zlj
 Wb0Rw2mgpT4aP8deLeLQY1dbwVrpptiLH0dltoFoBko1wN6c4qnaThkM5 Q==;
X-CSE-ConnectionGUID: hFFvFzWyTgqyBQzyLRWv0g==
X-CSE-MsgGUID: rSO7cLd1T+e/gXkliDOjMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81149343"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="81149343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:07:29 -0700
X-CSE-ConnectionGUID: VctnBQiwQOKU+bEdTGznkw==
X-CSE-MsgGUID: 4QOcQEjlT7+D60+6v/XKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="186020612"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:07:27 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Disallow setting sched mode HW starting from NPU6
Date: Tue, 28 Oct 2025 08:07:21 +0100
Message-ID: <20251028070722.135236-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OS scheduling mode gets deprecated starting from NPU6 onward.
Print warning and fallback to HW scheduling mode if OS mode is
explicitly selected with sched_mode parameter.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 +-
 drivers/accel/ivpu/ivpu_fw.c  | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ca68730dee88..b305effcf003 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -57,7 +57,7 @@ MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
 
 int ivpu_sched_mode = IVPU_SCHED_MODE_AUTO;
 module_param_named(sched_mode, ivpu_sched_mode, int, 0444);
-MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default scheduler, 0 - Use OS scheduler, 1 - Use HW scheduler");
+MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default scheduler, 0 - Use OS scheduler (supported on 27XX - 50XX), 1 - Use HW scheduler");
 
 bool ivpu_disable_mmu_cont_pages;
 module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0444);
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index aa032b39dbe3..48386d2cddbb 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -144,6 +144,12 @@ bool ivpu_is_within_range(u64 addr, size_t size, struct ivpu_addr_range *range)
 static u32
 ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr)
 {
+	if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_60XX &&
+	    ivpu_sched_mode == VPU_SCHEDULING_MODE_OS) {
+		ivpu_warn(vdev, "OS sched mode is not supported, using HW mode\n");
+		return VPU_SCHEDULING_MODE_HW;
+	}
+
 	if (ivpu_sched_mode != IVPU_SCHED_MODE_AUTO)
 		return ivpu_sched_mode;
 
-- 
2.43.0

