Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5C7D0DCD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C59810E5A7;
	Fri, 20 Oct 2023 10:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B599B10E5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798715; x=1729334715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pydSNzwkmsMbzCxBpm4V7XyXKI566I9qw9drUs4fznc=;
 b=eGcLcdGuBXC6IpbupyQzeOoXttsRQG2PpwPklfc7Sy3fyEcA1npficFK
 0Ou20MmWnCxlVYu8xpC/7Q46gRvbngMwrGsQq2I/nFXBlMrt09D9PqvPS
 Nfpdxex1mrZTfpdw997gK/SxFWYVfizXbXaEFt58dRxKhxBErLy1RhGKT
 W+vDrG6bSHIncamUqhO0n4tmlSIiG03aMmzsSUyVDtjiHX9uqsSrP+ge2
 SnIyFzz1Gymb5fHVbLtpqQ0JPRPeI7rRGo/mx5UJOCzUgMUQdCCFxq5A9
 k7mjEFfFrwhgbbTNaN5gJF3mMmzsYW3bG22j/ld5qwe5+j7MZejZF/i/U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287524"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287524"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572566"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572566"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:13 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] accel/ivpu: Read clock rate only if device is up
Date: Fri, 20 Oct 2023 12:44:58 +0200
Message-Id: <20231020104501.697763-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Do not unnecessarily wake up device to read clock rate.
Return 0 as clk_rate if device is suspended.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 18 +++++++++++++++++-
 drivers/accel/ivpu/ivpu_pm.c  | 13 +++++++++++++
 drivers/accel/ivpu/ivpu_pm.h  |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 7851ff7773ca..b6aa8893ff1c 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -131,6 +131,22 @@ static int ivpu_get_capabilities(struct ivpu_device *vdev, struct drm_ivpu_param
 	return 0;
 }
 
+static int ivpu_get_core_clock_rate(struct ivpu_device *vdev, u64 *clk_rate)
+{
+	int ret;
+
+	ret = ivpu_rpm_get_if_active(vdev);
+	if (ret < 0)
+		return ret;
+
+	*clk_rate = ret ? ivpu_hw_reg_pll_freq_get(vdev) : 0;
+
+	if (ret)
+		ivpu_rpm_put(vdev);
+
+	return 0;
+}
+
 static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
@@ -154,7 +170,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 		args->value = vdev->platform;
 		break;
 	case DRM_IVPU_PARAM_CORE_CLOCK_RATE:
-		args->value = ivpu_hw_reg_pll_freq_get(vdev);
+		ret = ivpu_get_core_clock_rate(vdev, &args->value);
 		break;
 	case DRM_IVPU_PARAM_NUM_CONTEXTS:
 		args->value = ivpu_get_context_count(vdev);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index e359ba36a9c3..d14b6fd796b4 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -246,6 +246,19 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 	return ret;
 }
 
+int ivpu_rpm_get_if_active(struct ivpu_device *vdev)
+{
+	int ret;
+
+	ivpu_dbg(vdev, RPM, "rpm_get_if_active count %d\n",
+		 atomic_read(&vdev->drm.dev->power.usage_count));
+
+	ret = pm_runtime_get_if_active(vdev->drm.dev, false);
+	drm_WARN_ON(&vdev->drm, ret < 0);
+
+	return ret;
+}
+
 void ivpu_rpm_put(struct ivpu_device *vdev)
 {
 	pm_runtime_mark_last_busy(vdev->drm.dev);
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index f41c30a14a40..044db150be07 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -33,6 +33,7 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev);
 void ivpu_pm_reset_done_cb(struct pci_dev *pdev);
 
 int __must_check ivpu_rpm_get(struct ivpu_device *vdev);
+int __must_check ivpu_rpm_get_if_active(struct ivpu_device *vdev);
 void ivpu_rpm_put(struct ivpu_device *vdev);
 
 void ivpu_pm_schedule_recovery(struct ivpu_device *vdev);
-- 
2.25.1

