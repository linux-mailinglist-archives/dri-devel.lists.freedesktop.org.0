Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E673B941
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652EC10E632;
	Fri, 23 Jun 2023 13:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465910E118
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:47 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b470330145so11670071fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528725; x=1690120725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yOhWkbu2l8TcyI6GhCT/UC0v9ZBG8+6y99ASll4jh3w=;
 b=gOT4WUNixw1iqApc2hvVhE0lW9ZYNsgY52m1tquGH6LS+PTQVh3rFeQ4cM7/c/Ux5h
 x7cywYZVk2Dq4XyJTHpb28rS2VY+mSLlLIngwNUc9waWV6G2KceJ660ddP9C0tEAzpuF
 Z1+Qcqrt47Iuj2Toio3qx931DbFv8VRkQzFSb0wflAjrP/2tMWqbBeEWfVeVQdw0jpU8
 8IyLpjOQUEUqf/AU1TX9OE48wD1z71a510M5mnVRY24KEVjbNyUWy2RcKwCsVCozuoSk
 okqHVYl7Qdj6BdutCgjVMy/Yctq0RUpoHlj9y2gnyPc4PL5aqf68ByLmC2NBClwKgqck
 9bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528725; x=1690120725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yOhWkbu2l8TcyI6GhCT/UC0v9ZBG8+6y99ASll4jh3w=;
 b=FH/sQc+j9pELiNZbsdXofHhWU7jXbvoL5Vq7xcKfTcGe+GA/Mkbz/aOYpBYVPbQ+2N
 Gzoub8kg6eYv/2RRNWCDKJZyOnfO00hNsF04ibKeZ/tSdEGULuXr0f4fpiZrLxdnJBpf
 Ng3Wg9MESMlj0lWjHhsR4c5Lm0ruIEw6h8IFggpCw4gavVdT+llIx5hAlbh5niSimjuG
 NEsoWpxNq3Y0QQqxjffEMYXAMBwew6/5udoL8XnKUr1QvaZZnxkZXPO2dr3nKphFtpkx
 nNVRiL1vDMTFBrKZn2eHmvxXHYXmCuLpSHQvXAGVaqwqAKQ0qgJU0ckXXX2dbAILwNNf
 wjjQ==
X-Gm-Message-State: AC+VfDyJgHlZyfmWq0o3owerzwoDLrmmycPDVDT7rUVKerhnPjOfN/iL
 w0yj3jveTaWDelA8m3pUbrR34Q==
X-Google-Smtp-Source: ACHHUZ7CUw4mSjt7xEoQZLR9dgp37du/c/s9wAc01Q2NRnVzbTqGUFk86gqyTYlJKvykW/TqCI39OA==
X-Received: by 2002:a2e:a175:0:b0:2b1:fda8:e653 with SMTP id
 u21-20020a2ea175000000b002b1fda8e653mr14243650ljl.27.1687528725225; 
 Fri, 23 Jun 2023 06:58:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/7] drm/msm/dpu: simplify DPU sub-blocks info
Date: Fri, 23 Jun 2023 16:58:37 +0300
Message-Id: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

Ryan pointed out [1] that some (most) of of sub-blocks do not fill the
field `name'. Further research showed that we can drop the fields `name'
and `id' and further simplify the catalog. The handling code also
usually knows, which sub-block it is now looking at.

Drop unused field and arguments and merge some of sub-block
declarations. I did not merge inter-generation VIG_SBLK definitions,
this is pending another cleanup (which will also switch to using
hardcoded scaler version).

Dependencies: [2]

[1] https://patchwork.freedesktop.org/patch/543903/?series=119773&rev=1
[2] https://patchwork.freedesktop.org/series/118839/

Dmitry Baryshkov (6):
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the field `name' from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: merge dpu_csc_blk and dpu_dsc_blk into dpu_simple_blk

Ryan McCann (1):
  drm/msm/dpu: Drop unused num argument from relevant macros

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  16 +--
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  16 +--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  16 +--
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
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  20 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 122 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  48 +++----
 17 files changed, 154 insertions(+), 200 deletions(-)

-- 
2.39.2

