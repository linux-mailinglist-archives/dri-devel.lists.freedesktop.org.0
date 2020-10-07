Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD52865B7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 19:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE276E980;
	Wed,  7 Oct 2020 17:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE726E969
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ujKXx4vHiZYwBaLPxXGcqjlgFpmHbJVz3yknSrJWw9k=; b=IOQ1OZq0GwdvTmvH7mMLB2EO/J
 GvHVfPr7MbcpL/JJzRkT0wrSpfGp1GTrL7mlWrdZLjsHpFP2L1Qzm0woIJrUTHh+KrtMmJLM7J1ys
 C5eJX//mWxOnRLN7In29qEOOD/iLdxAUgf4TyHurpmctAR8LQnOSwtIeml2h0RLO/AMNtOZhy8jzN
 R80cu4qIpK4D9DOAC7syKeTXahSX3M+rNBja3ek4EdVPbhq0COvXNcxlEPZ6cE5aQ3v9cm1ErLK39
 x3fhgBhF8zJgrShm+1fzVPUVUe+bBeUiYL8lWVsvCv7DS0HD2ZRRHUsLmfE038GDRlHasEk92JtWc
 2bbelUvg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kQD40-0006P9-W4; Wed, 07 Oct 2020 20:17:17 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 16/20] drm/tegra: Boot VIC during runtime PM resume
Date: Wed,  7 Oct 2020 20:12:34 +0300
Message-Id: <20201007171238.1795964-17-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the new UAPI implementation, engines are powered on and off
when there are active jobs, and the core code handles channel
allocation. To accommodate that, boot the engine as part of
runtime PM instead of using the open_channel callback, which is
not used by the new submit path.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* runtime_get/put is now done directly from submit path, so no
  callbacks are added
* Reworded.
---
 drivers/gpu/drm/tegra/vic.c | 114 +++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cb476da59adc..5d2ad125dca3 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -29,7 +29,6 @@ struct vic_config {
 
 struct vic {
 	struct falcon falcon;
-	bool booted;
 
 	void __iomem *regs;
 	struct tegra_drm_client client;
@@ -52,48 +51,6 @@ static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
 	writel(value, vic->regs + offset);
 }
 
-static int vic_runtime_resume(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = clk_prepare_enable(vic->clk);
-	if (err < 0)
-		return err;
-
-	usleep_range(10, 20);
-
-	err = reset_control_deassert(vic->rst);
-	if (err < 0)
-		goto disable;
-
-	usleep_range(10, 20);
-
-	return 0;
-
-disable:
-	clk_disable_unprepare(vic->clk);
-	return err;
-}
-
-static int vic_runtime_suspend(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = reset_control_assert(vic->rst);
-	if (err < 0)
-		return err;
-
-	usleep_range(2000, 4000);
-
-	clk_disable_unprepare(vic->clk);
-
-	vic->booted = false;
-
-	return 0;
-}
-
 static int vic_boot(struct vic *vic)
 {
 #ifdef CONFIG_IOMMU_API
@@ -103,9 +60,6 @@ static int vic_boot(struct vic *vic)
 	void *hdr;
 	int err = 0;
 
-	if (vic->booted)
-		return 0;
-
 #ifdef CONFIG_IOMMU_API
 	if (vic->config->supports_sid && spec) {
 		u32 value;
@@ -153,8 +107,6 @@ static int vic_boot(struct vic *vic)
 		return err;
 	}
 
-	vic->booted = true;
-
 	return 0;
 }
 
@@ -308,35 +260,76 @@ static int vic_load_firmware(struct vic *vic)
 	return err;
 }
 
-static int vic_open_channel(struct tegra_drm_client *client,
-			    struct tegra_drm_context *context)
+
+static int vic_runtime_resume(struct device *dev)
 {
-	struct vic *vic = to_vic(client);
+	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
-	err = pm_runtime_get_sync(vic->dev);
+	err = clk_prepare_enable(vic->clk);
 	if (err < 0)
 		return err;
 
+	usleep_range(10, 20);
+
+	err = reset_control_deassert(vic->rst);
+	if (err < 0)
+		goto disable;
+
+	usleep_range(10, 20);
+
 	err = vic_load_firmware(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
 
 	err = vic_boot(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
+
+	return 0;
+
+assert:
+	reset_control_assert(vic->rst);
+disable:
+	clk_disable_unprepare(vic->clk);
+	return err;
+}
+
+static int vic_runtime_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_assert(vic->rst);
+	if (err < 0)
+		return err;
+
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(vic->clk);
+
+	return 0;
+}
+
+static int vic_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = pm_runtime_get_sync(vic->dev);
+	if (err < 0) {
+		pm_runtime_put(vic->dev);
+		return err;
+	}
 
 	context->channel = host1x_channel_get(vic->channel);
 	if (!context->channel) {
-		err = -ENOMEM;
-		goto rpm_put;
+		pm_runtime_put(vic->dev);
+		return -ENOMEM;
 	}
 
 	return 0;
-
-rpm_put:
-	pm_runtime_put(vic->dev);
-	return err;
 }
 
 static void vic_close_channel(struct tegra_drm_context *context)
@@ -344,7 +337,6 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	struct vic *vic = to_vic(context->client);
 
 	host1x_channel_put(context->channel);
-
 	pm_runtime_put(vic->dev);
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
