Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04055160AE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 23:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2D310E335;
	Sat, 30 Apr 2022 21:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A322510E364
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 21:55:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p12so19637545lfs.5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hzFGGotlG7RlR3r+aJsAnarQlq0qwF4e5LkUUWTXHdg=;
 b=MPDiP134izRt4GfK1GWHrpbIR7KbcRcviRlV5MeyysEimI+615eScwZII4ZAqFoDVb
 6FWzMJ4BF8bUqYRUbLkVat+kAXlNw+cuOFkUuAlhZNk5R3cxTJQLmj1lZIoXK/sAYs9c
 7kUiPRqJL59RKY3muhJbBl8gQuBgKCKmrJGSpLQMh8VvzOoFEYzTPtZbUUscCQ7M+Khs
 AFRZWEiwMgG1mVUECncNkqM9mAYmYv3LpsNVJ9vU7AiTucCdXOsMZfgMOsay6oAiN8kj
 x37EZ84/QV3GGQOmWg2b1wfhkUB4ntZKVDBa9QTobfgNspEv+mIA0iiVAziKidR1vi9E
 kzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hzFGGotlG7RlR3r+aJsAnarQlq0qwF4e5LkUUWTXHdg=;
 b=UJ/+2kza1ps2I/AOVxD5Rx48OIzqtN6fJ8TEw7HeImxNT7wkJCWeJjMQysGLtTrFjP
 tq/tR8w+8ZM3Hji4toCQHuG/jm2b/M/XzYdHcdVNmEdPbkttXgPwEVWQ7oiEgNhIFU3L
 RwiiblHAMwAJZjKvg0Jk9Q4CcfXFVxwpaNiLRh3gqzm1KS7spe0fQdA8F74CskiZV8Nd
 FLTwIUe8MTGXWEOYDajh74347/Zk6CLIEOTDwLHbRnfxAW7nGlotDFqws8yUqfnTVwjD
 LRxPbBiIEh1nBG+Yle+kh+51r43djQqJXskEHUSBmvcmQTwBLyTp0o9F4ukUU3k9L74/
 bOWw==
X-Gm-Message-State: AOAM530EX6b8xWZPSVLWyeh6sk2pCoALX14bVDA+y8kPClo8/IZIrKQv
 7YwNCbKHZAalaGaFUr8w2biTRg==
X-Google-Smtp-Source: ABdhPJyeOGfm8FWZb1tKY9hXrt3tqJ7LKc9TbQ7XVv+O/za6eefQaeBt868EPs8ExkFvEwYJrZnaqw==
X-Received: by 2002:a05:6512:2202:b0:472:2130:40ea with SMTP id
 h2-20020a056512220200b00472213040eamr4349197lfu.349.1651355733682; 
 Sat, 30 Apr 2022 14:55:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25102000000b0047255d21151sm282111lfb.128.2022.04.30.14.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 14:55:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PULL v2] drm/msm: several fixes for the 5.19 branch
Date: Sun,  1 May 2022 00:55:32 +0300
Message-Id: <20220430215532.3850521-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Please pull the following few patches into the msm-next(-staging).

They are mostly minor fixes for the issues reported by robot, a patch to
silence CRC warnings during modeswitch, a change to use initializers in the IRQ
regisers array.

The following changes since commit d2dc68276133362f021bc8d429433b5818826c81:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-04-27 13:44:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to 432c0e2685e025eefe188135d617dc476fba69f2:

  drm/msm: drop old eDP block support (again) (2022-05-01 00:02:38 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: remove unused refcount for encoder_phys_wb

Dmitry Baryshkov (3):
      drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
      drm/msm: add missing include to msm_drv.c
      drm/msm: drop old eDP block support (again)

Jessica Zhang (1):
      drm/msm/dpu: Clean up CRC debug logs

Marijn Suijten (1):
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Vinod Polimera (1):
      drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table during probe

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    8 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    5 +-
 drivers/gpu/drm/msm/edp/edp.h                      |   77 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
 drivers/gpu/drm/msm/msm_drv.c                      |    1 +
 9 files changed, 36 insertions(+), 1482 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
