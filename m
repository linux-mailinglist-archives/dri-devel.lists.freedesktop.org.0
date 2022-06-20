Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BD55266D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 23:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB9710F3C3;
	Mon, 20 Jun 2022 21:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B8F10F3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 21:31:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id d19so13295180lji.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHmkNxA8N58V2GQi/PzXnfoaYwDjhD9ndI1UMR5NyGs=;
 b=dd8ohYarDQSDHQ2O/Pv4EbMMg8fL2Nj64attWTLNouejam3O6K/eHIuL/B4sn8aW4R
 STknjvL2uNFvN8EXC8s4vqvqrXZ05dS2rBXhEDzv38E6TIZh+2yNnkTsIn80Z7EG248w
 NKsRyb/7UqemAO7tEHJvfAbF2vYogLL2Bz8gY1yntcuOBayw7pmmAgU6gOYIrFP8/s5I
 jUPYZasHMmYkwLbjBl2FlmrxRN2iLz4217N4V9nXWV1/XfndnTxp6XxTGPE2eYL60AC4
 mVH1tB/+PH3OLT/ftlc1d2NS/Wzet5WOScDt7eQOvOuBhCZM5RXLPcxTewOjnnbdQ/vL
 2RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHmkNxA8N58V2GQi/PzXnfoaYwDjhD9ndI1UMR5NyGs=;
 b=alueMrOFcZD3JlNeLvOqXAbdPIi8TANw009K6sHpNt8+a6XFjctFYi09/vaDHfmuER
 nfNRnvgSphVMRQvBVUqkY0XyeQfBc2p+TVlDtWSNu/lUdPCMw6tK45rzvU4pWskq/jQH
 Zk4dG69z/s8o8SA1hRW2+OxsISoDW6bux1fPsm6b/lnHBzw+z8W8BjHcrbNixMLivJCu
 xIIZetLo7EL3UWZhbGe0PWwqpFBLKvVn6VBkiuqnMaNavOIiGpJZlgD+9+Cyg8yTAgiH
 q1x7PAV5BPtNwt+CxNbdWLPvYkEYwyh+TMOyR0YDrfTMGDR1EgFkCFpeW8oHGEIWEJrZ
 8IBw==
X-Gm-Message-State: AJIora/z2AYxv3WrUHFR9LA4Gg3/5ssuIWG6IaBfCvRRs3+mJKTpjx14
 roa4piDBwKHtwZpGVaF+L4BFRg==
X-Google-Smtp-Source: AGRyM1sDW7gYoASLhORCVOKQB6DYQOjc1q+s1lQgC9qmGwhuvv6GTFvf2yplhlV9L1+DfA1t5pPTrg==
X-Received: by 2002:a2e:8805:0:b0:255:6e73:9a67 with SMTP id
 x5-20020a2e8805000000b002556e739a67mr12477444ljh.426.1655760658717; 
 Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 2/4] drm/msm/dpu: move resource allocation to the _probe
 function
Date: Tue, 21 Jun 2022 00:30:52 +0300
Message-Id: <20220620213054.1872954-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 62 +++++++++++++------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae13a3a5d8a5..756be04d804b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1206,31 +1206,13 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms;
-	int irq;
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
+	dpu_kms = to_dpu_kms(priv->kms);
 	if (!dpu_kms)
-		return -ENOMEM;
-
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
-	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
-	}
-	dpu_kms->num_clocks = ret;
+		return -EINVAL;
 
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
@@ -1249,21 +1231,41 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
-	priv->kms = &dpu_kms->base;
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (!irq) {
-		DPU_ERROR("failed to get irq\n");
-		return -EINVAL;
-	}
-	dpu_kms->base.irq = irq;
-
 	return 0;
 }
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct dpu_kms *dpu_kms;
+	int irq;
+	int ret = 0;
+
+	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms)
+		return -ENOMEM;
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+
+	dpu_kms->num_clocks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	dpu_kms->base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
-- 
2.35.1

