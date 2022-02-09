Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530774AED53
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B786E10E644;
	Wed,  9 Feb 2022 08:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793A810E61A;
 Wed,  9 Feb 2022 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644396950; x=1675932950;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=y0yZ5q/+c6SfYwXnH7eqJbGk8kSf6a0eSUhic2wJcrY=;
 b=bUN9Uj7fS+AiXXixBMbXrC6T2ZbbJDzu9zYiv6ltmf6VESa1a2z232Iy
 IbrdwiQXTvMTjq3YL8CvflHVV1SxZF9IOdARI9i5C3iE4P4psnTaxQB2j
 zoUUVRSHeZTiTjhW1lPPMjyO5XQUT954dZnvKoYpV5Tc6AnCT5ZZeQd9y M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Feb 2022 00:55:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:55:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:55:49 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:55:42 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 0/4] Add support for the eDP panel on sc7280 CRD
Date: Wed, 9 Feb 2022 14:25:28 +0530
Message-ID: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
 quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the eDP panel on sc7280 CRD platform. The eDP panel does
not need HPD line for connect disconnect. So, this series will report eDP
as always connected. The driver needs to register for IRQ_HPD only for eDP.
This support will be added later.

These changes are dependent on the following series:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=586263&archive=both&state=*
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=560587&state=%2A&archive=both


Sankeerth Billakanti (4):
  dt-bindings: display: simple: Add sharp LQ140M1JW46 panel
  arm64: dts: qcom: sc7280: Add support for eDP panel on CRD
  drm/panel-edp: Add eDP sharp panel support
  drm/msm/dp: Add driver support to utilize drm panel

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sc7280-crd.dts            | 122 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   8 ++
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  54 ++++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   3 +
 drivers/gpu/drm/panel/panel-edp.c                  |  31 ++++++
 7 files changed, 216 insertions(+), 6 deletions(-)

-- 
2.7.4

