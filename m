Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1AB71F09D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8210E58B;
	Thu,  1 Jun 2023 17:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC5C10E58B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 17:22:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so1485483e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685640158; x=1688232158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sWVaudt6LsFTD/rqYNILwYPV4mqbIoPZfzCN0ltwBe0=;
 b=oKS648V4csGwPY/aR2vtqyAMJUbtbly8L8AZnN8my8AgTv8p/GMBbQGxASb9nJ+XHd
 KEyyaCT/1Fo56HZpUwsGdQA55nrYnSOY25SPSczTFVV5L8E/yqmdfd4O7BXMcY4Y7hPb
 lrGgskYsO1qxZHhR4bsYDo6YTsz7vz8B9Iye8foRdblMbsnVICgsC9mvq9PM6xczNp06
 t8iYOPHLg5HwZKnA3uwYvLnkdbCt31B6kITerh06/kVfNFsnnbRUTJk0NYaroJwUKIiK
 vuv9HWHJLlNS6PbcozwcaPRyRo1/NSy+NNHKtk63W6RoLdHmraZiJTLpja84FxpLtGxe
 5nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685640158; x=1688232158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sWVaudt6LsFTD/rqYNILwYPV4mqbIoPZfzCN0ltwBe0=;
 b=FJRzF7H5jTMicjEMZsNGXH2WNRMpBGKsRG7jzjzVTlja6WGti+AUyLBh+2Euwl6JwU
 VeE9EqDhRKn0A9Rwj2Gp7OX3RSkMd5a/wGQnMsqDVwiaLu44GBKyPI+dlfNFmWuWQMQs
 bwV+1pNyykCzkoHxcMrU7wAF2HiW0Z/oAuJ5Fh7HbHdIxswnzFWFTWEHL0Dq/9bzNtSE
 Oylimq0YLC914KmDMZZHOnWqTUOmZLDcf5uxr9Kqojtk8zOphGOXFiqmGPPHAAEeRG/L
 0BsnfRd0ICoQTHyME2X/Bv2LWjZdPBvB3/Fw3T75qh/DysHU8J6qahdvsp4TdVJNeEQX
 sxqw==
X-Gm-Message-State: AC+VfDzXG28Lgy2EEz3PxY0EIQ0eonLUpcsC8dNVWaoVt4D20mvSMmKc
 I7Yi7E+E4stfXQEbvRONDPtdqA==
X-Google-Smtp-Source: ACHHUZ6nIBJXKG+xTUTHYyhVVGJkUrZWZrvseGKuDtApB9Is+JPcnXkFZilVLdboy10XG1W8jjaJKA==
X-Received: by 2002:ac2:5627:0:b0:4f3:880b:285a with SMTP id
 b7-20020ac25627000000b004f3880b285amr456411lff.29.1685640158258; 
 Thu, 01 Jun 2023 10:22:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:22:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/7] drm/msm/dpu: simplify DPU encoder init
Date: Thu,  1 Jun 2023 20:22:29 +0300
Message-Id: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

Rework dpu_encoder initialization code, simplifying calling sequences
and separating common init parts.

Changes since v2:
- Rebased on top of msm-next-lumag branch

Changes since v1:
- Withdrawn two pathes for a later consideration
- Changed dpu_encoder_phys_init() to return void (Abhinav)
- Added small simplifications of dpu_encoder_phys_cmd_init() and
  dpu_encoder_phys_wb_init()


Dmitry Baryshkov (7):
  drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
  drm/msm/dpu: separate common function to init physical encoder
  drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
  drm/msm/dpu: inline dpu_encoder_get_wb()
  drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
  drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
  drm/msm/dpu: simplify dpu_encoder_phys_wb_init()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  37 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
 7 files changed, 141 insertions(+), 244 deletions(-)

-- 
2.39.2

