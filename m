Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865434FF76
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833236E1A3;
	Wed, 31 Mar 2021 11:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39DB6E1A3;
 Wed, 31 Mar 2021 11:27:38 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 31 Mar 2021 04:27:38 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 31 Mar 2021 04:27:36 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 31 Mar 2021 16:57:04 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id BE5EA433F; Wed, 31 Mar 2021 04:27:02 -0700 (PDT)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v1] drm/msm/disp/dpu1: fix warn stack reported during dpu resume
Date: Wed, 31 Mar 2021 04:27:00 -0700
Message-Id: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
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
Cc: mkrishn@codeaurora.org, hywu@google.com, dianders@chromium.org,
 steev@kali.org, linux-kernel@vger.kernel.org, mka@google.com,
 midean@google.com, Kalyan Thota <kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WARN_ON was introduced by the below commit to catch runtime resumes
that are getting triggered before icc path was set.

"drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume"

For the targets where the bw scaling is not enabled, this WARN_ON is
a false alarm. Fix the WARN condition appropriately.

Reported-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cab387f..0071a4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	struct icc_path *path1;
 	struct drm_device *dev = dpu_kms->dev;
 
+	if (!dpu_supports_bw_scaling(dev))
+		return 0;
+
 	path0 = of_icc_get(dev->dev, "mdp0-mem");
 	path1 = of_icc_get(dev->dev, "mdp1-mem");
 
@@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
-	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
-		dpu_kms_parse_data_bus_icc_path(dpu_kms);
+	dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
@@ -1198,7 +1200,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 
 	ddev = dpu_kms->dev;
 
-	WARN_ON(!(dpu_kms->num_paths));
+	WARN_ON((dpu_supports_bw_scaling(ddev) && !dpu_kms->num_paths));
 	/* Min vote of BW is required before turning on AXI clk */
 	for (i = 0; i < dpu_kms->num_paths; i++)
 		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6..f7bcc0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -154,6 +154,15 @@ struct vsync_info {
 
 #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
 
+/**
+ * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
+ * @dev: Pointer to drm_device structure
+ */
+static inline int dpu_supports_bw_scaling(struct drm_device *dev)
+{
+	return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");
+}
+
 /* Global private object state for tracking resources that are shared across
  * multiple kms objects (planes/crtcs/etc).
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index cd40788..8cd712c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
 	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
 	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
 
+	if (dpu_supports_bw_scaling(dev))
+		return 0;
+
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
@@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
-		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
-		if (ret)
-			return ret;
-	}
+	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
+	if (ret)
+		return ret;
 
 	mp = &dpu_mdss->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
