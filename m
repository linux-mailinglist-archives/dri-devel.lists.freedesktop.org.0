Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B4E6A081D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF0B10E4CA;
	Thu, 23 Feb 2023 12:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EC010EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:57 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b10so1820611ljr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qf5HInxjG90aUJ6hCZyojCQwkimyt7Jgftn2UOCVowY=;
 b=PblEPf/xero1S5B6lz+EkjYQqQGaR3LqwLmbXZLAlwoNHm7ZalfNJZ2fHw1hwcF2VS
 0d1LkH4gUzTpbyC+OYCy/89Uv0rUCxpXqd3xvPQf//Oa02qGtNswmtzmT1pde1TYMaGO
 Y96OQxy/OCX6jNOO6byWEp7EJr5BVZUUjrxa6dBnw7BCCbNg8fM9lEIFIhSDsTRTEGc0
 sz+I7NIVt6lzuUL4MIlHoM1megdE+6rt2soWExAfh3JNU394tu2cW8YUswJ3NGNJDe8L
 8QlgOA3NhMtuNN2mJGkKW2ar89bmgdBwmX5FuLAbNs+nW7PJddScFIkE51xF0P8ZvJa1
 d1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qf5HInxjG90aUJ6hCZyojCQwkimyt7Jgftn2UOCVowY=;
 b=UlVo7EYpB8ESBdA1BmsXpdhaMl9ysC6GTOPPxk8l751IZ0LNXarPriLmJB3hbb/eAb
 qu9SeGc6gi5iaH2GEpiyYjni8weY6YusoSqBEzihE0zIvD7NN+bozWYI34zA9lqf08py
 rpM0JaLlvrByWXMDUsOtZZeHwQVP5OrsxU8hveyS9B7jx1C5/pO7ECW162PHTAGP1V1Y
 JhGlGDtvYlQnYu5ReXV93hpFCGeqAPynIyIqQfr/nCGNKXmPw97wdm9iFhJFc/nsIN3e
 muvKT9UdPbzzAWQ4E7mKZy1MM3+nfeS2xufjkPOujbs9A4hM2j6DoY3ANGtC2bQZJHcn
 n5rw==
X-Gm-Message-State: AO0yUKVJb29MaxhgtY3e6xpG7R5Q2NlIw6Y8nSQ23OVmiMvSUKjrbLWN
 8OJpLlPt8OwO1cMd91GtJ5MFFQ==
X-Google-Smtp-Source: AK7set8LggzN6WNPfBVr0UHvKGJ3hSixlN1HA7HErHjUIxOpbU4YBioGHk+U2bkHICf2lFT3ZDrCQg==
X-Received: by 2002:a05:651c:109:b0:293:3d31:be8 with SMTP id
 a9-20020a05651c010900b002933d310be8mr4002640ljb.5.1677154015641; 
 Thu, 23 Feb 2023 04:06:55 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:41 +0100
Subject: [PATCH v3 07/15] drm/msm/adreno: Disable has_cached_coherent in
 GMU wrapper configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-7-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YYycR3bRJfKGsgGpgNOineZFPyZdnWytf23WfqsrBCk=;
 b=cLHqy1jK95xMtC2H769nOzM6xMSsaFAe/WGrn1IYO7julVHu5tBndfmxPVQn2i+HLOjV8ES2kW4E
 +nErpCukA7P3YzRQOH6OQqE7uQm5Kq+ROEkDvH0NLuZVuEw6UKS8
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
index 5142a4c72cfc..dfb43741ea32 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -552,6 +551,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.39.2

