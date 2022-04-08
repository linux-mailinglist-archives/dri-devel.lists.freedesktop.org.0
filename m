Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E24F9E81
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 23:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DC110E07A;
	Fri,  8 Apr 2022 21:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5057B10E1DA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 21:00:36 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 p128-20020a4a4886000000b003296205eb59so1677084ooa.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6bF252QqnY12H7PjXHxtHVXzmjhuS4IY4ywpEiT3F4=;
 b=t9eaw3470SQsd1wU8fIBzSCDwU93D3/U5o7El/OjmTy/I/XW40z25vnyJRfDe180ji
 6GVsXBXQorbud91CxmGZV4Na3ft9TgYHHi3PIzLFlx+1OKjL2aphMwALvb3tTiabF6gN
 RcLnSJ1kAy9nybVb9TvGuxKDqFdxuiM/rg7UmqX4psrIvVxOh/VEnAWbQM1sqNEDW/7I
 NE+0X4K7taXlXnSSd2OIutuIRZWpiW0RJQIb1dvIHpfxxhxlUDtgoiAFSQcXkv+l8Ku2
 jtixuZhBORYm/NPQtNHLsPDs1p6hE3PPik4BqIPP0qxY/HZ/Ll0eVZEK9ZU9n64KkqKI
 TUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6bF252QqnY12H7PjXHxtHVXzmjhuS4IY4ywpEiT3F4=;
 b=7PfvQQrb4uxuv/g/c+QBcpa4HLO7AIKuNCamuSxcH78AAtiYsjHGK+NHql9fuQvjrI
 fxcVcWzyE0mC2fSg6SB0XpndhQ+UoZ/NpxoP7s7RyE+9tCeNbrmP5NCe0bBaJ58ewNtx
 KvhYSY4fZQ38UCecv9NDLzNgE+exdcsCQgr7qKRPvlE1u8F0ZjqPxhpDVkDL7vcty1tJ
 R2gr1CWxl6BXrjoBLUPPeRZ3T5HhQnkhf9dKWYJliPQK71/pocbiw9vX7fFg3PiRuHmO
 NJjPb22KpwOAOnj7DBwZVuJLR/VKdO1p5ZpA1TtDRo46bWz/zYE9cRx2gVepCJxz1/s2
 Q4Ww==
X-Gm-Message-State: AOAM531maYY16mTcCqpP0gJbGl7cFX73UCCQt9FZjwCWR06mi+JJGl4u
 WfAI4UOIVuN+bliS2xL7H6YJ4w==
X-Google-Smtp-Source: ABdhPJzEyHtkxoluS20SeKqiN/F4ipRlBq7hIPzS0/fxSKWetul7V//ubEQF1a5ctnVubF0wepHU3w==
X-Received: by 2002:a4a:d08d:0:b0:321:54c7:8fe0 with SMTP id
 i13-20020a4ad08d000000b0032154c78fe0mr6782448oor.10.1649451635561; 
 Fri, 08 Apr 2022 14:00:35 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm9160490oif.22.2022.04.08.14.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:00:34 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/2] drm/msm/dpu: Issue MDSS reset during initialization
Date: Fri,  8 Apr 2022 14:02:53 -0700
Message-Id: <20220408210253.581337-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408210253.581337-1-bjorn.andersson@linaro.org>
References: <20220408210253.581337-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's typical for the bootloader to bring up the display for showing a
boot splash or efi framebuffer. But in some cases the kernel driver ends
up only partially configuring (in particular) the DPU, which might
result in e.g. that two different data paths attempts to push data to
the interface - with resulting graphical artifacts.

Naturally the end goal would be to inherit the bootloader's
configuration and provide the user with a glitch free handover from the
boot configuration to a running DPU.

But as implementing seamless transition from the bootloader
configuration to the running OS will be a considerable effort, start by
simply resetting the entire MDSS to its power-on state, to avoid the
partial configuration.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Move the reset before the probing of the children, to avoid issues if child
  drivers touched hardware at probe time.
- Extend reset assert time as the previous 1us showed reliability issues on
  Lenovo Flex 5G.

 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index b10ca505f9ac..6f921910d0e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -3,10 +3,12 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/reset.h>
 #include "dpu_kms.h"
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
@@ -197,6 +199,32 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
 	dpu_mdss->mmio = NULL;
 }
 
+static int dpu_mdss_reset(struct device *dev)
+{
+	struct reset_control *reset;
+
+	reset = reset_control_get_optional_exclusive(dev, NULL);
+	if (!reset) {
+		/* Optional reset not specified */
+		return 0;
+	} else if (IS_ERR(reset)) {
+		DPU_ERROR("failed to acquire mdss reset, ret=%ld", PTR_ERR(reset));
+		return PTR_ERR(reset);
+	}
+
+	reset_control_assert(reset);
+	/*
+	 * Tests indicate that reset has to be held for some period of time,
+	 * make it one frame in a typical system
+	 */
+	msleep(20);
+	reset_control_deassert(reset);
+
+	reset_control_put(reset);
+
+	return 0;
+}
+
 static const struct msm_mdss_funcs mdss_funcs = {
 	.enable	= dpu_mdss_enable,
 	.disable = dpu_mdss_disable,
@@ -210,6 +238,10 @@ int dpu_mdss_init(struct platform_device *pdev)
 	int ret;
 	int irq;
 
+	ret = dpu_mdss_reset(&pdev->dev);
+	if (ret)
+		return ret;
+
 	dpu_mdss = devm_kzalloc(&pdev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
 	if (!dpu_mdss)
 		return -ENOMEM;
-- 
2.35.1

