Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E84824121
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C9A10E455;
	Thu,  4 Jan 2024 11:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C9A10E44A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369458; x=1735905458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwcRT+nfA+HDfLBlaYlkzw8yB5P1y7QqSqPgqpiQJ/E=;
 b=C7KkmyOyTV/8SXTRvkK5jGSeoxqRrzn1U3Dp2uQgqKeAALtZtgDIgXVF
 dO8UAOxwbKe/50SO8SeakBH4eGSNdWe3uHmBBHdX8PnThjBVuSORE6xTR
 kExmX/uvIPAgskefy5rByau921G3pNboNt9ffz0UbtXg04nzAv34KNaAT
 X0A0/hgWNeGgkilSQ80fCRg2m7TjhNYfJ61pd4asXxj163Zw6sJqfLXFf
 xIOCugU2kjwiyvzsUQrWskoCrAl/2vov5OlpANsFMeC3A8OOxIMQnyjhs
 tavRQpi/9czrxv278QfNBU9vl1QlOAVrm0p3nXrICZkkhkQrvwbYwiqB6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584179"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275759"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275759"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:35 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/16] accel/ivpu/40xx: Stop passing SKU boot parameters to FW
Date: Thu,  4 Jan 2024 12:57:07 +0100
Message-ID: <20240104115713.8657-11-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com, Krystian Pradzynski <krystian.pradzynski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@intel.com>

This parameter was never used by the 40xx FW.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index eba2fdef2ace..bbb93cac0190 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -704,7 +704,6 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 {
 	struct ivpu_hw_info *hw = vdev->hw;
 	u32 tile_disable;
-	u32 tile_enable;
 	u32 fuse;
 
 	fuse = REGB_RD32(VPU_40XX_BUTTRESS_TILE_FUSE);
@@ -725,10 +724,6 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 	else
 		ivpu_dbg(vdev, MISC, "Fuse: All %d tiles enabled\n", TILE_MAX_NUM);
 
-	tile_enable = (~tile_disable) & TILE_MAX_MASK;
-
-	hw->sku = REG_SET_FLD_NUM(SKU, HW_ID, LNL_HW_ID, hw->sku);
-	hw->sku = REG_SET_FLD_NUM(SKU, TILE, tile_enable, hw->sku);
 	hw->tile_fuse = tile_disable;
 	hw->pll.profiling_freq = PLL_PROFILING_FREQ_DEFAULT;
 
-- 
2.43.0

