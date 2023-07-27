Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60AA765636
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659AA10E59D;
	Thu, 27 Jul 2023 14:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39E210E598
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so1824498e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469145; x=1691073945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AaVR++jkAbk5lOudvbAkb+yuYak09u1ZunnxV6fVwE4=;
 b=KznsrfP3bnT1LvVctNi3r+GWeMYdM8x8wGXQizIHC4eGlhDAlO5SuCh1+SDJ61/Kpk
 55xRPpguyS5txEdcSdp5rkBAschmdj/XB6fW7gGVh/JoFVVOACvi9qa4cLxmer82PpVS
 ZM9eWMiTXccRHATZmjigTUfClXw8iIWaFEipYO/AdRY22O69A16YWvdcL5fY4h+h5A/2
 Nq4APVomnRhchWRJHTx2SiIYKqY6Ze199UW1fZnbMn5ZyoIr3JYCWY+yqXYyFMpRhv+f
 nPJ1IaidhpLmhzYL6WfmH/sOI2q67zkPyF3ITXu3+iENbAnRwDv4B+0OXA9mI3RYQIe7
 4zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469145; x=1691073945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AaVR++jkAbk5lOudvbAkb+yuYak09u1ZunnxV6fVwE4=;
 b=lX4XbnSFOTLTYhDrh8wt1i4ek0sxXql14kXZvbWfqsdH5bRM+5/XMAGKRjPLB2x1cG
 +QNBRCKggZisKMefJgGW3v0nmlWtC3VKYbuHb/YWYHJu6xO3EM23Ve6piade7lS4VC5K
 hGseMHjA/pGSWOaqNHRbVnjgGRxyQfXOMBylBCZ5hAW6Thdsd7KCdOqL+ZKrDQCGaFmo
 E/VYT6l3Idx5/mUdaoJyPqFOmnTa3C/KTeHMARfL6JDkRBmGIU156LDZ070ITNvF4lsH
 X75pP9K40baIh2wXvqLhE6gZLhPjlCbQklVn9x8u+1dWnYIgYP1pN3b0uVrvYIlhwJFT
 iLVg==
X-Gm-Message-State: ABy/qLaffr2O0sW2IWqshZSMTGxqgsRkiTjIguLF6g7XADteKkzqgScc
 LvsDTqIfFGRT2vMuuwFmykdwH5jtsDTkeisEoe0=
X-Google-Smtp-Source: APBJJlHcNaVsnq5IxLwKHZK87F69UYwFuKz7uKNszuET8IAmX7/wC5TbZLXxF0i9Uw+NvD4BgLLdrQ==
X-Received: by 2002:ac2:43ad:0:b0:4fd:f878:c3fe with SMTP id
 t13-20020ac243ad000000b004fdf878c3femr1744140lfl.43.1690469145136; 
 Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 0/5] drm/msm/dpu: rework interrupt handling
Date: Thu, 27 Jul 2023 17:45:38 +0300
Message-Id: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
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

Please exuse me for the spam, I missed the triggered WARN_ON because of
the dropped patch.

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v3:
 - Rework INTF_TE handling. Stop depending on DPU_INTF_TE and enable the
   relevant interrupt explicitly.

Changes since v2:
 - Rebased on top of msm-next-lumag to be able to use core_major_ver
   instead of adding yet another flag.
 - Dropped the DPU_INTF_TE movement patch, useless after rebasing.

Changes since v1:
 - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)

Dmitry Baryshkov (5):
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 106 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  18 ++-
 19 files changed, 87 insertions(+), 190 deletions(-)

-- 
2.39.2

