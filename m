Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3777D6728
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4206210E628;
	Wed, 25 Oct 2023 09:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F7D10E61C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227048; x=1729763048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R/GsiwnC0SkQZXIP/nc3CraWknqOv27AdNqNjSWx888=;
 b=QLY5xTVZVO91fcnXR0PIXpn5BvkH7Tcut9H00BRu9OeGyXC+F+rX/OOJ
 vQT3jW3TSUtM4oK6w9XRGrsdbVqlJ+IWuOwQFhkAfoFFmNT8vo63BCSl1
 iYV3bA53D+6X0osNSS0zNkaxZXGZ8xbRi8UTnfsHDPGNfbkBfAltaY3ds
 aWhlmqs3J1yho9k+o6Dtl1S7n87Z8shbMdMe/b+kaq3U1AieUQ6vwzFKZ
 4P+T1HNCnhE6zqG+HYTosVmpZAY0rr2kWwQ2nqeNevfcETylDmi/I0PEJ
 kE+rUlA3ZYbQqvIxKo++piebh9723aQzG8WGZq+OhXYN5gfryyxyUEe7U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451498855"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="451498855"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882401208"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882401208"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:44:05 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] accel/ivpu/40xx: Capture D0i3 entry host and device
 timestamps
Date: Wed, 25 Oct 2023 11:43:21 +0200
Message-Id: <20231025094323.989987-10-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

The driver needs to capture the D0i3 entry timestamp to
calculate D0i3 residency time.

The D0i3 residency time and the VPU timestamp are passed
to the firmware at D0i3 exit (warm boot).

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 5876cfd9dd40..d8df2addd18a 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -909,10 +909,18 @@ static bool ivpu_hw_40xx_is_idle(struct ivpu_device *vdev)
 	       REG_TEST_FLD(VPU_40XX_BUTTRESS_VPU_STATUS, IDLE, val);
 }
 
+static void ivpu_hw_40xx_save_d0i3_entry_timestamp(struct ivpu_device *vdev)
+{
+	vdev->hw->d0i3_entry_host_ts = ktime_get_boottime();
+	vdev->hw->d0i3_entry_vpu_ts = REGV_RD64(VPU_40XX_CPU_SS_TIM_PERF_EXT_FREE_CNT);
+}
+
 static int ivpu_hw_40xx_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
+	ivpu_hw_40xx_save_d0i3_entry_timestamp(vdev);
+
 	if (!ivpu_hw_40xx_is_idle(vdev) && ivpu_hw_40xx_ip_reset(vdev))
 		ivpu_warn(vdev, "Failed to reset the VPU\n");
 
-- 
2.25.1

