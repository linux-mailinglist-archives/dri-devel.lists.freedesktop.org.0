Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3F74BAC9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EA110E191;
	Sat,  8 Jul 2023 01:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04B910E05C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:12 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b701e1c80fso38231321fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778249; x=1691370249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wj7LNm7j8uJ6srVzyDHm7xnSDGTFeyf7qEu/J+OSTyk=;
 b=VzR53hJYdkUKIz0f6Y4HBRN6BwBlIO0nBViJ+QNXHktqVvNlBtgQLuezuTXKpgfAq9
 CzPw/bP/+MSEANGDX0OEprP+hPvsmbRy+EHgGA0HL5o88aEr0pBfJwElePFPRmL3pVmN
 vOqHD+Sb2sEoUtWVFH3srdtwYkw8wGAc/BeBMFk/GltTLM0URw5b89621e6d4v0G8EjH
 43l3X6eRd869S80/c0yvz8hH4s97YCp/NhH7Y3F5265eo0RuDBvsJU8Up+MoEZ3btG3Y
 aweQiA9g90GVOUm4hI0LqIsLgFM1wZ0d0/hXdeYM0H08I62/ZBs/VpkyAhZkjqGjw3J2
 WS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778249; x=1691370249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wj7LNm7j8uJ6srVzyDHm7xnSDGTFeyf7qEu/J+OSTyk=;
 b=KSMe34vnQy/yhOgVnENOFIHZTIgZSt5vQZl2xFLhvpIAOf/6SVmZ3lqB/5WT/kcKRZ
 mKmAjDY618l/WoYjRZm8FoLyqNhrwUEDiIkg1mYek1UkMV8TuU7bubOoXvpzy83o9Xji
 xsEs3Hc0I4sadlM+WFGBFrFN0CnmAvIqyfScKLqYmMZEU/4rE9ELa3GH6UKYz9LOExFf
 6FVbDXY04oSm9ozZhyagbbLB2l/CFsdHHfHE3hvK4dltdnnmzZ/xiM6nF+xLVrgmNYL8
 yRTRnpQSSzo3A5pzRGGQsF4ICYAF8YYSVxKuKjQv6uFUrDB7tNAZH7oX78FMV4+eEi2s
 i3bg==
X-Gm-Message-State: ABy/qLbeu8iYEAyO8hDsABI0TuN7UOm+0cQf5cbROVB9iYpiZic1vU6V
 FaZWCinmb5c4V2bNwq4Mw8jhmg==
X-Google-Smtp-Source: APBJJlFxsuuokLyKhRQ1fUfj3a1WJAB0a76r5DhYNKwKNL06bFTd/N+9oYHZdjMagvGn11Grjrub6Q==
X-Received: by 2002:a2e:87c3:0:b0:2b6:bd09:4d64 with SMTP id
 v3-20020a2e87c3000000b002b6bd094d64mr5007973ljj.34.1688778248725; 
 Fri, 07 Jul 2023 18:04:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 00/17] drm/msm/mdp[45]: use managed memory allocations
Date: Sat,  8 Jul 2023 04:03:50 +0300
Message-Id: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Follow the DPU patchset ([1]) and use devm_ and drmm_ functions to
allocate long-living data structures in mdp4 and mdp5 drivers.

[1] https://patchwork.freedesktop.org/series/120366/

Dmitry Baryshkov (17):
  drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
  drm/msm/mdp5: use devres-managed allocation for configuration data
  drm/msm/mdp5: use devres-managed allocation for CTL manager data
  drm/msm/mdp5: use devres-managed allocation for mixer data
  drm/msm/mdp5: use devres-managed allocation for pipe data
  drm/msm/mdp5: use devres-managed allocation for SMP data
  drm/msm/mdp5: use devres-managed allocation for INTF data
  drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
  drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
  drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
  drm/msm/mdp4: use bulk regulators API for LCDC encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
  drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
  drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
  drm/msm: drop mdp_get_formats()

 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     | 33 +++----
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  | 32 ++-----
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  | 37 ++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 87 +++++--------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 59 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 24 ++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     | 30 +++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      | 21 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 29 +------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 25 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c    | 10 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h    |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c     | 10 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h     |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 40 ++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      | 19 +---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp_format.c         | 67 +++++++++-----
 drivers/gpu/drm/msm/disp/mdp_kms.h            |  6 +-
 21 files changed, 171 insertions(+), 369 deletions(-)

-- 
2.39.2

