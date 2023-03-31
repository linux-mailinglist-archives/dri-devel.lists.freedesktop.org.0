Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F26D14D4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 03:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CE010F0D8;
	Fri, 31 Mar 2023 01:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C9E10F0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:15:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id x20so21469008ljq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680225298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G6mdNQhMjpxcMUaJ/7JOM8PZFmH0MT/DI0sUdW8J0P0=;
 b=FmDWo+WsUIEzWEh69oAza5U9SDuhi3vg0vzqbUw0sWTdtjcYoB77tqOV1xw/aRJp2h
 nIA+QrGZrOvn48wti32AyLqxLRSpTNvo9mk+apQCn2aQ5/9H+qVDf1JkML7Zbfv/sHb7
 iOGNvJXH1iV3g4CNdnjGiegN3Fmc3fnWp9IiTfqZBZI4sSI2UPRpu7XxHQQ3Z+FVWvOP
 MNBpfofj7fBU1nX7YjFPl9+PavvifqTcm2A3qAJ+mPt4bI96y+2aa1MvAh1od1in5MXQ
 nD5g1NlUavkUmwLwKzHUbqg7uzesaUSgdV5QqHw7PN/5T8XRiEagR/3Re5v+8BDRqrS0
 u3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680225298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G6mdNQhMjpxcMUaJ/7JOM8PZFmH0MT/DI0sUdW8J0P0=;
 b=f3pfji41BLbEzXzynDFJGV8LwSu0m96U+TNcLKuBOgFkdWsblOmeEo5ZRzcBJszufv
 VW/oL9Q+l4TLQKBE8J2L7edZwnfBmeeePDeXFTWDhm8JVP/DsWMyTFv6NvDLM5GV5ET4
 dI4a0MzEiHOqm9UNVgtrpEv/TawnrzyJL0JPGDxl06hYm68aAmMmDpW8G7DxYoW3119d
 xzNWQZXdsLifxGFq7h1at2AWqxhPB+ONWrVzPIbHRr4f4LMaWSDg0iSR9MezJzAAIy2Q
 BpeU/82o8zQqyOkJws5gji8Y3aktqJCcwspu7n9D5QPnicrRPxpp1OcxRnSOcO815ij0
 9tvA==
X-Gm-Message-State: AAQBX9duC5V/HYLCTLBtwCC4F5cZCyTAnom/Q0QC5SbOsiqIvrCVa4qt
 35cbg+WGuY6eQG6wlvSnV39KVw==
X-Google-Smtp-Source: AKy350Zb9up3yCkQCc7qcN3sJjC3uSGuYzAqAKbJxUDI1C3urvSdsIL2EvRVpITAQvJpt+zhH8FBcA==
X-Received: by 2002:a2e:7c10:0:b0:298:b333:4267 with SMTP id
 x16-20020a2e7c10000000b00298b3334267mr8693032ljc.18.1680225298531; 
 Thu, 30 Mar 2023 18:14:58 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a2e7207000000b002986854f27dsm134573ljc.23.2023.03.30.18.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 18:14:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 03:14:50 +0200
Subject: [PATCH v3 2/5] drm/msm/a6xx: Add support for A650 speed binning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-konahana_speedbin-v3-2-2dede22dd7f7@linaro.org>
References: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
In-Reply-To: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680225294; l=1412;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=42U2yCRDQAALlywjy8FiLoqbAeo9f7qbW4rrzl+BgmY=;
 b=dwyPUzW5kyB7cpYIsra0jqgoc9iICEbp333fN21/hW1uI9eAgh9lyZx3qLIhTqeBJe7Uf2/WSJLw
 8UXuc7NcD4q+iFYH51Ld8y73WVcYc3NMkKeHz0Kfjv8gbc3apCoK
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for matching QFPROM fuse values to get the correct speed bin
on A650 (SM8250) GPUs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 663090973c1b..2afc160cf06a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1900,6 +1900,21 @@ static u32 a640_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a650_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+	/* Yep, 2 and 3 are swapped! :/ */
+	else if (fuse == 2)
+		return 3;
+	else if (fuse == 3)
+		return 2;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1928,6 +1943,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+		val = a650_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",

-- 
2.40.0

