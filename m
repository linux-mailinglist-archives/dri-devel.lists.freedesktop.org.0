Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD6709B93
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 17:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3371989D56;
	Fri, 19 May 2023 15:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B32210E112
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 15:49:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af2958db45so3994471fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684511379; x=1687103379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=etm0lGlferaZBiu/m/R8IoSiZbBr1p0Ve2cEXO9P+d8=;
 b=x8LjhB6xV2Gj3OFH4jaZP6gUtckhUvcOYS9pHNHfPL61gKRIv1BAYr2sxa3VccvZD5
 An2mB8Vj7r+DYW2ca74/rS99Ezpw3La8fUHpz8VVRVhKG7aTG3d0woWzKylEJO1AELHy
 T6wKlkMybmccdH9j3QA/eTiFmA3cMw93Ym/EhXl4QwWJTPZyI07ifqrimYHjWf8XG734
 x26Q3+qSmuTBUcwe3hJZcsCZVLl1JQNKw9D7cT3WSkriH9FxnwaEVv33A7IIg+MtrDra
 LqD4iK4B7uqKyGLcB+ygv3a6uA08vV5iG0sQ3W5+kiYTLsmmqBynjaZZhdbHFJ4YipSD
 FDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684511379; x=1687103379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etm0lGlferaZBiu/m/R8IoSiZbBr1p0Ve2cEXO9P+d8=;
 b=iehl8IybSqrlZvMQE1oLr7MFiE00LF3nFSMBSxCmbFbIdQ5WixuVq7Te3vFQMQbWir
 KuSClAbQvhkWUesfcgv7FuyNb86VJKY+s2FiKINdczj6dtOpXpEVVdv+zAfPcTDNudrb
 LjrwUhzMlX/kkVbXdabV5mSZr6fs/zDVtGrCeGT7DJXL2VgwtFNEmB7C2hv+K0eW3LVx
 ogmUzdZQdhLfPrOGrxPv5Qiq3HPE33H5t7kAQG/SFC0MqXNHpCGmilX2IYLxBKjw4bWQ
 y3jp0HNxFyVAgopsojUzpdJE1qoFXi4IWwgYjx6Z15eA87gk4nKkMm4u5wdoSDcDx8gb
 Qavg==
X-Gm-Message-State: AC+VfDyUwwb2Ii+nFHnQ4NuIUpuJQtvC191OCzl8qJxL24se4wmxTuK5
 SY/FegYs8VaAhBIgVmq9qP2V2g==
X-Google-Smtp-Source: ACHHUZ75pz5tZfDvLgjAVqnnC4tOhnfAgvtWOyj7YnyKWM8M8h8lZ9SLgfBikSAxL9c6aN1LICZbzA==
X-Received: by 2002:a2e:960a:0:b0:2ac:7ffb:6bda with SMTP id
 v10-20020a2e960a000000b002ac7ffb6bdamr908462ljh.2.1684511379018; 
 Fri, 19 May 2023 08:49:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm873333ljj.120.2023.05.19.08.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 08:49:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/4] drm/msm: move resource allocation to the _probe
 function
Date: Fri, 19 May 2023 18:49:34 +0300
Message-Id: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
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

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  64 +++++++-------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 132 insertions(+), 148 deletions(-)

-- 
2.39.2

