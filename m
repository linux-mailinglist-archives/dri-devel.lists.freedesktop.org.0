Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A6708DE0
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 04:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF9E10E5A3;
	Fri, 19 May 2023 02:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4727410E5A2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 02:38:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af1c884b08so4209681fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463936; x=1687055936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hB8ttbepI7FxJGTYR5m6g7q7o+wcPnq3jGd8N1SpVCI=;
 b=VjfmbfbVfpbbbE3GuO+Zf+g5r78woNV9IpiPnccmMFoSwn4LBwoHwaDREb9ushjW4a
 mEIJRsGlSxhmgyFfrDeanBXRxkQrmwqVfnRuHGl7DaMLyzmN92Eoc6UztdV+KIeIYNCD
 FX3cfLLjm1n/wyIyxX5WfTT4dRZIS+qWspiF1P+b7uOoI7kT3tHoCfPl5LkkMYBYifQ3
 azGjaX14vVY8lLJyTwaZI05B5wWdVB4H6aPYv8e/bXTvCwi2o8FzPPaahi+vH+VBsycV
 ZHSk2pSuBtrrqMJhQn/xRyvErGri/M45E/RJQJeYmwKnNk4/foWyOXMOR4PQbUsnwNHb
 PEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463936; x=1687055936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hB8ttbepI7FxJGTYR5m6g7q7o+wcPnq3jGd8N1SpVCI=;
 b=ZJcZwflaUpF6jOhajK0d5HGT/1aNQctJGpmi8XUgoxnatQgpLLnndIWT+EwoyxDh1d
 ZIc1Pk1XHL36mxM8fKWKhFzoIVMM3vjuVRzi54mAm5qK5FmDLIDx6KEvErzF5mFoSuWj
 44LdLZSu7F/SfvhD/6cClDWdcm7RVedRUWzFrfe64jC8D4VetctzG1rvXDSbpZFwCP7C
 h3AXc4IePqpc90pmFurk8S2Yub/ngcUQzMb7YuHje5cbBnIQKJFlQmz3hWJQNoeh/tZM
 uEE5Lnv+g+GvWWiCa2lJzJxIi0WKHQ+efuvO0qOWZ62/4x4AbMUf7GEjyPAPzLwVA/8O
 HHgQ==
X-Gm-Message-State: AC+VfDw+1kXEF3Ju6hMSriD7fB5iR3U+UWI4sq/0tiVxEBt7B+D4HBZq
 WHz/qJ+ziAIG5P/r/9OMcWRAYnvtIShGLesbRzs=
X-Google-Smtp-Source: ACHHUZ5BnGhVzZ2iYRIc5cTse2COPb6iSeJskh97TwpEPM05paE6PQ4l4p042CJNRhdiesdH2TGB/A==
X-Received: by 2002:a05:651c:1693:b0:2af:2094:acdd with SMTP id
 bd19-20020a05651c169300b002af2094acddmr127190ljb.14.1684463936505; 
 Thu, 18 May 2023 19:38:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:38:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Date: Fri, 19 May 2023 05:38:48 +0300
Message-Id: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
 7 files changed, 140 insertions(+), 243 deletions(-)

-- 
2.39.2

