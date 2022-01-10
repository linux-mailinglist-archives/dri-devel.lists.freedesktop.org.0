Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A148A145
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 21:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4F810E7ED;
	Mon, 10 Jan 2022 20:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D418B10E675;
 Mon, 10 Jan 2022 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641848193; x=1673384193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Gr+l/UoZ28gbJ/8YEFHqKGCvW74fJsmMUGhTjiUYfPs=;
 b=HyRskTbczGDqx42PRr8U0srUqOukulaNLVFyWaSYlA6aBKpdO3X5CyYj
 s7wplxCaoOkhUXLmCTyMz1LlYB+FIV7hSx6ejLuz0x9rdRYz6RIGKL40C
 8qpCoxLdE2GDVBf1XhbWfcAvhZM4+pYgYEVNFaRO0rkGbDz0+PjXX5Fsp 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Jan 2022 12:56:33 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 12:56:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 12:56:33 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 12:56:32 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v10 3/5] drm/msm/dp:  populate connector of struct  dp_panel
Date: Mon, 10 Jan 2022 12:55:42 -0800
Message-ID: <1641848144-25147-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP CTS test case 4.2.2.6 has valid edid with bad checksum on purpose
and expect DP source return correct checksum. During drm edid read,
correct edid checksum is calculated and stored at
connector::real_edid_checksum.

The problem is struct dp_panel::connector never be assigned, instead the
connector is stored in struct msm_dp::connector. When we run compliance
testing test case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid
edid set in struct dp_panel::edid so we'll try to use the connectors
real_edid_checksum and hit a NULL pointer dereference error because the
connector pointer is never assigned.

Changes in V2:
-- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()

Changes in V3:
-- remove unhelpful kernel crash trace commit text
-- remove renaming dp_display parameter to dp

Changes in V4:
-- add more details to commit text

Changes in v10:
--  group into one series

Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c7f0423..e76e375 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1489,6 +1489,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
 	struct msm_drm_private *priv;
+	struct dp_display_private *dp_priv;
 	int ret;
 
 	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
@@ -1497,6 +1498,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	priv = dev->dev_private;
 	dp_display->drm_dev = dev;
 
+	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
+
 	ret = dp_display_request_irq(dp_display);
 	if (ret) {
 		DRM_ERROR("request_irq failed, ret=%d\n", ret);
@@ -1514,6 +1517,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 		return ret;
 	}
 
+	dp_priv->panel->connector = dp_display->connector;
+
 	priv->connectors[priv->num_connectors++] = dp_display->connector;
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

