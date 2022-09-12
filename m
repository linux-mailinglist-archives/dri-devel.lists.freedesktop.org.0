Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD05B5D78
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8814A10E5BA;
	Mon, 12 Sep 2022 15:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0210E5C3;
 Mon, 12 Sep 2022 15:41:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59400B80DC7;
 Mon, 12 Sep 2022 15:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67BFC43470;
 Mon, 12 Sep 2022 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662997286;
 bh=66wIq+GWMs/sYpVYKkxofHK3eZwUltuTpqY+ZipnyME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LnGLSV34wqjHLEQpsMdzfRyZKTEOCXvu1ggzoaemcCsCDtDnbwmVtzKa3LE6ILPn3
 xU2o/sbFW6+LyH9KhqNGmeSYIar7AQiNZUys9aB7h5cls0nry8iml/4qR8F68dSb+w
 TncIKVLwEKp/MoASdHUcECMG7CLWx8UZS6x3r1QSLgvja3kWIVCVv1q2iUr0bve7ur
 o0PhZewBA5Lqhq8GbMOvGGAUQW9Tn8GvuFDwe/moW7G943uiRCZbOjg85XaYglJcjQ
 toFVte3yOqQa9BZ7XN2rdYmA7HcG/0vSbVnQQ+hwZ6liliQMwf3OB5FeYZwWKeCiPt
 hct6wH8gZKIqQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oXlYp-0003Mw-Hc; Mon, 12 Sep 2022 17:41:23 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 5/7] drm/msm/dp: fix bridge lifetime
Date: Mon, 12 Sep 2022 17:40:44 +0200
Message-Id: <20220912154046.12900-6-johan+linaro@kernel.org>
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

For the DP bridges, previously allocated bridges will leak on probe
deferral.

Fix this by amending the DP parser interface and tying the lifetime of
the bridge device to the DRM device rather than DP platform device.

Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
Cc: stable@vger.kernel.org      # 5.19
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c  | 6 +++---
 drivers/gpu/drm/msm/dp/dp_parser.h  | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e1aa6355bbf6..393af1ea9ed8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1576,7 +1576,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
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

