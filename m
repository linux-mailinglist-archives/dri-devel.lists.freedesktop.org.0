Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66807082DA
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E10D10E525;
	Thu, 18 May 2023 13:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB9810E525
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684416955; x=1715952955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aB+NaCycmq+wZhuxT4eP5M8/+8DV1KG6ci0GFlVId0I=;
 b=L+cdbz0JyCYFnUdZCuwd7W+cmFS/L0/9dBxmZ9fcwOfOt0yaXAZRwgsr
 5GnohV0Ds3FS+DPveCNrus1cJu5e0W90KseNsTe/tmyJyOiQvKjG514K2
 BRoZeOYkqe4DfsASAmnD2deFDZwSp28EpAb3OdalzcuzpffwB4JNmmRbL
 TxtdxUgmgL+FGR7smVH7T2lamR0ebmo5PGYQrEpfNbwR7VRGkTWNCWC9o
 0KTds400E9zAFfCtqkVmZd9ZI91H+N39pFijumvTmd3Mq88JWsNod5yoU
 GFQjK6NZbO2zx9+fTFTuDoxggKYKDUO9D5isqrFKjITBHU8cbqlbIAiJl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355264300"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="355264300"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="767204001"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="767204001"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:37 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] accel/ivpu: Remove configuration of MMU TBU1 and TBU3
Date: Thu, 18 May 2023 15:16:01 +0200
Message-Id: <20230518131605.650622-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
References: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

MTL HW only uses StreamId0 and StreamId3 that map to TBU0 and TBU2.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 382ec127be8e..3210f1b4a7dd 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -537,21 +537,10 @@ static void ivpu_boot_tbu_mmu_enable(struct ivpu_device *vdev)
 {
 	u32 val = REGV_RD32(MTL_VPU_HOST_IF_TBU_MMUSSIDV);
 
-	if (ivpu_is_fpga(vdev)) {
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_AWMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_ARMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_AWMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_ARMMUSSIDV, val);
-	} else {
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_AWMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_ARMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU1_AWMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU1_ARMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_AWMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_ARMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU3_AWMMUSSIDV, val);
-		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU3_ARMMUSSIDV, val);
-	}
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_AWMMUSSIDV, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_ARMMUSSIDV, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_AWMMUSSIDV, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_ARMMUSSIDV, val);
 
 	REGV_WR32(MTL_VPU_HOST_IF_TBU_MMUSSIDV, val);
 }
-- 
2.25.1

