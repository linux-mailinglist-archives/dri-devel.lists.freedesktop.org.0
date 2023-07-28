Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BA767906
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE43A10E7A1;
	Fri, 28 Jul 2023 23:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9FC10E7A0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:32:03 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so13384631fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690587121; x=1691191921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9CT7/d8hNuwfOKkfzLeLsqBpMbScuX2Y6f1uvXet40=;
 b=U8LVGNMXkDnUfj8pHwjBcZk65oESytAL6ZKnfOHsTHwy+Uw5Q4A1qHtnw1r8oP8RXL
 X1LHmgFJ+9dWFZPawl3NY8mjcUxVGemFK6p7k7vcrf+jUYh2MH5KM5GJ8oUwoIcVvxsu
 WEBrG8S5RtZsjBsCuEtdxn0jjRgeEOkCOPXdK9X3d3lg5nSggO+hhppcRpx33vwkAU6b
 W0gbBq4K60HfB9Q1A1A978um+Y2QvznlJJdfWaap43ImJE6F+dxVeyV1TS9Pwi582a+j
 t+aqqXvg8hyMQ43mrHCMcabS0WC9pb+3FG0Jn/pwE4i5EEZ14f7RqWohJjPY2FrF9YLt
 l93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690587121; x=1691191921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9CT7/d8hNuwfOKkfzLeLsqBpMbScuX2Y6f1uvXet40=;
 b=VrT8O8nJsYQU4zW/Ep78VHBHncZJopaAEpFItd1gJ4ss+Repk2FLcJPeL7sNr3Rvu/
 tBONaYwxD5dYkfbZaTQu2okORwCsBPFYVGtvy5vuxif1C3xy9/A1h5DZ4lx7KTnShGuL
 WqNtDBrihv9Iyzc1M5t3gPKG3MLzxfnJece1NGFwgyHyVspjTJh+ChfcLcwTKUfPVQgt
 +1DlK2AoaQua3E/jodCC7MjOW6DDpCdIIeyqovkkrZl5LaOhyKvHheStYsDANq+IM2i7
 kHzM7bJOyrPJdESjHKo0siq3yn1ARvN5FkjbfY09J6wsZdGJeiQfoXYiZ+VxKUcnTivf
 Dt4Q==
X-Gm-Message-State: ABy/qLbYCghMIkUSkPAA+q+6j7IpcPHzDVMvh8iqIx/Bs7uzcNqoTrPw
 Bf31q2+xQ/RciUHV+hQ2rbckqQ==
X-Google-Smtp-Source: APBJJlHtx/x/anMH5H0H0nolkgHJsA/Ynlf6FdIwhn6RRXr1bYtAbAfOBWLA4ErGnuvkgajpN2YWtg==
X-Received: by 2002:a2e:8e81:0:b0:2b6:e78e:1e58 with SMTP id
 z1-20020a2e8e81000000b002b6e78e1e58mr2936611ljk.5.1690587121493; 
 Fri, 28 Jul 2023 16:32:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 16:32:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/6] drm/msm/dpu: change interrupts code to make 0 be the
 no IRQ
Date: Sat, 29 Jul 2023 02:31:54 +0300
Message-Id: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
 - Added the dpu_core_irq_is_valid() helper
 - Replaced irq_idx with reg/big pairs in kernel output
 - Readded -1 when accessing the IRQ structure.

Changes since v1:
 - Rebased on top of msm-next-lumag and updated IRQ rework series.

Dmitry Baryshkov (6):
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: extract dpu_core_irq_is_valid() helper
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: make the irq table size static
  drm/msm/dpu: stop using raw IRQ indices in the kernel output
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   9 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 155 +++++++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  18 +-
 25 files changed, 131 insertions(+), 202 deletions(-)

-- 
2.39.2

