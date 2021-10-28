Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CF43DC2A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9256E924;
	Thu, 28 Oct 2021 07:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Thu, 28 Oct 2021 02:01:12 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64388249;
 Thu, 28 Oct 2021 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635386472; x=1666922472;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=a5hh0Naa28U3Lq2JXKdxUdPuy4+irXvUZAhbvn2LkY4=;
 b=doNPV6boA09iYs7ZM0F7MaaHiPr8kKzmiLQDjdKlbRsodIWuwrnam9tq
 QRNXlJPplMuFHwOIv5yBBKRyCsBV2dQFHUwNatT9EPsfowNdJY164+7Nl
 ORTHQ7z/PBBmZ3iLE3dlQVi2mqTU7fHgCTz0+jD6Fg6AkqNDQRSHDn6P7 Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2021 18:55:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 18:55:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:05 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:01 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
 <abhinavk@codeaurora.org>, <dianders@chromium.org>, <khsieh@codeaurora.org>,
 <mkrishn@codeaurora.org>, <sbillaka@codeaurora.org>
Subject: [PATCH v3 0/6] Add support for eDP controller on SC7280
Date: Thu, 28 Oct 2021 07:24:42 +0530
Message-ID: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Thu, 28 Oct 2021 07:35:12 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	This series will add eDP controller support for Qualcomm SC7280
platform. These patches are baseline changes with which we can enable
eDP display on sc7280. The sc7280 eDP controller driver can also support
additional features such as no_hpd detection, PSR, etc. which will be
enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=564841

Sankeerth Billakanti (6):
  dt-bindings: msm/dp: Add DP compatible strings for sc7280
  drm/msm/dp: Add DP controllers for sc7280
  drm/dp: Add macro to check max_downspread capability
  drm/msm/dp: Enable downspread for supported DP sinks
  drm/msm/dp: Enable ASSR for supported DP sinks
  drm/msm/dp: Remove the hpd init delay for eDP

 .../bindings/display/msm/dp-controller.yaml        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 23 +++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c                | 20 ++++++++++++++++++-
 include/drm/drm_dp_helper.h                        |  6 ++++++
 5 files changed, 49 insertions(+), 6 deletions(-)

-- 
2.7.4

