Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A66D132F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7975E10F0BD;
	Thu, 30 Mar 2023 23:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB510F0B3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g19so13548873lfr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218733;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UaQqSlW0Hu7wuwFuXxr7ZB+drxQgUbdgeqKDpKp7IHg=;
 b=VoTrTlyva0/pRKXMl0hn4cMaA39/aoaR4/8ZZAh9o6WOKfKpR+gWirGoGwaSRDGqFz
 wZFmjn8nSY2p8xKPZA6lftR2MBAJQJMH27B6gJAaQA9y0t799nBnuBCVQNt1R0kuc8yh
 8NaYDB4FQxsNk76tF+PLdXIZ7tdboZeL+M34QC/xXxHlaoq4CDmFx2+b1PQKAlr+FQeb
 xgTa6pjpqnN0quEsuz3cueAy8Y+NVJPCfynlVTG2xSkzY/r0Te9iCC7dt7JjL27XnWcL
 VVMyDrqZt1LBIUYz7hci1aBNAUCHySUNSDC6TYbybc8ciCZ8lGVZ0iEwlfj5zf9TXOo8
 0Z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218733;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaQqSlW0Hu7wuwFuXxr7ZB+drxQgUbdgeqKDpKp7IHg=;
 b=11AuJRWBRhysJG5Xxh2xJBeqqc1Dc/rbKtzx/Z7ED8WGkV/sXyjCnYzmrkOkEftDwM
 6F4TmraLOMtTS5TIIk5M3RxcWHLdY/ts7fqvUQRr8bEaLlSO46PcPIYedbD7wskBXHUs
 HerzpTVJDwZnZFnco2dlgA3T5dANT7IVmau80WyU9FmPSoP2sziC8g4cKKq/5gRW3U2d
 mR0xCsUVTNJH+BSwSe9+lFwKnMwccgTBaCbQRIQXvazTyc34zBbnkrWJPd2f9xHt1q+a
 GFjDjcuUZSHpier8aWWecFPHO6xT4D5/MbQBCPjlLYIggugAb6QPaQqhwqK4oDk9Kqcd
 vJ7A==
X-Gm-Message-State: AAQBX9fEdDmioX2HLMnCnJ3SuBghenbEFaGIXGq5UY0fJ/CKvRSaMmD4
 BkTEDnT0BkPaaQI5uYgDrc1gDA==
X-Google-Smtp-Source: AKy350bOCRvb/Uxz+rYeH/vzVuRgY/7Tn4zCMqfiK1AgpxVq8TbjI3Bhj11x6WhdotNgeGpdkkRa6w==
X-Received: by 2002:ac2:4105:0:b0:4db:381d:4496 with SMTP id
 b5-20020ac24105000000b004db381d4496mr6099217lfi.51.1680218733408; 
 Thu, 30 Mar 2023 16:25:33 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:33 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:22 +0200
Subject: [PATCH v5 08/15] drm/msm/adreno: Disable has_cached_coherent in
 GMU wrapper configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-8-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pgsq2wrmx2dN+DhvHdVkqgJZhLfKKJzRqreYHhrCBpQ=;
 b=ZUd/VafLrjD0054XVcT6XP030VEirGQOXi/zbif+vu4oYlkpmNnSi/9Idamps4JWET8miFA8TTAL
 JVJVISW5AWVNY9mdNYozBMeaZK6UK7taSwr4866ybvsItP8zQM7E
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A610 and A619_holi don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly. Extend the disablement to adreno_has_gmu_wrapper,
as none of the GMU wrapper Adrenos that don't support yet seem to feature it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 745f59682737..2c6de326187b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -545,7 +545,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -557,6 +556,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.40.0

