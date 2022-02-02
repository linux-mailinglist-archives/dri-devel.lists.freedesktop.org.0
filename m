Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B54A7849
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 19:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E346D10E20B;
	Wed,  2 Feb 2022 18:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4E010E3A1;
 Wed,  2 Feb 2022 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643828214; x=1675364214;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=bUwZvr959gWIjd1I85WEgu77J4m63RW0GHC6Ui0ajPQ=;
 b=LQ+YA7aKfm1AaXyu6bMNGXMdIeu6ABWu93qQTF3vOgWBFxaxR8hvqtzh
 iLHMd061nDEgAxtHMbbEqUxkUTqjU6p+q+HNcv9IZWSylwXHo4WUPBQHx
 7XcqqCTmmQoSzHVBg7X1iKJuCIp4rG4QuvQVbnpJg1psF2oNvSH7z7gIc M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Feb 2022 10:56:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 10:56:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 2 Feb 2022 10:56:51 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 2 Feb 2022 10:56:50 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/3] Add connector_type to debug info to differentiate
 between eDP and DP
Date: Wed, 2 Feb 2022 10:56:36 -0800
Message-ID: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
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

1) Add connector_type to debug info to differentiate between eDP and DP
2) add more debug info to cover dp Phy
3) repalce DRM_DEBUG_DP with drm_debug_dp

Kuogee Hsieh (3):
  drm/msm/dp: add connector type to enhance debug messages
  drm/msm/dp: enhance debug info related to dp phy
  drm/msm/dp:  replace DRM_DEBUG_DP marco with drm_dbg_dp

 drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.c |  34 ++++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 116 +++++++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.c | 103 ++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
 drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++------
 drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
 drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
 9 files changed, 283 insertions(+), 187 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

