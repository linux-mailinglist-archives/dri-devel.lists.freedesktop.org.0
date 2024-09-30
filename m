Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95898AD6A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5779510E580;
	Mon, 30 Sep 2024 19:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCSsJyND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05E10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726020; x=1759262020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEsi6S4+kFaLMrYNP+1BdcOj29v1msXvL8Q83zm/z7M=;
 b=MCSsJyND6nI7yCo/GBQkPH4xSnknUgkvq9G57rUNP9wHwrjHFZSimTt+
 rQwhJIKHBuWMpuEc7jHk6k0mhmS20AySkZWfpXIDmErZnjbxFnMPpy1jM
 6SlFCwrLrAaEI55KLngVvudEMacGyPFacU1lN/rfKFW+94XBpk0ewIuul
 DdHvFYXZsru5Va1J9mCu0zldc/ZH+EwPamDo2w2WyqOz4nDzPUCjO7eE3
 xKZb/czXnRnrFVncWYc0WXCDXmG/hk56dabUUkBelBfIOXg+Qf8vHxNlJ
 IYcLgvGbAP4nwQ4KSnbLAXslW2pJXwqbzEGlYwiJI4wpEYs0DeBmywt3e w==;
X-CSE-ConnectionGUID: 1nJeX0mlTc6iQTbz880/Kg==
X-CSE-MsgGUID: u7JHQZI7QHOmcL+3EhhV3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962312"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:40 -0700
X-CSE-ConnectionGUID: P7k4ZSZeT9uY8qGRKrgsjg==
X-CSE-MsgGUID: vCyI8alySKKlS9CvDRywWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370016"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:38 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 09/31] accel/ivpu: Set 500 ns delay between power island
 TRICKLE and ENABLE
Date: Mon, 30 Sep 2024 21:53:00 +0200
Message-ID: <20240930195322.461209-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Follow HW documentation recommendation of 500 ns delay between setting
AON_PWR_ISLAND_TRICKLE_EN and AON_PWR_ISLAND_EN registers during power
island enabling. Previously this was only done correctly for VPU 4+.
VPU 3.7 had the delay added after power island disable where it is not
needed.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_ip.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index dfd2f4a5b5268..cfcbb99168e65 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -311,9 +311,6 @@ static void pwr_island_trickle_drive_40xx(struct ivpu_device *vdev, bool enable)
 		val = REG_CLR_FLD(VPU_40XX_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0, CSS_CPU, val);
 
 	REGV_WR32(VPU_40XX_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0, val);
-
-	if (enable)
-		ndelay(500);
 }
 
 static void pwr_island_drive_37xx(struct ivpu_device *vdev, bool enable)
@@ -326,9 +323,6 @@ static void pwr_island_drive_37xx(struct ivpu_device *vdev, bool enable)
 		val = REG_CLR_FLD(VPU_40XX_HOST_SS_AON_PWR_ISLAND_EN0, CSS_CPU, val);
 
 	REGV_WR32(VPU_40XX_HOST_SS_AON_PWR_ISLAND_EN0, val);
-
-	if (!enable)
-		ndelay(500);
 }
 
 static void pwr_island_drive_40xx(struct ivpu_device *vdev, bool enable)
@@ -347,9 +341,11 @@ static void pwr_island_enable(struct ivpu_device *vdev)
 {
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX) {
 		pwr_island_trickle_drive_37xx(vdev, true);
+		ndelay(500);
 		pwr_island_drive_37xx(vdev, true);
 	} else {
 		pwr_island_trickle_drive_40xx(vdev, true);
+		ndelay(500);
 		pwr_island_drive_40xx(vdev, true);
 	}
 }
-- 
2.45.1

