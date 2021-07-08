Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E13F3BFA25
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7112989F31;
	Thu,  8 Jul 2021 12:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3777089E69
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:47 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q18so14990393lfc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8CufoHY4b7Kdk/bGCgQwPghMrG3yF81c9YnZwFkA3Kc=;
 b=ioy8/5VastZrNccn7z2GRjdchRkTPdgIBgh/B9OctiBcWm5R/RNkRNoLblVP2M7/wx
 1NRJPTlAtmHMc7oOF2MKoxtyuazj4qb1bXWNYiByVwiFssKY8fbOvZ6llwrRH0CF2pnR
 PNNkIvWd2iEhW1MBjiiss3NbWayUjNimG90kyaIE4y3+v0sdOoKAFvRdiPGiIi+HrEIx
 oNMMGA479wZDe8bJpaBqjjmsbqRITlLPfH4D78z7peA4pQslpHudp7+9NbTeca3iE26W
 FeZnBbzMviUaafwPUQ6NMGGdecVJSU0MnM5mycWPIDBzRkA4qJxsS4mRG/KVI6k89CBT
 aM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8CufoHY4b7Kdk/bGCgQwPghMrG3yF81c9YnZwFkA3Kc=;
 b=p4tjQf9YqNTmphtKin1iCtLZSohZukKw1dy7pRxBo1up7rlz8auHIKJl70GeWn7RW/
 dKvK8blsq1j+OtRlWzd4AxV7fMmCMTsbALSnTgffTk0KyFFhcNCbD7xiUPOvsVGlML09
 e14KaHwZ0HbGJpjV9c6KDE0NASII21FXr2mt7jwnloinSdhjn/VHjQhMf1/V4M6ubf1h
 GYhj2pxr2S32TCKBUxSNoCMnUFrCGduEm5mQtcyzf6ydWZZ1boYZ9zXZYZNWMVOEDdJV
 D7BK+kRGzyq9bet/jPv7l2dICK7v6oB7Lt1VZRbyVXcl3YBgFd73bCvuZ9CM0lAJGyU4
 fk/Q==
X-Gm-Message-State: AOAM530E09JMnAEFItzLh77J/2XnvdVfqKOlNpr/8G2SOLXJlQ5e8LU3
 LfSljW9BFyMe5YoLetO4KE33fQ==
X-Google-Smtp-Source: ABdhPJyftfBglnVIO3dRbWrXzjZDUxoP7xSZBt8uQU7GalcDpSNDqO6l6dPH8Jqlr7U8cx3iGkCbYg==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr23628480ljn.331.1625747325564; 
 Thu, 08 Jul 2021 05:28:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 0/7] drm/msm/dpu: add support for idependent DSI config
Date: Thu,  8 Jul 2021 15:28:26 +0300
Message-Id: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchseries adds support for independent DSI config to DPU1 display
subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
now.

Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
Minnekhanov.

Changes since v1:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-1

for you to fetch changes up to 142f79dfc41271576731a49516d63ad47a56e1ca:

  drm/msm/kms: drop set_encoder_mode callback (2021-07-08 15:20:52 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add two helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 102 +++++++++++++++++--------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  11 +---
 drivers/gpu/drm/msm/dp/dp_display.c      |  18 ------
 drivers/gpu/drm/msm/dsi/dsi.c            |   9 ++-
 drivers/gpu/drm/msm/dsi/dsi.h            |   9 ++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h        |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c       |  30 ++++-----
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  93 ++++++++++++----------------
 drivers/gpu/drm/msm/msm_drv.h            |  12 +++-
 drivers/gpu/drm/msm/msm_kms.h            |   3 -
 10 files changed, 136 insertions(+), 153 deletions(-)


