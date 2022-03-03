Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDBE4CC66D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 20:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED0410ECCC;
	Thu,  3 Mar 2022 19:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09410EB1D;
 Thu,  3 Mar 2022 19:48:14 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e6so5577947pgn.2;
 Thu, 03 Mar 2022 11:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nq2rmInutTT50JNuTi3WdH4IenPn5amupYm/+5YS6nM=;
 b=hNYgCPz2O9db5uTiclBrG7nypU306/HnWpqPmcvXxDrb3Qq/m+b/xwi33NQzhl10SB
 2WX61/0O+nw4OEZCNRBiOTvGpCbS5Rileh/+eXGMJm17WjFu4Ba43jHRUtKdmPlJGS/O
 Oj5/Kmr2TtBkh4rFfhazVO2R39j87lvoK3Fz/ZCcXCbQn7YCSpnir5mSohildu8tijVB
 TcbKGpbm36L4N8UtR2WpnsQ53TuXrqDDiFt5LCo8DhIe4wylWjZawHAWY+XHLy3Uaslp
 oOTPkoMcWmA4SW9VI+/x8b4darMCCKgD7i8QP3iVHUvm4CdL+hnSkuMOoXCxmLN+rVTZ
 uLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nq2rmInutTT50JNuTi3WdH4IenPn5amupYm/+5YS6nM=;
 b=x7dGttXLsYxK3lhzqYUkijiyMTuwAMXu0kNL8kF/n9nOIiGxsrPiyX+WJ7DB/6cRyK
 LbbbxKdZWmdj3regdwTQOKFxsqtQ17woU/YWMB9CiqO0mS5s3kgD4yXKkexiUghIhSkM
 BWzU+hhK68YM3fD0jBm4CW/Ca+AF65cf/z7hMso5Vs7jZ5d8388yyS9IpHidBPhXk3r8
 COqY5Kszbmrg8hNEa+oZgpVFv4537qKqhKUSmbW1WhLx/q8gNjCo+6KsVm9CC2JnbxHg
 52JNZZ1KJo+z6OgMFlWy/jcNvcpW9TSFwvASmdA8Wyxny8wUjN4NqWVKAXI/r03Z6GF5
 SXjg==
X-Gm-Message-State: AOAM530a0uEX1NNP6cB2QNfkaHgewcAkHsvWtRHtwU5y3+BUTaNH9DcQ
 sflsM0ciwIVVt9sXgsbnO8PC7sbcobE=
X-Google-Smtp-Source: ABdhPJyDMcOlF9eIIMTPVlfRlQIe07UC4nsuOmCpBbDN4ntch1XnJYQS3Kf6ITfUHnzvOtc1lFCfZw==
X-Received: by 2002:a63:b551:0:b0:378:c0a1:49d6 with SMTP id
 u17-20020a63b551000000b00378c0a149d6mr16343172pgo.296.1646336893725; 
 Thu, 03 Mar 2022 11:48:13 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 nk5-20020a17090b194500b001bf01e6e558sm2889647pjb.29.2022.03.03.11.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:48:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm: Clear perf counters across context switch
Date: Thu,  3 Mar 2022 11:46:44 -0800
Message-Id: <20220303194758.710358-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Some clever folks figured out a way to use performance counters as a
side-channel[1].  But, other than the special case of using the perf
counters for system profiling, we can reset the counters across context
switches to protect against this.

This series introduces a SYSPROF param which a sufficiently privilaged
userspace (like Mesa's pps-producer, which already must run as root) to
opt-out, and makes the default behavior to reset counters on context
switches.

[1] https://dl.acm.org/doi/pdf/10.1145/3503222.3507757

Rob Clark (4):
  drm/msm: Update generated headers
  drm/msm: Add SET_PARAM ioctl
  drm/msm: Add SYSPROF param
  drm/msm/a6xx: Zap counters across context switch

 drivers/gpu/drm/msm/adreno/a2xx.xml.h         |  26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a3xx.xml.h         |  30 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a4xx.xml.h         | 112 ++-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  63 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 674 +++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |  26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  30 +
 .../gpu/drm/msm/adreno/adreno_common.xml.h    |  31 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  14 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   2 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  46 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h      |  37 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h      |  37 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h     |  37 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h    |  37 +-
 .../gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h   |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h     | 480 -------------
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h     |  43 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h            |  37 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h           |  37 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h         |  37 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  28 +
 drivers/gpu/drm/msm/msm_gpu.h                 |  29 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |  34 +
 include/uapi/drm/msm_drm.h                    |  28 +-
 34 files changed, 1051 insertions(+), 1130 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h

-- 
2.35.1

