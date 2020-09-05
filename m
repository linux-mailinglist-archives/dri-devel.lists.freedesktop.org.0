Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958425E6EF
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779836ED3D;
	Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EB26ED3D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ludm6wMoUYd/F3P2MXIp2pMUgSBr0qQ7S9yFE/7XgMY=; b=MMvgjJzf+vQwafd8zEpg9Jm3Lb
 cybCcU417JxJLVr0dhTZog5zJPFiWv7uVKJ+ytxa6zOFTPS2AN0+k54wLKVXNAkLJs5lOYNSsWNgv
 rOZGdtTM0erAURikV4AtwQkkauG/ch2TbAzl3Dr3TjU+iIymE5FBl8QTCYZxwVfsFxtj6SKcuc7or
 j1m0OqHH5Wkmi6dtQqX0IqAR8T+6gZi2yA2Crf3Z3gmiG81sMzHs0Fi2gibLufEYHuFRfwSn2PeMY
 HbL+FAzBMN1WyR5zm5jJrPYer0LrG9hFmVGYTzIW3uT5/FUeohHQHeyWAil/3CZc/8FfkgsiCf7A6
 zUiF8lRw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kEVXy-0003SS-QU; Sat, 05 Sep 2020 13:35:50 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH v2 15/17] drm/tegra: Add power_on/power_off engine
 callbacks
Date: Sat,  5 Sep 2020 13:34:18 +0300
Message-Id: <20200905103420.3021852-16-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.250.171.65
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
allocation. To accommodate that, add the power_on and power_off
callbacks. The open_channel and close_channel callbacks are now only
used for the staging path.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.h |  11 +++-
 drivers/gpu/drm/tegra/vic.c | 127 ++++++++++++++++++++----------------
 2 files changed, 78 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index b25443255be6..b915a3946ad4 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -67,14 +67,19 @@ struct tegra_drm_context {
 };
 
 struct tegra_drm_client_ops {
-	int (*open_channel)(struct tegra_drm_client *client,
-			    struct tegra_drm_context *context);
-	void (*close_channel)(struct tegra_drm_context *context);
+	int (*power_on)(struct tegra_drm_client *client);
+	void (*power_off)(struct tegra_drm_client *client);
+
 	int (*is_addr_reg)(struct device *dev, u32 class, u32 offset);
 	int (*is_valid_class)(u32 class);
 	int (*submit)(struct tegra_drm_context *context,
 		      struct drm_tegra_submit *args, struct drm_device *drm,
 		      struct drm_file *file);
+
+	/* Legacy UAPI callbacks */
+	int (*open_channel)(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context);
+	void (*close_channel)(struct tegra_drm_context *context);
 };
 
 int tegra_drm_submit(struct tegra_drm_context *context,
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cb476da59adc..4783c7254de9 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -52,48 +52,6 @@ static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
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
@@ -308,47 +266,102 @@ static int vic_load_firmware(struct vic *vic)
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
+	vic->booted = false;
+
+	return 0;
+}
+
+static int vic_power_on(struct tegra_drm_client *client)
+{
+	struct vic *vic = to_vic(client);
+
+	return pm_runtime_get_sync(vic->dev);
+}
+
+static void vic_power_off(struct tegra_drm_client *client)
+{
+	struct vic *vic = to_vic(client);
+
+	pm_runtime_put(vic->dev);
+}
+
+static int vic_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = vic_power_on(client);
+	if (err < 0)
+		return err;
 
 	context->channel = host1x_channel_get(vic->channel);
 	if (!context->channel) {
-		err = -ENOMEM;
-		goto rpm_put;
+		vic_power_off(client);
+		return -ENOMEM;
 	}
 
 	return 0;
-
-rpm_put:
-	pm_runtime_put(vic->dev);
-	return err;
 }
 
 static void vic_close_channel(struct tegra_drm_context *context)
 {
-	struct vic *vic = to_vic(context->client);
-
 	host1x_channel_put(context->channel);
 
-	pm_runtime_put(vic->dev);
+	vic_power_off(context->client);
 }
 
 static const struct tegra_drm_client_ops vic_ops = {
+	.power_on = vic_power_on,
+	.power_off = vic_power_off,
 	.open_channel = vic_open_channel,
 	.close_channel = vic_close_channel,
 	.submit = tegra_drm_submit,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
