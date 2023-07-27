Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4E765513
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E5510E589;
	Thu, 27 Jul 2023 13:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2695810E582
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:31:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so703557e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690464717; x=1691069517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43GPkP1PeA9fZvjE3accIBVrdRKqnNagCa2FjKs2v0g=;
 b=kYG3vIYonT2Saxken9gnkC3TY2ScqKQKR00NGzYVYLXHCq9Ers8WrC8wfliSBd+fY+
 EP3l9LJD4I9qKKcNsWWQF1RR04nXEhcDHbVcCs059szWVwOSfZIldjyipxMDkvDdJhMW
 qWuwWvVkZOC0JDcREqwvgXmMtte0iyNg+5eVc0fxl/NJD/jHiel5R36Zkcv3Sby7cGvH
 LQ3osIvzf95hwNM2zdX8b7vItLgSMQt1wOaQ/WC4JZ/Hd7ybpd9Rjs818zt3JYMpp+5n
 XI1KcIgWd4DmVxJ5U04356zbXpGaj0a7jZjFdLaeAVk0KUNRdx5HqEquqj1NoT9Oq7XH
 xMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464717; x=1691069517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43GPkP1PeA9fZvjE3accIBVrdRKqnNagCa2FjKs2v0g=;
 b=Is+gv5Hexb3CscaV+fvabjc1rMD+C2YrOU6DRBXZal6dC5gzEG3wB6t0xtSJKlQrIc
 6LRvyXE1aR1Es0GLuGDkmmTYWFAg5ZQFGTmyXkidf4Wrfv2q13d/WrPZizlVNQoXy2X9
 FXhTx1h7k+Mho/NxEI3TEiHdJ9++QsDn/CPWt27VushHM3ttB8eSXIL+K8OM3LsOd7aq
 yiWq9PSks4nXewH+LJJR+WrH/WL7dgw5qKmx7+iVqNHM87L4bVvAFXx2I99Nrrjw4y5p
 GUF57WHeNnAJHFbuMb0IZtyS8l+O2CWh7ns/aUj2T29qdqIBkLZPpkath6nHBbiiZFqy
 KU7A==
X-Gm-Message-State: ABy/qLYXnu/2XwJr55e7QTaNEvsVLGPRAikyp+PZ5oO5DtP39OMytfFU
 0fxiQHb0Lfp26Q+vbkbQafU1BA==
X-Google-Smtp-Source: APBJJlFjztgEBS8BeDBxfm8Fn+Qb6BdMyJrpPdsXoOmmp5mI+KFk1/u7RsdzOVNAD/qdbItVec1kRw==
X-Received: by 2002:a19:e609:0:b0:4fd:d18f:2d93 with SMTP id
 d9-20020a19e609000000b004fdd18f2d93mr1677986lfh.6.1690464717488; 
 Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:31:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 3/5] drm/msm/dpu: autodetect supported interrupts
Date: Thu, 27 Jul 2023 16:31:52 +0300
Message-Id: <20230727133154.1421721-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
References: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
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

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this with looping over the enabled INTF blocks
to setup the irq mask.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0cecdc847b49..a745de20d387 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
+	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
@@ -480,7 +481,24 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 	intr->total_irqs = nirq;
 
-	intr->irq_mask = m->mdss_irqs;
+	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
+			 BIT(MDP_SSPP_TOP0_INTR2) |
+			 BIT(MDP_SSPP_TOP0_HIST_INTR);
+	for (i = 0; i < m->intf_count; i++) {
+		const struct dpu_intf_cfg *intf = &m->intf[i];
+
+		if (intf->type == INTF_NONE)
+			continue;
+
+		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
+
+		if (test_bit(DPU_INTF_TE, &intf->features)) {
+			unsigned idx = MDP_INTFn_TEAR_INTR(intf->id);
+
+			if (!WARN_ON(idx == -1))
+				intr->irq_mask |= BIT(idx);
+		}
+	}
 
 	spin_lock_init(&intr->irq_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f329d6d7f646..f0b92c9e3b09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
 	MDP_SSPP_TOP0_INTR,
 	MDP_SSPP_TOP0_INTR2,
 	MDP_SSPP_TOP0_HIST_INTR,
+	/* All MDP_INTFn_INTR should come sequentially */
 	MDP_INTF0_INTR,
 	MDP_INTF1_INTR,
 	MDP_INTF2_INTR,
@@ -33,6 +34,11 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
+#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
+#define MDP_INTFn_TEAR_INTR(intf) (intf == INTF_1 ? MDP_INTF1_TEAR_INTR : \
+				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
+				   -1)
+
 /* compatibility */
 #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
 #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-- 
2.39.2

