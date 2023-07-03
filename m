Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E77456F6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 10:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10C610E1C1;
	Mon,  3 Jul 2023 08:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EAA10E1C1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688371650; x=1719907650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Wn11iksTeRFiv2ZB0KO7fN06x7MkSXZYW2CBXvR6qw=;
 b=gaPEiTLoCqNo9NYLbsvoB99X4uSbfUA5W5gJS/eTSkJjv6zLqd3619H8
 4Uv+8zFtZKneHKrSUxq3uKorSS6hl1+9LNyBCKeXzWIvquVoGMjMTcqs0
 GltUFHIMZuV8d7FGumtXoySUoy1EGoUnpX0Z40MbpTTweyZk3xpPj9eN7
 TRGOrIq/C6i/SY+ESLVazv/vdpaSlQrtz8U6+ektcyUihe6J/bYHx/N+s
 WhP5EdH2KXwdvKuHD0SjU8pMpc/u7bLKHU5zkrRnQlmrwnl96Iqo+HvvO
 uWDgq5TlS6KOAFB9pMYAC26Mgx5Lpw+9BziH7uMcSDn4RyQp6dw9kGuGg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="365392515"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="365392515"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 01:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="831726786"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="831726786"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 01:07:27 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] accel/ivpu: Fix VPU register access in irq disable
Date: Mon,  3 Jul 2023 10:07:24 +0200
Message-Id: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Incorrect REGB_WR32() macro was used to access VPUIP register.
Use correct REGV_WR32().

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Cc: stable@vger.kernel.org # 6.3.x
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 3ff60fbbc8d9..d3ba633daaa0 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -874,7 +874,7 @@ static void ivpu_hw_mtl_irq_disable(struct ivpu_device *vdev)
 	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x1);
 	REGB_WR32(MTL_BUTTRESS_LOCAL_INT_MASK, BUTTRESS_IRQ_DISABLE_MASK);
 	REGV_WR64(MTL_VPU_HOST_SS_ICB_ENABLE_0, 0x0ull);
-	REGB_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0);
+	REGV_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0);
 }
 
 static void ivpu_hw_mtl_irq_wdt_nce_handler(struct ivpu_device *vdev)
-- 
2.25.1

