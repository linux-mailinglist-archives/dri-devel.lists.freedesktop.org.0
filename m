Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0070CCC2
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3C510E18D;
	Mon, 22 May 2023 21:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41C310E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:45:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b256a0c9so1519037e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791928; x=1687383928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k6gn7Y4qoY3ku7wbFuicMLgC2spCVikeHkn0CM0cq+U=;
 b=TRrV+NSmwH0JScLFBWL1YvLsnvWyGmhV732WFztodQD6F/T+kOgYt3A3pZWyVNT9+i
 2YYeRZntBy0nhvzlYJB9YDLkaILZ3xKklZmBq+y/8MZZXjJS4kZ/dbn5atnD3fImLPwX
 BQ8hDRY5/KEmVir/eab856pq0xPu94/SFsogYvsvTwFa/fWW3nEl7nnoGXssJKOOabLa
 aKWLV9Q6m9a6vZaXkMhIvnKdMmj8IIHZr6AVgMKaSTKHykkjVCNWXrf0wQvc6hn5HtP/
 fTjkdbK0sgnwHWeopBFrRXJuzy9eNj3kKrRQ5r8TRlHfza73io76uDdw1oBu+QEWltld
 cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791928; x=1687383928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6gn7Y4qoY3ku7wbFuicMLgC2spCVikeHkn0CM0cq+U=;
 b=gcnDQ1RUhbgpu5laWhdHJcGp2IHTqq9IzupxjtXoeTRW2UBfWmbz6A7h9iuoGa0GrW
 qQcERLOptgNYu9aUgP7rV2/3K1S+oHc/Gz1z3e0sib0JsdLy3YY4MaKyk6U/FWq3OvUG
 xiZU9P6UAEeziwtblw9RvZcwFNiUS69ovcg/hBqQSvNDf3Tc5YxPoOfk68IBaYr7q7Ih
 VI3WOLFpdKdp0p1BmTnMSPTTy1bQp5OVIpU6heAG+Y/xnQ3pXT88+Dkm1gWizmvETcAM
 WnYyb8IfLuBzi8rbi1TBJMtEu3j1aGAm+EZj0nnuBcN/FPO+EAyUMjvsOitPx72JWsz0
 PykA==
X-Gm-Message-State: AC+VfDxuX4TgfJMHNHBJz+uJE0TD1zvwJh+d+xrdp82kaKAMX2f5DnCe
 uznfDbiKJPOqRigbj1UMm0JpQA==
X-Google-Smtp-Source: ACHHUZ6TaZjp2uCnvt0sLePWE7ya6+815pDv0RMQQ2jfUWQNEJpxo0lOlEKl3dQqPUVkcSLKV1a0jg==
X-Received: by 2002:a05:6512:21c:b0:4f0:5b4:4863 with SMTP id
 a28-20020a056512021c00b004f005b44863mr2944951lfo.0.1684791928542; 
 Mon, 22 May 2023 14:45:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 14:45:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/6] drm/msm/dpu: rework interrupt handling
Date: Tue, 23 May 2023 00:45:21 +0300
Message-Id: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v1:
 - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)

Dmitry Baryshkov (6):
  drm/msm/dpu: don't set DPU_INTF_TE globally
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  14 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  10 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  19 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  14 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  14 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 110 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  21 ++--
 17 files changed, 102 insertions(+), 175 deletions(-)

-- 
2.39.2

