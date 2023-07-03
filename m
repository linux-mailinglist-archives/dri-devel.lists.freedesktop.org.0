Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C67461F8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 20:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7941F10E22D;
	Mon,  3 Jul 2023 18:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6510E227
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 18:16:08 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so7588628e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 11:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688408166; x=1691000166;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=M3MZVSSvTVZWcSpRhaGpO/4ZkPSOJadnFRhiAWsh68RYeasKrMbEh/oT0RYk3GLYFo
 k4jwahArOJYgAvQtne7W5fHuj3trxl49qv26FrFAJPDMKnjMa4Hwf1KfrF9RA7dSb306
 CJxseFXY8lFhRYqn+UhQewllXgn+Ya667F39GD+h//21/3/m9D+GK4CmpZZMtlq3ifTB
 xu/JJOFXym4Bl3Iy/vnGUSrBd0nM8RWNEGhKDr5xS6CpaOrQTL/r//7ljBrUlwnnkICc
 rrtEWp8QlX/wSerFxkpNnk1VKPfJVb2Ac/79UNgYBOFvt8bQOCu7wizgPkbl0ydDXUeK
 6/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408166; x=1691000166;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=eFpV9NrzRf41NllHnBUae0TRM8tM+GKh4OLQidNfGc/xsKEMeGOrHcvQjvIdr0tSPd
 2RbxzJjNz57li9+eU3WDCJZBMzmJnWQ+2OrBIEWEUmQ9ks6RVQhFhCyQy29Jw4Xnt+FL
 bLU85ja31431o3Jg0MfpVXXHqfFM5dQs3sLbmUEnJOCBG+IpTuXACswzWsbMnbKpvMzn
 sF1LKU6NQCJuPZR6GcyOmOokMQHSVNekCgOmrPe19dCqOxhAQhIA2CAnk164rO9ywGWJ
 ndVQCEp8o1GdEaiCBog744KzK6K66cZ083pPdACpQzWbM00mIW7y2+DiO0mGvYIdjXUl
 0GRQ==
X-Gm-Message-State: ABy/qLZTXjh2Gfntx9SE4dc4JG0gZYXejhTgbBGpFOrqe+uKHwrmjuNo
 Btu1FKq+wPWzClbpprhDG3WBJQ==
X-Google-Smtp-Source: APBJJlEc4yAktwF7x6gCgekN3+ccCPA50qDBBrH0d+jVm7hR7Bx9KgDlzmfylQS/QgSsNDm8guAWzg==
X-Received: by 2002:a05:6512:360a:b0:4f7:55e4:4665 with SMTP id
 f10-20020a056512360a00b004f755e44665mr6488178lfs.56.1688408166353; 
 Mon, 03 Jul 2023 11:16:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 11:16:06 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 03 Jul 2023 20:15:57 +0200
Subject: [PATCH v3 4/4] drm/msm/dsi: Hook up refgen regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=1019;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bdVFkIHME+ksW97iOZJH0yeZoPTsVUfCpblAjJVbJjI=;
 b=76+Fxu9Mkj2j91rvxqGFAjIS4lnVHjZtvgXD8BN606qTh2MlXXDVLXeY449B7FkmiVfjfKJUE
 3PeNBebhJ/3A+sotF6ET4cY+H5e2VvFD/K9b8XQzRdZcHcZMxrMZwBW
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consume the refgen supply on configurations that may use it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 8a5fb6df7210..1f98ff74ceb0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -160,6 +160,7 @@ static const char * const dsi_v2_4_clk_names[] = {
 
 static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
+	{ .supply = "refgen" },
 };
 
 static const struct msm_dsi_config sdm845_dsi_cfg = {
@@ -191,6 +192,7 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
+	{ .supply = "refgen" },
 };
 
 static const struct msm_dsi_config sc7280_dsi_cfg = {

-- 
2.41.0

