Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6F79AB96
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 23:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600C310E1EC;
	Mon, 11 Sep 2023 21:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8234D10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 21:45:24 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5007616b756so8147701e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694468722; x=1695073522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8J6OJLL6yO9801GDZc9YLhZ4do8H4JQeCks1RXRX5uo=;
 b=Z6s3n3JYGed/ej2wzRUe3gWnZttUWUhCycOgScUd2ylQoIH9p+Kmwcm76o19sz9l4K
 /ZjqrGyydcV2oUwSEAGO9ydf3MeXy9P8O5nLRRW/qMvL/ueldmcuvvU4g8gwg/yXLzTn
 MRkm8yfOUeR4QeAXMZUuRbIC1Y616yOLWgaMBtT9jcQ0YDXy9r24HqdXSdnMpz4Z6Qre
 vCUVZbQnXaA2kMcN/NYMVsjxRmkMajs5Jux4FkoWD7wyDbqEeEgUTbDWR8pMdlxvd5Q/
 sGn741lsNM9FhqA3X7oci96x4CHIJbuf0c/PL7lB8J2EHfxqt2JxLAu53/ThyhMQIUT6
 Q+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694468722; x=1695073522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8J6OJLL6yO9801GDZc9YLhZ4do8H4JQeCks1RXRX5uo=;
 b=H2WuROv5Zv/XAH1RWkhRxyyvy0M3m+GoMcY5Zcs5ihZ95iqQ1c0U7sXZi5Zbz33OVC
 vAunaRNXW3kS6g7HWA2umrNciQAM2ccUrKiVWjJZgcs9fPZ43z2+CXWguEFysqoiFUH1
 V6hxFQB+aRFqNYMYCymX0FT60RWop0vZduSZ/1pOAuurYVZl6qnn2nvZAQJUe3j3NHPu
 Cr5TD2KPZ1jFO/kHfZz7XC9mBAk7RKgblPKtOSa+o6+9GeKmcb29feUelloCdpSl6KEn
 lQi0gi22sYIPSwDIQzx7QzSODwRm/pOTOtNCjHlroCD1z1vvwKMO+ZLYkeYkmPQ1Ff7L
 LECw==
X-Gm-Message-State: AOJu0Yx1905dlCCkaEaSA3PbbWWdGPzyWanJk2WvgRmKnEV78X6hI6t+
 H3R+cYTiGxLIQf+RJBpNf1seFg==
X-Google-Smtp-Source: AGHT+IGJG8+w5mQL4Vxq5yngRkpLjVobswZYDr4KahW5nJJpi2M2Aw64a/Svk/t9loqH66PWcO2JlA==
X-Received: by 2002:a05:6512:281c:b0:4fe:ecd:4950 with SMTP id
 cf28-20020a056512281c00b004fe0ecd4950mr10973430lfb.1.1694468722444; 
 Mon, 11 Sep 2023 14:45:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 14:45:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 0/9] drm/msm/dpu: simplify DPU sub-blocks info
Date: Tue, 12 Sep 2023 00:45:12 +0300
Message-Id: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
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

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

While we are at it, also fix all VIG subblocks to contain correct scaler
block version and drop the becoming unused QSEED-related feature bits.

Changes since v3:
- Proprely describe dpu_scaler_blk::version field as the register value
  (Marijn)
- Picked up Marijn's prior art patches (sorry, missed them while
  preparing v3) (Marijn)

Changes since v2:
- Reworked the VIG SBLK definitions to set the scaler version (Marijn,
  Abhinav)
- Rebased the reset of the patches on top of this (intrusive) change.
- Folded QSEED3LITE and QSEED4 feature bits into QSEED3

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (7):
  drm/msm/dpu: populate SSPP scaler block version
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
  drm/msm/gpu: drop duplicating VIG feature masks

Marijn Suijten (2):
  drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
  drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  29 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 145 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  55 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
 23 files changed, 200 insertions(+), 296 deletions(-)

-- 
2.39.2

