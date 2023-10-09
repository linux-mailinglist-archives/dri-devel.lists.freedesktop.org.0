Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21967BE8E2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989DA10E297;
	Mon,  9 Oct 2023 18:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E7710E06D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50567477b29so6217470e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875041; x=1697479841; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf3Eadkqm6Sq6Z7urOC8V+yKfv/PCxBmCl4bdQV2+XQ=;
 b=kfASHTs3pNLcv+fUagVeKqjUButEDsuai5rt2XRWq5JcAoAzQWNW1LNuUQhbtO06s5
 Mb6zz+f3K5oMRjZixiyrfznjEJ/6zTVw+bT+J/YYL/vVlnph3KrqyYQqUhBdCjdnGk6s
 5ZT3WspSZNJsq0NlvxlCArmpFF/0OhxDQLLr6BAB79OJBHEc9bERdfsR6Qz8zUY3ZKeC
 TXVf5Z1uaxoEZX0sQb6Xu/ab1TUVCtFD6ihZdZW06zhc7zL2A2AL8a7cum4c5JM7g/82
 N+paPxi3fIKm4f0RkZ9FZWWEYPyD1mSEpZEpA6M0Xm946ddYOmxiWjvMkly/GctUBthX
 MjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875041; x=1697479841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cf3Eadkqm6Sq6Z7urOC8V+yKfv/PCxBmCl4bdQV2+XQ=;
 b=miB5QlDXyWzXAmFtN8bCfhz0FcomI3kOT7XO/m9i3UCQdgGAd6o5r0tTXBPmQnLZqx
 Ub5rQ8EyptZOU2dF7U1pQn3rTfO7DHhkxZsa+eHGZ0qbBzLlncbEFDC/0sXR7FcaLK1m
 Zm+f2ntdLDFiPXKa88XBm8MK1fHBkPlp5+RQFgjch9w/PrEwgCQ1UkTx1JmebJznScfS
 H9y+NjgTkEi9eetUC1VC0rk97NQnRVJn6owQy50rImwbc07XHU4B3krTSUtCS9N+NMaq
 +b2F2eAOl3i+QM/V/9A66/2Y/2U5t7iwJ5pPZLGyptFkqghXXvgKczy9LWO+m1cw3CQ1
 1CxA==
X-Gm-Message-State: AOJu0YxBoTuI00X2tzUbDivUMdEYLMwpye3Yx26EUuLYSq+C3jHPpQiq
 e/4CngBTI2xDIICs9ahiwKB0CA==
X-Google-Smtp-Source: AGHT+IEK23tBwzVPwBfjqxe7yhl9FWdLr7i7xfW87bmEbQPI3jGg+3emkhmQPpGKruvAUsHPjglIpw==
X-Received: by 2002:a19:4f0c:0:b0:4fb:7675:1c16 with SMTP id
 d12-20020a194f0c000000b004fb76751c16mr11472469lfb.49.1696875041633; 
 Mon, 09 Oct 2023 11:10:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/13] drm/msm: move KMS code from msm_drv.c
Date: Mon,  9 Oct 2023 21:10:27 +0300
Message-Id: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:

- Rebased on top of linux-next / updated version of [1]

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
 drivers/gpu/drm/msm/msm_drv.c            | 362 ++---------------------
 drivers/gpu/drm/msm/msm_drv.h            |   9 +-
 drivers/gpu/drm/msm/msm_kms.c            | 345 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h            |   3 +
 20 files changed, 451 insertions(+), 478 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c

-- 
2.39.2

