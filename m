Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645953CC360
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 14:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C3A6EA71;
	Sat, 17 Jul 2021 12:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58FD6EA6D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 12:40:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g22so8773616lfu.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxluHM0Kg15VbQXdZCw+cTpPGVJhl2e5U5S77sNpUgo=;
 b=F9qPRPbpZ/MDYTWcuECxoE5ld2DSfHlPETZMJQHvSEijtH3I/iL40+g81qNU9R7+gr
 I7brVhaVnH+ycpS6c41cgUmoa+K4kcFXKxtzpEVbJlVjWTUzlT2DLtwsTJVuh7J/ca43
 PBbb/c3sONb9VuZtLxfWZvOMHwyj9Yn0IfmZJJT16cUeOpF/gMSABHr65sOTi2BagLRI
 /O1Az3q/CFAETL2UKdhQXTBC+Jz6nc8k189A5M9Eb2kBWALZcLTlzf1DHjTqYKjbFHTA
 YRNXumeDk+0WkRNSF+vf6ZXBLYrzJnZHUB2lP9H+ajhflM+w9/Hs6GiZZE9prm2sQyA6
 7UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxluHM0Kg15VbQXdZCw+cTpPGVJhl2e5U5S77sNpUgo=;
 b=IDI+HWfGTrgV4pmAV17mFeaM1pBN4I+sPF2Racn/f3JtMOGgRNwpkuZmgz59QnOA2i
 5eWX7BiR5k9kxdI2P13eyw+x/hNIK6Yi2zfo4mDFweHgWSnpWBk/B/u5npMl6vs1Qtl6
 06kQV1ydDn4pv/7r4eKtY794s/JUGJnACzUuwjZHbEI4z+i4AdzZgmbQGdjm/ylD7UB8
 aWkQYEnPnvtDNCIBAk1jyQTahte/ozW3BUizCWSZMUXOz8qIL5oiM5m1xUJm2FTKVg1d
 Yk034jx6EhJonim1J8croKfMS0WpWRNl/oXWRzGskrvNvEiuk9pN+H6iT5efRfTWMGJD
 PKVg==
X-Gm-Message-State: AOAM533Igw17CFaY4L9KcGV1t+aPv5ghLYDr0ZWKfwRkvGLohwtXpZ8/
 ktOutiMu5220WX8/u3Vtb3E+1A==
X-Google-Smtp-Source: ABdhPJwISVShNgvCCESFTQM5nE5x7zXB8RXC/C4BdlA6CqHjawE14xWbC81UHGBs5rPw8sEl2p9iEg==
X-Received: by 2002:a19:6752:: with SMTP id e18mr8871245lfj.144.1626525620946; 
 Sat, 17 Jul 2021 05:40:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 05:40:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 0/7] drm/msm/dpu: add support for independent DSI config
Date: Sat, 17 Jul 2021 15:40:09 +0300
Message-Id: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
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

Changes since v3:
 - Fix missing semicolon in the msm_dsi_is_master_dsi() stub as noted by
   the kernel test robot

Changes since v2:
 - Removed Reviewed-By tags from changed patches (1, 2)
 - Changed more dual DSI mentions in the patch 1
 - Added msm_dsi_is_master_dsi() helper
 - Rewrote dsi encoder setup function again basing on review by Abhinav

Cahanges since v1:
 - Rewrote dsi encoder setup function by separating common code sequence
   and calling it either for the bonded interface or twice for each of
   the DSI hosts.

Changes since RFC:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage


The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-4

for you to fetch changes up to 75dcb396a3230046f5967bd7363d6b8cab0bf743:

  drm/msm/kms: drop set_encoder_mode callback (2021-07-17 15:36:41 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add three helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 102 ++++++++++++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c   |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  11 +--
 drivers/gpu/drm/msm/dp/dp_display.c        |  18 ----
 drivers/gpu/drm/msm/dsi/dsi.c              |   9 +-
 drivers/gpu/drm/msm/dsi/dsi.h              |   9 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h          |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c         |  34 ++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c      | 130 +++++++++++++----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |   2 +-
 drivers/gpu/drm/msm/msm_drv.h              |  17 +++-
 drivers/gpu/drm/msm/msm_kms.h              |   3 -
 14 files changed, 170 insertions(+), 177 deletions(-)



