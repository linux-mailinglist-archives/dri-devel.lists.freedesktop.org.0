Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB414C05FB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 01:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5110E256;
	Wed, 23 Feb 2022 00:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FBF10E256;
 Wed, 23 Feb 2022 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645576070; x=1677112070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89kZOxkjh+QnMeXkX5rvnLnyQUJZk6N+c3m9u8acRrA=;
 b=sHl3zy48gyP0qivqhERixqGaJQzel4ZBPyYBg+5TTHi1nbxBYrK6IsZp
 XJXpQ225Q8uBukmSSVZZ/pTQvaLdehhBhAOHLAsINvelARfwBNZJDIl4t
 BWX3xfzIvCGlEwcm6elZbU9Rne1rLfO06ai+Tms67XrROqr6yY7K5zwX6 g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Feb 2022 16:27:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 16:27:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 16:27:49 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 16:27:48 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v10 0/4] drm/msm/dpu: enable widebus feature base on chip
 hardware revision
Date: Tue, 22 Feb 2022 16:27:36 -0800
Message-ID: <1645576060-3046-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

revise widebus timing engine programming and enable widebus feature base on chip

Kuogee Hsieh (4):
  drm/msm/dpu: adjust display_v_end for eDP and DP
  drm/msm/dpu: replace BIT(x) with correspond marco define string
  drm/msm/dpu:  revise timing engine programming to support widebus
    feature
  drm/msm/dp: enable widebus feature for display port

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 14 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 62 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 32 ++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  2 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  7 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 21 +++++++-
 drivers/gpu/drm/msm/dp/dp_display.h                |  2 +
 drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
 12 files changed, 145 insertions(+), 20 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

