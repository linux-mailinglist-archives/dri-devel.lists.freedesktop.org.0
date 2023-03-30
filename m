Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695B6D1118
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083A210F040;
	Thu, 30 Mar 2023 21:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62910F049
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:53:26 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y20so26416167lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5L5ZEDSelVBtZ55FOozqu+GozXT8Asc+2u8ZodUwXDM=;
 b=son3PxDL44lsO58j9wl/U6ELLAKPfRi4WU+BwdMrdzGhdGr3wAEpzOV+o1u9Knprb4
 dTHmTqFQuT0vccvuJF31FkWbGPFkS7S+5PULFMVASmBOut8/AlDFHBQEIFckwR2MR9lk
 EHuQg5XwBFoNoTEe4Oo3dWcYFu95tb6xRjSiAa8plNDF2Ol8jMdKlm+cgM178vHpTMFx
 wXfF45p4ruwIpERLi2AqbMZCEyipIh5U1bIErqgdxiGcQhJVmprRF9qKlLQklQyysi27
 rVARqfx0OczoTtqhfqDXcuq67skLaM7rJedvzsow/L2xn858+4R1LxNC+oYY+ZPueuSD
 B/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5L5ZEDSelVBtZ55FOozqu+GozXT8Asc+2u8ZodUwXDM=;
 b=gL22QuOl/uETFTZoq0k7j1tsSyCHO2fvDIKWmlZIFAVmUiqWjrkB6EaHunuTIsb0DE
 uue37WEqnnsUGTxTe+4r+LIJ75vbmF69P7iyGWeNSJJ756JA0al0CXpmjnOCD/yIlX/O
 0TgpsjONEFzIFenZcoS8X+0XFuAuUP0hxEyf7t2Z6TDhPNGz+C2sC+cy+osdpOT8lTPy
 WE4wlFHvibrXk0QvHO9Zr/3Jo9fSpjyM18Adz1Xp3T6+8y/kMhh2fLCUMlKxlGdNn+Nw
 RsJT3jmaTqOU80hIMwt6/jIDmpUadq1oYlALLzpFbn7dUgZpZ646lGYkrIZ1C5Jg6XIe
 O9mg==
X-Gm-Message-State: AAQBX9eKDxQ+40U+SGXIVqknmmdXEsVqSycgToODKlQdhCvf8Qc29Uei
 nNgtX8Rq83FA4WvP31p5mq+npg==
X-Google-Smtp-Source: AKy350ZGvNeQV/kPw3jx7h3Ip+StbsIHZfgnNJ65dO6ItTZiQzzRUEd05K0L+V+xluigNgYkEX5jDg==
X-Received: by 2002:ac2:446e:0:b0:4a4:68b8:f4bd with SMTP id
 y14-20020ac2446e000000b004a468b8f4bdmr7371149lfl.3.1680213205102; 
 Thu, 30 Mar 2023 14:53:25 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:53:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 00/38] drm/msm/dpu: rework HW catalog
Date: Fri, 31 Mar 2023 00:52:46 +0300
Message-Id: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

This huge series attempts to restructure the DPU HW catalog into a
manageable and reviewable data set. In order to ease review and testing
I merged all the necessary fixes into this series. Also I cherry-picked
& slightly fixed Konrad's patch adding size to the SSPP and INTF macros.

First 4 patches clean up the catalog a bit in order to make it more
suitable for refactoring.

Then the next batch of 13 + 5 patches split the hw catalog entries into
per-SoC files.

Next 9 patches rework catalog entries, mostly targeting deduplication of
data used by several platforms. At this moment only three pairs (out of
13 devices supported by DPU) are merged. However this part lays out the
ground to ease adding support for new platforms, some of which use the
same configuration as the existing platforms

Last batch of 7 patches renames existing macros to ease using them while
adding support for new devices.

This pile of patches is submitted in a single batch to allow one to
observe the final goal of the cleanup which otherwise might be hard to
assess.


Changes since v2:
- Fixed sc8280xp SSPP size to 0x2ac
- Rebased on top of msm-next-lumag, dropped merged patches

Changes since v1:
- Picked up Konrad's patch
- Picked up dependencies into the main series
- Moved qseed3lite vs qseed4 patches into the fixes part
- Fixed sm6115 in a similar manner.

Dmitry Baryshkov (37):
  drm/msm/dpu: constify DSC data structures
  drm/msm/dpu: mark remaining pp data as const
  drm/msm/dpu: move UBWC/memory configuration to separate struct
  drm/msm/dpu: split SM8550 catalog entry to the separate file
  drm/msm/dpu: split SM8450 catalog entry to the separate file
  drm/msm/dpu: split SC8280XP catalog entry to the separate file
  drm/msm/dpu: split SC7280 catalog entry to the separate file
  drm/msm/dpu: split SM8350 catalog entry to the separate file
  drm/msm/dpu: split SM6115 catalog entry to the separate file
  drm/msm/dpu: split QCM2290 catalog entry to the separate file
  drm/msm/dpu: split SC7180 catalog entry to the separate file
  drm/msm/dpu: split SM8250 catalog entry to the separate file
  drm/msm/dpu: split SC8180X catalog entry to the separate file
  drm/msm/dpu: split SM8150 catalog entry to the separate file
  drm/msm/dpu: split MSM8998 catalog entry to the separate file
  drm/msm/dpu: split SDM845 catalog entry to the separate file
  drm/msm/dpu: duplicate sdm845 catalog entries
  drm/msm/dpu: duplicate sc7180 catalog entries
  drm/msm/dpu: duplicate sm8150 catalog entries
  drm/msm/dpu: duplicate sm8250 catalog entries
  drm/msm/dpu: duplicate sm8350 catalog entries
  drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
  drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: drop duplicate vig_sblk instances
  drm/msm/dpu: enable DSPP on sc8180x
  drm/msm/dpu: deduplicate sc8180x with sm8150
  drm/msm/dpu: deduplicate sm6115 with qcm2290
  drm/msm/dpu: deduplicate sc8280xp with sm8450
  drm/msm/dpu: drop unused macros from hw catalog
  drm/msm/dpu: inline IRQ_n_MASK defines
  drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
  drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
  drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version

Konrad Dybcio (1):
  drm/msm/dpu: Allow variable SSPP/INTF_BLK size

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  210 ++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  210 ++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  151 ++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   91 +
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   83 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   53 +
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  158 ++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  136 ++
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  142 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |   99 +
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2175 +----------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
 21 files changed, 2443 insertions(+), 2147 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h

-- 
2.39.2

