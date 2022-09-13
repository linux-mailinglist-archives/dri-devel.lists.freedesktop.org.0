Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56D5B6A23
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C7010E677;
	Tue, 13 Sep 2022 08:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0941410E66A;
 Tue, 13 Sep 2022 08:58:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5ABDBB80E3D;
 Tue, 13 Sep 2022 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8B0C433D7;
 Tue, 13 Sep 2022 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663059499;
 bh=OxlY1wqQsLgLsZL8UM+h11nCPJtAdLLq4mxJl0UHIGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HdFZsnvDfetEuZ9OOsaqe4P3XkCn6W8iV5G29D9GPmOToOSPYZkbEE1l52kOkQSca
 j27BIh2w2t0LCq4aOyNPO/ofXfJbQwoZsRDTfL8AnWtjk0XxfZEMKexa0+M9E1IIjT
 56AsIttLFTLUK9MrlFL7+JV/ZX4Xyq3DO7m2AUOnHaIJxlvK+W/h/7PiavPh+GQvEH
 EI06cyBWoIzxSGBjlQKYyjVc039GCTaws3fffOqJOkX6rWwGoK8CvInyjFdMMYAQJU
 buqsXsvTM3LbM1Ocxu/rNV5mcWksHgoR7JttMYzWHEwUIK55rgJ1HTROfZB/pZJsAO
 DHNw9ry6NA7mQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oY1kI-0002H6-Il; Tue, 13 Sep 2022 10:58:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 03/10] drm/msm/dsi: fix memory corruption with too many
 bridges
Date: Tue, 13 Sep 2022 10:53:13 +0200
Message-Id: <20220913085320.8577-4-johan+linaro@kernel.org>
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

Add the missing sanity check on the bridge counter to avoid corrupting
data beyond the fixed-sized bridge array in case there are ever more
than eight bridges.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Cc: stable@vger.kernel.org	# 4.1
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
2.35.1

