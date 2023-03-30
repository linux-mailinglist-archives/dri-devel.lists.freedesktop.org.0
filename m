Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0E6D1330
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1770010F0C3;
	Thu, 30 Mar 2023 23:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8FD10F0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:39 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h25so26658733lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r1qkEAaQNTO/CD5dWLHAfXm+a6T+9M+SqzmBcYhiN1U=;
 b=CCeeNvjDBGJBgtguU2LCva5SOHxRmjKNbrSLW+DIrcTTirGjkgnND/QAV+reebxVzx
 dhoirrKQbSD/jwdfub2xWCF9ICWALYsmwJpfT+O3ITzKdXxH7B5ukjKfYeivuLvdl4vH
 tQYgSy/4eysQhu5ORxdOIRuz/+WCFM1UQycow/Z2S+IYn25UIj8wo15UyOPOMVp40/47
 skknMOsCcU1Lh2nqDn7yx6qtaZRRDdzw+sZdUgICRARqOy92vyuTej6FTf4D2m1UAqjt
 +snu5SnM1xf4ogsyxCYXWc9TpKgkH61HhtBl7yKY957g7YLrgLA34aQGk8gonRN5vZK6
 e3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1qkEAaQNTO/CD5dWLHAfXm+a6T+9M+SqzmBcYhiN1U=;
 b=TW/YHlWov/PVLk1J+uTArEw1Am6evFi+jvLpW7rGPdPERcqswrrGesWmE4N0jUtF5B
 ETsMmawq2r1AvE9MC9Ot6FvrJv6j4e2+29z8FxgSyfcby/ziN1e1aAgr/cwwfhu9HaLP
 vjNnzKgreIhfM1wroP9WQJ58PE1KdDPLhhDXrj2Ov81OWLheE2FEbv4ugiaiqoN4s+no
 7aMVjbN7WWL968i3KC5WUcL6o8iIZZf6Pv+vPnXGAFEf3aSC9JxRQiubkZP43YlSVF19
 4aQKGQnRk9Lbl5FHiIB3wS7ajLtLD3gXszmTsn5QdGcZYViMP0uYCTwTC6QDGj6NXeXw
 8ZyQ==
X-Gm-Message-State: AAQBX9chMvETqAaFwbY1mfA6OPjbVzSxP/dUefYXGsYmWIH9QPlv4Y/I
 0SpHCAePr3gaSqadJi5IfK9Hf9P9+BhYJGZokYg=
X-Google-Smtp-Source: AKy350YWEPjKZkDdVfYN1xjqQpjwI6x1EB3w1J5gFScHYlYsn1tfNe58bHr7TJo6zOTCC9+LAgkAGg==
X-Received: by 2002:ac2:5a03:0:b0:4e9:d53:a5ef with SMTP id
 q3-20020ac25a03000000b004e90d53a5efmr7058419lfn.1.1680218737770; 
 Thu, 30 Mar 2023 16:25:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:25 +0200
Subject: [PATCH v5 11/15] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-11-bf774b9a902a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vSIgBLooy4SpPau69jLvwPl464u8HClYRgiP0Hf1QqY=;
 b=NJKrNhAXk0iryuQaH1Cq4X0A6u4XrEdf3rOBDV+BNa5JPIq8uIm8pH5yaiEBJnxqODbpjp+1c8VW
 MrRIbbAiCJSOCUgRmPBNMEBVZVf8eU999xXHzCUrK+K+GpjyJV7r
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

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7d14a9cfd410..1f553451ffa5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1186,6 +1186,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1203,7 +1205,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.40.0

