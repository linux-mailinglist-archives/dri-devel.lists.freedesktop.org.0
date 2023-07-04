Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7A7477FF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 19:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C973410E306;
	Tue,  4 Jul 2023 17:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA47510E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 17:45:56 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso9155228e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688492754; x=1691084754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6NVP63A5kA3bVBWFMHxu9Ll3AzCjFkGOvC1AhTKo6S0=;
 b=mPxqXiHYbM2soowGCvklymGX0xgtEFNKZco2Giol7Iaqez4s7EY9LdTdQasEQ51xhz
 A9347mX4EcyDsMmo67CLfz+TzAUyQoTx7bUTendr1daGUQSG2z92MJ4GUYbLkOW7dDC+
 dZ+Azk8ZtDc8LHP74/HjQAC4cs30MRMlwrWyfE2V0gNQM41RF5+64dXXfkBPd700edXW
 VdIngYfViBcMU+k8LjmZQ5WPLl5de0tl9VWveYDtO2afKbWdfu8xJqZWyB729nuTB6sg
 Ky3f4KMfdyUrVvVGaa5pY8V7DyMrZ0TQn+8GihfZnIoaa+JPkA5AodvJHVaKLJ/QAaB5
 hgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688492754; x=1691084754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NVP63A5kA3bVBWFMHxu9Ll3AzCjFkGOvC1AhTKo6S0=;
 b=eOR8ZzcRQiITXSeos+n3Nh0wicC7dSdkkCMi6dAt4DYu/mpNfMHkwuFjS2K4BV1VUg
 75VChnQ4G7yfEibD9PJtbMo6E4MvTo4c96uCHSTz3mzEhiq6TIvGftxaby0CG81sY0Iu
 exERteuJtAV7S/sVesLQKJy1kj2CCKdAe4BQlT28qL65ZZYEBWPWBsGkgzVrW2ZK4sJI
 K+Y8qFU3uQ1xGuxy5gZrmNdWizSmnbKH4yutlRrGdz/pNfwzJxT6tBP1+QQ4CewEJI00
 ZWm7jNZAmd/mVcyh2jRbCy3gLdtYRoSGt6PYjkCQjSeJktc9iYLOFftjTpOonKoMPZjo
 aXkw==
X-Gm-Message-State: ABy/qLaVQZbENKpnkUG5fSOcTYDiSHcM5So3Gcl+dcLNJbRFb+2QRf3K
 Cq6s6ocofvxtAt6PmKSGFfLE0XwWB26opJxWi5A=
X-Google-Smtp-Source: APBJJlHW1odJg4Bh1+LqhExnDN5SfHorKlztMinWGKGapxRceXAGkdkn7U6Fg8SVrbGPdrhXrjirog==
X-Received: by 2002:a19:e046:0:b0:4fb:82ac:9d23 with SMTP id
 g6-20020a19e046000000b004fb82ac9d23mr9313764lfj.36.1688492754562; 
 Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 0/4] drm/msm: move resource allocation to the _probe
 function
Date: Tue,  4 Jul 2023 20:45:49 +0300
Message-Id: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
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

Changes since v3:
- Fixed MMIO unmaping in the DPU case.

Changes since v2:
- Move even more resource allocation in the DPU init path.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 187 deletions(-)

-- 
2.39.2

