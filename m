Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B9E4F481D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 01:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581F10E334;
	Tue,  5 Apr 2022 23:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C810E32B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 23:51:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b21so1206684lfb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YSYDjPb6rkMrUy2ND+BWShKjgnutY8vFHmoniTCXNs=;
 b=oUMaw5vOO5xHZB0ujTF7+xO0htbaaZj1/WNJHYE/P8urqcDn2s8bz79kbFXcBeqLce
 biHoxfW5KopBRgHA3vrpXUrOowoFXtet80WKRIYEIOZAYtJRwOJGoOTrNLrY1/RXGEJB
 K/TKHAS2vmENqVrWHtE5C/BLrUtLrMYZVDKbs9D4BgKh88mkYA5sD1L2i+HpbvIUu4KA
 gUlBmMfxjyStiQxUExiGY8if4v7i0Yr9xOxtaM9qZmE5+2Jfb5jrSHoqy3opx53MDnl+
 fLMi8dkd2QV7voWs6Gslw1sUGRBd5Urcrl04hj8ts+xa+E1Nmm+CV6He5lilj6opmzs3
 3T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YSYDjPb6rkMrUy2ND+BWShKjgnutY8vFHmoniTCXNs=;
 b=OkrBppBlrTZmEdWdaLEwPfZDtCqmYcrho81kzgGc+K7fqEdNGt0MkIXk3iGZucwSrH
 aBcMc0UVkVZWz4AOnWmD8uWQHNrPgWxujPs+9nJHTq4zcGvOdQrELUgkcbBKzUaasw1M
 HDTX674L5xfvg8NDHJbSkmEHvnmhD3bKPzARnNBl2Ts4S+MKeloLeVMZPOXi0unw+aer
 o3o8JrYJQwlUk71i0+4L9DyXsGhWW0nzAMdHdtllJ9EZOlIuhM4hYtWD0U6po6232ofy
 0RXsLsA12ePVmm8kW+PQkenPxLCx+7mNOVFkDCBuVSxwAEPkMem1L+bOOwtG+VJoXYUD
 WmgQ==
X-Gm-Message-State: AOAM533xBn7c5DrM1oVutGk7dlsfbVG4eC1cjUgc3B8RcYHz5TuqEJzh
 A8Z+M5arABM0iAe/Mtb3vZPxPg==
X-Google-Smtp-Source: ABdhPJzNHlLedXR6pzP6xqaOfB82l/XCYzRdWX7WDvO/+hf1SMfxV98iC7FNMSzXJUdhbhpipNuK5w==
X-Received: by 2002:a05:6512:22cd:b0:44a:6d2c:8b9f with SMTP id
 g13-20020a05651222cd00b0044a6d2c8b9fmr4189272lfu.142.1649202660661; 
 Tue, 05 Apr 2022 16:51:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm/msm: remove DRM mode setting object arrays
Date: Wed,  6 Apr 2022 02:50:56 +0300
Message-Id: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
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

MSM DRM driver stores connectors, encoders and planes in the arrays
inside struct msm_drm_private. They are not really necessary, as
drm_devices also references lists of these objects. Drop private arrays
and use drm_mode_foo() macros.

Note, the crtc array is kept intact as it is used in vblank handling
code. Maybe it can be dropped later, but it would be a separate
intrusive change.

Dmitry Baryshkov (3):
  drm/msm/dpu: remove manual destruction of DRM objects
  drm/msm: loop over encoders using drm_for_each_encoder()
  drm/msm: don't store created planes, connectors and encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 50 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 -
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            |  9 -----
 7 files changed, 20 insertions(+), 67 deletions(-)

-- 
2.35.1

