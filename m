Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14796C4615
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDDA10E8D8;
	Wed, 22 Mar 2023 09:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4318410E8D6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476771; x=1711012771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T1djOVhtXMcdWvsJSM9/KZ/L4cXYrah21PCLICOzIGo=;
 b=nXYePaV6hoLJ8UU1N/Pgl1R/Dit1sw5OlDZEML5G2KNMamEOnmal7bPq
 e8kDEIfB8wDQ89ipNEqv6EfjLKc6PQhOEPt8bZ2Jc12q2HUpUrje+/tGw
 RsWA/8M+MvJDbAFYkWbWUITdvtYQqgTD5Z8dxTsB2pQQiOGxA9UsKrjgz
 lq6AJ2eiRrGUhTXw2zeaPiC/Maep0HtV5dOwwmH7harDLQ4XN+BiPvhsZ
 c4bzscrFQpYfUFxlbo+COo61dtG6DGVGgRtw4TfneaSddkqlWZAXkvOj5
 jodSsrT4a7XqYBch6c/SIS9a4Ze+eu9RQTnFduJjVjB4bdtfueTV9sdG/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904334"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229847"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229847"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:29 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] accel/ivpu: Disable buttress on device removal
Date: Wed, 22 Mar 2023 10:18:58 +0100
Message-Id: <20230322091900.1982453-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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

