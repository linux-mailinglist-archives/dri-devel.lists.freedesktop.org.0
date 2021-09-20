Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2E41133D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 13:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9989FF7;
	Mon, 20 Sep 2021 11:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F436E453
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=KXU1uvvGG3Zwek
 t4tqYouB7lvi7vVs87+GJSqA8pvcg=; b=ZEoox5cWHSEWiHX8F3b60QHgE4BSTo
 ByZKSvlB6kYXa1ekjk10OzxT4DMgE4kXw/hNgUrkE3YFzKuS9cmAwn1Nv/NYg6xr
 8HK7vUzn4Nz1CUKHfk8rDmzcJowZczuj89ZApRzYNdDXBFJG0FfX+Ln5fNM56RBg
 UdoO29nU/CcAo=
Received: (qmail 2412676 invoked from network); 20 Sep 2021 11:05:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Sep 2021 11:05:25 +0200
X-UD-Smtp-Session: l3s3148p1@ky/klGnMDosgAwDPXwlxANIWpbLKE1Uh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 4/9] drm/msm: simplify getting .driver_data
Date: Mon, 20 Sep 2021 11:05:16 +0200
Message-Id: <20210920090522.23784-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Sep 2021 11:00:52 +0000
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

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 13 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c       |  6 ++----
 drivers/gpu/drm/msm/msm_drv.c            |  3 +--
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..32410bd299e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1185,16 +1185,15 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 static void dpu_unbind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
-	devm_kfree(&pdev->dev, mp->clk_config);
+	devm_kfree(dev, mp->clk_config);
 	mp->num_clk = 0;
 
 	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(dev);
 }
 
 static const struct component_ops dpu_ops = {
@@ -1216,8 +1215,7 @@ static int dpu_dev_remove(struct platform_device *pdev)
 static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
 	int i, rc = -1;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
 	/* Drop the performance state vote */
@@ -1235,8 +1233,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 static int __maybe_unused dpu_runtime_resume(struct device *dev)
 {
 	int rc = -1;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
 	struct dss_module_power *mp = &dpu_kms->mp;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b3b42672b2d4..3db9d1603dfe 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1015,8 +1015,7 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = dev_get_drvdata(dev);
 
 	DBG("");
 
@@ -1025,8 +1024,7 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = dev_get_drvdata(dev);
 
 	DBG("");
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbe4c2cd52a3..a58fccacc874 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1272,8 +1272,7 @@ static int dp_display_remove(struct platform_device *pdev)
 
 static int dp_pm_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct msm_dp *dp_display = dev_get_drvdata(dev);
 	struct dp_display_private *dp;
 	int sink_count = 0;
 
@@ -1329,8 +1328,7 @@ static int dp_pm_resume(struct device *dev)
 
 static int dp_pm_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dp *dp_display = platform_get_drvdata(pdev);
+	struct msm_dp *dp_display = dev_get_drvdata(dev);
 	struct dp_display_private *dp;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..d27db5777f2c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -470,8 +470,7 @@ static void dsi_bus_clk_disable(struct msm_dsi_host *msm_host)
 
 int msm_dsi_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
@@ -485,8 +484,7 @@ int msm_dsi_runtime_suspend(struct device *dev)
 
 int msm_dsi_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2e6fc185e54d..ede3d8b43761 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -309,8 +309,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 
 static int msm_drm_uninit(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *ddev = platform_get_drvdata(pdev);
+	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct msm_mdss *mdss = priv->mdss;
-- 
2.30.2

