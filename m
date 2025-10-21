Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2ABF7087
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FAC10E5FD;
	Tue, 21 Oct 2025 14:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpL8Y7yc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430410E5FD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761056528; x=1792592528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+3d40Sf496w4bXWgYbv8ziwt+7/HIJjNf3mj1M73Bk=;
 b=LpL8Y7ycRWbWdQW58zd7qvMC3k54iBtWdEhjrc0/x3q9nb9LVToyuawV
 W+h8AQREZTgYRpoaWFV0wwLfP0txMv0Q2c4vrGT3R26R4UPbgVWHALObm
 1v6bF8CPAoZCuxS88DtpaKoc3vLfl0qWuBcFw7OCffuwPsMaJ4WS9QXbR
 5vyFcSmdoJoi+3K3lf2NoeYAjWbn+/C9O8rzrBaV097UR48ci64abUpeh
 dcAHJCW/QfV8akObOaoiuEbPKY6LO1Qhz2ZI8cfKbJeM2+M5oINbFW51d
 Dg0K9gQwdFo9tc49IYukkAlxMHHgjMupQzf2857Zr3UPwm6npDQ5tFogT w==;
X-CSE-ConnectionGUID: 7GPjTZmnQ4+BmdVcpcMkSA==
X-CSE-MsgGUID: pMqos6lySnSQYpcASMjrwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67018825"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67018825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:22:08 -0700
X-CSE-ConnectionGUID: id91XL5lQ+C+9nCFeLd96g==
X-CSE-MsgGUID: QcjJUzXlToW81YwvWn46Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182763861"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:22:06 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Remove VPU_CPU_NOC_* register access from NPU6
 onward
Date: Tue, 21 Oct 2025 16:20:05 +0200
Message-ID: <20251021142005.2216776-1-maciej.falkowski@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Quiescing TOP_MMIO in SOC_CPU_NOC as part of boot procedure is no longer
needed starting from 60XX. Remove soc_cpu_drive() call from NPU6 onward.

The VPU_CPU_NOC_QREQN, VPU_CPU_NOC_QACCEPTN, and VPU_CPU_NOC_QDENY
registers are deprecated and non-functional on 60XX. They will be
removed in future generations.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_ip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index 9d32273e94ed..06aa1e7dc50b 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -896,6 +896,9 @@ static int soc_cpu_drive_40xx(struct ivpu_device *vdev, bool enable)
 
 static int soc_cpu_enable(struct ivpu_device *vdev)
 {
+	if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_60XX)
+		return 0;
+
 	return soc_cpu_drive_40xx(vdev, true);
 }
 
-- 
2.43.0

