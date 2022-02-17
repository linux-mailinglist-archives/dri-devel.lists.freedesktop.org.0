Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB84B97B3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 05:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0578410E82E;
	Thu, 17 Feb 2022 04:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC95410E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 04:31:50 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id bn33so6474445ljb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 20:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNj42/lJdlgSodUSxPSjU0zf2PPxy6ssj0HPCjOotes=;
 b=KMNVQoLGiu3fPSXvGiW2dZFnJjLkltmuc4YS47xtoJ8v3QzL6SNdLxct2awfSjjDNP
 TcH5H2IlmM0xQdl/hRa5dJo4ajrqFEcb6AiaJKKh3dNuVJs1gsuJozQBkKY8mV3Ohozo
 oLJFI2YTcQzw2O2/+Ksc+PfFxGbBmgNQ7CSCe6f0tZj7rq0PZiaMb5Dny7RJfqIZs0RQ
 ZLUF2gJXnvGqSmk88+fFbfa0VMa+vdAmTk5yPdpwUG9rGAiTTHyt3kOSQHd58mM3bCUB
 tGGr3me/GhBFXLxSNgsmgur/LMzRPjGRMXLKWK7SQYEAuVPvjlaXJixyYzb/vQGbMOzy
 nLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNj42/lJdlgSodUSxPSjU0zf2PPxy6ssj0HPCjOotes=;
 b=f4910TBzkIHC76+vPyZf4SpfBehAr32+2YEduqGYT75+zVxGn+RGaFO7J9+CfzWpFG
 W0nvqzFi3FkUFk9j6INiSfDqoLNAUQBDtqhmdwLQgG62LJXuP9OHjTAF/bIno5DU26bj
 FOfDjQsDKoC24rR17W3/L1WfCGf7pSbgfrm2nvmSXmGUlOmDh+2owsUXTLoaO7mnFXX5
 g6Kr0DpA+Tms0CTdpBtxnl6bUewUtmX82AK9Df0ifkRXWtukoPp5H1sgiDwUgMETedgn
 LqSCdpn2RZHUauAOcG+2seJe9BJ2f2BDjaicJjiaHBR6i8PjNP2S7+I1ZWwkxRJgUftg
 8nRA==
X-Gm-Message-State: AOAM530sGDmgEGYTonQck3+Jr2xftIMOnHyO85IVujG3ZyG4s7NbJCFI
 PcGL6mc4zdk7cF6/oF98wjUOdg==
X-Google-Smtp-Source: ABdhPJwnaCikXIxgUC8kjXsVHGKy7uZpNhrFPtf12oJlxW7wJ3rvfqN2M2wCLmApiOSDYSGfCsIsIQ==
X-Received: by 2002:a2e:bc03:0:b0:23c:af37:a6bd with SMTP id
 b3-20020a2ebc03000000b0023caf37a6bdmr980301ljf.14.1645072309302; 
 Wed, 16 Feb 2022 20:31:49 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 20:31:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
Date: Thu, 17 Feb 2022 07:31:42 +0300
Message-Id: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the second part of
https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.

Changes since v1:
 - Fix warning ins dpu_trace.h related to
   dpu_core_irq_unregister_callback event
Changes since v1:
 - Use ARRAY_SIZE() rather INTR_IDX_MAX when clearing irq arrays.

Changes since the original pull request:
 - Split applied patches
 - Add unlikely and WARN_ON in dpu_core_irq_register_callback()
 - Remove extra checks in dpu_core_irq_unregister_callback()
 - Remove unused arguments of dpu_core_irq_unregister_callback()
 - Clean the cb and arg in dpu_core_irq_unregister_callback()
 - Split the last patch. Leave enum dpu_intr_idx intact. Pass irq index,
   callback and data directly to dpu_encoder helpers.


Dmitry Baryshkov (6):
  drm/msm/dpu: remove extra wrappers around dpu_core_irq
  drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
  drm/msm/dpu: allow just single IRQ callback
  drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
  drm/msm/dpu: remove struct dpu_encoder_irq
  drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 112 +++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  43 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  92 +++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  51 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 157 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  67 ++++----
 10 files changed, 202 insertions(+), 403 deletions(-)

-- 
2.34.1

