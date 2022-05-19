Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9EB52E053
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 01:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7546010E66C;
	Thu, 19 May 2022 23:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FB310E66C;
 Thu, 19 May 2022 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653001914; x=1684537914;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=CYLrqUDrZ80p9ncAy6YURBGJYkxdkslDJ+ojtqW+u54=;
 b=Wny6jvCmY0OH521xJW+agGA89i5O4VYY0dTGrJpnfPkQstgi6foaB67j
 /1VZNZ3G4iLDHixQS2/WVwsEIbhtU5UBrHXYP52brn1ktto8rQG6IVlP6
 NPYK0CTemcIaZzt2KcmK6XzagzMXyqxyBiU7wXwUdqLj64ACuniSFlSl4 s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 May 2022 16:11:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 16:11:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 16:11:52 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 16:11:51 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v6 0/3] eDP/DP Phy vdda realted function
Date: Thu, 19 May 2022 16:11:39 -0700
Message-ID: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1) add regulator_set_load() to eDP phy
2) add regulator_set_load() to DP phy
3) remove vdda related function out of eDP/DP controller

Kuogee Hsieh (3):
  phy: qcom-edp: add regulator_set_load to edp phy
  phy: qcom-qmp: add regulator_set_load to dp phy
  drm/msm/dp: delete vdda regulator related functions from eDP/DP
    controller

 drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  6 ---
 drivers/gpu/drm/msm/dp/dp_power.c   | 95 +------------------------------------
 drivers/phy/qualcomm/phy-qcom-edp.c |  9 +++-
 drivers/phy/qualcomm/phy-qcom-qmp.c | 16 +++++++
 5 files changed, 26 insertions(+), 114 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

