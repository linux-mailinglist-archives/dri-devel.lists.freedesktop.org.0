Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7770A7E1
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8A710E181;
	Sat, 20 May 2023 12:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502BC10E181
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:07 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2af28303127so15610891fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585205; x=1687177205;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nbeDfglU9RuqTNjicprjwIl53dVBd5+75wJTdFjQtgw=;
 b=ExOJZduGvtwwLGUWbE2bohMRQ3uh+WA5DdQ2TUV3X7X4sNx5oFHX35JK9VgguaFbZH
 nZgfrBJgcD1rDEdExeZUbnReiz31GMJoX8AHI/+RWbsVLngsCUBU+w4Ch1fRWrJWN6aR
 rdxW4Ri3cTvxnZwPGF5dHhfhEBqubTeZDvrVSus9Mfh8K6cOVs4N+Rv+KJRh5XlHlnxL
 UmVuXcXMR95EXPVAve1YdYchXTn/z5uEg59+gQwwOyimzTPQIwfi9nfx3C66k59IUnTp
 +QY1ajAK317q+KT60pEbgelMlvmTemVtGl9BtqYdpRhs8Xn2vPBpzRLvnDC46jb5KNvd
 5DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585205; x=1687177205;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nbeDfglU9RuqTNjicprjwIl53dVBd5+75wJTdFjQtgw=;
 b=F2NPBIOf5Q95A1p16hojiovwKsLRHKnwxkYku5quRoJsk9PJeCFDjjoygbrOps0Nox
 Rwh9B4VmiZF0Y3AlFj1CGP0gr3BI742HDiNNJxxzPxuC00RvWgjT8GPGAjXoyA5QlLzH
 B0K0lUaBqV+8MRFA6+5QSG6QKybFG4snXSFN5R2PgdO4k4SYXw+uca1JeVUq8Z1OUeUO
 hTm89DUpNVMB+2jrqF2h5EHfyyVO6bobjzcxl+/MY+EOVaJnK1KewhoHvA7iPd65afHk
 p1MA8Wlwg9kYwJXZOT8cJLv3t/TltuD41/+RrX2/ETj1PoUL1OjUUgeAPobRkkJ2/M9g
 NuuQ==
X-Gm-Message-State: AC+VfDyeRdUqT02bT/PzHyr1143LBLkNdA5TYMLKChJVfimJQabWOmvY
 bVAFTH+KPBaEk1lu43Kr9p6hqA==
X-Google-Smtp-Source: ACHHUZ46Y0C+VGHUCkao/0+x2PRtDiIQaj9lWWsv5+OI4eWpUyyfEPZB28xAu4EzbfU5NbG7XUtazw==
X-Received: by 2002:a2e:904d:0:b0:2ac:b63e:94a6 with SMTP id
 n13-20020a2e904d000000b002acb63e94a6mr1939411ljg.21.1684585205257; 
 Sat, 20 May 2023 05:20:05 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:51 +0200
Subject: [PATCH v7 11/18] drm/msm/adreno: Disable has_cached_coherent in
 GMU wrapper configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-11-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ocm0vLk+RPaXxNK50G6/CzW6Z0tf26goam4OhjTSWzI=;
 b=kG9tiJJo8el0T9AKSzuHPeh2Sfcz5nC7icc5Eg0j1Kz8+OxSsA/t/ZldnqBwMOgw92PtxeSRA
 awRSRNuzpFbCNWiYdPjMR/ER0mCdAOx45dNW6hQBntrTLroZwm98Tnu
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
index 8cff86e9d35c..b133755a56c4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -551,7 +551,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -563,6 +562,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.40.1

