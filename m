Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A109B765640
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1098F10E59F;
	Thu, 27 Jul 2023 14:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09810E5AA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:49 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe07f0636bso1860932e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469147; x=1691073947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OS0/Lxd5lKrwuqIAbL/+8ULTmmH/V10tfKT3ZkQl4g=;
 b=ZZAp/HMdMyKbswenyzIOHOBslyFVPLkIYYGacEce4rmkUV6ai4D5X/9zWhvXzdS/Lf
 LJ9RjOVWZZgRFJ7anpqA8S4V4Oh9H4ZG6vUI02i7cNVpEV/helKGOf138k90tEpdyRHV
 +aeAGIWhTI+9wvxWowjmEw0KeF+JphX7OqhzoreNMuYQVAKqlod9JrVvSSux/Lcd1bdr
 isaTIqypnpRuY8KshiYbqaRMTfzVhDg7EQSTKkMlWH2VzN9j5p0Y9gaShLdvBqSRGzO4
 ypCvrRSiIpzMeo2sN5tvy7Mq0EXkhxfMv/jHz/uKzq+C43GAzwZ60cmwEYL6Usc46xf3
 Qs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469147; x=1691073947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OS0/Lxd5lKrwuqIAbL/+8ULTmmH/V10tfKT3ZkQl4g=;
 b=QDrrffyfYk4LZFS361dX5jK0fvtAbMw+2dZRYAARVdAHY1d7Si43algxJP/CFTqhhf
 L7i3TrwX1swBbsMLhYJZpDi0PejgBK+VM5TRgdBScKD1GaR1dg2AxclQXnoSyqhbT3pZ
 VyaDQBPrvRGXIV3rYa6zAzDO8s08pTcCIoA12OmkrXd+5PYa6KpqGPVZUYn3Gi45VEk8
 b/cHBFvhBxQXa1imqXNHd2vzyuPQwS8kLairHMLVRwBkDJfYqbcvAFX2OTQWJ4vHFNnj
 SeCku59rHxZc28xTulbm1ZRPpjgKx8viay2Q0Q2NJsZjerGwPND6xnJYLCtZh70tuZ0n
 lnSA==
X-Gm-Message-State: ABy/qLbpJU6qXostJNFnGa7v+CoZDu/VDnAdNgt6pzYyEdilnbzD4+sQ
 3UQeGRdPq+FL+PELvxif1Qxzvg==
X-Google-Smtp-Source: APBJJlGXBETZDllFMYnUFy6biPyn2Ehox7GbdpmmogvvyQO192JjCIOey9LxSi+XWGrcgzZiasrNww==
X-Received: by 2002:a05:6512:6c7:b0:4f4:b783:8556 with SMTP id
 u7-20020a05651206c700b004f4b7838556mr2015913lff.66.1690469147649; 
 Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 3/5] drm/msm/dpu: autodetect supported interrupts
Date: Thu, 27 Jul 2023 17:45:41 +0300
Message-Id: <20230727144543.1483630-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c    | 16 +++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h    |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0cecdc847b49..e3c50439f80a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
+	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
@@ -480,7 +481,20 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
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
+		if (intf->intr_tear_rd_ptr != -1)
+			intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
+	}
 
 	spin_lock_init(&intr->irq_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f329d6d7f646..6e0d0188edc6 100644
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
@@ -33,6 +34,8 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
+#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
+
 /* compatibility */
 #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
 #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-- 
2.39.2

