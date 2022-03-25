Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F1E4E72D8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7326A10E1EE;
	Fri, 25 Mar 2022 12:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C545C10E1EE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:17:40 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u3so10090545ljd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJpZ4NYnVX6K1Z2aT+F++WJPO52SFbhSGOdmMUxAXQw=;
 b=fWJFTvMmTwptlT5sDzclx+zIACzB+S15RspnPUeX2wsZttZ0tFAC/xFR5zwRpsFZTw
 fQXET3Pi3BlKfBCoKJllvaV7QPY5QoNH/6OLW/7EXXqG4QEJLgt2Cv2g1dmw+fGJs4Yv
 B5rp0MRbgM8hYs0ekApb/GTBHq4LgQsa4J61wTpHWxLk2w2BGMA0nTBphHl7vqUvLx/U
 H3GlHq2WmE8kbEiecnz5no0lyVgPBxapfR+PfEYe36BXB+xpPTPSoGJpMDGiagdY2nYE
 y2ab96PktSEWiqp24uJhjlFWckPAxVuCPfluIaIM8zQt9gdaGr2QPk60Vfg6BsW0Of4x
 5wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJpZ4NYnVX6K1Z2aT+F++WJPO52SFbhSGOdmMUxAXQw=;
 b=vw8k9/PLk2K4gs3A95t1T0UAtLQ7hoM4SXjf3uPgvwId5hmYgnhrCHSwcrZQLtBStM
 P69hEJSLG2KYXfhpAr0gc2XNJn+YF3lttLzszBKV9Go3wos1RhojTCzRcy4NVkocnkqa
 /CMAyl9zw7ZhtXTzk/VuEflBjZ2hpaHx3xWcNzJtf3IX3TsHEIbv4nD/OyaTSfFAR/Se
 EALdc7/tqcwjjfs9Mo54iH+2OrnXufpIr2Cs6BE7salrF116t/q9BlAfNzx0d+JhLQCs
 QiRo4iTZ2pZiCs5kGNTJnIPi8dY4z+4qW+fDi2SnrjfAnzZDzbKaKT+dFoYGn+3pWV8F
 3y7w==
X-Gm-Message-State: AOAM530+Nec8eJreQmtv3ZXCyidhRwNifzs/ZAfFoN4U2GVY4ZGYJ4PU
 H++Y/pGJgFzF9JWVywmMM51k13gnaihCxg==
X-Google-Smtp-Source: ABdhPJyPaIqbaJBFLJjxsGZtVPxZaVcjcn/xnr1YqspmRUY89/OQUB6SByvKvruU+1V1dHJ7dQ9F6Q==
X-Received: by 2002:a2e:9c99:0:b0:249:146e:57a9 with SMTP id
 x25-20020a2e9c99000000b00249146e57a9mr7762474lji.319.1648210658931; 
 Fri, 25 Mar 2022 05:17:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.164])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05651210c900b00448956cb40csm688489lfg.109.2022.03.25.05.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 05:17:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 0/6] drm/msm: rework MDSS drivers
Date: Fri, 25 Mar 2022 15:17:30 +0300
Message-Id: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

Changes since v4:
 - Fixed the issue with MODULE_DEVICE_TABLE reported by robot
 - Fixed the comments accoring to suggestions of Stephen
 - Removed extra goto (Stephen's suggestion)
 - Break long kms->dev->dev->parent chains into cleaner dpu_dev/mdp_dev
   and mdss_dev to document device tree bindings. Add related comments.
   (Stephen's suggestion)

Changes since v3:
 - Rebased on top of current msm/msm-next
 - Fixed issue with enabling/disabling MDP4/MDP5 vs DSI driver (per
   Stephen's suggestion)
 - Reworked mdss_probe to remove extra platform_set_drvdata calls (per
   Stephen's suggestion)
 - Fixed a typo in the Kconfig (noted by Rob)
 - Added a patch to move component mastership from mdss to mdp5/dpu1
   devices

Changes since v2:
 - Rebased on top of current msm/msm-next(-staging)
 - Allow disabling MDP4/MDP5/DPU/HDMI components (like we do for DP and
   DSI)
 - Made mdp5_mdss_parse_clock() static
 - Changed mdp5 to is_mdp5 argument in several functions
 - Dropped boolean device data from the mdss driver
 - Reworked error handling in msm_pdev_probe()
 - Removed unused header inclusion
 - Dropped __init/__exit from function prototypes

Changes since v1:
 - Rebased on top of [2] and [1]

[1] https://patchwork.freedesktop.org/series/99066/
[2] https://patchwork.freedesktop.org/series/98521/


Dmitry Baryshkov (6):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer
  drm/msm: allow compile time selection of driver components
  drm/msm: make mdp5/dpu devices master components

 drivers/gpu/drm/msm/Kconfig                   |  50 ++-
 drivers/gpu/drm/msm/Makefile                  |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  86 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 260 ------------
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  54 ++-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  57 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c     | 252 ------------
 drivers/gpu/drm/msm/msm_drv.c                 | 261 +++---------
 drivers/gpu/drm/msm/msm_drv.h                 |  61 ++-
 drivers/gpu/drm/msm/msm_kms.h                 |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                | 375 ++++++++++++++++++
 13 files changed, 652 insertions(+), 856 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c

-- 
2.35.1

