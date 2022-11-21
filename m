Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A28D632FC7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 23:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF80110E33E;
	Mon, 21 Nov 2022 22:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A06D10E33D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 22:25:10 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 712A13F20C;
 Mon, 21 Nov 2022 23:25:06 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Print interrupt index in addition to the mask
Date: Mon, 21 Nov 2022 23:24:55 +0100
Message-Id: <20221121222456.437815-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.1
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mask only describes the `irq_idx % 32` part, making it generally
impossible to deduce what interrupt is being enabled/disabled.  Since
`debug/core_irq` in debugfs (and other prints) also include the full
`DPU_IRQ_IDX()` value, print the same full value here for easier
correlation instead of only adding the `irq_idx / 32` part.

Furthermore, make the dbgstr messages more consistent.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index cf1b6d84c18a..64589a9c2c51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -252,9 +252,9 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
-		dbgstr = "DPU IRQ already set:";
+		dbgstr = "already ";
 	} else {
-		dbgstr = "DPU IRQ enabled:";
+		dbgstr = "";
 
 		cache_irq_mask |= DPU_IRQ_MASK(irq_idx);
 		/* Cleaning any pending interrupt */
@@ -268,7 +268,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
+	pr_debug("DPU IRQ %d %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -301,9 +301,9 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
-		dbgstr = "DPU IRQ is already cleared:";
+		dbgstr = "already ";
 	} else {
-		dbgstr = "DPU IRQ mask disable:";
+		dbgstr = "";
 
 		cache_irq_mask &= ~DPU_IRQ_MASK(irq_idx);
 		/* Disable interrupts based on the new mask */
@@ -317,7 +317,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
+	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
-- 
2.38.1

