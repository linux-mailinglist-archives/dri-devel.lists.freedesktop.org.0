Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD274A9F37
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 19:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B310E7B0;
	Fri,  4 Feb 2022 18:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F9710E773;
 Fri,  4 Feb 2022 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643999813; x=1675535813;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=mk7BEok8/VhlRqkWI4IQkDfecA7DKdES0Z/Ryz5SbOc=;
 b=t3KndcZV4woy3JK6maHVOCABcqrvcPZxje9pnNyRoYOzlRuu7ceX4nah
 7Tkj3Xz3nBEoO4gbzsP2C9CuQfUttsrZUW/5piyl4ZGf98ygWPHrJrnsc
 eAg2SEJx4YmGwvfefQlQfvD+kY3HKd9FOZ2S6rRcm1expzNEOw3ACh34E Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Feb 2022 10:36:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 10:36:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 10:36:51 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 10:36:50 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/3] enable widebus feature base on chip hardware revision
Date: Fri, 4 Feb 2022 10:36:38 -0800
Message-ID: <1643999801-20359-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

split into 3 patches
1) widebus timing engine programming
2) dsc timing engine
3) enable widebus feature base on chip hardware revision


Kuogee Hsieh (3):
  drm/msm/dp:  revise timing engine programming to support widebus
    feature
  drm/msm/dp: revise timing engine programming to support compression
    (DSC)
  drm/msm/dp: enable widebus feature for display port

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  14 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 107 +++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  36 ++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  13 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  30 ++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   4 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   6 ++
 14 files changed, 197 insertions(+), 42 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

