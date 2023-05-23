Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EDA70DC1D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9893C10E432;
	Tue, 23 May 2023 12:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0BC10E429
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:15:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso8008701e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844096; x=1687436096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pTCAzPM+XQkFg/kFCaBKSjHD1xHDAZL557+xzbBW8Pg=;
 b=O8aNdpq+aoUCR9LbZKAbhLlmkuzkiVY85MB2hAG8Scazsh0ub2rc7iFpIS4M6eiUXN
 g3jEZFhvA9ItaV3f2qU8Nr3Tmjbkej0i4P9JBguM8W5xUsZ5cFJoiRRipHZj/Y6Ss+p6
 aipwqZW8JRryms+XDdyHx+n7OyPqun8D0WmZ+T/1g4pQTcRoPvMEoBT1nTa5yXYR/64m
 V/ZCuIkWjF/p8q/A4WQ4xK9/FK21kcu0Rhf3NLzwm1AwR0ZqtwqYJhd8+ALqp8PY2vEU
 UClCH9e0m0xRZ8XTD9Z1ZsHGO2gu5apuZVMqtQSABO5JG3azZYxjZBe8aSka9U5CHFAE
 bJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844096; x=1687436096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pTCAzPM+XQkFg/kFCaBKSjHD1xHDAZL557+xzbBW8Pg=;
 b=Ax7AcKOkkJPo1xs/Qip5x+lBzzdRgGAV4I3CzTKZzvA4uQLlJ6zaw5Rvx/wREGEoP/
 GfOEhztPTs40tw8Kl9U9fcpjrFc8ZRSpNRcdkpNHPr8oZPiOnYz4JnoqY4k0iaH1YB8Z
 U/LcR/HCCqGjwaFD3hUW5hbkX5So5LWkR3JjdfbEznaEb95muluH/gNqN2uglVgK/gI1
 +dDHq3bWEkhJJ6NNEZ0YIVGb6VN0wuCv+lnyRddaRAJR4qcUS+Vj9qDWq6MeF3r+Q4Pv
 Lfm5O4MapXart0RkAv+fNfgJisz1ahBO8rww3ckVWHW75PtgPoCWTrOr8sLH3YaPXYEx
 MgSg==
X-Gm-Message-State: AC+VfDyygH610+d1GI5hZTw34uZD6Qdq0bsmxrm8+dRobmxupFBZ+H7j
 fGdZW9lzALwBGFlpHo4WNTBGPA==
X-Google-Smtp-Source: ACHHUZ6wZYLIhMnucl76GusJYLoBy4vUy3JkQdEWTKTTJuSuVlVOIIMGz3REICRMgRokSSTOA4O5tg==
X-Received: by 2002:ac2:46ef:0:b0:4f3:a556:61b6 with SMTP id
 q15-20020ac246ef000000b004f3a55661b6mr4318822lfo.3.1684844096123; 
 Tue, 23 May 2023 05:14:56 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:14:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 00/15] drm/msm/hdmi & phy: use generic PHY framework
Date: Tue, 23 May 2023 15:14:39 +0300
Message-Id: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move all the PHYs to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept close. Also in future this will
allow us to use a common set of functions to setup msm8974 HDMI PHY,
28nm DSI PHY and apq8964 SATA PHY (which all use UNI PLL internally).

This also causes some design changes. Currently on msm8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree msm8960
driver and posted, but not merged, msm8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Dmitry Baryshkov (14):
  phy: qualcomm: add QMP HDMI PHY driver
  phy: qualcomm: add MSM8960 HDMI PHY driver
  phy: qualcomm: add MSM8x60 HDMI PHY driver
  phy: qcom: apq8064-sata: extract UNI PLL register defines
  phy: qcom-uniphy: add more registers from display PHYs
  phy: qualcomm: add MSM8974 HDMI PHY driver
  drm/msm/hdmi: move the alt_iface clock to the hpd list
  drm/msm/hdmi: simplify extp clock handling
  drm/msm/hdmi: correct indentation of HDMI bridge functions
  drm/msm/hdmi: switch to atomic_pre_enable/post_disable
  drm/msm/hdmi: set infoframes on all pre_enable calls
  drm/msm/hdmi: pair msm_hdmi_phy_powerup with msm_hdmi_phy_powerdown
  drm/msm/hdmi: switch to generic PHY subsystem
  drm/msm/hdmi: drop old HDMI PHY code

Sandor Yu (1):
  phy: Add HDMI configuration options

 drivers/gpu/drm/msm/Makefile                  |   6 -
 drivers/gpu/drm/msm/hdmi/hdmi.c               |  86 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  79 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        | 108 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           | 217 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c      |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 765 ------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c      | 141 ----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c      |  44 -
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 458 -----------
 drivers/phy/qualcomm/Kconfig                  |  40 +
 drivers/phy/qualcomm/Makefile                 |   8 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c  |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c  | 744 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c  | 531 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c  | 353 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c | 184 +++++
 .../phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c  | 441 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h      |  75 ++
 drivers/phy/qualcomm/phy-qcom-uniphy.h        |  65 ++
 include/linux/phy/phy-hdmi.h                  |  33 +
 include/linux/phy/phy.h                       |   7 +-
 22 files changed, 2562 insertions(+), 1897 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-uniphy.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.39.2

