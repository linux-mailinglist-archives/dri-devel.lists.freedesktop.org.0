Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9633D4BBC
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26B6F447;
	Sun, 25 Jul 2021 04:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB7A737FB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:28 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id y18so6912733oiv.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
 b=GP51RnXyV5DlsFpI2ZiBhXt9xZvi1sS6LzIRJewIMWMadsHwvMzlslCOM8ygyMv0EF
 Cv94UffGrQGwyIc3hwmqoGkM5X6BWL4qurb/sSc3cXSrWYKNX8Wb48HE8AJ2t7pT38O9
 4LE9U4XGDNtz93pkHz36mMH3CAa1UV8GlJuk6Mt77LoGwfENEnxSVTOaKjwACI8lwfuw
 NzZc3YsXHJZ/ZlwyLas8qIFb/MVmd2yj98fonX8pnphzcrpUeQCvi0067+vSN+WPqVG3
 zuerbA8JLUQXGBq7BOXd8gEtBk3gy0kNOw/evOJ3Sm9AjUFPWeaULHYo5gwfxKwMF8y3
 B70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
 b=ES+HZkC66qwqRnWywMdebLdvgLoqHIRFSrEBYWripBNb2YKERKQptA++5FpUX290/F
 v9d+Pw6r4HldlrzmsEtaWiiuzhN/VkObPANTkSrIdH6y6YEUJfUwijqyBE4MsCCJENxu
 hZoVEHrXOQKBWASxZfAugahWtyB/bkl2IUdMlEsTHHp73ILww8nNROs8vo1Hn6Muntvv
 xo797zRJCPCJ22HorQIgDdeMCm301HsH9vA+JqYQtp8BDXWwd+4hSy5x/BFM8TPzyvPk
 qgVzWkfpbdEDJD52WV88ymXYdRrIvTaLDGa9fJp7jPVejAzBIOZub1EL/pEQ9lOA73cp
 1UZg==
X-Gm-Message-State: AOAM530H5kfY9UOo9RrP9/7nCZmIiLaAMcLC+nA4riUxDS6qtmfvbg30
 J0dniBu0jcRn1SgTxYkFzGamxQ==
X-Google-Smtp-Source: ABdhPJzqm38dWktOC/MvcPenQ6kG9WAWPEUG/v1ipVnF/0XD8fc9iKqYr2zNhfv/t0WUpq2sFSIKLw==
X-Received: by 2002:aca:d505:: with SMTP id m5mr11011056oig.5.1627187187735;
 Sat, 24 Jul 2021 21:26:27 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:27 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH 4/4] drm/msm/dp: Add sc8180x DP controllers
Date: Sat, 24 Jul 2021 21:24:34 -0700
Message-Id: <20210725042436.3967173-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 92b7646a1bb7..c26805cfcdd1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_dp = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0 },
+	.num_dp = 3,
+};
+
+static const struct msm_dp_config sc8180x_edp_cfg = {
+	.io_start = { 0, 0, 0xae9a000 },
+	.num_dp = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
 	{}
 };
 
-- 
2.29.2

