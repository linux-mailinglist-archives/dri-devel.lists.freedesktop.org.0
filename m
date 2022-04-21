Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359AD5095B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 06:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1923C10E522;
	Thu, 21 Apr 2022 04:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8161C10E4E5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 04:13:48 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e2442907a1so4205555fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 21:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YxJkE8G1CRaDGILe7+GoWJTE8swqHANzIKXbTjCxfWA=;
 b=wmc+QCZr7W/1S6Qi4m8vCRTullRSJITUAjG2JkXsl8y5jZBmRrU28R4meMbAFMy3j4
 xQHQfXWzBZdgs6/PiN1QjCK7nca7KkIULjqpfArwqsljTp9SwXfgOAPvYa/92cfETLAO
 LH346HKowgQBSMij8Rm6I/QklFiHzmza27cpSEJEdeZ83KaCQ/3QihpNz/jZGXDcdZXB
 rgfhCdFLPpwEhmrawwEsfA7x/XzslBP9+9jEx720HPu5cdO5e9TWoRCQ+S0ou0bYepRe
 DpwKKaqQtinBGgGsOfZBxZeQVVlZTAvWQhsNDyFZh2IskOh9wH/UhEVMJURzOankc7i2
 6Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxJkE8G1CRaDGILe7+GoWJTE8swqHANzIKXbTjCxfWA=;
 b=5AudUCogeSUUTUmXEr4lnD30OCYJq3gFin+JbEs+3johWDjXQfBspY5MPa4khb3s2c
 t+mT8flFsBrFNG6el7JanuI1fzqZlSESqeXkHvUhKapqkhsi8YV6g3thXtKM+9Fk6VhW
 lz9xo3HInmEdsKIXz7hysMd+1XV/+WowYz3p1L14UAEhIgafiFfU811lSkbLsCivKeWH
 fLWUmf1uJtn1H1kPGkhKnVeHPt0PwAljxNLDWqp+4Tw7Ym+MOgeGpk7p9cww7/Q49G7+
 nLc+GYe+N17MJo/CaW698h/z8iJ43kNtDzUAWZO4Ew8SPqAKFeNGTNVjkmkVqXInuqKO
 VeHQ==
X-Gm-Message-State: AOAM53051IU+oQsgDqgl2V6hL/StZ7PraofFO2WQ1micZMEu9UZdy6TY
 hYGnmHUzaoLS1LpmMHsovVo6aQ==
X-Google-Smtp-Source: ABdhPJwj+TTo8+SybVk/1ckcBy63VRtH0SyOXR6xQENQRDdLYgNccjsgslQORDGkN774JfFw5rMNyQ==
X-Received: by 2002:a05:6870:a707:b0:e2:cc85:d98 with SMTP id
 g7-20020a056870a70700b000e2cc850d98mr3085213oam.131.1650514427764; 
 Wed, 20 Apr 2022 21:13:47 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 h186-20020acab7c3000000b002ef5106248asm7115512oif.45.2022.04.20.21.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 21:13:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 2/2] drm/msm/dpu: Issue MDSS reset during initialization
Date: Wed, 20 Apr 2022 21:15:50 -0700
Message-Id: <20220421041550.643964-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421041550.643964-1-bjorn.andersson@linaro.org>
References: <20220421041550.643964-1-bjorn.andersson@linaro.org>
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

Changes since v3:
- Rebased upon the mdss dpu/mdp restructuring (https://patchwork.freedesktop.org/series/98525/)

 drivers/gpu/drm/msm/msm_mdss.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f6f0d0fa5ab2..20f154dda9cf 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -193,6 +195,32 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
 }
 
+static int msm_mdss_reset(struct device *dev)
+{
+	struct reset_control *reset;
+
+	reset = reset_control_get_optional_exclusive(dev, NULL);
+	if (!reset) {
+		/* Optional reset not specified */
+		return 0;
+	} else if (IS_ERR(reset)) {
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to acquire mdss reset\n");
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
 /*
  * MDP5 MDSS uses at most three specified clocks.
  */
@@ -229,6 +257,10 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	int ret;
 	int irq;
 
+	ret = msm_mdss_reset(&pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	msm_mdss = devm_kzalloc(&pdev->dev, sizeof(*msm_mdss), GFP_KERNEL);
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
-- 
2.35.1

