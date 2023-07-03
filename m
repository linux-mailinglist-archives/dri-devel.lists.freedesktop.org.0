Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCEA74532D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1820310E05C;
	Mon,  3 Jul 2023 00:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E90B10E031
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:30:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so4833642e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344253; x=1690936253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yJANRZZIMK5svQNtmMZaMEVV9+AxVN0XsGlXd86Z6IE=;
 b=xc+e9mOdZ3GtvhvAJ/fseS93Odalh8jT60krEfKtrAVCeNqCSk/ceK8qirWlvI6wv0
 cJ0LcVsOniMldBihBqL2NY/2CQ1To0WksFiL1NjvG9Am86vzYYMNZz4/IDKYzxkQ6DMx
 J24DBuV18t2C7V2dxuUCxKF4uO55oHVNvlhw6YdKYekpNmAzypLfFqjEiu/+S23dUBYB
 V2CxytmdXN27tg47sRo+nOD0cOtXjDeP6g4ePi4HdASwhUOjJSVzyWG8QRYCrTU6K5C9
 OWM86FxLuG0DP5N+YD2bLln1kopWMNPdyh1f3ehzBF8GXk0QZGim8kxk5hx20O9R2gcs
 FoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344253; x=1690936253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJANRZZIMK5svQNtmMZaMEVV9+AxVN0XsGlXd86Z6IE=;
 b=LnLSIdmGtEwKJf25Ql9B599qLx5O0UWEYpdX4ZObMU+kgAJpxQ1kQkLxUnoWrSeZIQ
 dUTB9myWwWK4zlWdAW5vV7L+7i3N8K0CAumAs380sIDOtQnU2ByFrBS8QAHjhsRqhj+c
 /saQYVePJQRQFukJcd7Rwa8240a2yR09FWI7ofmBnD7lgklEeFdlLVKvSnkt0aSPTxqi
 hQfvpY6CbfU/68rj8QtyYuTRg8eCGMO5t47ktUYufG8Sgx3HlLu+c7HC4vas9RryfqBq
 UJA6RCoTQaXW9yMTqfUMKu1l1loMBRDc4SKATxEVXDajnPdxCosgp5R7LFNXkD79Oz31
 ec7A==
X-Gm-Message-State: AC+VfDzfu8Ne5X+HmrXo1MF/hrRzXBG/FuPV7sPnxUWjmpwLXXD2eI92
 taDvvCGGkwRuzXj3d82E1PzNcA==
X-Google-Smtp-Source: ACHHUZ4Ohf808GKFowwML3dOzTbtjZyzqRUDdk6LA3Aku3BokN9EK06I6ub/a5yV3idfclvqCZKOcg==
X-Received: by 2002:a05:6512:31d4:b0:4f8:5e4e:52ad with SMTP id
 j20-20020a05651231d400b004f85e4e52admr4152153lfe.23.1688344253120; 
 Sun, 02 Jul 2023 17:30:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 n2-20020ac24902000000b004fbb1bc1ae0sm558842lfi.163.2023.07.02.17.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:30:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/4] drm/msm: move resource allocation to the _probe
 function
Date: Mon,  3 Jul 2023 03:30:47 +0300
Message-Id: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 121 ++++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 ++++++++++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 +++++++++----------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 175 deletions(-)

-- 
2.39.2

