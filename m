Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1B67CFD5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292B410E29D;
	Thu, 26 Jan 2023 15:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D510E154
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y15so1472504edq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CddRwSzocQvRockEdA4yvKkrPdK0c3Dd42RlRLUcF2Y=;
 b=GXmG/u1h816X05sgf8P1FECsAAVuqm7W8uZuzMlJ3yYinH721+FYFN9aDfAmNDTt1p
 X9WWXSUesFBuZNbZ5sXvXaQLbK7szTktWxlPz8/sR7fOQ6jSW/EE1ZexvSS6g58+CAEd
 CaOmskiFbo7tqyydjQV7uLLRxEo/8jf8AsSF+y0cW7iHOMUC9LVv9YTjn2VjVCHDC1uC
 Wn48JLQeSpERIKxWCkbVTLUQ5rD1nve44WQniwh5GbVBrVkkjPvHkoUcyVav3Adia2j1
 IgxcaUYHYDIYJINQsTEg9zm/4L6Gg1nOz4Bzk7kqur55bEQpPoeZhDBmxAhgIXwobgYg
 M6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CddRwSzocQvRockEdA4yvKkrPdK0c3Dd42RlRLUcF2Y=;
 b=jqlnUZ7TNSHwmDRRC5J5kAjDPpras/iioNL/y1Iukj12NKVrBR+fIlV+Gxpku8nHcx
 kU+fWa402TqbCCl6WRQyIPMr9QYFaltBmGOL8xT+sfp7LzkPBz6hp554uLGxXVF2RdTL
 Hp/nbodsv7lSkAtbjbfedJx7B3ER+DYjPwyULhV7gVYODAxOfJuItS9L8HGsph2zyrLr
 y5BDIYX1Dy+WELzzr/T+3Tkt6BBatufLBQhLC1t4KA9S2/ZKEu+lXmwmk0lZFqcpyhvn
 EIXsr4uVC8JWCiTN3w+KfxWxKcjntK8nNs33meSxzLoZRVbmYBX5ARXIu+nYaur7KEEG
 FtoQ==
X-Gm-Message-State: AO0yUKV0crDamfsMA6VqyoBWYa+ROewIjHi5K8HBmqTtOURX8b9ZRiea
 N/dt6jtYhM9AsBPuiHht8kLUDw==
X-Google-Smtp-Source: AK7set/ykZUSLMStAUNJlo7q5VvG2BHWVGFSh8/CbaVeBRoljyctPOuurEQckisZ2pmnXW2EGweKww==
X-Received: by 2002:a05:6402:430b:b0:4a0:afd5:df81 with SMTP id
 m11-20020a056402430b00b004a0afd5df81mr7170467edc.35.1674746274366; 
 Thu, 26 Jan 2023 07:17:54 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 11/14] drm/msm/a6xx: Enable optional icc voting from OPP tables
Date: Thu, 26 Jan 2023 16:16:15 +0100
Message-Id: <20230126151618.225127-12-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
for us. This is however not the case for the other GPUs. Add the
dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62f504ed7ef5..6d6b71306ee5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2335,5 +2335,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return gpu;
 }
-- 
2.39.1

