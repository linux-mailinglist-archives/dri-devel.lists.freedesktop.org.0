Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCA78FB6C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8759F10E769;
	Fri,  1 Sep 2023 09:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C1710E75B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693561810; x=1725097810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fLJY8OX8rhzSBqAUzRs1NllRAyvfohxpFgGIBy6CC4M=;
 b=RgviuTmgfuVwyzDQ6659LhZ/Ey498TOXNoUBEwZ0/sMvB5quQxSrE6+Q
 ZbRBi/EN16XcdbLGm2JQrcYUd0hkuizHmLARr545aO+R2isyfHfXfuEvq
 wiYatVs05LwappoxbvWrTrLEiJIIP3Pry3PYeTuhBFlfRqKIivCJk6x9x
 FMNHzk5HYu7hspBc2hYRMZEb8+yVZwySYvfe07BNgJVi1lY0jUS9OOAnl
 TxJRLoLzq0N1oFDSRml/X48cCj/mC8sgAqRt7VrXraKpjh5S26w7Ox8Gu
 R255cz+sBbHNds9YQZASxsmNSzYahjCbANBthspEUTtI5F9olVbJEOBuX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361206894"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361206894"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070679936"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070679936"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:09 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/11] accel/ivpu: Make ivpu_pm_init() void
Date: Fri,  1 Sep 2023 11:49:49 +0200
Message-Id: <20230901094957.168898-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ivpu_pm_init() does not return any error, make it void.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 +---
 drivers/accel/ivpu/ivpu_fw.c  | 2 +-
 drivers/accel/ivpu/ivpu_pm.c  | 4 +---
 drivers/accel/ivpu/ivpu_pm.h  | 2 +-
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 4b344ab614f6..b10b2909f05f 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -551,9 +551,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_fw_fini;
 
-	ret = ivpu_pm_init(vdev);
-	if (ret)
-		goto err_ipc_fini;
+	ivpu_pm_init(vdev);
 
 	ret = ivpu_job_done_thread_init(vdev);
 	if (ret)
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 9827ea4d7b83..9b6ecd3e9537 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -78,7 +78,7 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
 		}
 	}
 
-	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
+	ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 954c9ecd3e14..28a0d1111e12 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -282,7 +282,7 @@ void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
-int ivpu_pm_init(struct ivpu_device *vdev)
+void ivpu_pm_init(struct ivpu_device *vdev)
 {
 	struct device *dev = vdev->drm.dev;
 	struct ivpu_pm_info *pm = vdev->pm;
@@ -303,8 +303,6 @@ int ivpu_pm_init(struct ivpu_device *vdev)
 	pm_runtime_set_autosuspend_delay(dev, delay);
 
 	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", delay);
-
-	return 0;
 }
 
 void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index fd4eada1290f..f41c30a14a40 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -19,7 +19,7 @@ struct ivpu_pm_info {
 	u32 suspend_reschedule_counter;
 };
 
-int ivpu_pm_init(struct ivpu_device *vdev);
+void ivpu_pm_init(struct ivpu_device *vdev);
 void ivpu_pm_enable(struct ivpu_device *vdev);
 void ivpu_pm_disable(struct ivpu_device *vdev);
 void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);
-- 
2.25.1

