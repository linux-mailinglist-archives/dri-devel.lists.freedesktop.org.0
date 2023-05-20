Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9E70A7F5
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96910E192;
	Sat, 20 May 2023 12:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10D510E188
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f3b314b1d7so1167185e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585216; x=1687177216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6euEkRodrQgx7ZE9t7r7K+NeHv1LqldRFjOFTB8bWyY=;
 b=BmrH/ZJTnlOU8B8MsGcUTxSs3ldt6wbdkha5Pku8nW8wiesMbU9mNfyY7MrN4V2Gqr
 RLM9scxRukJ/ONiVl2FsY6eDoLKRgfHlIFHVnW3yGkZxHqsyzkcOxFzg8TIpGA3BT8c9
 nXHtqqFpJohjbQNeLqbPPGwTBeK/TU/btYx1zkZFbakqExv6o0z5JGy6ZhPC3MkoQRIr
 CZsWcSPBsbGhnU8JpbytXaPNh2weDBplzjO1VgucrO8AcidNHtppBnIsBiW2L/gbckAN
 dcFefXS2aEZ6Kq53K1na7IRRmYLvYbZohlo99vP8mSpdLLltZHx6ugzO+AwL6Mk6CKg+
 AN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585216; x=1687177216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6euEkRodrQgx7ZE9t7r7K+NeHv1LqldRFjOFTB8bWyY=;
 b=gv+0nP2GtrxvsxeDVgPFbBul+5EbgEqnErQHU0SkP9zfY21JOlAw1DTImCeG9ZEeRP
 l4tzOf259O0FgmPAjPsgpe1aCbYiRBYrYqaNLYI12QW9cfIBNaj6stYgSU/CskagbH0B
 WRLuKXqFXBQFV2B5rxu5TD9xj9NppEZ32v+RrHS6m6gdJ91Hi++E3hFln1+WQo88qZ4C
 n2z5El/VNKPjKbxIDtCciV3eiTtsXD4nftKz/4gwyMy7ioETP3V89FJs+8ykEjD6cbNS
 LmVUgMcII3xu88JMcnRDgEkiTcPfBo/aMi6GqqMvZbPkzDl5+fSmscODZNHAcjIDvHdQ
 dGLw==
X-Gm-Message-State: AC+VfDypefstj92c/tlXgR2L51y1kfhynmjhyZTcw0JClczjHm3SmKVR
 k8B4eqHvsfuzcGwUK/J3rN0/Sg==
X-Google-Smtp-Source: ACHHUZ58TljU+iUDLDIpGnb1GNrV3kCrtVuNbUTxPr6r/DQkrOHnuSQRaoImSSkim8bcpU5KKyUiNg==
X-Received: by 2002:ac2:539a:0:b0:4cc:96f8:f9c6 with SMTP id
 g26-20020ac2539a000000b004cc96f8f9c6mr1835216lfh.5.1684585216004; 
 Sat, 20 May 2023 05:20:16 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:58 +0200
Subject: [PATCH v7 18/18] drm/msm/a6xx: Add A610 speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-18-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aYEnG9+HCzURuVCpcLpZTVlrArU+CPMAgc+RtQYPTAw=;
 b=cBGb71GEz6m+55DZbw5+CIlpa9bA2JR7ff/H/b1bxB27zpReX2GOg7AWcYOzBnWEkZtbP6mJc
 HaVYS9xm5/JBf1ihgp+IOvYeg1spOGFEwJmV78VNSn9B2Aj+MtEE37L
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

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c07b25fc2bd9..d004458ca783 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2102,6 +2102,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static u32 a610_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
+	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
+	 * as only a single SKU exists and we don't support khaje upstream yet.
+	 * Hence, this matching table is only valid for bengal and can be easily
+	 * expanded if need be.
+	 */
+
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 206)
+		return 1;
+	else if (fuse == 200)
+		return 2;
+	else if (fuse == 157)
+		return 3;
+	else if (fuse == 127)
+		return 4;
+
+	return UINT_MAX;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2199,6 +2223,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.40.1

