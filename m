Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E5D3D4BA9
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35246F97B;
	Sun, 25 Jul 2021 04:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A316F447
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:24 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u10so6900446oiw.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFd+X7oTHADuT288+EEd3xR940f0BDuWrDa2rxXiuIM=;
 b=WKNvI24GiVvhCutDHa54Je6JZH578NP4Btg9cqRBa3J4lITuNpJzNQwz1xhmRtkZ9V
 P4ZKQiby5aRxE5tSdlGDSOs6Xo5m8AeHvLP550X8DxvWs7pUKUxtb+aEJm5yGwMf2g9O
 OLRsQjZjKVIgNWpUD95sOziexq3GfCbefyOrpHwEzHi4pea9OGn5qXLbN38OWdT407lP
 97i/qUHb6VdFtQvj4SFcS9dJSe3VeeLdiu7PO0vJPZ6nT4JkYoDl5EiDqIRJwyLz5hmO
 w2pR9fYiP8i5PeZGKs65aTTPGaAKwZtbij5LJ0eLFSZvI+SrjXeFIJZMjg+nUOhSDsY2
 tsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFd+X7oTHADuT288+EEd3xR940f0BDuWrDa2rxXiuIM=;
 b=ArXs3oP6Y4kdDn/3ScarSQejh1Sxfilbl+GrxGxcFODvw2J785RtxaQSothok1oJuE
 wHDnwmLzT1b9ADo5Ef4aP+fZjcrJioF0A2/Z53Qwt6p4wqnFiEPZx1okaY69CNVF9lGO
 zkNFrf8bYGJGckpUEoOucAcma5pPUxqSx5MIYps482J2uJIa3bYJKB8CSoy3gLBk3VKC
 jEZcmP6yjeQTWEfMnNrXbXVWGrRGb+okimqwn2yfCiPq+DbsFXrdgovD7I+8oeKdkuDL
 nIY/fk7zv1RJSDSfBTf94lLkkbiJOAfFy/EKUfiPpGkKyo3m949HJnVIpzY9xwitzfcV
 97gw==
X-Gm-Message-State: AOAM531km+MRLcJeRuM56YmnKj9Cr49fnFUmkWJ0ANp7bGKYzKxU/Pxb
 eF9eXlnyH6k6bB8ntTSGWuiYVw==
X-Google-Smtp-Source: ABdhPJxAnqWdynxTIU/ZSqayCOuWNeg4YGWeTecnM/cvLrNlSFSGgBV+4XbDkEV+jpfC8SJs1ndAyA==
X-Received: by 2002:aca:4743:: with SMTP id u64mr13017033oia.52.1627187183742; 
 Sat, 24 Jul 2021 21:26:23 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH 0/5] drm/msm/dp: Support multiple DP instances and add sc8180x
Date: Sat, 24 Jul 2021 21:24:30 -0700
Message-Id: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current implementation supports a single DP instance and the DPU code will
only match it against INTF_DP instance 0. These patches extends this to allow
multiple DP instances and support for matching against DP instances beyond 0.

This is based on v4 of Dmitry's work on multiple DSI interfaces:
https://lore.kernel.org/linux-arm-msm/20210717124016.316020-1-dmitry.baryshkov@linaro.org/

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (5):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  60 +++---
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 183 +++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h                 |  33 ++--
 6 files changed, 200 insertions(+), 103 deletions(-)

-- 
2.29.2

