Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1245B5D76
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB610E5B3;
	Mon, 12 Sep 2022 15:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F7C10E5AC;
 Mon, 12 Sep 2022 15:41:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8892C61251;
 Mon, 12 Sep 2022 15:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE8EC433D6;
 Mon, 12 Sep 2022 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662997285;
 bh=h3sQrhyd74oWULFv02m70LBt91EIrT+Rg3lg8RO3sAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nCrQ3rYO8gn+eTf9ct4rWDoXMGm6kB35ix1yNHFyi04TOVEC4Yj5zIPwVfa2HR8E9
 syouCiVw1hiMsiy9fte8AMzxA8DRtWf30ftAFC4fMB+A671fmF2aQwABBawSL7xTLd
 wnA8DvQKe9vm+EGb+LnFJNySc42kwlSxYCHX4NKV/6P73W5iWmLLUimFoIgSWWymPc
 QfRuLC/X8sT+wymxMknifc+fBAWhMbbmegN0/OgTPhuAd1hWw7XeChgHYMgbt/3w1K
 N7GlQkAzgxuBzQr9RQsMvdsHHG3hDRuWO9ZeVUBrWjgPzUNXgsxj7UmmJ5eYkjAawY
 gZfVicLVRXcwQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oXlYp-0003Mu-Ez; Mon, 12 Sep 2022 17:41:23 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
Date: Mon, 12 Sep 2022 17:40:43 +0200
Message-Id: <20220912154046.12900-5-johan+linaro@kernel.org>
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

Device-managed resources allocated post component bind must be tied to
the lifetime of the aggregate DRM device or they will not necessarily be
released when binding of the aggregate device is deferred.

This can lead resource leaks or failure to bind the aggregate device
when binding is later retried and a second attempt to allocate the
resources is made.

For the DP aux-bus, an attempt to populate the bus a second time will
simply fail ("DP AUX EP device already populated").

Fix this by amending the DP aux interface and tying the lifetime of the
EP device to the DRM device rather than DP controller platform device.

Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
Cc: stable@vger.kernel.org      # 5.19
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/bridge/parade-ps8640.c   | 2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c      | 3 ++-
 include/drm/display/drm_dp_aux_bus.h     | 6 +++---
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index d7483c13c569..6127979370cb 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -719,7 +719,7 @@ static int ps8640_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = devm_of_dp_aux_populate_bus(&ps_bridge->aux, ps8640_bridge_link_panel);
+	ret = devm_of_dp_aux_populate_bus(dev, &ps_bridge->aux, ps8640_bridge_link_panel);
 
 	/*
 	 * If devm_of_dp_aux_populate_bus() returns -ENODEV then it's up to
diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index f5741b45ca07..2706f2cf82f7 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -322,6 +322,7 @@ static void of_dp_aux_depopulate_bus_void(void *data)
 
 /**
  * devm_of_dp_aux_populate_bus() - devm wrapper for of_dp_aux_populate_bus()
+ * @dev: Device to tie the lifetime of the EP devices to
  * @aux: The AUX channel whose device we want to populate
  * @done_probing: Callback functions to call after EP device finishes probing.
  *                Will not be called if there are no EP devices and this
@@ -333,7 +334,7 @@ static void of_dp_aux_depopulate_bus_void(void *data)
  *         no children. The done_probing() function won't be called in that
  *         case.
  */
-int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
+int devm_of_dp_aux_populate_bus(struct device *dev, struct drm_dp_aux *aux,
 				int (*done_probing)(struct drm_dp_aux *aux))
 {
 	int ret;
@@ -342,7 +343,7 @@ int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(aux->dev,
+	return devm_add_action_or_reset(dev,
 					of_dp_aux_depopulate_bus_void, aux);
 }
 EXPORT_SYMBOL_GPL(devm_of_dp_aux_populate_bus);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ba557328710a..e1aa6355bbf6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,7 +1559,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 		 * panel driver is probed asynchronously but is the best we
 		 * can do without a bigger driver reorganization.
 		 */
-		rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
+		rc = devm_of_dp_aux_populate_ep_devices(dp->drm_dev->dev,
+							dp_priv->aux);
 		of_node_put(aux_bus);
 		if (rc)
 			goto error;
diff --git a/include/drm/display/drm_dp_aux_bus.h b/include/drm/display/drm_dp_aux_bus.h
index 8a0a486383c5..a4063aa7fc40 100644
--- a/include/drm/display/drm_dp_aux_bus.h
+++ b/include/drm/display/drm_dp_aux_bus.h
@@ -47,7 +47,7 @@ static inline struct dp_aux_ep_driver *to_dp_aux_ep_drv(struct device_driver *dr
 int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 			   int (*done_probing)(struct drm_dp_aux *aux));
 void of_dp_aux_depopulate_bus(struct drm_dp_aux *aux);
-int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
+int devm_of_dp_aux_populate_bus(struct device *dev, struct drm_dp_aux *aux,
 				int (*done_probing)(struct drm_dp_aux *aux));
 
 /* Deprecated versions of the above functions. To be removed when no callers. */
@@ -61,11 +61,11 @@ static inline int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
 	return (ret != -ENODEV) ? ret : 0;
 }
 
-static inline int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+static inline int devm_of_dp_aux_populate_ep_devices(struct device *dev, struct drm_dp_aux *aux)
 {
 	int ret;
 
-	ret = devm_of_dp_aux_populate_bus(aux, NULL);
+	ret = devm_of_dp_aux_populate_bus(dev, aux, NULL);
 
 	/* New API returns -ENODEV for no child case; adapt to old assumption */
 	return (ret != -ENODEV) ? ret : 0;
-- 
2.35.1

