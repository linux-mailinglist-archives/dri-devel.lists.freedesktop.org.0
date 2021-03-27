Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0934B661
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00296E3EF;
	Sat, 27 Mar 2021 11:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05B86E3E3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o10so11464145lfb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KZDpEXPQmSxpWJA5pbH10vAd6wTYvaEgEWkgKJ7hknY=;
 b=xbeuY4fHeWgajQPrP2wfQ/qKNf1IQvjaHgMipZUKetQ+GwVwfTw4vcPFgntVtYD23+
 koQfFVqRIKx2AL2+AsQ3FbD2ed71A2hUiPD8JREN9dTO2PIlVAX1eWN15SrnljBucFEv
 c2oCkOPYGO8VQP8R0ozuxE9b0+BdGsFnNEAOZ9+MyfuLQqmB4+3SFk5cB/g1oanT1+kZ
 OQa2suhjwGiZEzWuMTfKwBT+1IroRx7pRG3StbS0F+yX+L+A34ToLRZDNlAmOMUsoWoF
 jFKe71m+AURunrBZibU6aQZxx5/HZrkEjZMtfx0fjv8MRdlFt6I1zjwzHHv2KMyk6DUW
 kTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KZDpEXPQmSxpWJA5pbH10vAd6wTYvaEgEWkgKJ7hknY=;
 b=Z+qCz1ViqdkHAF8w6iwCfI/U4MMkDSfzuGS+Y3cmlTqcVKWMe64XBUEmXngprvV/hP
 fD/srHeolGL72jEroF2ze18GuBZrb2q0AAyOmMZjVV5DImJCpUVeKM6A6YsPuftNCzx5
 7odNYjRrJ0p4ZAjZ4t8LHpvJaD1sFwVLoqmUHWaO628SPFdRJ2Dy00cdndNZwWs5r0lP
 XCmRTJk7DNqw2E9wx1B4VAL1RsdtFz4DQnCDxTXTiMi0jlQ84hJO2Bl2s5gLlXCdB5LD
 1R0ATe8QPJ90fVBeMfC7IZtRGxy37mVWgab/XP1SZ5Y3mEpv3gdRqj7mDQ3OyKv1fBNV
 vzlg==
X-Gm-Message-State: AOAM533Nley6BiADp6XK9y+3WGWreDMvMX2IBbxjz7z2sn9EvpitULeL
 wcEdvDoGaAkEqyuGfKem76oYl0VshfHJxQ==
X-Google-Smtp-Source: ABdhPJzKlkUYKA9Z7ZuJKCxOltu1RQmG+F/4OudHEO78+/n3taFdvD3MWfzQYmmMt+9YO4BNe0PW8Q==
X-Received: by 2002:a19:3804:: with SMTP id f4mr11362701lfa.117.1616842991268; 
 Sat, 27 Mar 2021 04:03:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v3 00/25] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date: Sat, 27 Mar 2021 14:02:40 +0300
Message-Id: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

The patch 'clk: fixed: add devm helper for clk_hw_register_fixed_factor()'
is already a part of mainline as of 5.12-rc1, but is included here for
completeness to fix compilation issues (as msm-next is based on 5.11-rc5).

Changes since v2:
 - Drop the 'stop setting clock parents manually' patch for now together
   with the dtsi changes. Unlike the rest of patchset it provides
   functional changes and might require additional discussion.
   The patchset will be resubmitted later.

Changes since v1:
 - Rebase on top of msm/msm-next
 - Reorder patches to follow logical sequence
 - Add sc7180 clocks assignment
 - Drop sm8250 clocks assignment, as respective file is not updated in
   msm/msm-next

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.
 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.

The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume (2021-03-22 18:52:34 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-3

for you to fetch changes up to da7ba6797b2899a78774fb89e586e79a1001eff4:

  drm/msm/dsi: stop passing src_pll_id to the phy_enable call (2021-03-27 13:56:26 +0300)

----------------------------------------------------------------
Daniel Palmer (1):
      clk: fixed: add devm helper for clk_hw_register_fixed_factor()

Dmitry Baryshkov (24):
      clk: mux: provide devm_clk_hw_register_mux()
      clk: divider: add devm_clk_hw_register_divider
      drm/msm/dsi: replace PHY's init callback with configurable data
      drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
      drm/msm/dsi: drop multiple pll enable_seq support
      drm/msm/dsi: move all PLL callbacks into PHY config struct
      drm/msm/dsi: drop global msm_dsi_phy_type enumaration
      drm/msm/dsi: move min/max PLL rate to phy config
      drm/msm/dsi: remove msm_dsi_pll_set_usecase
      drm/msm/dsi: push provided clocks handling into a generic code
      drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
      drm/msm/dsi: use devm_of_clk_add_hw_provider
      drm/msm/dsi: make save/restore_state phy-level functions
      drm/msm/dsi: drop vco_delay setting from 7nm, 10nm, 14nm drivers
      drm/msm/dpu: simplify vco_delay handling in dsi_phy_28nm driver
      drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
      drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
      drm/msm/dsi: drop msm_dsi_pll abstracton
      drm/msm/dsi: drop PLL accessor functions
      drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
      drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
      drm/msm/dsi: remove temp data from global pll structure
      drm/msm/dsi: inline msm_dsi_phy_set_src_pll
      drm/msm/dsi: stop passing src_pll_id to the phy_enable call

 drivers/clk/clk-fixed-factor.c                  |   39 +-
 drivers/clk/clk-mux.c                           |   35 +
 drivers/gpu/drm/msm/Kconfig                     |    8 -
 drivers/gpu/drm/msm/Makefile                    |    9 -
 drivers/gpu/drm/msm/dsi/dsi.h                   |   60 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |    4 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |   30 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  161 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   41 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  745 ++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  939 ++++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |   16 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  654 +++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  479 +++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  772 +++++++++++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  184 ----
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  132 ---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c      |  881 ------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      | 1096 -----------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |  643 -------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  526 -----------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c       |  913 -------------------
 include/linux/clk-provider.h                    |   34 +-
 23 files changed, 3732 insertions(+), 4669 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
