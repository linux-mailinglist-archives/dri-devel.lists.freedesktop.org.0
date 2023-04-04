Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAAF6D61D4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42A10E2C7;
	Tue,  4 Apr 2023 13:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EB910E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:08:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id br6so42288719lfb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7kPnU2nLRwz6G9LFL7GuLhoTybSEj4D3+fJk4EzfqT0=;
 b=sVengYYIfKT0tYEJOvzUwxYQMX6mUMzzLnlnIrnghVX6MxsIkC2iQJTv62sAEDSIiS
 6s9R4I+Ji0MkOb+4u0LDvF1luBy5BiFE4LuvYA/B51dWdfkF+9C8U26UCvCgVtu3E2kt
 gaD/qRbG7tIv/UMBMQD8TY4SLMqgkS0RJMagt+h/hRyecS0mnS7YklqSpxrs1fZHkhyd
 4xiwxmcWtT1jPtmNtR78qUGPDvt4M7Zcl/DewMyrvFbVa3NhNoM4buV/QNQ9JYHfovIb
 eGHxer7QCHvbxUu8wKY/1Z9lP0YdYN2YXpvF0P138G27awrn03k2i4FGbgN2Og+Pxxy8
 1EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kPnU2nLRwz6G9LFL7GuLhoTybSEj4D3+fJk4EzfqT0=;
 b=BcfGiWVW6ho/E+Wjrybn0auBgGGB7pvwTCxo44M4ncBoJrIp09jqDOlfkvq7597nem
 gwnXD2dLk1Jmx0uCRiZ9g+YrbGBDl2huncPBFk4lrm/UrJRG6kOF2k1QL3eAUYbZT50z
 KCACf9w29cz3kANnlL9fhG97AqmZctD5u9iHNwR/mAEqhsx8zk/TqerAXoyMtVDdX+Md
 JcuDtrsizIlfQtnBnrIZ9hvLYYJ+QlMPAc2HGUwAJ0uZOmjUgr2644f7Q0kYaLMVepL+
 GbZQD3RueYSR1Z0ZT3Y0zBF+6Pvsw3lixqmfSzZ2BCxr8ZlKX0maZRpm2S9ZJenagGB1
 WEKQ==
X-Gm-Message-State: AAQBX9d3hxTHEwGJU+SZ6xR6gCcoRoNjG+X76TRd8fXqWVRPqFntNU2P
 ZHiKmACxXR+QV+33v4vJtR2YxQ==
X-Google-Smtp-Source: AKy350YTau/wB3HvhMOSz4nsP/qk130OsWvl/OtJ5Xz/Hdxb+06EACeJukXpRjTwNT5WA9SLIVfpWQ==
X-Received: by 2002:a19:5503:0:b0:4eb:44da:e85d with SMTP id
 n3-20020a195503000000b004eb44dae85dmr580858lfe.57.1680613710145; 
 Tue, 04 Apr 2023 06:08:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:08:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 00/42] drm/msm/dpu: rework HW catalog
Date: Tue,  4 Apr 2023 16:05:40 +0300
Message-Id: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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

First 6 patches clean up the catalog a bit in order to make it more
suitable for refactoring.

Second batch of 13 + 5 + 4 patches split the hw catalog entries into
per-SoC files.

Then the next 6 patches perform a post-split cleanup. They enable
missing features, drop obvious duplicates, etc.

Then 6 patches rename/inline existing macros to ease using them while
adding support for new devices.

And last 2 patches migrate HW catalog entries to be tied to the
of_device_id rather than using HW revision to obtain one: in the email
discussion of the previous revision of the patchset it was revealed that
there exist different SoCs with the same DPU hw revision, but different
fetures being enabled in the hardware.

This pile of patches is submitted in a single batch to allow one to
observe the final goal of the cleanup which otherwise might be hard to
assess.

Changes since v3:
- Split the SSPP/INTF size patch into SSPP and INTF parts (Abhinav)
- Dropped the deduplication part for now. Replaced that with
  _duplicating_ the data (Abhinav)
- Reworked catalog/kms interface to bind data using device match table

Changes since v2:
- Fixed sc8280xp SSPP size to 0x2ac
- Rebased on top of msm-next-lumag, dropped merged patches

Changes since v1:
- Picked up Konrad's patch
- Picked up dependencies into the main series
- Moved qseed3lite vs qseed4 patches into the fixes part
- Fixed sm6115 in a similar manner.

Dmitry Baryshkov (40):
  drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
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
  drm/msm/dpu: expand sc8180x catalog
  drm/msm/dpu: expand sc7180 catalog
  drm/msm/dpu: expand sm6115 catalog
  drm/msm/dpu: expand sm8550 catalog
  drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
  drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: drop duplicate vig_sblk instances
  drm/msm/dpu: enable DSPP and DSC on sc8180x
  drm/msm/dpu: inline IRQ_n_MASK defines
  drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
  drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
  drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
  drm/msm/dpu: fetch DPU configuration from match data
  drm/msm/dpu: drop unused macros from hw catalog

Konrad Dybcio (2):
  drm/msm/dpu: Allow variable SSPP_BLK size
  drm/msm/dpu: Allow variable INTF_BLK size

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  210 ++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  210 ++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  237 ++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  239 ++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  156 ++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  131 +
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  122 +
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  158 ++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  223 ++
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  234 ++
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  239 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2209 +----------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   89 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    1 -
 20 files changed, 2753 insertions(+), 2243 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h

-- 
2.39.2

