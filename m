Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25709A35EAA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2AD10EC8A;
	Fri, 14 Feb 2025 13:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MC8DlzP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B947910EC81
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:18:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43938828d02so2063945e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539080; x=1740143880; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ER5spUPaUVlyGOWIrNvzoMizFEk7Lu+Morh7MgKfJEY=;
 b=MC8DlzP2aWlMhIKyMPiw7MKB9LPnqcMrcntWzj73ZIAdC0PvtywM6zN/+ZdRkKVbVp
 WFLQ1X9zTO1kKiQNHPHaMect7L1ZzLLWWx0sRFVgxkGto/6mHLcYryZOgya+kFB2XEoM
 Kq2cVmL38XEW9BgGzVOc0c7Ah+nkBNBw6Fg0u0wop7Ie7KHz9oZTJBu6MmDEyH45ef3c
 PvTKgIwe6z+BYN8ldOvoiTXVQdTwoGCf8rd7V1nXugvuOEDJvN/mAsAVxIJTecioIJQ8
 +mwvkZFsFbG/NEp5LC/A0Ob67O2h/9dNUbVw7vPr7BrFDblNEjI1Jqf8ZaeoL/g+AaGK
 oe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539080; x=1740143880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ER5spUPaUVlyGOWIrNvzoMizFEk7Lu+Morh7MgKfJEY=;
 b=fUv56RTpUl/yxznkUobuvBxRUxpxaRyMhkHg8mnPSkvTA17uNegiG8W0r1Oa5/UiQo
 Pu0Zu9Se4KPitwT/HpEd4XDLo2S2DxHWxZ3GJPiOMq2Et4o0Ho1IuwqjLyA3iivxl/l0
 GBKlCOX3Ac3w3HrT+uig0EXv9izI5JtpBCLwhIzMl7Sp+KpikLtQt/ydah/n4xzrqFDW
 xjcbl+U+u948RIH6vcuNAjlxQsQmNz/AkviX02HZZn/cnG1gmdVr66/SvjSIYieqK23t
 uVncpSsDmlNsJeugzRUlZCpLlbY8I4UY/RgTriklLgQ8zvzTnzG/ePwaXYWRrOFWj6UF
 UcOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS/SD3ws/3d7Dha7bemQbry91eBM9G4/wjb2aKfRfzuAmRb9i0o/1dAoPF3S2SCzVJvd8tzaHsldE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgtGYDmKzaQxi752PILR39VrstlQqQ6wpThnoV3m47/r1LZoN5
 CbwOp68gMaWqtneQQnjyKEsJy3kiMgEWLKQ9S6Jnj0iyxX6gZleFvI7ing1Xqvw=
X-Gm-Gg: ASbGnctGJ8pJTri0GJsCpjJx8h6z+TxOE4JGwHQ3iorNz9lMJj3Ref/g5wT3eUEHeJc
 iXyxP6tImn1rtM6zdIyBRzHZ+mJWKX1W9a6mfvQyToIoMTqEwJgC6q2yi8Cxho54CMLR2UnEjYR
 FOOUQO/Xe+SBur7kQ81kL54grHWB+LnWfnRUMddk3iB5boMLdDh2XV70s+Q6mN/q13IjbD7mdCW
 deSPqNWk+FkA8aucHL8jWerYli2yWJ9V+PhklyZYqYJeBuYYTaifsBi3R2ivRK+TGptX0hyu9SK
 JTlUZhAB80f3Y+Y90lFud0RJhaaAbEk=
X-Google-Smtp-Source: AGHT+IGIlrTgLRsqyJPOqO+awGlXJBj4SLLn6Y0DaVIi6VSMJKuGPZgAAK52EZC+DFxC8B7CiMtSpg==
X-Received: by 2002:a05:6000:2d0b:b0:38f:2e80:795 with SMTP id
 ffacd0b85a97d-38f2e80105fmr620552f8f.13.1739539080149; 
 Fri, 14 Feb 2025 05:18:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:17:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:45 +0100
Subject: [PATCH v2 2/4] drm/msm/dsi: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-2-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6658;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LL1TogbS0I4oRjmhDntXeaINYx8bTjc/f2otEygS0h4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0KAwAeYL3ltzf1YUQ4/nTZFCZJPiaeRiKKAL
 x/LdP+jkkyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CgAAKCRDBN2bmhouD
 1+7WD/9b//ZURPl4U7Yr+s5hL3Wu8hFQO1WE+u0tnhn8D3Kl0IqH4hJD8JOSaNtUervQAoYxlUx
 nUUd34dtMfU6DVlpvTJ2Su4pXJRb0rE+ZkdP9E77a9CLtyAnoYAJXufiX/kTNEVMhBZ7z+uO0r9
 OJN8Kf6XgaXDcbVlM8DnvdDxAmf+TNQlkUad2I6JK0L9cTb2z2OSLsA3FyuzDdkS09gkoebr8f/
 hnhXPhJ2X7kRRHKh3J1iRpyhbhx+3BnppgtZDv5PRSdlQFY1mZ+ACrMEaoNHmtYQmJoDlcha7Sf
 L4bkdNXt93aCdPPzAX03a/bi8vWJKj6ibGCnGeUdXCCHJ1ny6GJ7SDIm54DMbS1BlWfXvaEQETr
 I29r6LNKsnmSkCRdnTsw9s6hr1V7+7zjXiuC48OxlAQEZaIrlTlOSQcYdJZAN4BRhhjP/f4PAJ7
 CRpj09TJO9tcyqXHgDFH5jXdzJSJPsvxV2sqLkKbbpZ+uWYclvXmvyRitVuN27nHtTFa7FZgTpx
 6HFfWgHIxsRoIzldk/DRjmHQxoEtvm03gqqVmgya482q8iULtis0owH7MSH/AlCiOIjxSg8toCB
 vXJPq3jei/hlmSUT7DBBmzm2g+50ZDv1rlI3ddZ4/PproomerYwQgfY14F+gNK98cCfRBfSL9Y9
 v1JLEvMaI3B7rJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dsi_get_config(), dsi_clk_init() and msm_dsi_host_init() are called only
