Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71004BDA63
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9650310E668;
	Mon, 21 Feb 2022 14:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36C010E5F4;
 Mon, 21 Feb 2022 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645455121; x=1676991121;
 h=from:to:cc:subject:date:message-id;
 bh=0r70U4Ls0HL3+dHw7RRmyaZy44+ZP9FEugYbM/LwvYU=;
 b=q/1LlQsFBbt3F4bIMoWht9ei3ytSg8QWvlPAAI1dzG9f0+B/haOV5x9T
 vEWo1x5wKy8UVrEXXdVMefDExLg271Anf5aopQ0t5qjOHawsAj2g5RLR0
 4FyYFmm/BnT8te7HRzbcJgGrQjXCOmXbAts/eWY/Kg0Q3JB1tDhFuRI81 E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2022 06:52:01 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2022 06:51:59 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 21 Feb 2022 20:21:32 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id AAA7E5392; Mon, 21 Feb 2022 20:21:31 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, robdclark@gmail.com, seanpaul@chromium.org,
 swboyd@chromium.org, dianders@chromium.org,
 krzysztof.kozlowski@canonical.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/4] Add PSR support for eDP
Date: Mon, 21 Feb 2022 20:21:22 +0530
Message-Id: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

*** BLURB HERE ***

Vinod Polimera (4):
  drm/msm/dp: Add basic PSR support for eDP
  drm/bridge: use atomic enable/disable for bridge callbacks
  drm/msm/disp/dpu1: use atomic enable/disable callbacks for encoder
    functions
  drm/msm/disp/dpu1: add PSR support for eDP interface in dpu driver

 drivers/gpu/drm/bridge/panel.c              | 102 ++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  31 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  40 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c            |  63 ++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c         |  14 +++
 drivers/gpu/drm/msm/dp/dp_display.h         |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c             | 177 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_link.c            |  22 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c           |  21 ++++
 drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h             |  19 +++
 drivers/gpu/drm/msm/msm_drv.h               |   6 +
 16 files changed, 568 insertions(+), 24 deletions(-)

-- 
2.7.4

