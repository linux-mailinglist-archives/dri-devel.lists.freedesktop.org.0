Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF05B6A2B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B310E67C;
	Tue, 13 Sep 2022 08:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399F210E672;
 Tue, 13 Sep 2022 08:58:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2195B80E42;
 Tue, 13 Sep 2022 08:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB048C4315A;
 Tue, 13 Sep 2022 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663059500;
 bh=hrVvbXZI3Rtg13D3GQsc7u6t7rwPKk9Y9RWbu9u6KlM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=unmVFMd/dGOGh2PApm3PDyWQrBxL1xdvk35PijR18DwwcNW4H727qG6HywOtia2G2
 an8mZSsqIbYsjx7668w2wSRihZ+TOZk0wbnLpgVhA84QJsUt7Mf9OazIDIHQbvx8RA
 VGO+U0ddf3DHcr4r+i3jQv7zqXaXJOO5Huf2SFMYYixc586UzpcYleH6GsMFkAz32Z
 HDaH19Ek5MYXTqDLSUnLW4drfC15K1hC/dInzytrumqJumgk4zEXx/Dgn7N3eHacrJ
 Z8phApq3E6e67RMzA9Z9XfUf+fLj6acdta1bs96nRDXe2EgtZF3uX517FevoEzerlI
 fNnsMqDjz2NSw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oY1kJ-0002HO-5t; Tue, 13 Sep 2022 10:58:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 10/10] drm/msm/dsi: drop modeset sanity checks
Date: Tue, 13 Sep 2022 10:53:20 +0200
Message-Id: <20220913085320.8577-11-johan+linaro@kernel.org>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the overly defensive modeset sanity checks of function parameters
which have already been checked or used by the callers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 8a95c744972a..31fdee2052be 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -211,14 +211,9 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
-		return -EINVAL;
-
-	priv = dev->dev_private;
-
 	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
 		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
 		return -ENOSPC;
-- 
2.35.1

