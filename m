Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F98252A9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BA410E5BE;
	Fri,  5 Jan 2024 11:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAF910E5BA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453744; x=1735989744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wyBFu+dmAW22JJ8uQbdxRjeXIfkm4FSB8jQTEptxWBI=;
 b=BSZ+jzVcIr0bK4ixBJ7WxFeA5L/Gf1XZRxzADRpilqiCP2J1k2I/m7oE
 fke1SXPpOAfnkDVPjf+MnM3xjhGYPVDy4GY4Woi1J9SPiJQNYCRMpDvxh
 r+w5c0b7jHMxUC5Jjvs8Z/F8wqRledZOjhxPe5RcLj+rr+iRYb9V0MKKT
 0rIkETP7Dis+OjXUJthNDFfQoZIcBqXlBkBEfaPFjOfHAqY/tHZArDUpF
 ah+dLoIjPtfuJ4TPwy5wByj2FI0ToOUIfi3D2QU10SMVOvAXBzrA+z7vL
 Q+rdkh/1vmSHDoW47t1a94WWThpj3FELGDGDpcLIyGnrQIW01efpJ7xt0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255388"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255388"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918705"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918705"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:22 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] accel/ivpu: Dump MMU events in case of VPU boot timeout
Date: Fri,  5 Jan 2024 12:22:09 +0100
Message-ID: <20240105112218.351265-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Add ivpu_mmu_evtq_dump() function that dumps existing MMU events from
MMU event queue. Call this function if VPU boot failed.

Previously MMU events were only checked in interrupt handler, but if VPU
failed to boot due to MMU faults, those faults were missed because of
interrupts not yet being enabled. This will allow checking potential
fault reason of VPU not booting.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 1 +
 drivers/accel/ivpu/ivpu_mmu.c | 8 ++++++++
 drivers/accel/ivpu/ivpu_mmu.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 64927682161b..0c3180411b0e 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -369,6 +369,7 @@ int ivpu_boot(struct ivpu_device *vdev)
 	ret = ivpu_wait_for_ready(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
+		ivpu_mmu_evtq_dump(vdev);
 		return ret;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 2228c44b115f..92ef651098d8 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -905,6 +905,14 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 		ivpu_pm_schedule_recovery(vdev);
 }
 
+void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
+{
+	u32 *event;
+
+	while ((event = ivpu_mmu_get_event(vdev)) != NULL)
+		ivpu_mmu_dump_event(vdev, event);
+}
+
 void ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev)
 {
 	u32 gerror_val, gerrorn_val, active;
diff --git a/drivers/accel/ivpu/ivpu_mmu.h b/drivers/accel/ivpu/ivpu_mmu.h
index cb551126806b..6fa35c240710 100644
--- a/drivers/accel/ivpu/ivpu_mmu.h
+++ b/drivers/accel/ivpu/ivpu_mmu.h
@@ -46,5 +46,6 @@ int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid);
 
 void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev);
 void ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev);
+void ivpu_mmu_evtq_dump(struct ivpu_device *vdev);
 
 #endif /* __IVPU_MMU_H__ */
-- 
2.43.0

