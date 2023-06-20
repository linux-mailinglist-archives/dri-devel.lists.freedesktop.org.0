Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297BD736B4B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CD710E2D7;
	Tue, 20 Jun 2023 11:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4753910E2D4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:43:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so6112600e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687261409; x=1689853409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RI8zJ2B4Z2X5IcHWBKS5WPAJQqO4aBjX6c2mtTI8B2Q=;
 b=CCTRNsgvR2UPVb1xJXQQZiCUabVKolwzo7UTGIODyexvGu2GPrMRg1g7UxVbFYZYfB
 cP5yDros9mziT2CV7bMqFjA8wdpqFgjHjmUfNaXgECkgjdJbiXMeDZQbbEuA5NiqatIK
 fEJ2j9ZTacjoL+sBLp1nX6WZNveNeZ0AI2MT5pXkTz6zZZ2MR3E2UwoCMhfOvVd4kWxf
 Vjk8E4gSdo04E8YYSvjrDE9ie2YDpNieF449TUUATWR+ayI0uaGb0VZaGDon4i28HAki
 82tLQvVV3CibPCH8uVNDzSPqeRRkak/Wuy/CwEshNRxxSv/cTmy1jYe4Qa36Zj0yPMLk
 LPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687261409; x=1689853409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RI8zJ2B4Z2X5IcHWBKS5WPAJQqO4aBjX6c2mtTI8B2Q=;
 b=OTSQYdiYbSyOd5ofJfOtZWgzz7d8iefKzP8oVcl2pAZMH22uvTTklcWV6CvAvR0EIG
 Fq+PdT4O1zsTdhsJsbHV9Y3mpk8lc9v6yTzbHGkzvFCnyW8DLGiDIr8bM6g1ruj7yh8s
 CUwOBjlmgBcZJ3TMTdVCX80jV2qEPyamOE/xx7xGMqN4NoQivzI3+/GZO4+wOgHKKr7a
 JsWDWyIBojSdXtruzXXW57n4GzZnxdKNSeDDcWTYOY89Ujt+OOwMMfkSGdMMTQXw4DwT
 939debwuNifCjlxRvqiWqYPrnW2N/2AeFjK3j2PX3Pwq3gXv0+xXzTUrVnMoJ90KSmUY
 sOkA==
X-Gm-Message-State: AC+VfDxvfpZHHAueMjGymbQJB7hiCLGb+KSbbRut+xAd9hGo/acANVys
 pmsvdQApPG/q1Z0rXFqcvS1AMA==
X-Google-Smtp-Source: ACHHUZ4brkblTOFRd/aUUHxZjq1zHbMhvCCj6HWtCPfsrSx/hxBC/7I663A9U2A8XTdEhYztMwW5oA==
X-Received: by 2002:a19:4350:0:b0:4f8:4919:2dd5 with SMTP id
 m16-20020a194350000000b004f849192dd5mr6575126lfj.30.1687261409551; 
 Tue, 20 Jun 2023 04:43:29 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 v17-20020ac25591000000b004f640b0fb04sm324158lfg.212.2023.06.20.04.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:43:29 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:43:21 +0200
Subject: [PATCH v2 2/2] drm/msm/dsi: Enable runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-dsiphy_rpm-v2-2-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687261406; l=898;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iR0+YI1D9awhWod+Sc5nGzcONvn3jPDAmrCRI6Yrb7M=;
 b=VXt0CmEZJgqL4MCbC8F8Mojwr2O2qliYJQRqyaxSfqgW8xqo1xrUAiXuEgFa1sXkhE/W9UIrX
 bMwaD2UuaKvCaVzwZHX20kE7AInt4nccV5Tl9zu6jVR+uwOOhLf/b9q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some devices power the DSI PHY/PLL through a power rail that we model
as a GENPD. Enable runtime PM to make it suspendable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 2f319e0eb74f..22431e106529 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -689,6 +689,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
 				     "Unable to get ahb clk\n");
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* PLL init will call into clk_register which requires
 	 * register access, so we need to enable power and ahb clock.
 	 */

-- 
2.41.0

