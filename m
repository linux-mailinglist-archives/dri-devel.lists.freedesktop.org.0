Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5F98402C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660D310E65C;
	Tue, 24 Sep 2024 08:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No7hziAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FD10E65E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165907; x=1758701907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HJ65xuaoHcuJx8IPiJW4NERO8QvyB54m5K9MgWjI+8c=;
 b=No7hziAjahKsySIxW8SO7Pd0pjo0o7yA+6ydhUdSTexT2Y9q0HXOBD6g
 ccYHXvxImjMNVuqdh3KXxt9YO+nDIEv6kNr/F0VmCbCjOIUQTjaOmRE/X
 u3TlJlx6cIISLuXDAtJv1Fp5mMLmcm/ZoQ5phNdqwDMGF7bq+lYXiO2wj
 HQUEqcK5AbzUYyir0kJXwrX/Rd80+xoGRuYmiIZQGkRymtx0wyBBqeuzP
 pCZ1ZYQk96GC1up4hDjPMc6jxG2iccYn5mCh255oo5PILHCwyPYbl3zod
 VBePIYNNzoii0QjsbxGVhF0VY7eys70iWfVkEgdDcIHgTwIvQhVFir4Bc w==;
X-CSE-ConnectionGUID: 3L2BGWC5TT+V0iGtmntIBg==
X-CSE-MsgGUID: WIsj74tvSB2AbqhQEdvp+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506916"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:27 -0700
X-CSE-ConnectionGUID: rN//2R5QSyS+cpBob+uiVg==
X-CSE-MsgGUID: cPZmy65iTGiICtImGPDGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170648"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:17 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 07/29] accel/ivpu: Set 500 ns delay between power island
 TRICKLE and ENABLE
Date: Tue, 24 Sep 2024 10:17:32 +0200
Message-ID: <20240924081754.209728-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Follow HAS recommendation of 500 ns delay when setting
AON_PWR_ISLAND_TRICKLE_EN and AON_PWR_ISLAND_EN registers

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
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

