Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F144AB1B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 11:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9FF6E5D1;
	Tue,  9 Nov 2021 10:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD31C6EB16;
 Tue,  9 Nov 2021 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636451265; x=1667987265;
 h=from:to:cc:subject:date:message-id;
 bh=6tqlYmDpFiTflvQY8+aODJEFmV4JpiyMaHH3bDkK6nQ=;
 b=TtkNbawaJwgQiq2hng00FA0CNUljabTiu6jesQlbaB3kANvEtIl2NJRw
 P5jH/Jd0l6zkqjeTjoNSIheTuHRRXH80Aiqt99CE62xYj5B+G4wRukZ48
 zRbasuxpWcWmbcQLJgWR0OM92pUFy1IWCBbJjHIcyoSRQ8wDOhFoJmq+q E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 Nov 2021 01:47:44 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Nov 2021 01:47:42 -0800
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 09 Nov 2021 15:17:31 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 517DE2227F; Tue,  9 Nov 2021 15:17:30 +0530 (IST)
From: Krishna Manikandan <quic_mkrishn@quicinc.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/msm: use compatible lists to find mdp node
Date: Tue,  9 Nov 2021 15:17:28 +0530
Message-Id: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 09 Nov 2021 10:02:10 +0000
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
Cc: quic_kalyant@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the current implementation, substring comparison
using device node name is used to find mdp node
during driver probe. Use compatible string list instead
of node name to get mdp node from the parent mdss node.

Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>

Changes in v2:
  - Use compatible lists instead of duplicate string
    check (Stephen Boyd)

Changes in v3:
  - Use match tables to find the mdp node (Stephen Boyd)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 ++-
 drivers/gpu/drm/msm/msm_drv.c            | 7 ++++---
 drivers/gpu/drm/msm/msm_kms.h            | 3 +++
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ad247c0..c778b6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1273,7 +1273,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 				pm_runtime_force_resume)
 };
 
-static const struct of_device_id dpu_dt_match[] = {
+const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
 	{ .compatible = "qcom,sc7280-dpu", },
@@ -1282,6 +1282,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
+EXPORT_SYMBOL(dpu_dt_match);
 
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 7b24224..8b97008 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1031,13 +1031,14 @@ static const struct dev_pm_ops mdp5_pm_ops = {
 	SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
 };
 
-static const struct of_device_id mdp5_dt_match[] = {
+const struct of_device_id mdp5_dt_match[] = {
 	{ .compatible = "qcom,mdp5", },
 	/* to support downstream DT files */
 	{ .compatible = "qcom,mdss_mdp", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdp5_dt_match);
+EXPORT_SYMBOL(mdp5_dt_match);
 
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7936e8d..445788f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1277,9 +1277,10 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int compare_name_mdp(struct device *dev, void *data)
+static int find_mdp_node(struct device *dev, void *data)
 {
-	return (strstr(dev_name(dev), "mdp") != NULL);
+	return of_match_node(dpu_dt_match, dev->of_node) ||
+		of_match_node(mdp5_dt_match, dev->of_node);
 }
 
 static int add_display_components(struct platform_device *pdev,
@@ -1304,7 +1305,7 @@ static int add_display_components(struct platform_device *pdev,
 			return ret;
 		}
 
-		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
+		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
 		if (!mdp_dev) {
 			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
 			of_platform_depopulate(dev);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 6a42b81..8b132c8 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -198,6 +198,9 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev);
 struct msm_kms *mdp5_kms_init(struct drm_device *dev);
 struct msm_kms *dpu_kms_init(struct drm_device *dev);
 
+extern const struct of_device_id dpu_dt_match[];
+extern const struct of_device_id mdp5_dt_match[];
+
 struct msm_mdss_funcs {
 	int (*enable)(struct msm_mdss *mdss);
 	int (*disable)(struct msm_mdss *mdss);
-- 
2.7.4

