Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6576CA53
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 12:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B1210E531;
	Wed,  2 Aug 2023 10:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3005C10E531
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 10:04:29 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so946055e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970667; x=1691575467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=izmDC9RsdCQbJBlU11/lW4sdu4loxNg0jjfHkErdNjU=;
 b=nnXoe2hPcIEKxrCfIDgp36+gTLaXhE+3V34AfVaeJ7+slZE9m3Jt3UEDg+9fpVrEQs
 AxCXj10Oho+pJzRhWRABQKfEkI8RRDL/q6bTJPvHbRThmmCeaoGMXpQZsKutsKR8blfQ
 KrqJhrEF9n5skgk9Npl49mEs4WWn6959iXbJzie57MY5tAiJk07B4x5/TZKOoxjYrwzQ
 RYzDLoGFaguBVKKemaetzrbBVBxaR2gzaK9oWid3gsi8njWUYiL6unAILcfL9A0GAvhP
 PFFVJMDVFVyVM44Ow1daerxrhZB/RcQLLHKn2LCpyPjOuE7rMgUivrkhY8tQp8Hoogz0
 KE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970667; x=1691575467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=izmDC9RsdCQbJBlU11/lW4sdu4loxNg0jjfHkErdNjU=;
 b=P7q2vKCeVQNsRoxhc7PORbNKOG1fBRn0zGDNPf9jrBv34hFnyF/20oiW6mJHNvG33U
 Hn6cO2X9JLaSCmo7/V53vSNcHq50oDx18NEiUj8I+5w/0SbiodSWlZ2Yz9RfgA6Mq4Qs
 nFAMT0D03Dw+jFCDY6wykadpuqcO2N2xw+fOIwxt/sY5KQca5r4VBzrQ8p1+L8ort7/s
 EjslR7hhbOpb05fCQnmOj63H+cUl4CLzo6NtHrpvmh2uId+6yIGphQ7xEciDjhZpmjJE
 KQyjGs2iprXCfDXZiALXFddAnMaD0pg18hUEmpjAx1dazQQGcu1olCcwQ9kLRLb9u/+T
 QoaA==
X-Gm-Message-State: ABy/qLZhQCdwvvuMwRA91ZpGKJmcHdftvaDYxeOUVhvNjRksWpoou5Mm
 z5SBUNDPmNceM/8gmHw+xkA84w==
X-Google-Smtp-Source: APBJJlHtKlpldz5wlYRKarTCXQhtHX8P4JyvRE88Iz1/6nXjMw2GVdxgC67DCrCFuhOwZ0NGT4Es6Q==
X-Received: by 2002:ac2:465e:0:b0:4f9:5693:3d2c with SMTP id
 s30-20020ac2465e000000b004f956933d2cmr1735049lfo.34.1690970667406; 
 Wed, 02 Aug 2023 03:04:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 03:04:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 0/8] drm/msm/dpu: change interrupts code to make 0 be the
 no IRQ
Date: Wed,  2 Aug 2023 13:04:18 +0300
Message-Id: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
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

Having an explicit init of interrupt fields to -1 for not existing IRQs
makes it easier to forget and/or miss such initialisation, resulting in
a wrong interrupt definition.

Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/118088/

Changes since v4:
 - Really add a fix for writeback code (got missing in the previous
   series)
 - Reworked several printk formats strings to always use IRQ=[%d, %d]
   (Marijn)

Changes since v3:
 - Added a fix for writeback code
 - Fixed articles in commit message (Marijn)
 - Dropped dpu_hw_intr argument of dpu_core_irq_is_valid() (Marijn)
 - Reworked REG_IRQ_BIT / REG_IRQ_MASK / REG_IRQ_IDX (Marijn)
 - Fixed irq format strings (Marijn)
 - Also updated all trace points to use reg/bit pairs instead of raw
   index

Changes since v2:
 - Added the dpu_core_irq_is_valid() helper
 - Replaced irq_idx with reg/big pairs in kernel output
 - Readded -1 when accessing the IRQ structure.

Changes since v1:
 - Rebased on top of msm-next-lumag and updated IRQ rework series.

Dmitry Baryshkov (8):
  drm/msm/dpu: fix the irq index in
    dpu_encoder_phys_wb_wait_for_commit_done
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: extract dpu_core_irq_is_valid() helper
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: make the irq table size static
  drm/msm/dpu: stop using raw IRQ indices in the kernel output
  drm/msm/dpu: stop using raw IRQ indices in the kernel traces
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   4 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   4 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  10 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  13 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  12 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  41 +++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   6 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  19 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 160 +++++++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  72 ++++----
 26 files changed, 195 insertions(+), 254 deletions(-)

-- 
2.39.2

