Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6386C68F1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AC910E7B9;
	Thu, 23 Mar 2023 12:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F74D10E79A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576130; x=1711112130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+kOY8IMJSFbw+hZpDr2qPr+8YqViN5BvBkxmJEaguM=;
 b=huB6StzXTtnDUCPZCqdE6LBopaUkSoXYaFulNuZPnx8KH0qepRoKH5Tp
 76yIgiszGVhMfYqD1h1Ubck65dLojFhR33RYKwjVEK4THbvR4cxnIkwS4
 RjCrFZKtAVh0/ihL9BRWNz6G1EgSzVUjs6kCCz5txAfpNr1goVXM0DCrr
 M/7ULBpie5WXhAvPMsTD/lBS0kGvRcpcEj1KpAXC0t29VPaojz+4yFfsA
 9E8BXMlrShhucXli4MmkVP4+C1IBMSMNo3rnWL10XDU/vqBPaQx1UVcpL
 6N5Km39Om9pjNPvJV+YEq92HhBQ7f4TQHkbw7yfYYGroDQsDqHyxiILFR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336982551"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="336982551"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="793010841"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="793010841"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:29 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] accel/ivpu: Disable buttress on device removal
Date: Thu, 23 Mar 2023 13:55:01 +0100
Message-Id: <20230323125504.2586442-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pci_set_power_state() to disable buttress when device is removed.
This is workaround of hardware bug that hangs the system.

Additionally not disabling buttress prevents CPU enter deeper Pkg-C
states when the driver is unloaded or fail to probe.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_drv.c    | 4 ++++
 drivers/accel/ivpu/ivpu_drv.h    | 1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 70245cf84593..6a320a73e3cc 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -569,6 +569,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	ivpu_mmu_global_context_fini(vdev);
 err_power_down:
 	ivpu_hw_power_down(vdev);
+	if (IVPU_WA(d3hot_after_power_off))
+		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 err_xa_destroy:
 	xa_destroy(&vdev->submitted_jobs_xa);
 	xa_destroy(&vdev->context_xa);
@@ -579,6 +581,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 {
 	ivpu_pm_disable(vdev);
 	ivpu_shutdown(vdev);
+	if (IVPU_WA(d3hot_after_power_off))
+		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 	ivpu_job_done_thread_fini(vdev);
 	ivpu_pm_cancel_recovery(vdev);
 
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index ef12a38e06e1..d3013fbd13b3 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -74,6 +74,7 @@
 struct ivpu_wa_table {
 	bool punit_disabled;
 	bool clear_runtime_mem;
+	bool d3hot_after_power_off;
 };
 
 struct ivpu_hw_info;
diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 70ca6de78060..133ba33d2866 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -101,6 +101,7 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 {
 	vdev->wa.punit_disabled = ivpu_is_fpga(vdev);
 	vdev->wa.clear_runtime_mem = false;
+	vdev->wa.d3hot_after_power_off = true;
 }
 
 static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
-- 
2.25.1

