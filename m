Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000F18F11C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 09:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594E89F5F;
	Mon, 23 Mar 2020 08:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606FF89EBB;
 Mon, 23 Mar 2020 06:14:58 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Mar 2020 11:44:15 +0530
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 23 Mar 2020 11:43:53 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 0662F4719; Mon, 23 Mar 2020 11:43:51 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
Date: Mon, 23 Mar 2020 11:43:47 +0530
Message-Id: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 23 Mar 2020 08:45:09 +0000
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
Cc: mkrishn@codeaurora.org, travitej@codeaurora.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"The PM core always increments the runtime usage counter
before calling the ->suspend() callback and decrements it
after calling the ->resume() callback"

DPU and DSI are managed as runtime devices. When
suspend is triggered, PM core adds a refcount on all the
devices and calls device suspend, since usage count is
already incremented, runtime suspend was not getting called
and it kept the clocks on which resulted in target not
entering into XO shutdown.

Add changes to manage runtime devices during pm sleep.

Changes in v1:
 - Remove unnecessary checks in the function
     _dpu_kms_disable_dpu (Rob Clark).

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.c           |  7 +++++++
 drivers/gpu/drm/msm/msm_drv.c           | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h           |  2 ++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ce19f1d..c3e8287 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -26,6 +26,7 @@
 #include "dpu_encoder.h"
 #include "dpu_plane.h"
 #include "dpu_crtc.h"
+#include "dsi.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
@@ -325,6 +326,24 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
+static void _dpu_kms_disable_dpu(struct msm_kms *kms)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_device *dev = dpu_kms->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_dsi *dsi;
+	int i;
+
+	dpu_kms_disable_commit(kms);
+
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+		if (!priv->dsi[i])
+			continue;
+		dsi = priv->dsi[i];
+		pm_runtime_put_sync(&dsi->pdev->dev);
+	}
+}
+
 static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
@@ -751,6 +770,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
 #endif
+	.disable_dpu = _dpu_kms_disable_dpu,
 };
 
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
@@ -1121,7 +1141,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	return rc;
 }
 
+
+static int __maybe_unused dpu_pm_suspend_late(struct device *dev)
+{
+	pm_runtime_get_noresume(dev);
+	return 0;
+}
+
 static const struct dev_pm_ops dpu_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(dpu_pm_suspend_late, NULL)
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 55ea4bc2..3d3740e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -154,12 +154,19 @@ static int dsi_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused dsi_pm_suspend_late(struct device *dev)
+{
+	pm_runtime_get_noresume(dev);
+	return 0;
+}
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss-dsi-ctrl" },
 	{}
 };
 
 static const struct dev_pm_ops dsi_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(dsi_pm_suspend_late, NULL)
 	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
 };
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7d985f8..7451ae0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1040,6 +1040,7 @@ static int msm_pm_suspend(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_kms *kms = priv->kms;
 
 	if (WARN_ON(priv->pm_state))
 		drm_atomic_state_put(priv->pm_state);
@@ -1051,6 +1052,11 @@ static int msm_pm_suspend(struct device *dev)
 		return ret;
 	}
 
+	if (kms->funcs->disable_dpu)
+		kms->funcs->disable_dpu(kms);
+
+	pm_runtime_put_sync(dev);
+
 	return 0;
 }
 
@@ -1069,6 +1075,13 @@ static int msm_pm_resume(struct device *dev)
 
 	return ret;
 }
+
+static int msm_pm_suspend_late(struct device *dev)
+{
+	pm_runtime_get_noresume(dev);
+	return 0;
+}
+
 #endif
 
 #ifdef CONFIG_PM
@@ -1102,6 +1115,7 @@ static int msm_runtime_resume(struct device *dev)
 #endif
 
 static const struct dev_pm_ops msm_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend_late, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
 	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
 };
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1cbef6b..c73a89b 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -126,6 +126,8 @@ struct msm_kms_funcs {
 	/* debugfs: */
 	int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
 #endif
+	void (*disable_dpu)(struct msm_kms *kms);
+
 };
 
 struct msm_kms;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
