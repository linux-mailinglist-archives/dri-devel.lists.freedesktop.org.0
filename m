Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 140FA7ADA8F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D176010E27A;
	Mon, 25 Sep 2023 14:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E8910E278
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:50:54 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bfea381255so111271431fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653453; x=1696258253; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
 b=cono78bk31nxfg21QNExk3Z5ywUe++GWyDgRI3Nww8Xykk2Z++pQBqU3Sn0RdejBvH
 gEwUnNlO7JhgT/HwLXCpeVrPpcTE6E3t2keeiVM5tzoKPPhByRFEJn0kEgSSzNp0W2Hh
 R5zkj/DaKVS/x/T4gz+X8XaXQO7a6Zs2g8g1LozaD9zLv/prSDnFh6ILS2w281FfQhxi
 cztdI6ty/zatVKN05b7tFM1c1QaHqu96piUVbjDxFLmD1mTkaobhAAX9dJcJmf/ewNkb
 Ai4k5uBOHjhelHTSKyJ59Gq2kKdE63hN2Auh/obDnJ62AckLMVoKXn+Hdh9YgGfvJST3
 6HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653453; x=1696258253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
 b=B6h44zlcqMtefA3zau4/GSm4/VMO/rJiuSNHAZ4+1jDeLKsFQDIQ99mtvS2VbFQX9T
 g/WySB61ZanUxkQvPRvdYHU/GbkiHPlsE+/JQtQqs2r1jbHXg3qqC2XFBz+1me8+7TDx
 0lF8iHhRu3RB3OYszDs9nGOHsub35RfXWuXiGnyN/o4qSa9bK62zyBqqEdSrbFzE77SW
 taZuVvGlSEa8fL1tthEvMvtXyNekQ67zSwgzO6rYX4Ca2z9i1xtvQA4cRaCTbSGx+KDU
 84RUiDeYAwvNgTop60Pl9STy0fthxj/IfLEdmgrr1N2NUbDUUoy8YkFqMkIstjQvZjED
 Tsuw==
X-Gm-Message-State: AOJu0YzQr8Usz6sI7NSt9wW1rQUbeGxoyfQXUnNamT3DjMbbDf01Fv2Q
 chppJdF2yFe9Z2s8R0idFAqEiL1rtWoDp/V2oWecWA==
X-Google-Smtp-Source: AGHT+IGngHh1lJzYut0axATUq1RD4igrxqprEB7ZDSJGxzmibNVKlh4pMxU3t9l8VHC4gxFNKD1PFA==
X-Received: by 2002:a2e:800c:0:b0:2bc:efa4:2c36 with SMTP id
 j12-20020a2e800c000000b002bcefa42c36mr5755576ljg.11.1695653452875; 
 Mon, 25 Sep 2023 07:50:52 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:50:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 25 Sep 2023 16:50:39 +0200
Subject: [PATCH v5 10/10] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-10-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=S69YtysEIHJMxY5KNnuCyMTYR/1rqHR9OdffW35mR5k=;
 b=deWqc3xOp1yizqjDENR+XaQW6wnaaeSKpTpreg+G3/p7xbkHMY61wviNuH6/V3VKcF9ePxP+W
 PDwN6oVPiqRCms8n3osJOWf/yJd48uaIscbJVT9/lMgwkRDys++aKk1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPUs - particularly A7xx ones - are really really stubborn and
sometimes take a longer-than-expected time to finish unhalting GBIF.

Note that this is not caused by the request a few lines above.

Poll for the unhalt ack to make sure we're not trying to write bits to
an essentially dead GPU that can't receive data on its end of the bus.
Failing to do this will result in inexplicable GMU timeouts or worse.

This is a rather ugly hack which introduces a whole lot of latency.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2313620084b6..11cb410e0ac7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1629,6 +1629,10 @@ static int hw_init(struct msm_gpu *gpu)
 		mb();
 	}
 
+	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
+	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
+		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.42.0

