Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8C732378
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D410E580;
	Thu, 15 Jun 2023 23:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAF610E585
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f6170b1486so277534e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871308; x=1689463308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a+svBDf4CLgOAipv+j0r6qWFrZWv28OUfTzAcDFjW8k=;
 b=GCHOdnkoYXEvs/0jT/JPEJ88fwlvgz9KRcr4tdd1kVEoRdap5/XoymnOMrVgKYqg0u
 qtgkwIV+8jgAeRsJ96GdMoqzjhufEGhX+iz2zQYykJuxurBiJreSCezAnbSqIXFy2Zok
 QERYixcwm6AqzZPtv3VXY8bkQTgFQBEFQ+euYXRdArxUUoIoUCS1HhCvCF2is2Y3uqDd
 3M3aSuie9CCXNOYaBSPUR/xJiWgDCpUwot/U7PAEs07FHHyBnuSaceKng+gOXCBPW7Aj
 v1RPpRa6oPIKlo6oXNkkTPbOaJf3dfADfbNbutC57q5M2cz/W0qHjaatksJ4EtRhQ9uY
 zAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871308; x=1689463308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+svBDf4CLgOAipv+j0r6qWFrZWv28OUfTzAcDFjW8k=;
 b=CTL6V3R95kou5J5/MaHUFndVKpxSqZ2kGo8mKV5puC/Fp++iYHKg5+UJQaE+0f0VXY
 iw/hX9LwZc/YN2OeIXv3IfObAY8N/o1m9TPssq+e8GkXdbdzdt88F2bhEqgwwxLIMYwA
 FnR87v0tmz6v3rAbzVHl8EQ+BjJoVj2nx8Blf3KE6ccd5Q2zIPC6POOE1B3qfWP6fUd3
 qKxhRqtBZFUQpGST4pOWkX6G9ZhHMBe4qfBpAqyYU6NsLh/mwTt2cGohyK8fQbzkkOKF
 KYrdqC6PHmRybkDVD5RuiJA1MNWdt6GavFWCTUHIpAE1l0S1g8nFpyfXcHkEDBR3Z289
 ogXQ==
X-Gm-Message-State: AC+VfDwBDbATsFAWBGfrYzqpqyHZWAgpnLOwhznxXeJLDUwyX65Lgedp
 E9ZoFlNgAsJfVWPkc5+Xl7F4CPihGdTXLcXRAMg=
X-Google-Smtp-Source: ACHHUZ5M8+Y1tEEhAxhunZ5k31fQ0kTL8g5RSZ1OpELl8hso07LURPszaXvFfhbNwT0tuON+1GdjNQ==
X-Received: by 2002:a05:6512:398a:b0:4f4:e509:ef56 with SMTP id
 j10-20020a056512398a00b004f4e509ef56mr1852623lfu.25.1686871308495; 
 Thu, 15 Jun 2023 16:21:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:21:01 +0200
Subject: [PATCH v9 20/20] drm/msm/a6xx: Add A610 speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-20-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1908;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QopxU5AaMC+j/o5cTOrG8wzEEwTggnAJi8IemaS+5vw=;
 b=NYNylG8pigD3OTBd3OI53qX8ugm96hvBv8g6mwWgFpPpKI2cLy28RrZAm4FAkNYNvy9fmXUEY
 hEPbQ2EAryQCVzo06LJNPngbVcuJId2kFj0Bwt1/Dxnfm7lLvCfe6/I
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
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ff9a8d342c77..b3ada1e7b598 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2204,6 +2204,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
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
@@ -2301,6 +2325,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.41.0

