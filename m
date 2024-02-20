Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C087185B9F0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F7410E2FA;
	Tue, 20 Feb 2024 11:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hx3xf6iP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E9310E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708427316; x=1739963316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HIw9ATkvhWGFG9DqtWWojbNX03QxV3oGQ+1ulPbTphY=;
 b=hx3xf6iP9eZrJC2eTbmrJZjv6NJv85+7g2ChhcdRfx7afGQLXaoau+4U
 Dz1d6IpQr4l1K+fTEtTpgRD9IUMLR1PAZ+jflr2wysXES4xT7QwF39sOj
 EIUUbGMp960XtF4p6kPxynpQKVf0rm3eTpTOQmDSTsDQYJy7//UaIIK+r
 q1q8pdbof0P3vDuZGxqRlspXPJiIRysQnslS1CFZdHkrCoF7Qb7kNUmuW
 O7/fG0/UMGngfFhRvMGZ6kAPj3ONAurhF4FJQGJrUCihKjnLlztknWsVc
 2SffsMc26AwpbZHD6wnBm/4PoBKEwEuvp+jnzfy/XEB056pDtMUhPU7xk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13640642"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13640642"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5112498"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:08:32 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, stable@vger.kernel.org,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Don't enable any tiles by default on VPU40xx
Date: Tue, 20 Feb 2024 12:08:30 +0100
Message-ID: <20240220110830.1439719-1-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

There is no point in requesting 1 tile on VPU40xx as the FW will
probably need more tiles to run workloads, so it will have to
reconfigure PLL anyway. Don't enable any tiles and allow the FW to
perform initial tile configuration.

This improves NPU boot stability as the tiles are always enabled only
by the FW from the same initial state.

Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 1c995307c113..a1523d0b1ef3 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -24,7 +24,7 @@
 #define SKU_HW_ID_SHIFT              16u
 #define SKU_HW_ID_MASK               0xffff0000u
 
-#define PLL_CONFIG_DEFAULT           0x1
+#define PLL_CONFIG_DEFAULT           0x0
 #define PLL_CDYN_DEFAULT             0x80
 #define PLL_EPP_DEFAULT              0x80
 #define PLL_REF_CLK_FREQ	     (50 * 1000000)
-- 
2.43.0

