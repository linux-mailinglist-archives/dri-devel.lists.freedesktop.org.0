Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC025B5D7A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E5310E5BC;
	Mon, 12 Sep 2022 15:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0900210E5B6;
 Mon, 12 Sep 2022 15:41:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F672B80DBF;
 Mon, 12 Sep 2022 15:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2083C433C1;
 Mon, 12 Sep 2022 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662997285;
 bh=PUntr8RYUmccrijWnyRaies5VrUYer8Dhhlkap8IWYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SfjprwJ/HGXVSYx09dbIkIMfeqtpIhR81HgQ2yRE5dQmaeuLAKa9J4wyjLAnXyd31
 fNq+skV4cr2V8vN1CFcvKlLFQxIOwHI0G88IDNNbjAQyfpY44jYATwH/o+t+m856Mk
 FLTJm3cBXqrsWIY+OVn/L4q5nio3/nVE23AIMHWdwb7QyAuC9KWRTxpRQiQ91lcnYU
 bQhoRsN+eEamvLJfrLvxw3cGugU7HCipIC2N08BZyV2JPtiOUuQB8BELhmRcOpBunl
 +8QgGfhPhNZekaUzB44D5b0TL8MF9XoaM9t89PZ77G+1alA5ubLyGluA0lu6JqIgTR
 f8Hl7g2ZGzzwA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oXlYp-0003Mq-8S; Mon, 12 Sep 2022 17:41:23 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/7] drm/msm: fix memory corruption with too many bridges
Date: Mon, 12 Sep 2022 17:40:41 +0200
Message-Id: <20220912154046.12900-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220912154046.12900-1-johan+linaro@kernel.org>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing sanity checks on the bridge counter to avoid corrupting
data beyond the fixed-sized bridge array in case there are ever more
than eight bridges.

a3376e3ec81c ("drm/msm: convert to drm_bridge")
ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
a689554ba6ed ("drm/msm: Initial add DSI connector support")
Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Cc: stable@vger.kernel.org	# 3.12
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 drivers/gpu/drm/msm/dsi/dsi.c       | 6 ++++++
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3e284fed8d30..fbe950edaefe 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1604,6 +1604,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 		return -EINVAL;
 
 	priv = dev->dev_private;
+
+	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
+		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
+		return -ENOSPC;
+	}
+
 	dp_display->drm_dev = dev;
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 39bbabb5daf6..8a95c744972a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -218,6 +218,12 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		return -EINVAL;
 
 	priv = dev->dev_private;
+
+	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
+		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
+		return -ENOSPC;
+	}
+
 	msm_dsi->dev = dev;
 
 	ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..a0ed6aa8e4e1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -300,6 +300,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	struct platform_device *pdev = hdmi->pdev;
 	int ret;
 
+	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
+		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
+		return -ENOSPC;
+	}
+
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
-- 
2.35.1

