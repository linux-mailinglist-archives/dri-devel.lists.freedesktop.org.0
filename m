Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C874D721897
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 18:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1E810E155;
	Sun,  4 Jun 2023 16:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF3710E157
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 16:28:03 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so4891789e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685896081; x=1688488081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8vc5MBeCCZI5bHxGJ2Sp9BdFxUUJzEqrxMFqdzuocP8=;
 b=M3GctNXIEoVPdRabkg/D4a0oxTdq0d3kfoyN37LwKz1LWlXY9Rr87iShi5PZZ+Xwf7
 XprbXBGtOp7Vyc4JosJe+IL9NC9xAektr1I8jl0ov9BlsELkB0MskwfcTlr/jPuH2zfD
 /uiSe0zko4HA4pu6yBmTkgzXo0RZnOAmtYpBVayZhFC88SVXK6C7Jg2yy9msPqM43kzM
 PFkq3ueoXGn19i4hAL1aBS40LkwdYFvuofbxpM6MQtxutsW7qCVdP9aIzbaATU8NANiP
 mL9/SikpTvw+FIrdgfy087zyYL2GNq6GrCabl5djYxqJq4clge1e57D565eUmMkawWzQ
 2RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685896081; x=1688488081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vc5MBeCCZI5bHxGJ2Sp9BdFxUUJzEqrxMFqdzuocP8=;
 b=OVFjuiG8n3nEo+vl78TrU9SdIncJDV70y3h7BXzJZM6lSZTqEaLonb/2+JLW+bJX5w
 ZbCgEcxlNe19CxkKqGrwD1JhJiZaD/7iITcnrsd++su+4Hw0DldhbDlADfnKdccf9l19
 gRMmWlAHo/eq9MJFdNGNCVwfbYKJSk93bbByIlNnVnvSCnb9OcADa5FMyBwhMqUg8rrD
 v/Jl/Kca1QzELpZ6jC7xmnBiG7/UckkDLhf+G3Pnmh0AyV79/hXYu4gvmcRHE4gqOk04
 1FoJpV4O2yaMwMa5BX/BPIxqgWVRbtIka838/sPsoPw/qOomXu/1lByxDCxzu39bmoFf
 bwmw==
X-Gm-Message-State: AC+VfDxnMYfzb9SnlchV9UoqqJVoTYI8pcmOwJseQG6niSMkaMzfFWRh
 ZFAMPwJU6QIs8ar0HSbCGzomHw==
X-Google-Smtp-Source: ACHHUZ5pREsN2MHzx8jSBJ2yDWA0drKmDfKerC6Hz/sXLS47q17yzFfm6KEqYLDxHTcny/r49UO15Q==
X-Received: by 2002:a19:f808:0:b0:4f3:b61a:a94b with SMTP id
 a8-20020a19f808000000b004f3b61aa94bmr4546784lff.53.1685896081315; 
 Sun, 04 Jun 2023 09:28:01 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 09:28:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/8] drm/msm/dpu: change interrupts code to make 0 be the no
 IRQ
Date: Sun,  4 Jun 2023 19:27:52 +0300
Message-Id: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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

As we are preparing towards expanding some of the macros, it would make
sense to change 'no interrupt' from -1 to 0. This would allow us to skip
the field assignment completely rather than having an explicit assignment
.intr_foo = -1.

Dmitry Baryshkov (8):
  drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
  drm/msm/dpu: use PP_BLK_DITHER for DPU 6.x
  drm/msm/dpu: don't pass intr_rdptr to PP_BLK_DITHER
  drm/msm/dpu: split PP_BLK_NO_TE from PP_BLK
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: move several IRQ-related defines
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 30 +++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 30 +++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 30 +++---
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  5 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 18 ++--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 12 ++-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 12 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 24 ++---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 24 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 16 +---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 17 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 92 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 18 ++--
 21 files changed, 186 insertions(+), 197 deletions(-)

-- 
2.39.2

