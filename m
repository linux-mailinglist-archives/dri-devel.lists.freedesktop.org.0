Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DF27AF2A8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 20:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206BE10E41C;
	Tue, 26 Sep 2023 18:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C27C10E418
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-530fa34ab80so23255050a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752682; x=1696357482; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fImG1LGJjUdtZmi9fIr7EL8KTwVEILvKptZJzrzzi84=;
 b=wZmGeHb8+6o7rZrq4iVKv7hpmF8kxfT3i1EnE8kVvNylVHiCLwSK/4TSP3Y4DW+Vh1
 GtW6YdXO5YiklfFpk9N4BgpxcQbtkskpM6eSDtnPtCBCDogD7E7diUfk+4W0pH+wgmkI
 DHAWHRJ8Fllc+0RlX/o7VyfFDk+bRl2f1upVnhnPDh0PT/93wnZ3P6sYyMl9CmbncncG
 bWGBS6j1ByCzdq3r/Pxde5FYNwjTIZOgi/SikofYf5wR35MNa0+CO2FsrJlTBiM7EF5x
 bWqRTBeCWKVwgEReMweqY4tZthrU8b0Q0bqAtJ957LAapoG3j+ABKLH9+vAusBxvTxHw
 NgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752682; x=1696357482;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fImG1LGJjUdtZmi9fIr7EL8KTwVEILvKptZJzrzzi84=;
 b=hvldbRSty2ilE+kDUrOYTjneOmyspSYJSqNMXJU0lOfatlYQuGyEgQdBnkjHqOBGVE
 cLBdjdxmt+UfTEFknRwOIh+NbcmTex+0Jfvyv5a3cBOMNSzSjnpLwYcHsV/uwC89LPZb
 50okEtxcSjbjv+HUProBjqDf8HjI4M46IjZhvUKBQl+9itlQb4/wXe2cUEfx7vbq6HhJ
 WWMkenbnX320cLaY03A9XMZX1d+Q0C3b0K7YlS7ubhluN0Mn821mmKUCFP4zRfNPhZs4
 EXg4DCNpgBzx34iDoKKwpyWmF9AzeiQ0cf81wXkWY6ylnhnQG40xUdQEUME57iJhA7q1
 ipkQ==
X-Gm-Message-State: AOJu0YyjvYORJlWzmZHVcbgHAkpNyl04kUcVyO3A2LRDc5PB7Jn4cNEE
 04fu/qgAZ7PMIL4Z/l6D0g4hEg==
X-Google-Smtp-Source: AGHT+IGyhzCX7pVh+DA0+lbZn90DwBp8MEe1mDcGOaXhO5brGM7FQnNVnsw4ZES8ExBZftUUH8qOhw==
X-Received: by 2002:a05:6402:35d5:b0:51d:b184:efd with SMTP id
 z21-20020a05640235d500b0051db1840efdmr5471808edc.20.1695752682485; 
 Tue, 26 Sep 2023 11:24:42 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:36 +0200
Subject: [PATCH 1/7] drm/msm/a6xx: Fix unknown speedbin case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-1-7af6937ac0a3@linaro.org>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
In-Reply-To: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=1465;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3B0yIPSygi0wMpl7xpS+ZhhsZWi7J9UA34HRlycQuyk=;
 b=Iu9f1ructFVGASge8ugqNeXgxQC0RA2BFUwle16+fVrgAArXS0bQ1QC4HXS8kP4G+m1Yn6duX
 ykCLE1FvC4ZB+qXAkv5ObgAqFPAY+KWSMuSl/qkqVw74fcluxKFF3Oe
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
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When opp-supported-hw is present under an OPP node, but no form of
opp_set_supported_hw() has been called, that OPP is ignored by the API
and marked as unsupported.

Before Commit c928a05e4415 ("drm/msm/adreno: Move speedbin mapping to
device table"), an unknown speedbin would result in marking all OPPs
as available, but it's better to avoid potentially overclocking the
silicon - the GMU will simply refuse to power up the chip.

Currently, the Adreno speedbin code does just that (AND returns an
invalid error, (int)UINT_MAX). Fix that by defaulting to speedbin 0
(which is conveniently always bound to fuseval == 0).

Fixes: c928a05e4415 ("drm/msm/adreno: Move speedbin mapping to device table")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d4e85e24002f..522ca7fe6762 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2237,7 +2237,7 @@ static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *i
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
 			speedbin);
-		return UINT_MAX;
+		supp_hw = BIT(0); /* Default */
 	}
 
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);

-- 
2.42.0

