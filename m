Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4505EFC4C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 19:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55A10EBA8;
	Thu, 29 Sep 2022 17:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8C210EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 17:11:49 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0668C6008836;
 Thu, 29 Sep 2022 18:05:00 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id jEmwgPGU0KD3; Thu, 29 Sep 2022 18:04:57 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8038C6008772;
 Thu, 29 Sep 2022 18:04:57 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664471097;
 bh=YRT6lSNe5QX6TyDghu968Ip0/fGWKOZs9tdGpmcfqV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZS3BklhKjXtjIJK7mDbsEsH9X8s5Wk7Swz/R95oEMNm6bLhhj37piX3KPIpN3m1PX
 hoQtD/ISmrWrkyVpJuHkG3cm9mIyoZpjETAex0M248THnyN+g3jSn76M3sWNYhSTVg
 M+tgSTHeH31s6VHQMV6DW5sVBFZsrsorV1I6XZdc=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 58C73360086;
 Thu, 29 Sep 2022 18:04:57 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH 2/4] drm/tegra: dsi: Clear enable register if powered by
 bootloader
Date: Thu, 29 Sep 2022 18:05:00 +0100
Message-Id: <20220929170502.1034040-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Sep 2022 17:52:24 +0000
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In cases where the DSI module is left on by the bootloader
some panels may fail to initialize if the enable register is not cleared
before the panel's initialization sequence. Clear it and add an optional
device tree property to inform the driver if this is the case.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/gpu/drm/tegra/dsi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index de1333dc0d86..f66514379913 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -78,6 +78,8 @@ struct tegra_dsi {
 	unsigned int video_fifo_depth;
 	unsigned int host_fifo_depth;
 
+	bool enabled;
+
 	/* for ganged-mode support */
 	struct tegra_dsi *master;
 	struct tegra_dsi *slave;
@@ -460,6 +462,8 @@ static void tegra_dsi_enable(struct tegra_dsi *dsi)
 	value |= DSI_POWER_CONTROL_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
 
+	dsi->enabled = true;
+
 	if (dsi->slave)
 		tegra_dsi_enable(dsi->slave);
 }
@@ -737,6 +741,8 @@ static void tegra_dsi_disable(struct tegra_dsi *dsi)
 	value &= ~DSI_POWER_CONTROL_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
 
+	dsi->enabled = false;
+
 	if (dsi->slave)
 		tegra_dsi_disable(dsi->slave);
 
@@ -912,6 +918,27 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	if (dsi->enabled) {
+		if (dc) {
+			value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+			value &= ~DSI_ENABLE;
+			tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+
+			tegra_dc_commit(dc);
+		}
+
+		err = tegra_dsi_wait_idle(dsi, 100);
+		if (err < 0)
+			dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
+
+		/* disable DSI controller */
+		tegra_dsi_disable(dsi);
+	}
+
 	err = tegra_dsi_prepare(dsi);
 	if (err < 0) {
 		dev_err(dsi->dev, "failed to prepare: %d\n", err);
@@ -1573,6 +1600,8 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 
 	dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
 
+	/* Check if the DSI module was left on by bootloader. */
+	dsi->enabled = of_property_read_bool(pdev->dev.of_node, "nvidia,boot-on");
 	/*
 	 * Assume these values by default. When a DSI peripheral driver
 	 * attaches to the DSI host, the parameters will be taken from
-- 
2.37.3