from platform driver probe function, so using dev_err_probe() is both
appropriate and beneficial:
 - Properly marks device deferred probe status,
 - Avoids dmesg flood on probe deferrals,
 - Already incorporates printing ERR value,
 - Shows device name (in contrast to pr_err()),
 - Makes code smaller and simpler.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Update commit msg
2. Tags
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
 1 file changed, 41 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 397c9f1f588558b2081d6400d2cbae746c900697..8fc9f5486aebd3c08914409cd3c7824fa0b97515 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -200,7 +200,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
-		pr_err("%s: cannot get interface clock\n", __func__);
+		dev_err_probe(dev, PTR_ERR(ahb_clk), "%s: cannot get interface clock\n",
+			      __func__);
 		goto exit;
 	}
 
@@ -208,13 +209,13 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ret = clk_prepare_enable(ahb_clk);
 	if (ret) {
-		pr_err("%s: unable to enable ahb_clk\n", __func__);
+		dev_err_probe(dev, ret, "%s: unable to enable ahb_clk\n", __func__);
 		goto runtime_put;
 	}
 
 	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
 	if (ret) {
-		pr_err("%s: Invalid version\n", __func__);
+		dev_err_probe(dev, ret, "%s: Invalid version\n", __func__);
 		goto disable_clks;
 	}
 
@@ -281,39 +282,31 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 	msm_host->num_bus_clks = cfg->num_bus_clks;
 
 	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks, msm_host->bus_clks);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
-		goto exit;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Unable to get clocks\n");
 
 	/* get link and source clocks */
 	msm_host->byte_clk = msm_clk_get(pdev, "byte");
-	if (IS_ERR(msm_host->byte_clk)) {
-		ret = PTR_ERR(msm_host->byte_clk);
-		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->byte_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->byte_clk),
+				     "%s: can't find dsi_byte clock\n",
+				     __func__);
 
 	msm_host->pixel_clk = msm_clk_get(pdev, "pixel");
-	if (IS_ERR(msm_host->pixel_clk)) {
-		ret = PTR_ERR(msm_host->pixel_clk);
-		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->pixel_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->pixel_clk),
+				     "%s: can't find dsi_pixel clock\n",
+				     __func__);
 
 	msm_host->esc_clk = msm_clk_get(pdev, "core");
-	if (IS_ERR(msm_host->esc_clk)) {
-		ret = PTR_ERR(msm_host->esc_clk);
-		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->esc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->esc_clk),
+				     "%s: can't find dsi_esc clock\n",
+				     __func__);
 
 	if (cfg_hnd->ops->clk_init_ver)
 		ret = cfg_hnd->ops->clk_init_ver(msm_host);
-exit:
+
 	return ret;
 }
 
@@ -1879,31 +1872,28 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	msm_dsi->host = &msm_host->base;
 
 	ret = dsi_host_parse_dt(msm_host);
-	if (ret) {
-		pr_err("%s: failed to parse dt\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: failed to parse dt\n",
+				     __func__);
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
-	if (IS_ERR(msm_host->ctrl_base)) {
-		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
-		return PTR_ERR(msm_host->ctrl_base);
-	}
+	if (IS_ERR(msm_host->ctrl_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->ctrl_base),
+				     "%s: unable to map Dsi ctrl base\n", __func__);
 
 	pm_runtime_enable(&pdev->dev);
 
 	msm_host->cfg_hnd = dsi_get_config(msm_host);
-	if (!msm_host->cfg_hnd) {
-		pr_err("%s: get config failed\n", __func__);
-		return -EINVAL;
-	}
+	if (!msm_host->cfg_hnd)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "%s: get config failed\n", __func__);
 	cfg = msm_host->cfg_hnd->cfg;
 
 	msm_host->id = dsi_host_get_id(msm_host);
-	if (msm_host->id < 0) {
-		pr_err("%s: unable to identify DSI host index\n", __func__);
-		return msm_host->id;
-	}
+	if (msm_host->id < 0)
+		return dev_err_probe(&pdev->dev, msm_host->id,
+				     "%s: unable to identify DSI host index\n",
+				     __func__);
 
 	/* fixup base address by io offset */
 	msm_host->ctrl_base += cfg->io_offset;
@@ -1915,10 +1905,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 
 	ret = dsi_clk_init(msm_host);
-	if (ret) {
-		pr_err("%s: unable to initialize dsi clks\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
 	if (!msm_host->rx_buf) {
@@ -1931,26 +1919,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 	/* OPP table is optional */
 	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(&pdev->dev, ret, "invalid OPP table in device tree\n");
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!msm_host->irq) {
-		dev_err(&pdev->dev, "failed to get irq\n");
-		return -EINVAL;
-	}
+	if (!msm_host->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get irq\n");
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
 			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request IRQ%u\n",
+				     msm_host->irq);
 
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);

-- 
2.43.0

