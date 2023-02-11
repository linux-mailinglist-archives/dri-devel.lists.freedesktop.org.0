Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECBE692CCB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CFB10E2D5;
	Sat, 11 Feb 2023 02:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3668910E2D5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:10:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so18130723ejc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6hXY5qH7E6QkEVbSGwR80wGsqXPfBW3dz3Y94maE6JY=;
 b=b05kldMrVKaejm2R68XOD3ANon3jqRUn9tj69avSInETqVyQeCrpUzrYfI3HXF9tmI
 P+/NptKfKKTkmOG6rZkjHwOaoZhNyra9djB1FMHStvGmAomoO02wHA7GmIinY3DIY9jJ
 GBNkUzxSutucEDH2PLXv4om7jmVZU5vredBk+zZIJoJTDyKxqoTxz5ei7GspKGTF60ZI
 Rq0RPRwJWr0UuDWKzy8bt5IdxVqT9C/aMTJ28U7rw/OXEJQbaTnFA668PnzUX0fOkbAD
 9nqikMqMAMl5YkUqf8NyVfXXdzyRLeopYj53zIkkQqIX+isOrwxSDIC1cpQCdA+qY4P/
 KYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hXY5qH7E6QkEVbSGwR80wGsqXPfBW3dz3Y94maE6JY=;
 b=yTmDkmAyuIeY22RLij6Sk2uFfwADDrVvIPXCRz4q0Eli9dAbnmnydqnj/oDEkEuyKz
 M/zcX0zZrOq+ko87B3UA2i96QUMTBf2O+2uLSEhMmgxiD6i/Ri6tpQmmTh8nimC/hcsk
 47W3cEoDg8hCGfoKfnizatxIM8Q0u34CaIIV9LIhfrtSIwLyHXVHzDOXV9DcTHIAm1JE
 7ZubUhWHcEcUlTUqVKCW64nMVeuMOHMF74U1TL5bj5Bp4U0nygXhUyMfNX2LRBRY/+WO
 4x72MWQhkF3q/q9Q+NtyhUuml61KyPI8ej2PDhXN/WMcFjbdcUvjsAPMbIlcK68GE6MV
 1Kcg==
X-Gm-Message-State: AO0yUKVmU2ZkqC2zXYglV5+ndx2+LiZXKH0Hb+iq+dMW2etZVhcUgcDu
 kh7NeNrIRHX+wgP85n9kn8H12w==
X-Google-Smtp-Source: AK7set8PJOR2U2iajUihDbLspiFSxFRTazkl/1iSqzcfV3oQIjOeLvCR7mB+LkGWB7VnAdkRnVCkiQ==
X-Received: by 2002:a17:907:318e:b0:8b0:7cf6:104 with SMTP id
 xe14-20020a170907318e00b008b07cf60104mr166609ejb.67.1676081455379; 
 Fri, 10 Feb 2023 18:10:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:10:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 00/43] drm/msm/dpu: rework HW catalog
Date: Sat, 11 Feb 2023 04:10:10 +0200
Message-Id: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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
manageable and reviewable data set.

First 3 patches clean up the catalog a bit.

Then the next batch of 13 + 5 patches split the hw catalog entries into
per-SoC files.

Next 14 patches rework catalog entries, mostly targeting QSEED cleanup
and deduplication of data used by several platforms. At this moment only
three pairs (out of 13 devices supported by DPU) are merged. However
this part lays out the ground to ease adding support for new platforms,
some of which use the same configuration as the existing platforms.

Last batch of 8 patches renames existing macros to ease using them while
adding support for new devices.

This pile of patches is submitted in a sinle batch to allow one to
observe the final goal of the cleanup.

Dependencies:
- https://patchwork.freedesktop.org/series/112847/
- https://patchwork.freedesktop.org/series/113894/
- https://patchwork.freedesktop.org/series/113206/

Dmitry Baryshkov (43):
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
  drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
  drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
  drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
  drm/msm/dpu: correct sm8550 scaler
  drm/msm/dpu: correct sc8280xp scaler
  drm/msm/dpu: correct sm8450 scaler
  drm/msm/dpu: correct sm8250 and sm8350 scaler
  drm/msm/dpu: drop duplicate vig_sblk instances
  drm/msm/dpu: rename VIG_SM8250_MASK to VIG_SM6115_MASK
  drm/msm/dpu: enable DSPP on sc8180x
  drm/msm/dpu: deduplicate sc8180x with sm8150
  drm/msm/dpu: deduplicate sm6115 with qcm2290
  drm/msm/dpu: deduplicate sc8280xp with sm8450
  drm/msm/dpu: drop unused macros from hw catalog
  drm/msm/dpu: inline IRQ_n_MASK defines
  drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
  drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
  drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
  drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
  drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
  drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  211 ++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  211 ++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  152 ++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   95 +
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   84 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   54 +
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  159 ++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  117 +
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  123 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |  118 +
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2170 +----------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
 21 files changed, 2423 insertions(+), 2153 deletions(-)
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


base-commit: 1d233b1cb149ec78c20fac58331b27bb460f9558
prerequisite-patch-id: 0898891b053cb26fac9905ab98ec0c80ff643200
prerequisite-patch-id: a2eee8202ca90755a5accc450b34ccd0851c862e
prerequisite-patch-id: e9c11a97aa84bd0f560cd13a54943ec53a8686db
prerequisite-patch-id: 1f4d1c2fdd7700dbf00f466c0a03d0d890e9f4c3
-- 
2.39.1

