Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE95B6A27
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3225810E678;
	Tue, 13 Sep 2022 08:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A49110E665;
 Tue, 13 Sep 2022 08:58:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B79D6136C;
 Tue, 13 Sep 2022 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18A0C43148;
 Tue, 13 Sep 2022 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663059499;
 bh=ZcIqc1knQDBLZsYiRURyGWfkmlLHu5K+oQ6ruURZbro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sTS3FNdE+EXltnMNa9h3t5HHxPDAV3FkjYxZXZzxxwatDqjnDieL8UI0YWbk3+iRb
 BYy/ihxt8Axd+nQdQEB01mz3/qyk45lVZObDGOXWKYcwU+RlPwzG9oEWcWwa/CwNaP
 VabYvOC67nBvjxScVUlui7LW43A71MqP2oFx6GcjJNtedJ+8fyXxPgDtxp3trnLsj0
 BS//ga8N7p+JuouJuIItXfONiqKN1QPnvwrIbM6xViGfA/7mkq4NiQtlmJjA8DM77T
 DGSMD2iNG+tKarvowIoAkyZ6TfXzN1jeaD0S4evUL+kPlMaYQXK3IKbPa1qv4d83Zb
 6lY2Bo2+YYUGQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oY1kI-0002HE-TH; Tue, 13 Sep 2022 10:58:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 07/10] drm/msm/dp: fix bridge lifetime
Date: Tue, 13 Sep 2022 10:53:17 +0200
Message-Id: <20220913085320.8577-8-johan+linaro@kernel.org>
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

For the DP bridges, previously allocated bridges will leak on probe
deferral.

Fix this by amending the DP parser interface and tying the lifetime of
the bridge device to the DRM device rather than DP platform device.

Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
Cc: stable@vger.kernel.org      # 5.19
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c  | 6 +++---
 drivers/gpu/drm/msm/dp/dp_parser.h  | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4b0a2d4bb61e..808a516e84c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1586,7 +1586,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	 * For DisplayPort interfaces external bridges are optional, so
 	 * silently ignore an error if one is not present (-ENODEV).
 	 */
-	rc = dp_parser_find_next_bridge(dp_priv->parser);
+	rc = devm_dp_parser_find_next_bridge(dp->drm_dev->dev, dp_priv->parser);
 	if (!dp->is_edp && rc == -ENODEV)
 		return 0;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index dd732215d55b..dcbe893d66d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -240,12 +240,12 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
-int dp_parser_find_next_bridge(struct dp_parser *parser)
+int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
 {
-	struct device *dev = &parser->pdev->dev;
+	struct platform_device *pdev = parser->pdev;
 	struct drm_bridge *bridge;
 
-	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	bridge = devm_drm_of_get_bridge(dev, pdev->dev.of_node, 1, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 866c1a82bf1a..d30ab773db46 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -138,8 +138,9 @@ struct dp_parser {
 struct dp_parser *dp_parser_get(struct platform_device *pdev);
 
 /**
- * dp_parser_find_next_bridge() - find an additional bridge to DP
+ * devm_dp_parser_find_next_bridge() - find an additional bridge to DP
  *
+ * @dev: device to tie bridge lifetime to
  * @parser: dp_parser data from client
  *
  * This function is used to find any additional bridge attached to
@@ -147,6 +148,6 @@ struct dp_parser *dp_parser_get(struct platform_device *pdev);
  *
  * Return: 0 if able to get the bridge, otherwise negative errno for failure.
  */
-int dp_parser_find_next_bridge(struct dp_parser *parser);
+int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser);
 
 #endif
-- 
2.35.1

