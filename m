Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970F903B5D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005D710E5E6;
	Tue, 11 Jun 2024 12:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhFyEXQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B652B10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107479; x=1749643479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OVRLpMVnPBsWbGBMb+ik2SLewKNmLK4wGkpAW0t4/rc=;
 b=HhFyEXQgH+bkIqKNviOMNtbWS9tg1DURQqZfOPEe6uE2zoajU4rV+ZpB
 6j/6OT8YRBdEo/n9u35ZZaV42OA0eYjaXEt14o2xvHbWWrg09Gs1v59iU
 z2aVUyz2HVe22fnXAHz6pYqrbryUH+swuvmzQzN5MuXQDFbOGI6y5D9Cu
 hIG8Sh6hjAI07kc3LHcWPHjzQKBO9Z3CA/JR1N7CXr6tTKGjFoLAuDJhc
 buZZ0khvrkjylNIOp3KgPe03Ej1itUiH+T1gj8aZxEzoBWysmA2rg7co4
 84te96lIZH4luKHzjsrR8jTqBHxjnzXCxnsAzooykJcypXBJEJTeMzqWd w==;
X-CSE-ConnectionGUID: e5uLGCBPRH2EFs062j4FDw==
X-CSE-MsgGUID: whYa2uI0RhaYvZ+ws4K5IA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296024"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:39 -0700
X-CSE-ConnectionGUID: f6gYcF5YQ0KeQby93w2How==
X-CSE-MsgGUID: NWqivOghQ5ancge+EPYgJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39876939"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:37 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 01/15] accel/ivpu: Add wp0_during_power_up WA
Date: Tue, 11 Jun 2024 14:04:18 +0200
Message-ID: <20240611120433.1012423-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

Send workpoint 0 request during power up on 37xx.
This is needed in rare case where WP0 was not sent
during power down due to device hang.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h |  1 +
 drivers/accel/ivpu/ivpu_hw.c  | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 39df96a7623b..823e10c41816 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -102,6 +102,7 @@ struct ivpu_wa_table {
 	bool interrupt_clear_with_0;
 	bool disable_clock_relinquish;
 	bool disable_d0i3_msg;
+	bool wp0_during_power_up;
 };
 
 struct ivpu_hw_info;
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 9f5e3875baf1..daf1e4afb479 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -64,10 +64,14 @@ static void wa_init(struct ivpu_device *vdev)
 	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_LNL)
 		vdev->wa.disable_clock_relinquish = true;
 
+	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
+		vdev->wa.wp0_during_power_up = true;
+
 	IVPU_PRINT_WA(punit_disabled);
 	IVPU_PRINT_WA(clear_runtime_mem);
 	IVPU_PRINT_WA(interrupt_clear_with_0);
 	IVPU_PRINT_WA(disable_clock_relinquish);
+	IVPU_PRINT_WA(wp0_during_power_up);
 }
 
 static void timeouts_init(struct ivpu_device *vdev)
@@ -125,6 +129,13 @@ int ivpu_hw_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
+	if (IVPU_WA(wp0_during_power_up)) {
+		/* WP requests may fail when powering down, so issue WP 0 here */
+		ret = wp_disable(vdev);
+		if (ret)
+			ivpu_warn(vdev, "Failed to disable workpoint: %d\n", ret);
+	}
+
 	ret = ivpu_hw_btrs_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
-- 
2.45.1

