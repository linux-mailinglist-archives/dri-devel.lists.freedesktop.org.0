Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616F74166C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5185D10E377;
	Wed, 28 Jun 2023 16:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0010E37C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:56 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so3425436e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969795; x=1690561795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=DQZ8bQM6OK1Jdf9uCG5L3p0W5NUTxn2k5hoJpqJ89L7veP52vetsvHAr9/3u2T02s3
 FwN4eefSkPJdvODiqNbplGuLRIWZ9Ug+o+/AbFNmiw3XMd8YQpmooiF/N1hUHh6vhSbk
 +ZrenMM5DtHlclnuBwZWPPEv3Ol5pFBCNQrhnDE8PhJzrMoTF3hwMBgVtWxIpX2LQ8Bh
 J8uqKwhu4k/HYE5Y5Jcu11vJbOynqrOf5likeOo+7J2v3/gC2Fd1cRt5h/ihwA/b/FZz
 zFCTB1P8rWz7AkjVdLLpogD/SCEe4jP4gZDSyaMdjoEdjth37IpwKnetCTIOvTGKKC7J
 ohjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969795; x=1690561795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=SnUvhlDDcd9dOU6GUZTyyJKSLx5jyAJuM/qKt0XzWgVPHHfJdB6faIEf99x1wWBtQB
 2s75930xsDrzZIqMyvOpGv4PAWk/HFmplYN6mu0PHdNAoVzPzLE9mEy6UOcOXwBzFEDX
 We++vcrihq94i+vduZ1mntODRDF1JqIZSbF7JXgjjHRXlO2LNCvN75nYp+vSObV2oF8/
 Qnn0F4RLe7atQPkPouIkX+CtLZ3SgI8MEB5Zr82OJFkjTAeucgVPoHdH0QoeDcbedNXH
 W4QlUHhMnuZYkyBzXIrViduK9dY05kHboFvsuq55oa6DUCvD5X8msWaUpzwU3kduabei
 LkFA==
X-Gm-Message-State: AC+VfDwrUcm9zvGWFPt4CG54DzWM2JS4K+ftGxSjUDpQwZxC37yBBRTU
 xTpwINNLtvqKVjEgy+op7dNRpw==
X-Google-Smtp-Source: ACHHUZ4Lrm2R/nQcM5BRiDtkitE2zrl7ditARQnOGBg5dQFQzWYPnI075o/ZH3A36BQhfejWQM+KIg==
X-Received: by 2002:a05:6512:3d26:b0:4fb:89c1:c209 with SMTP id
 d38-20020a0565123d2600b004fb89c1c209mr4023314lfv.62.1687969794861; 
 Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:48 +0200
Subject: [PATCH 4/4] drm/msm/dsi: Hook up refgen regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-4-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=1019;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bdVFkIHME+ksW97iOZJH0yeZoPTsVUfCpblAjJVbJjI=;
 b=k+jAhj46mh/Oof9GvJUQpt/J2u2Kf9BOt4qC0dCu0ivMbU0GBjjqGdhsVkkJrQVyrqAml8JoS
 YHTy+kjdBZUDW1wpX+4zBYjHF71ydli6DvpRMxSVeEkmb7N7RPRelKx
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

