Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB29B485C16
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3559F10E362;
	Wed,  5 Jan 2022 23:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF70510E1FC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:10:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x6so1219943lfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2uWRi1Tnw19DQjCxNI71vGa0f/fnv4e8mcQMQAjEwh0=;
 b=pBkxwEEIb7kjBcYtaBtNrvxzgx8gTZANcdZiH48pWJLG1nEjEpXwJb4UQzk7HooewW
 AuKabkDRCjLZsnav+g+U703MjrYyol3FKpxey/EboUpzAVfG24iEgQzV+z4CHXDzigRx
 fHB5STWyo/u3MTCjmcpZ5iwVGsEwWQFvWB1JUmUCh1uLvUSPNXwQHprS3Oz4LNDpDSlO
 xwxGiiZONoWCQ1iG3O2TXI2wHiSPfLqkj1QdC6Hu4GQ1TyctcaaybxfzjoagELIDIEhy
 lHmplvN8IQCncmKDeCm/j9FSOoFTclGhk8EQNHVVpugLbysDmdjim07o+AoR2srdiRDO
 Z2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2uWRi1Tnw19DQjCxNI71vGa0f/fnv4e8mcQMQAjEwh0=;
 b=aJPolGakqHBEVRmr8/0EgJRvOmGnxKLSK9Y5SbPo1mpv0e1mqTWPWZKjrAcIC7OFDI
 g3UGhnsGfAL0x2atEBySYFFOozoWhjpACHd3zMEOUYhzS08GkGQ/0tQt+iHuQZjA3idW
 XSX1lziPAOEPDk0+yq7JCAUiM/dO94JEGz3jKN2MVLAv57yO9bxwt2vEDWeZXuygF4fG
 d928te0VA+RSGtxfTTWOqBO1t0ch4B7iBVDNp1J8EUs14/rAWvd6Gg3JOeQVTgsT6CJ7
 rNCriNfkj6vewqEfs/6qw9Ff3DSb4vtsM+6FOOq8+PqyP6UcRR+PejMRVnxGyaWvyAj6
 DweA==
X-Gm-Message-State: AOAM5306SN0ltjaTPt+CfMDVXXJTu5PEly/BKHH19c/+QmZvMi0EckQy
 0eu1aVjPzm197ZWcU1ngzisASg==
X-Google-Smtp-Source: ABdhPJzUAouje0ZYdH8MMRI5RVJTtFdrsuKPKFELQlJz/gxYPZFAnVM27oQmGIgXasThy4AgVtx6Rg==
X-Received: by 2002:a05:6512:31d0:: with SMTP id
 j16mr43103115lfe.448.1641424234974; 
 Wed, 05 Jan 2022 15:10:34 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:10:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 0/5] drm/msm/dpu: simplify RM code
Date: Thu,  6 Jan 2022 02:10:26 +0300
Message-Id: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder. So allocate them outside of RM and use them directly.

While we are at it, drop the lm_max_width from the RM and simplify VBIF
handling (move creation/destruction to the RM too). Once this and SSPP
handling patches are merged, the RM would handle lifetime of all
dpu_hw_* objects.

Changes since v3:
 - Add missing DSPP blocks teardown
 - Remove dpu_hw_blk from dpu_hw_intf
 - move dpu_hw_vbif creation/destruction to the RM

Changes since v2:
 - Dropped DSPP, PP and MERGE_3D patches for now.

Changes since v1:
 - Split into separate patch series to ease review.

The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-rm-clean-4

for you to fetch changes up to 95f32a88ae0dd366700e2ebf98d793b41c53aeeb:

  drm/msm/dpu: move VBIF blocks handling to dpu_rm (2021-12-27 03:41:20 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (5):
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: add DSPP blocks teardown
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
      drm/msm/dpu: move VBIF blocks handling to dpu_rm

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  36 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  11 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  28 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 116 ++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  31 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  26 ++---
 12 files changed, 70 insertions(+), 218 deletions(-)


