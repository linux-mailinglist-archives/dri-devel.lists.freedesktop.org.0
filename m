Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C282A7682FF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857710E127;
	Sun, 30 Jul 2023 01:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC01E10E127
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so49705381fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678864; x=1691283664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fZFRcwHJeVSh65Kz3mZ7lpYUowAafMtprlMPT1r95fA=;
 b=D+kDYvMnwANwr1qh4aSkCWNS+hW/sQ8dmmOxM15zbfx/N75PKrr+7nt522kqc0hrBK
 IfYb2TVbnH2jKJLHpaKlZGQNqS5rW2XWjFiugMzy45Ffxmt5s3kryxSUID2rRR5Cu6H+
 WODDu025368gjog7RMq2oMTBd62YGF+ghob7zqtrvTXuAmU18AMuKeV1UMawtfhJ6nSg
 Ydha1n5LnNt/Urzja5Rz4v6n7ZUw0ixKcHjPlJ4uY3PaJfJG/xCbINnOliVmhtYy0/Xg
 kdbXk2L03htEH/zQc/VbPjt1wEpJsscg/tN7mE+X73ydkHZD4Ty7xsous2ssXVkxEMaB
 61uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678864; x=1691283664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZFRcwHJeVSh65Kz3mZ7lpYUowAafMtprlMPT1r95fA=;
 b=Kqolgckl+AEGSQNZ/6UyywsP83MBv7hmA2EV+vu1eqFpNYayvZp8ajeEYk3UKpG/JQ
 AdScSSL+AHkSvFXuk7S60wvxjXgKYd565akBd41pRTMAz/329+cXygNVLNNXzzgYboje
 lcIXaVOqmGO/POC/NlfpHxdjHvtPI5UleyLeWSA9HOU4rqFh0lGBKrrJk+K+3Eveg+x4
 WaMwWlOqflQdvpae3gFRroHggSqOjK9+T1oxkZhrPuF9dJb1bl+ka4OtHvT8D/mQW/om
 9F4uvmA7LcufWU+E8seEFH5db2umQ/xteVdO76xnOiMlKjuzQdP9aRVCRg7n5xLgUFPR
 42Ow==
X-Gm-Message-State: ABy/qLboKB+B53ba//oXFb3wDGAHmHnhyruN79FtzZ9G8c+VDq9ZIBYc
 6H0tpFe9vLoZDCCR5T2eq2ib3A==
X-Google-Smtp-Source: APBJJlGtmyY9p+cYGHzyJojaq+edbB2ZxTMVxZv+lA2/UTIIcqd5S9h+Jmc+h8AX0z53+TobLbWANQ==
X-Received: by 2002:a2e:9a89:0:b0:2b9:e701:ac48 with SMTP id
 p9-20020a2e9a89000000b002b9e701ac48mr174745lji.32.1690678863977; 
 Sat, 29 Jul 2023 18:01:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 00/10] drm/msm/dpu: cleanup dpu_core_perf module
Date: Sun, 30 Jul 2023 04:00:52 +0300
Message-Id: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
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

Changes since v4:
- Dropped the 'extract bandwidth aggregation function' (Abhinav)
- Fixed commit message for the patch 9 (Abhinav)

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

Dmitry Baryshkov (10):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there are no
    ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 154 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 77 insertions(+), 145 deletions(-)

-- 
2.39.2

