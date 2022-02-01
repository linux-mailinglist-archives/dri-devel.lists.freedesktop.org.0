Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D04A5FAE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6A610E270;
	Tue,  1 Feb 2022 15:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F96E10E270
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:10:59 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p27so34578594lfa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+XWFKjQgChx97avL0aqxgU2/eFh5KaAhUEhdZemIvY=;
 b=syYI5u7jGJa64rTZ/6eBp2jQjDoWdZxeq5JLcnmYQjgaGTT/2+dDmA2iicSrWve0jS
 1LcwzdKVfo9R430XB+ZvGn/M5hj68aACpYUd8D34wwKPD5EsfYgqqkpXsvfAhFbpnxcO
 HHEmaddyJUo7Q4d44rI61koB/NqFCU9lYFsqufcc9c3ZznjstJeAjHso9YiU0QsGbaXT
 fGhTQ/kHDru909RFVwhExDrA0oXoyGQjX8XPN9eaqI+OHkqbEuJVbsXaBGIDTOcRSICe
 QWM1XOguUg1f+TyAIBZbvdW7f/ciNwx4xpgqCLlZ+8SezCzU5dW8NkGC/h8eC6uXN0Np
 iIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+XWFKjQgChx97avL0aqxgU2/eFh5KaAhUEhdZemIvY=;
 b=J0GJw3ZeB8voR+Pgu1AbHZVmh8hTPON1ihFV0sNX3X7TH/UKh/bL+y66S6ifuKnb6s
 Q5fDdoWnqyXekuzZ8BwkZcxoQerO53Y833Z2wxrta3xj5Uq75knjXYeNnBam85ppW7Xq
 cgpe349eivgloL8s3+yjcqbq4BuawvkRPXDpjvfE4PBXElHzSKol8zL8c20yhRZ3plnE
 9rTysgoJDK6ZpjtVrYfXhKM5pq3vJej9cVGbL4MOOnGwalg2knlfl380jux/4KtXtOY+
 Uf/Z7ei89KtHBjDSYSlMcg4x4JS33ApoStmRplczU8WYCnOB1IJ0fJy90vSl8L14rMOn
 Njxw==
X-Gm-Message-State: AOAM532bCudQOeMkmwMIHNZaMMhRHF08SasXHItf97ss55CPEP3PCh5X
 lS6t5d6EpiSLfQmZ6pF4qTFhdQ==
X-Google-Smtp-Source: ABdhPJy89zOj5NEP4rMnBJYkBvUs8qB3ABF+2GbRQvW4GRuFzkNl/ziHo8xrr/CQtUEAolRQKpmt1Q==
X-Received: by 2002:ac2:4e84:: with SMTP id o4mr20180667lfr.460.1643728257553; 
 Tue, 01 Feb 2022 07:10:57 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y6sm1337723lfk.157.2022.02.01.07.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:10:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/6] drm/msm/dpu: simplify IRQ helpers
Date: Tue,  1 Feb 2022 18:10:50 +0300
Message-Id: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  53 +++---
 10 files changed, 193 insertions(+), 398 deletions(-)

-- 
2.34.1

