Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03B745334
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0D810E052;
	Mon,  3 Jul 2023 00:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA98410E053
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6a662b9adso56492231fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344666; x=1690936666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uEqbnXVxf/GNYZWDqu5WzEIx3jBHqt95bZSu9ReOEu4=;
 b=tA4b1xkWhX6GhJ89GDMNG7DrGR4HxIQ4tfldfYQXhZglVBcEvyJe9GQmPkL8NhfeO7
 yJhk3NreIbXtGKqSAd88epwtGtepPwTUq1ijfRkPhr97ijeqjs4P2oJ+Ssc0IWIVPOKV
 jqWs1af7Vqa4+13dwidHvNdm2f40iACit8Hm5ZoKeUApZo8SKCIQi7aMkNqau0pfNIHT
 gdNjP3lgNHXlHTSegQtfbp33mmsye+Sxk4oikQ02NM7HoqVRA2whp8LfmKw6ahOTL74l
 NqHYGlLRU1dNBgQh35+n01epMWRx2PyRmLiq/sc4TPwog3Wwr6kKCoNg9b6t3GBAVC3O
 VkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344666; x=1690936666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uEqbnXVxf/GNYZWDqu5WzEIx3jBHqt95bZSu9ReOEu4=;
 b=bGPq+bkg957flg28oUV9OHJgl9JhT/Yn8pZf5Ur7fOkhlcPOWSSmXi5LybAKoMIKoE
 1WwC8+uSVjq+iJ8MNYcVvbkKMr40dqanWJ2EV0oIc+xruwegDOgTVRF1o85ELehoJ6PB
 lZrV0+39fJLlZL7WLmw//jDF4uC56I7Qlnlsi4BVY9hk0TkI1lYcfAh5PxoPVgyLhVwr
 tFq3KtQcrNQMSRR4KdvXYT97Oerr6xDPV8JG2slmDdVGL54FqhQUYmB/zlRuUzHizcPu
 SW61HK45Gf91YorOstKONXHycD9xVp82GHuqnnb7RanvV5B5M/tIreKfbUapzhwq2WkH
 dlfw==
X-Gm-Message-State: ABy/qLZOheeu4AnC1mUOgHPkQ5vRPIjQCU7FOJOrqEXPehjqwIgBVuTL
 usRinc6J9EfN8gH/WzpiAfjjbw==
X-Google-Smtp-Source: APBJJlH08bD5q58Qm4UG0tiu2t9Qn+5iQ3LV0DEG7A/qE4k1z0q8Db0JVreiyEz8VnNJIyWwlnwhtw==
X-Received: by 2002:a2e:a41a:0:b0:2b1:a89a:5f2b with SMTP id
 p26-20020a2ea41a000000b002b1a89a5f2bmr5475280ljn.2.1688344666693; 
 Sun, 02 Jul 2023 17:37:46 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 00/13] drm/msm: move KMS code from msm_drv.c
Date: Mon,  3 Jul 2023 03:37:32 +0300
Message-Id: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently both msm_drm_init() and msm_drm_uninit() functions are trying
to handle both normal and headless Adreno cases. This results in a
suboptimal code, since headless case still gets modesetting and atomic
interfaces enabled. Two mentioned functions are a spaghetti of
`if (priv->kms)' conditional code.

Move all KMS-related code (not limiting the init / teardown path) from
msm_drv.c to msm_kms.c, making it more self-contained. This also
disables ATOMIC and MODESET features for the headless case.

Dependencies: [1]
[1] https://patchwork.freedesktop.org/series/105392/

Dmitry Baryshkov (13):
  drm/msm/dsi: switch to devm_drm_bridge_add()
  drm/msm/hdmi: switch to devm_drm_bridge_add()
  drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
  drm/msm/dp: switch to devm_drm_bridge_add()
  drm/msm: remove msm_drm_private::bridges field
  drm/msm: drop pm ops from the headless msm driver
  drm/msm: rename msm_pm_prepare/complete to note the KMS nature
  drm/msm: remove shutdown callback from msm_platform_driver
  drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
  drm/msm: switch to drmm_mode_config_init()
  drm/msm: only register 'kms' debug file if KMS is used
  drm/msm: make fb debugfs file available only in KMS case
  drm/msm: carve out KMS code from msm_drv.c

 drivers/gpu/drm/msm/Makefile             |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   6 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |   6 +-
 drivers/gpu/drm/msm/dp/dp_display.c      |  34 +--
 drivers/gpu/drm/msm/dp/dp_display.h      |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  21 +-
 drivers/gpu/drm/msm/dp/dp_drm.h          |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c            |  28 +-
 drivers/gpu/drm/msm/dsi/dsi.h            |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  22 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h          |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c      |   3 +-
 drivers/gpu/drm/msm/msm_debugfs.c        |  12 +-
 drivers/gpu/drm/msm/msm_drv.c            | 363 ++---------------------
 drivers/gpu/drm/msm/msm_drv.h            |   9 +-
 drivers/gpu/drm/msm/msm_kms.c            | 345 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h            |   3 +
 20 files changed, 452 insertions(+), 478 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c

-- 
2.39.2

