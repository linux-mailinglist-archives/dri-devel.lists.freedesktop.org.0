Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3F675B1E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7602710E370;
	Fri, 20 Jan 2023 17:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF8610E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:22:42 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w14so7581837edi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTk/tR/tYl/KCS8N+SRDUWNSvwfDXiBMlwXtmH5gaEc=;
 b=YbR4ogtIlbSVc1u3jnY1YBF74m+ZBlifo5clT1CFPy1Tb3Z/Exs2k40fyU4F6Z0HzP
 Lp8Q/lndOGXNeXcIpktSqHhYb77BdaDyxMXXU5su6dqm9b2M/HHotEBAosBNIcrKRNzh
 Sc6caoppnZ9ReFwJkwlzmNjybToHDpI0mAdUnVtFEg4cH996zCCu9h1p2cIexmOGtRH8
 rAic1cOwKcldZRCLVbP4tn3DPzvu6nL0j46zEYtkK5LWgxRbX+xdSvq/XGEoQe9xgoOz
 glqS7yz/DPyZ5ijAP5GNsmDbhOqwPp7ITOIv0Kyi9n+7CM9vEtQAqyIoqFmGWb+UjZYc
 JA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UTk/tR/tYl/KCS8N+SRDUWNSvwfDXiBMlwXtmH5gaEc=;
 b=I8XlwB8gk78QZ+sb9X1Vina+S+OhOIuqlnvaA65e+1eb1rX66p5+wa6+4u7km1pnqg
 TsJjLM1ZjauMrB7np9MYzGa2EuzLWfI4Iw7+dBXUTjHDAwNJELCk+7cEM46wHTcIsCQ6
 Z//ouefTpuJdD/V9r1ESFm6Gp+AUGHmlmJ5d54Uw6sioRVxs9pFvCcDnEam/Ut+Th4+C
 NrQsgyfJoAP5kaKc3wLVNhJ42IGO8oNWP1mu0+tq4WdBKqgfAxo2IJgmK2NwA/dtF58q
 sJgsdiDyPtEL8AwGfpgvBHct4KI9tdzSpKA/EhW3pJyaNGVIPQLc8bGNfnQa6kNqKEQR
 mTeQ==
X-Gm-Message-State: AFqh2kqnJFYYSuxJYhNUyOQ0YpgdMOZ971wilYamokvcbw0nxYfuBP/P
 s+r/xf1KBY0mhaV8tpqRepI6CQ==
X-Google-Smtp-Source: AMrXdXthABXCdiT9cLDMkuBkDpMVfezZjlIi4Sc+A7GxntmCeVxSoxYgIir09PgnJz6TiGQQWMCuEw==
X-Received: by 2002:aa7:ccd3:0:b0:49d:f44f:7ef1 with SMTP id
 y19-20020aa7ccd3000000b0049df44f7ef1mr17648565edt.14.1674235360898; 
 Fri, 20 Jan 2023 09:22:40 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 s17-20020a1709060c1100b0084d21db0691sm18313857ejf.179.2023.01.20.09.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:22:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 1/5] drm/msm/a6xx: Add support for A640 speed binning
Date: Fri, 20 Jan 2023 18:22:29 +0100
Message-Id: <20230120172233.1905761-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
References: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for matching QFPROM fuse values to get the correct speed bin
on A640 (SM8150) GPUs.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aae60cbd9164..0ee8cb3e490c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1884,6 +1884,16 @@ static u32 a619_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a640_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1909,6 +1919,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+		val = a640_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-- 
2.39.1

