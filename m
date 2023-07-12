Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AE7507C5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DC710E514;
	Wed, 12 Jul 2023 12:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D2310E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso19723051fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163909; x=1691755909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8u99usX7me3R6ezNiQ39VuDYE1QHKY3yic4fbiQ42Y=;
 b=PaeeNlqC29vJaW47FUTpwhwKWIZ8YVsPowcrbrOneBcOsCtve21sP7QvI67vqtPj7a
 OgqBzUYqtQ89eyhn9KT4jIjPGmz1Eg8d3jh7JHAgxp+yxB4o9xTFDnD1zoAMLZei63jV
 /vC1c3ShGU3utgazkEmdFRrnBv8UuY/wXbuqHOc+fuL4QRtgs8yofcyfTECMlquMT1x4
 AT8sPzxPyfw1I5BvXsYHIjD1FPFfI82EMBsZoRGVmnuMe3T6dcY947W9Erf4CUOzHmJa
 3wl8tRzX9rt8mccS0TDhiMQe9CXoPRfPrOORwAPUIWaZpjOlIzKFC2eZNvjdN9Y2eElK
 40Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163909; x=1691755909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8u99usX7me3R6ezNiQ39VuDYE1QHKY3yic4fbiQ42Y=;
 b=fy0NFvokp19hJAMLo4ed+84vQE5o2/TWVqckgAj6kTi/ntFohC7Y7c1CRh5Tjh1dHV
 bdP2OaRMe4m7MjuF6EW2ojRlW6tYbe/VZv2kOnPYts5TUB945MWi3hqCfnytx947cN1l
 PEE2Z71vQFtJ6yfRuDFrqqT9GY9TrdO1HpHPS97LDFwrBjrKqC7Hb6nI/XeXucdVvhW7
 kHD5te/ZxFDRoAr1zu4VNT0/qCch/MRDL6s/Pwo8zN3za4R+AmLIRokM8R+6oEpgwe+D
 ib4G52GDzbHjcrijK2UXsUhThSy1cy20/pVLrCW/9hF7W5w02rQ3JibZ3vPcDUwTKO1G
 Q5gg==
X-Gm-Message-State: ABy/qLa6C8dxAz/OEmRgERkkeS+FttogXrPYO5sQE4fKOqRAei1IwdJD
 7cef13KUJXi7+zro7LdWM/RqBQ==
X-Google-Smtp-Source: APBJJlFw7Bt7yaBOhgBe1Bw0QG87L+kc2FH2U2ZcIx7JWarVs1gcvnh8RQ2nSmByaNKIv1/2fXSEAg==
X-Received: by 2002:a2e:8745:0:b0:2b6:d700:fbdd with SMTP id
 q5-20020a2e8745000000b002b6d700fbddmr15522209ljj.15.1689163908814; 
 Wed, 12 Jul 2023 05:11:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/8] drm/msm/mdss: switch mdss to use devm_of_icc_get()
Date: Wed, 12 Jul 2023 15:11:40 +0300
Message-Id: <20230712121145.1994830-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop using hand-written reset function for ICC release, use
devm_of_icc_get() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 798bd4f3b662..304a6509e1fb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -58,14 +58,14 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0;
 	struct icc_path *path1;
 
-	path0 = of_icc_get(dev, "mdp0-mem");
+	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
-	path1 = of_icc_get(dev, "mdp1-mem");
+	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
@@ -74,15 +74,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_put_icc_path(void *data)
-{
-	struct msm_mdss *msm_mdss = data;
-	int i;
-
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
-}
-
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
@@ -389,9 +380,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.40.1

