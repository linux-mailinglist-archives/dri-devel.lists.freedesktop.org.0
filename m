Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FAF485D59
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF79A10E570;
	Thu,  6 Jan 2022 00:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0010E571
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:43:04 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h21so1547991ljh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUkEK75e2F3w5u/llnR8n2HAgvHZx74pWDuCDC8nOSM=;
 b=DK4Xf6mITXkcOevJ4wZ51waw2rIr7t8adiZGB11WgPNMb43rmftVNODC0ZnNHtnFJa
 E03mOGa5vxMhterhVQcMMG3tyvp/wBKjJTFPG16d28no6B8QhOv5+/5FNy+u6qQGeZZY
 TvE60iWfQXN4nYECUxJdfFs2/O6sb7wC1ibBCSCMuuL2ofyJ2ysQWsLP/uBxk1S5A+fp
 ZSnzzTA/iYdGMTXaBzqNm9epOh7zcxcTSXIPBkMeZeeR37xsSx/t7bFLFQdCnGO93o7D
 ZnZ9UB3g93B0qeaYxulmTwBE7x5b7pdZfplGVSBPjhYrhDfiNjjv7rj8wAE4v4C+Wikn
 qR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUkEK75e2F3w5u/llnR8n2HAgvHZx74pWDuCDC8nOSM=;
 b=xN2rMIt6BXF3sUDJRbEGpZUismGctVxL+ucr4Bp68SPFBjvQcT4GGigSYC9CgyUOzg
 yqyD4iz7WeTCCzVomeNq8f7xhgqSsh3pETFxgoFUuw9XxuHMDSyLtEQBD/Okx3gU3LeL
 nfPIEHmp0OfpxR1Kx3YC5YSHmMXoiFn+KfZ7cz+aKp1yTHywmBGbNbGTeeia/S03K6Dd
 fnHjUY/FWmlazKnF8b1U7rNArCz2mJiibu+fLORGq4G/lGlxPaPiBWLvWxCi2L0Mrnhi
 VzT18gEWSkea3rSbu/whypL19Y/DEWDboRU1SGc9gKtoAA3zsEjqrZEbi+tGfVNzuK2j
 Ra/Q==
X-Gm-Message-State: AOAM530KfpXVE4wOpQ9Upcua7jGvp6YJfsSH/uGXIldBKg5BLactEovJ
 RlyAnWOIbI4E+WTb7CVLzJ2Khg==
X-Google-Smtp-Source: ABdhPJxOTBEliR4cyqqJRtekI49AUXMGi66dhMUQeLqjnoFKWAFQEfnR2O1wFXMHOxlZU5biDnaFlw==
X-Received: by 2002:a05:651c:1a0d:: with SMTP id
 by13mr38658971ljb.107.1641429782465; 
 Wed, 05 Jan 2022 16:43:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i5sm39131lfr.264.2022.01.05.16.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 16:43:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Subject: [PATCH 0/4] drm/msm: rework MDSS drivers
Date: Thu,  6 Jan 2022 03:42:53 +0300
Message-Id: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
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

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

This patchset depends on the patch
https://patchwork.freedesktop.org/patch/464362/?series=97310&rev=2 to be
applied (just 1/2, no need for 2/2).

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm: unify MDSS drivers
      drm/msm: remove extra indirection for msm_mdss
      drm/msm: split the main platform driver
      drm/msm: stop using device's match data pointer

 drivers/gpu/drm/msm/Makefile              |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 260 ------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  68 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 252 -----------------
 drivers/gpu/drm/msm/msm_drv.c             | 260 ++++--------------
 drivers/gpu/drm/msm/msm_drv.h             |  16 ++
 drivers/gpu/drm/msm/msm_kms.h             |  18 --
 drivers/gpu/drm/msm/msm_mdss.c            | 438 ++++++++++++++++++++++++++++++
 10 files changed, 578 insertions(+), 758 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c


