Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1B507236
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 17:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42A389B98;
	Tue, 19 Apr 2022 15:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35DB89971
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 15:53:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b21so30178128lfb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIfb+gmCtEt5H98vB8ohAIXclb9xmDCzfNmIFKE2t9I=;
 b=nUK0AjVJS5kb23t0P9yms6lOOOyCCFFf1w+fJiJrSGS1HknkpDLXh5IkvGOPC++L4b
 PYNPaM88pEEvaDjuS6G0TIwuD1sEewsW+GOrelR0yrTLJaBUZGrvfPbYMdZagY6cO6dn
 7nduz2u9QHk8G/OMGMDzgGoepAZSnZTnAKIRNfksFbi0PgngAvChUn24EKGoHJqDOfby
 cBTbRdS6zYRIDeiX2tB6TQ407bE7SVBDN9XEshiNF5roX4280q0nbAN3+nHFsGQ48iz9
 rdpD9vVOsIooVdTAEW2/UIegwViu8265LYUluCdpCYRaTZ30M56Epzms4pqowoNU/Rdm
 QBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIfb+gmCtEt5H98vB8ohAIXclb9xmDCzfNmIFKE2t9I=;
 b=EAuTIm5zbc6DWyG3RzSKDaDj9f/CPKecMbwqozoN2Qksx9EFXTkHdlK35sEn2PTtyX
 sJYk16MPGX310plB7+4oIVl5Rox0pDElyl1Zka0EIfG8qP15K5pndXcTB61cXfbJfU3l
 20CMTUprsUp3YFzHPSjZ+y7pgmJpkvVJ89txIiehHiQqDerrVZcn6R3EbMBCTPpy5j2k
 gHk6IvTewZKmoWTO5iv8TX5CHS3rL4rVgOaqIrH7XyXUgh48A4Y+lAvsuY2Og9Ea+eNY
 /D6pTaun4nSJQc76dlR8gMkP3Se+0JpOhoMBj3I9e8bFmxKHWyNdt5PzkqQVO80AFgaE
 sY5A==
X-Gm-Message-State: AOAM530BmbZuDZQEkP8HBwEVFf5S1kuFPy9sX8xVVoZ9Dk16qEj9MMlW
 YRs5sTWvba/3HJCk+X9A7Ej32Q==
X-Google-Smtp-Source: ABdhPJyd8FXgAg9xYtals42a2pylwxV1oZc/1iFaACU3eVNjANG7LKJG3MIS7WB02aYDM4ODBSnWCw==
X-Received: by 2002:a19:8c4a:0:b0:46b:abba:2409 with SMTP id
 i10-20020a198c4a000000b0046babba2409mr11920802lfj.88.1650383627193; 
 Tue, 19 Apr 2022 08:53:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 r25-20020ac25f99000000b00471a439838esm313911lfe.145.2022.04.19.08.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:53:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 0/6] drm/msm: rework MDSS drivers
Date: Tue, 19 Apr 2022 18:53:40 +0300
Message-Id: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
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

Changes since v5:
 - Fixed the issue with HW_REV access on MDP5 platforms
 - Moved "mdss"/"mdss_phys" distinction from second patch to the first
   one

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
 drivers/gpu/drm/msm/msm_drv.c                 | 261 ++----------
 drivers/gpu/drm/msm/msm_drv.h                 |  61 ++-
 drivers/gpu/drm/msm/msm_kms.h                 |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                | 384 ++++++++++++++++++
 13 files changed, 661 insertions(+), 856 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c

-- 
2.35.1

