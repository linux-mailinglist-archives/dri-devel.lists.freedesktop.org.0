Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A22182DA68
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE17910E2D0;
	Mon, 15 Jan 2024 13:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42E010E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326279; x=1736862279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zJJ9+IKVWA0m6UECjcmpfb1okyUgdEKI7bNRn+De+uw=;
 b=Ie8maLYG2LzBVJbR2qi0IxJgW0qMBONOy0mO+ewLdfJiKogGrFHgE59T
 V3qUq2jGvQGX41JT9l5cTnbyYNVcLxlTHeTvFHCCbM7B9nKD6RgimTL/6
 +TOyKTJy45pnZjOabhnrsFglqV2SGaOonrKii3ahxIOq7aUZSSiTaLV/1
 0Fr59+2CNfoewNf2BPRMezH5hvi2ykm7srZmddWtElXeMx3MLYxbi54Cc
 PN6zz+rovWnCfXzO5PCWIS+xqVg5sNRWdPWjRiDKpoQBcHg87i9drW/an
 ff+DyFtzHfbHb9iaVWt6L9W/Iy6BBj8euT6Y8Pn+O3n4vb6G+UCktA4eZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403378730"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="403378730"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25472205"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:38 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] accel/ivpu: Dump MMU events in case of VPU boot timeout
Date: Mon, 15 Jan 2024 14:44:26 +0100
Message-ID: <20240115134434.493839-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

