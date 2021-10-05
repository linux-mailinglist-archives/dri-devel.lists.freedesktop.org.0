Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9A4222B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508946E3C4;
	Tue,  5 Oct 2021 09:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Tue, 05 Oct 2021 09:50:54 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712496E3B7;
 Tue,  5 Oct 2021 09:50:54 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 05 Oct 2021 02:44:48 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Oct 2021 02:44:47 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 05 Oct 2021 15:14:34 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 2953A221DF; Tue,  5 Oct 2021 15:14:33 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, kalyan_t@codeaurora.org,
 robdclark@gmail.com, swboyd@chromium.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/msm: use compatible string to find mdp node
Date: Tue,  5 Oct 2021 15:14:31 +0530
Message-Id: <1633427071-19523-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

In the current implementation, substring comparison
using device node name is used to find mdp node
during driver probe. Use compatible string instead
of node name to get mdp node from the parent mdss node.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2e6fc18..50a23cf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1241,9 +1241,16 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int compare_name_mdp(struct device *dev, void *data)
+static int find_mdp_node(struct device *dev, void *data)
 {
-	return (strstr(dev_name(dev), "mdp") != NULL);
+	return of_device_is_compatible(dev->of_node, "qcom,mdp4") ||
+		of_device_is_compatible(dev->of_node, "qcom,mdp5") ||
+		of_device_is_compatible(dev->of_node, "qcom,mdss_mdp") ||
+		of_device_is_compatible(dev->of_node, "qcom,sdm845-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sm8150-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sm8250-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sc7180-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sc7280-dpu");
 }
 
 static int add_display_components(struct platform_device *pdev,
@@ -1268,7 +1275,7 @@ static int add_display_components(struct platform_device *pdev,
 			return ret;
 		}
 
-		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
+		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
 		if (!mdp_dev) {
 			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
 			of_platform_depopulate(dev);
-- 
2.7.4

