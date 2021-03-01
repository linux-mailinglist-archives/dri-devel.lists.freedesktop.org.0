Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E60329509
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 00:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86E189D9A;
	Mon,  1 Mar 2021 23:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C3789DA3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 2so17071867ljr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKDf3QO37bgAs0Xrvk527NLCW0728Tq3GZSclgxPbb4=;
 b=f/qKmhYB12KE9d1JmkLIUYuvF0QzqnjXrHTl42WXoRWJB/k0Q9cUPE3vIEQbY3aL3b
 Xyc+hyX48ABrYsaXdrzZeuGwTTKdlfVFcu0FPCLBeTpUTiYUmdREsund/sz4ZrIGOi3S
 1y15/amRDBnyeDdXx3BRIK+zHOVBYfCjNtp0c7oq9f6u0KP9IqL9pNQotl5Y03SRFKY5
 5mpjl/Fbwv8fgh2vSMExevw47CkX1/8GYvH3IjXz7S+xHILUCYlIBEEUdU0upc33zco3
 EVSFP8oMxMUQ+/4NB3xxpzBoPhvZlhnUNsGHiugcEmtFbfelSmJiDYVJ0+6syFgiNozH
 QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKDf3QO37bgAs0Xrvk527NLCW0728Tq3GZSclgxPbb4=;
 b=pF62fvGKEydkzibTFvNicXRghMhNRPMcWuRJY5JwAathE1tG4lDgwU6ZicTEOkkGpM
 77LJEc/7oSgTRYiVFbdWkcH3kxHg/jUcG0I9aQeiC5MvD5XhNuKm1E/O+HgydVcKt/RP
 ixxj6ppSoInY9iR/sTGzk6vbDCX/yPPuIj8DZMJvMOYTWEyGzTpTNjuTxMoWwOr6BaCa
 v8hGuIKDsWakfSyxLtlnPha5Jze0XjXoq31vSNSl6RzPbnVhfQw7+nA8pV8O0Q6zplcc
 lOJLTgwLnXb/ZLbA4x9fG9Q3wMdxFKvlJq2wfB6ntUI4hrN+CV0efr5dyHbM112v7ceu
 utYA==
X-Gm-Message-State: AOAM531Z+N/CCwmJ4u+aWH5tpkWU5Bii/h/J/kt/lbPvThpNSLliZxw7
 VXW2dw6aX6ctbLn8LGZp6UiLpg==
X-Google-Smtp-Source: ABdhPJwnByTzd2iAiMVc77lpgPAWpGltVB+jZ16ovZKzkKSZ9cAYy0ubIBSqT98LKT2EdjT4wJfNFw==
X-Received: by 2002:a2e:8e7a:: with SMTP id t26mr10261462ljk.243.1614641167817; 
 Mon, 01 Mar 2021 15:26:07 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 00/24] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date: Tue,  2 Mar 2021 02:24:43 +0300
Message-Id: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
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
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an RFC attempt to restructure MSM DSI PHY drivers. What started
as an attempt to grok the overcomplicated PHY drivers, has lead up to
the idea of merging PHY and PLL code, reducing abstractions, code
duplication, dropping dead code, etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and lightly tested on RB3
(sdm845, 10nm), DB410c (apq8016, 28nm-lp).

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  ssh://git@git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-rfc

for you to fetch changes up to 819a9071587f1acba14a6780f422d78fdb55d671:

  arm64: dts: qcom: sdm845: assign DSI clock source parents (2021-03-02 02:23:14 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (24):
      drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
      drm/msm/dsi: drop multiple pll enable_seq support
      drm/msm/dsi: move all PLL callbacks into PHY config struct
      drm/msm/dsi: move min/max PLL rate to phy config
      drm/msm/dsi: remove msm_dsi_pll_set_usecase
      drm/msm/dsi: stop setting clock parents manually
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      drm/msm/dsi: push provided clocks handling into a generic code
      clk: mux: provide devm_clk_hw_register_mux()
      clk: divider: add devm_clk_hw_register_divider
      drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
      drm/msm/dsi: use devm_of_clk_add_hw_provider
      drm/msm/dsi: replace PHY's init callback with configurable data
      drm/msm/dsi: make save/restore_state phy-level functions
      drm/msm/dsi: limit vco_delay to 28nm PHY
      drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
      drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
      drm/msm/dsi: drop msm_dsi_pll abstracton
      drm/msm/dsi: drop PLL accessor functions
      drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
      drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
      drm/msm/dsi: remove temp data from global pll structure
      drm/msm/dsi: drop global msm_dsi_phy_type enumaration
      arm64: dts: qcom: sdm845: assign DSI clock source parents

 arch/arm64/boot/dts/qcom/sdm845.dtsi            |    6 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |    6 +
 drivers/clk/clk-mux.c                           |   35 +
 drivers/gpu/drm/msm/Kconfig                     |    8 -
 drivers/gpu/drm/msm/Makefile                    |    9 -
 drivers/gpu/drm/msm/dsi/dsi.h                   |   56 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |   51 --
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |   18 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  129 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   31 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  741 ++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  925 ++++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |    3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  662 +++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  476 +++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  769 +++++++++++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  184 ----
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  130 ---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c      |  881 ------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      | 1096 -----------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |  643 -------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  526 -----------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c       |  912 -------------------
 include/linux/clk-provider.h                    |   30 +
 24 files changed, 3678 insertions(+), 4649 deletions(-)
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
