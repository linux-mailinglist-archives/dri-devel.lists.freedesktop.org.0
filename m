Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D317AD7BD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0644210E16F;
	Mon, 25 Sep 2023 12:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C84E10E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695643916; x=1727179916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yi14vtwrtXbhQ4Sbwbu30sxP9ulRqJjB7yiEFdqcyU=;
 b=EtoMFWU+eL8t4b8u0XxGFiXtwbUdQJ2gu76D//Os3++ESJlzW1eOBgIt
 twF07pbArtR9yyLbHYiF6f6hM1VYIRMHt+yYk/eGnU5VtrspvcXAXQaYq
 vnQCVjKFPtMCsxTUI/6QJ7IodzcH3UhIZJ4H8aft9FrY9qkdBphOHwXAh
 hXoLqA6gkl63GzOBCV8isnUBj3X2U8sPIIdUsy5+dcZmbf15WZNlm/Edc
 L49oRs61VVzW5RiuzPfJqy/LFHpsw6WNg0V8L66V9KEvHeY9wMVG8JhPE
 YrsYUgOSshmXHLLhtIR9NdaQWnNXFK1Qp85N36dT+9LX/wBCEmFfBeQ+J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378503454"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378503454"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921949542"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="921949542"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:53 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] accel/ivpu/40xx: Disable frequency change interrupt
Date: Mon, 25 Sep 2023 14:11:35 +0200
Message-Id: <20230925121137.872158-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
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

Do not enable frequency change interrupt on 40xx as it might
lead to an interrupt storm in current design.

FREQ_CHANGE interrupt is triggered on D0I2 entry which will cause
KMD to check VPU interrupt sources by reading VPUIP registers.
Access to those registers will toggle necessary clocks and trigger
another FREQ_CHANGE interrupt possibly ending in an infinite loop.

FREQ_CHANGE interrupt has only debug purposes and can be permanently
disabled.

Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index f4a251a58ca4..87b1085d44cf 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -57,8 +57,7 @@
 
 #define ICB_0_1_IRQ_MASK ((((u64)ICB_1_IRQ_MASK) << 32) | ICB_0_IRQ_MASK)
 
-#define BUTTRESS_IRQ_MASK ((REG_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE)) | \
-			   (REG_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
+#define BUTTRESS_IRQ_MASK ((REG_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
 			   (REG_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, CFI0_ERR)) | \
 			   (REG_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, CFI1_ERR)) | \
 			   (REG_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, IMR0_ERR)) | \
-- 
2.25.1

