Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DB7559F2E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 19:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3010E58B;
	Fri, 24 Jun 2022 17:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3981910E372;
 Fri, 24 Jun 2022 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656090929; x=1687626929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=fT+ythOYCVlNcrsvXZFZiFoUH/exNdQzHOf/KDYIKOM=;
 b=AWXP7Rfhyhvd7cq2zH3Z7R5zW33w8SE1eAlzWuopWL36gFKnid2r0m8x
 INEtENViP5ieTSP1itSL57uHg3zaU4GdzVSZMYKbE+VwlqjfOF5lI8CDr
 PNTrv543quALmtWwRs5kCMjc2VAIGaFNwJBQUo8sZa1RILuryOjuQbP7V A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Jun 2022 10:15:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 10:15:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 10:15:28 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 10:15:27 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v1 3/3] drm/msm/dp: place edp at head of drm bridge chain to
 fix screen corruption
Date: Fri, 24 Jun 2022 10:15:12 -0700
Message-ID: <1656090912-18074-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_dp_modeset_init() is used to attach DP driver to drm bridge chain.
msm_dp_modeset_init() is executed in the order of index (dp->id) of DP
descriptor table.

Currently, DP is placed at first entry (dp->id = 0) of descriptor table
and eDP is placed at secondary entry (dp->id = 1 ) of descriptor table.
This means DP will be placed at head of bridge chain and eDP will be
placed right after DP at bridge chain.

Drm screen update is happen sequentially in the order from head to tail
of bridge chain. Therefore external DP display will have screen updated
happen before primary eDP display if external DP display presented.
This is wrong screen update order and cause one frame time screen
corruption happen at primary display during external DP plugged in.

This patch place eDP at first entry (dp->id = 0) of descriptor table and
place DP at secondary entry (dp->id = 1) to have primary eDP locate at
head of bridge chain. This correct screen update order and eliminated
the one frame time screen corruption happen d at primary display.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a87a9d8..2755ff3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -143,10 +143,10 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 
 static const struct msm_dp_config sc7280_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort,
-		.controller_id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
 		{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, 
 		.controller_id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
+		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort,
+		.controller_id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
 	},
 	.num_descs = 2,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

