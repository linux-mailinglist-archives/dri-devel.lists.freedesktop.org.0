Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F71558BC3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 01:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CDB10E118;
	Thu, 23 Jun 2022 23:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C89610E070;
 Thu, 23 Jun 2022 23:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656027266; x=1687563266;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=/31sRhd3eMfjJCpxCgFwnrLmD7Dvnq2PU5xG/V6yQRQ=;
 b=IsTrrumlS5roTNHFU/EsZ3mnTHA6O3Y4v3MQc2s+XD95mmbkMI5p3Yng
 vi3R+04XEHR3YjXYh3m73JOqj86bBRNVXYDXNBmTH+gEknj5fV7Wu0bWq
 u1hk3sto0Iuf8Oghcs2Vsmvq9Fsv4RvyMHL/0mjzkFMiMPi1Au5rHf2Yn g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Jun 2022 16:34:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 16:34:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 16:34:24 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 16:34:23 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH] drm/msm/dp:  no dp_hpd_unplug_handle() required for eDP
Date: Thu, 23 Jun 2022 16:34:16 -0700
Message-ID: <1656027256-6552-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eDP implementation does not reuried to support hpd signal. Therefore
it only has either ST_DISPLAY_OFF or ST_CONNECTED state during normal
operation. This patch remove unnecessary dp_hpd_unplug_handle() for
eDP but still keep dp_hpd_plug_handle() to support eDP to either
booting up or resume from ST_DISCONNECTED state.

Fixes: 391c96ff0555 ("drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index da5c03a..ef9794e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1666,7 +1666,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	if (dp->is_edp)
+	if (dp->is_edp && dp_display->hpd_state == ST_DISCONNECTED)
 		dp_hpd_plug_handle(dp_display, 0);
 
 	mutex_lock(&dp_display->event_mutex);
@@ -1737,9 +1737,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	if (dp->is_edp)
-		dp_hpd_unplug_handle(dp_display, 0);
-
 	mutex_lock(&dp_display->event_mutex);
 
 	state = dp_display->hpd_state;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

