Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F75B6A2E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95C310E66B;
	Tue, 13 Sep 2022 08:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E210E65E;
 Tue, 13 Sep 2022 08:58:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 850D0B80E3F;
 Tue, 13 Sep 2022 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E1C43140;
 Tue, 13 Sep 2022 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663059499;
 bh=r1eIu70bO7F9bGV6RWNcBBZbjBFCSkRWrK4jhR8b81E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nQy9QDTqYcg6AwZbRN6/VcgbPD6oXsVS/16HS3Pg3SRXuLbK7F+9nUItA3tDZwXgQ
 FU8D5+2TR6NMsVE24B7YQoTwGuzPB3gAEByBOZhPnceiCbd6zZZa0Zb9Q/HcKTlzaj
 8W0qzThQOD4v6mItJlXt/vSYfpKf6VOqAQJ6ml4X3Xw5pyHQzn+LtpdxEKUL33sFAH
 cE41Prc+9ORsjtV/AegXPCW0UWu4v1asUWj6Njb3t/hsobpqd8bEwpZ4IFHzd8uvf1
 UprUgETBsjLXNnVVjXA5F32p+SHS8WPCIOZrsjhLFddDc7/uJd39huyF19xTpqsOvI
 ScfbMgS6oweaQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oY1kI-0002HC-Qj; Tue, 13 Sep 2022 10:58:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 06/10] drm/msm/dp: fix aux-bus EP lifetime
Date: Tue, 13 Sep 2022 10:53:16 +0200
Message-Id: <20220913085320.8577-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913085320.8577-1-johan+linaro@kernel.org>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
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
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>,
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

Fix this by tying the lifetime of the EP device to the DRM device rather
than DP controller platform device.

Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
Cc: stable@vger.kernel.org      # 5.19
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ba557328710a..4b0a2d4bb61e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1535,6 +1535,11 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	}
 }
 
+static void of_dp_aux_depopulate_bus_void(void *data)
+{
+	of_dp_aux_depopulate_bus(data);
+}
+
 static int dp_display_get_next_bridge(struct msm_dp *dp)
 {
 	int rc;
@@ -1559,10 +1564,16 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 		 * panel driver is probed asynchronously but is the best we
 		 * can do without a bigger driver reorganization.
 		 */
-		rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
+		rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
 		of_node_put(aux_bus);
 		if (rc)
 			goto error;
+
+		rc = devm_add_action_or_reset(dp->drm_dev->dev,
+						of_dp_aux_depopulate_bus_void,
+						dp_priv->aux);
+		if (rc)
+			goto error;
 	} else if (dp->is_edp) {
 		DRM_ERROR("eDP aux_bus not found\n");
 		return -ENODEV;
-- 
2.35.1

