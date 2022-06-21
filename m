Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209CC553054
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAC01121E7;
	Tue, 21 Jun 2022 10:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F12112155;
 Tue, 21 Jun 2022 10:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655809125; x=1687345125;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mb5DQUx++WBYqHBb28dKoW1PAZ+4l8zH8PF2XnRF4bc=;
 b=qKmKe4AzmoQU8g6dNIdfaOEgrZLBYD5scKHXo9IPyl2UEKW9bZOChQ6p
 T6ZuEl4SdQ89ODZRArc+TpoEMLZ2imiB5RDLZW5nKV2h34ZH8pXpTQurL
 3BySUJ2x2X4rZVmWWBZLyOaasNVJCdOu0YGokowXwVJGesNYky1pbRDh2 M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 21 Jun 2022 03:58:44 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Jun 2022 03:53:44 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 Jun 2022 16:23:27 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 32B123CF4; Tue, 21 Jun 2022 16:23:26 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v3 0/5] Add PSR support for eDP
Date: Tue, 21 Jun 2022 16:23:15 +0530
Message-Id: <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
  - Use dp bridge to set psr entry/exit instead of dpu_enocder.
  - Don't modify whitespaces.
  - Set self refresh aware from atomic_check.
  - Set self refresh aware only if psr is supported.
  - Provide a stub for msm_dp_display_set_psr.
  - Move dp functions to bridge code.

Changes in v3:
  - Change callback names to reflect atomic interfaces.
  - Move bridge callback change to separate patch as suggested by Dmitry.
  - Remove psr function declaration from msm_drv.h.
  - Set self_refresh_aware flag only if psr is supported.
  - Modify the variable names to simpler form.
  - Define bit fields for PSR settings.
  - Add comments explaining the steps to enter/exit psr.
  - Change DRM_INFO to drm_dbg_db. 

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Vinod Polimera (5):
  drm/msm/dp: Add basic PSR support for eDP
  drm/bridge: use atomic enable/disable callbacks for panel bridge
    functions
  drm/bridge: add psr support during panel bridge enable & disable
    sequence
  drm/msm/disp/dpu1: use atomic enable/disable callbacks for encoder
    functions
  drm/msm/disp/dpu1: add PSR support for eDP interface in dpu driver

 drivers/gpu/drm/bridge/panel.c              | 110 ++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  36 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  30 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 ++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c            |  76 ++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c         |  14 +++
 drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c             | 166 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_link.c            |  36 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.c           |  22 ++++
 drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h             |  27 +++++
 15 files changed, 591 insertions(+), 24 deletions(-)

-- 
2.7.4

