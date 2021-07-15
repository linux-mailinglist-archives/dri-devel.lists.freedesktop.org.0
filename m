Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6723C992B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 08:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079906E584;
	Thu, 15 Jul 2021 06:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE676E584;
 Thu, 15 Jul 2021 06:53:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F72E6117A;
 Thu, 15 Jul 2021 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626332001;
 bh=zs8jtugBfxKu+QBaFNWoOagtbR470C8x4uQ4+ADZelg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X5gIm5BAGBRqPJZKINT4BrIpCcGHiQ0OoEkmKWZkG9tOFv200kU3kMAQhq+hHzIz1
 t7qK+s1k7G8vWcdCRDdXreGTTkf2pYyQhsQATIJCGGr6Z3PDd3llNSPEv+fprMxLri
 OSEmPVpJ/7xQInvUUeOaSdeGj4/EE3mWpMuwbKKADFaRwkjbp5z7q7fFaJySFunc2M
 q+SS4xkuolhOMKI83r1qxC/hpu74cVaTexHMmc8j0oHBuMoEj2AmkVe7UBHLl96z2J
 /67JL0Nk7KA6jMeAjgahwC/9tQOfLJOjW11anTkerWlglPvwQs6v096EwKmEnIKCN4
 pkDPMf9qaM3ag==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 11/11] drm/msm/dsi: Pass DSC params to drm_panel
Date: Thu, 15 Jul 2021 12:22:03 +0530
Message-Id: <20210715065203.709914-12-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715065203.709914-1-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DSC is enabled, we need to pass the DSC parameters to panel driver
as well, so add a dsc parameter in panel and set it when DSC is enabled

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++++++++-
 include/drm/drm_panel.h            |  7 +++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4e8ab1b1df8b..ee21cda243a7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2193,6 +2193,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	struct platform_device *pdev = msm_host->pdev;
 	struct msm_drm_private *priv;
+	struct drm_panel *panel;
 	int ret;
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
@@ -2212,8 +2213,21 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	}
 
 	msm_host->dev = dev;
+	panel = msm_dsi_host_get_panel(&msm_host->base);
 	priv = dev->dev_private;
-	priv->dsc = msm_host->dsc;
+
+	if (panel && panel->dsc) {
+		struct msm_display_dsc_config *dsc = priv->dsc;
+
+		if (!dsc) {
+			dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);
+			if (!dsc)
+				return -ENOMEM;
+			dsc->drm = panel->dsc;
+			priv->dsc = dsc;
+			msm_host->dsc = dsc;
+		}
+	}
 
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3f0eba..27a7808a29f2 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -171,6 +171,13 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
+
+	/**
+	 * @dsc:
+	 *
+	 * Panel DSC pps payload to be sent
+	 */
+	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.31.1

