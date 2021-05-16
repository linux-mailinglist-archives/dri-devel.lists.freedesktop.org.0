Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BB3820E7
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 22:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621116E87F;
	Sun, 16 May 2021 20:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558E46E87F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 20:29:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id v8so775430lft.8
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yx7lyjus5tkXrUkQqZ06xZS0977rH25/5Uu8MUALxzU=;
 b=JjvEJePtFvg6AAjvz13dQA9K5P5LCJ7yAHnN1UxZkQdjwG2FLGCTAT7+H9uCwDrn0p
 CTC2Bas1BfLXW+zlEpl/ottJ82eFLrvtkw+pmQmadvVu3JlWrxcKtcnnKHOe6PD8hWnH
 XHhfnO3BMhUjmi2UIUGtWbbHnKjIdgRXSaVYWMV3lWMKUsMJqWN8fPMML+ZaocxswGXY
 LV7obEkUfbi5fGhQB4FTJy0ylFOXJ6oh9BWn8TPm2jcX4F1B8wyu0zXnLe0RnpK8izZs
 BQyFqSQb8zDVXIpQathzlqP69LBRJmk/+LPWIfUERGKncgegxGDhZRhGcHT5W2FEb+ye
 IWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yx7lyjus5tkXrUkQqZ06xZS0977rH25/5Uu8MUALxzU=;
 b=kKags5hxpYPTdSxI8HomKxX/4ofoSPEBM3nGiELK4e0btXVqxe85ZZ61PFO7dKWgx+
 Th44Tx+2OgXZ8Qth9SymA9q3zkhvLPuB93pfVkifIuucLyV1H0zHqCq3Mwi4HXiRf0rs
 Pa16X/dpN/HZIl77ERKRRX1YOsVcv4DIAbyNGEnSPxFJnPBCk7DnemdgkjPzFGJGbp/R
 drOs2HXSdVtA/XeLjDiMmoXSR4JGJ14Zsjlf1+3RWNiEG6aD0O5rU2WiloWajUsS8fgd
 HWMF0dhNznTGRqRG1KlcFSxr+bJZnv2wiZrUv3ml/FKbGREjCjzpzOPv8f117vOXXShE
 h+Tg==
X-Gm-Message-State: AOAM530FFCvAp1OdW2TRCqcK5sdg7f+AezAbPLFay/00EmL10A0q9pxY
 ew1eM06f58HdN09+olAeTES1bA==
X-Google-Smtp-Source: ABdhPJyZknMufSGJqVoQHvCXUeuulq2yKpWMWfgmFYNb3IXMFAKxE+aZKJYQfq4GA7eA9EbT5pr2dg==
X-Received: by 2002:ac2:4f92:: with SMTP id z18mr38521595lfs.343.1621196960758; 
 Sun, 16 May 2021 13:29:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l10sm2629795ljc.132.2021.05.16.13.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 13:29:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 0/6] drm/msm/dpu: rework irq handling
Date: Sun, 16 May 2021 23:29:05 +0300
Message-Id: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify IRQ handling. dpu_irq_map is a huge table consisting of all
possible IRQ entries (including a plenty of 'reserved' = not existing
IRQs). It is always used to lookup the interrupt index (in the table)
and then to use this index to lookup related interrupt register and
mask. For the long period of time these indices had 1:1 correspondence
to register/mask pairs. SC7280 introduced 'additional' IRQs removing
this correpondence.

Replace all IRQ lookup with stable irq indices, which correponds
directly to the register/bit pair. The irq indices are now fetched from
the hw catalog rather than being looked up using the hw block id and irq
type.

Changes since v1:
 - move IRQ indices to hw catalog rather than looking them up from the
   big dpu_irq_map table (as suggested by Bjorn).
 - add patch to squash irq enable/disable into
   dpu_core_irq_register_callback()/dpu_core_irq_unregister_callback()

Changes since RFC:
 - rebase on top of msm/msm-next to include SC7280 changes.


The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06 16:26:57 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-irq-simplify-2

for you to fetch changes up to ec3d935f9a18aeb3ebf5482eba7133cec020e047:

  drm/msm/dpu: simplify IRQ enabling/disabling (2021-05-16 23:19:56 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/dpu: merge dpu_hw_intr_get_interrupt_statuses into dpu_hw_intr_dispatch_irqs
      drm/msm/dpu: hw_intr: always call dpu_hw_intr_clear_intr_status_nolock
      drm/msm/dpu: define interrupt register names
      drm/msm/dpu: replace IRQ lookup with the data in hw catalog
      drm/msm/dpu: drop remains of old irq lookup subsystem
      drm/msm/dpu: simplify IRQ enabling/disabling

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |  203 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   43 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   74 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    4 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   40 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  202 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 1450 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  112 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   36 +-
 12 files changed, 330 insertions(+), 1883 deletions(-)


