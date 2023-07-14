Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27432752EF8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11410E0F5;
	Fri, 14 Jul 2023 01:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80C10E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:55:06 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so2453495e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689299704; x=1689904504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FvaSOZqsf7ed9orQcZu06EsxNR7GieKhInjCdLnIjq8=;
 b=oxikwUD1+/VMep89kyaaz/pBifhAydfoTAGiPNvERMr7AQJD63XHWZM8TZ4unCAsjf
 LxfhMfC7izHAyKyzfSZa4w+ko5foe13tgBdLeSIgunnYJlj/hK+lil7Gq/MfsrOQ/iuL
 z/JP3OB/xVaxzV6YcGlzu5Nw0cRR0gEVD9MEdIPfvdm2PnL19s6ixOPone7TecQy1a9W
 ps1UaLXrRwubYdTvzCOEzQ90yzrQUdXYUYk6MP4cGowRA+PmEB31eQR6ZSlvou2X/qrq
 +RmNco0ih0YLfu6rU9oLloF5T2wigLYPbR4ZGcZ9lJXL6+8AljILRgnkvQ0yzDLC+ExU
 waxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689299704; x=1689904504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvaSOZqsf7ed9orQcZu06EsxNR7GieKhInjCdLnIjq8=;
 b=loGuEyarTObqQm0eWhtDZLWHigQGrR3AwQPUlq9N/9tv0uE6JgjTKOyaJZDukQ7cih
 QHHLoT0JuTqlZltuKviLRNRaJHIjGbduaBFa07NUtqsCSn267iB10IuG5Sq7aKJz5oua
 vJ9T/r3SpkN6vdvrEbAynYOl04TDHIL/dpcNBcmUee2dr1B/6FATD8cq4WYAAWGgW+qF
 uTgzDpdCVYu+G2sVAjLbLNpmGCgaZNYHlHspWscnJ3jy4boiIxMytRwiTeZzMPLq+w+0
 Uj9JM5H1ItMS1n1zAhKXNt0LJ9CKerlIcLgX6th7Jgju1yPJet0A1YFo3E9riUnla0/4
 8YYQ==
X-Gm-Message-State: ABy/qLZNY8MyxkD922jfjKWU4VJbvmW3nCTwYeI6si2tcZdnNNpTXFpD
 eJL3vdCsnj9lS2nAc2WmxBptwQ==
X-Google-Smtp-Source: APBJJlGcwnCRoXxf++RPSnwgkdrhPb+zS3oX2wz734qK8ZrTlhVimyqZ7/jDRPWxgXeQa3+/eHtxgA==
X-Received: by 2002:a05:6512:3f10:b0:4f7:6976:2070 with SMTP id
 y16-20020a0565123f1000b004f769762070mr2650059lfa.40.1689299704105; 
 Thu, 13 Jul 2023 18:55:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 18:55:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/4] drm/msm/dpu: simplify DPU sub-blocks info
Date: Fri, 14 Jul 2023 04:54:59 +0300
Message-Id: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (4):
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   6 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  16 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  20 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 100 +++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  44 ++++----
 18 files changed, 141 insertions(+), 193 deletions(-)

-- 
2.39.2

