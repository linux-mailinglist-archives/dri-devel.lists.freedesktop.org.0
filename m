Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A8751344
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E918E10E051;
	Wed, 12 Jul 2023 22:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D3810E09D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fba74870abso106424e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199900; x=1689804700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4RiBxelklL66UAOz090rtZPINsn9CcVuq61oI6xDxFI=;
 b=WQf8BcV6FGMCMjo247gbz4AswWQHxO3/liFJtppvv0PloXb6Wm1lojUVQvkAp0TlCM
 89h+biD8WQFYm7aOP05ySqSn4UH1cGrpk7Z1K87ZL+H/Y9dfy3+RRfs1bpobz4yWlspP
 ka8YJeKSzdJh+xtyy/y3f+D3bwOnIEXYk7cFabpgGpOuMS7aHm0QM8fMVOxobyCeCHC0
 gHqgC3J6kmcRKgD80CCizAN/8mL853U/+eEmwWOLKMSD9NK3oPfJvjZylpjO87VsRb4c
 EeVNv+6W+YpGjcBenwP/iuH+KOqIzMlh+tQYyo9fH31PuQKXTYoT8/yYXxgv7kxDOvKV
 TStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199900; x=1689804700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4RiBxelklL66UAOz090rtZPINsn9CcVuq61oI6xDxFI=;
 b=EVZ3R7bBpHksTbckL42HnyVULrdwtZ+Ij9QvF6njljOd8hCIYNAX0Jqrnf7MdCUKOQ
 FXnrbvFaEm5YHZvQnAtWpBeJmUtpUUNar1XmaJFBMexjzXyy8anqyvenLdPKMQGhKdcJ
 UCyNZCmDcSSHQ/a9d2knGWLNS9zgX+ficbcODW81upZ4A+32xDNnGNM8ydj8ya/3aug/
 ElyOxrFRoDx0zEm6bewydXnX7qz55NKhfYvgn54TD+BLaS9c/qHZ3gfvE29/Kpsvld1b
 ds2p5HZJ4HmUNSPXNiwlaKXLZ27BRvu92fmnvUXsL4zSYf6vbBVec4TFV2U7IQ1Ee6Tu
 J1Lw==
X-Gm-Message-State: ABy/qLbRfZlx8njE8oq/QOq89RTTc0y6U4X1r9g94V2rHJWQwWB/BZHq
 QT4khe33trDDcVdkwxbv5ca3JQ==
X-Google-Smtp-Source: APBJJlFMDe0JLw2pB86fwpjn6gTtyQ7nxVTmEY6hl0L4dX+byLo+fFMtJhgj7lYJwP7aDAzsjXRO8A==
X-Received: by 2002:a05:6512:3090:b0:4f8:4512:c844 with SMTP id
 z16-20020a056512309000b004f84512c844mr20337601lfd.48.1689199900381; 
 Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 00/11] drm/msm/dpu: cleanup dpu_core_perf module
Date: Thu, 13 Jul 2023 01:11:28 +0300
Message-Id: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
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

Apply several cleanups to the DPU's core_perf module.

Changes since v3:
- Dropped avg_bw type change (Abhinav)
- Removed core_perf from the commit cubject (Abhinav)

Changes since v2:
- Dropped perf tuning patches for now (Abhinav)
- Restored kms variable assignment in dpu_core_perf_crtc_release_bw
  (LKP)
- Fixed description for the last patch (Abhinav)

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (11):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: core_perf: extract bandwidth aggregation function
  drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 187 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 159 deletions(-)

-- 
2.39.2

