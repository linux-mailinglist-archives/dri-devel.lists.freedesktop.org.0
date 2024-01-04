Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71655824117
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62C510E422;
	Thu,  4 Jan 2024 11:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8BF10E422
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369445; x=1735905445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wyBFu+dmAW22JJ8uQbdxRjeXIfkm4FSB8jQTEptxWBI=;
 b=AjecOjguvma1JOoBAOn97woaag3ixpiaxYloYT5IXvqteJidVNEPUDWT
 gnW96cj600kVlm3QJAuZYrnFJlNJWtXEfmaHTc14rqfY1vS1pftLr1rD8
 mlg5KFYs/lkXi6ZeNo6mIp0aJ0qT+rR/DIiGB9Ktr+mEY2hHAUivb3DIh
 LzKn8ugdDpIDbnyZfsgahYzcO9RexXrrGjVY50gxxDGLuzWFAPpyfw4vy
 ci/1eeic80SpCuFC+HamtWor+oPHzFKyuKsRwelb9ifJOZVISl98nN9hj
 Mr/FR16U9l22agZhStmqjQ1g01/H3UPlPTs/ToRqjySqx5POjWHqk4DhE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584123"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584123"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275705"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275705"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:22 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/16] accel/ivpu: Dump MMU events in case of VPU boot timeout
Date: Thu,  4 Jan 2024 12:56:58 +0100
Message-ID: <20240104115713.8657-2-jacek.lawrynowicz@linux.intel.com>
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

