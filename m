Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EE732364
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F265C10E56E;
	Thu, 15 Jun 2023 23:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70610E57D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:36 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f845060481so1674292e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871295; x=1689463295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FsmM0RVmGhdEwe/rih/x+k+rX6jJFYBfre/lrv7PkUc=;
 b=QxK4BzIR8IUBhOCy5aUHkaSxQ1FVwiCX9v8TWjmIKZxrM6iQhdZS075YcYr0T6/T5V
 cG3qCIAwYyWo5MXlUMb5/8OW+ZeInwEOo99SAvLMzeYqssas7QAY+7QsXkuCVT2GUg0x
 vv3hy70lsqmtHVCgnxKEbTuZppbJaCyn7xkPigVOR+HIwnmdcfsy0bgOOnzxSet0LOPf
 jB7qnjWq6y9G/vicSJr7Y51S4eW14hqGyROb4C6jziViqEei+zgrtAfGdLKswE4zVeqq
 04QDyy5jkZKfaMMa5dF5qLgKrhh3ZU6BVqL6idgqv5Dt4QaoICXLmi2QjKRs/S4pwuum
 lo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871295; x=1689463295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsmM0RVmGhdEwe/rih/x+k+rX6jJFYBfre/lrv7PkUc=;
 b=jQft6OrW/el8ZeaisUlXHMaxUuq0muSjnx8ow45+hReI0PhI2B7Xs6WmCmLR8Zrc7d
 mzkkrsrxZhs67DR7IDCIucwMVXQHDd5IKCAckjVXCuyoq0FpyYbQvBF5xLyw7AZ4D1M9
 2Rp5IBeo4Ps9RmzfxLAcykl2/ZSf0znkSs3GF6hV99Flm4+8BEWVUX6xCA93e1HmKXss
 EGsDCK58h1YXHjjvtrTq13qt5RQiHyBHDm0QCDfZLEu5Ngmeu8B8dG9g4IZA+HD1tTo7
 o6SKJKedEIEeaWXqpeZH3OXeCCuxnvkiEJHDBIXmo9eOpiCYkxrWzUvt2Sr0hDKWURhi
 TeXA==
X-Gm-Message-State: AC+VfDwzFJZg4omzqBg9Atv8KaB7Ebq+UUq+19MgJnoPyupV3C/Jh3gL
 P+3zsXu6+ukBqJznstF3wp73cQ==
X-Google-Smtp-Source: ACHHUZ57bxPcpLH/W26TQt+WKOvyGY/VYKwN0jb23n3AXd24tArYBiB8EX6js3HDzk6cTEl/2S6N3g==
X-Received: by 2002:a19:675a:0:b0:4f1:4468:ee65 with SMTP id
 e26-20020a19675a000000b004f14468ee65mr96060lfj.30.1686871295061; 
 Thu, 15 Jun 2023 16:21:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:52 +0200
Subject: [PATCH v9 11/20] drm/msm/a6xx: Move CX GMU power counter
 enablement to hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-11-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1883;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=NcBNg698ol/YkEOdeY7ojQoggNClubg5869lLN304Tc=;
 b=8sFX06msZKeW+kwKP3ZOXVdyHN22k+stTfTspDXSv/V6MFiUsi8VyYOuJztXYN7vAuhXvhy9v
 lEKWJf1OyO/AMgeFZYi9GWfzVwOr97iNrKw9rNMga9ujWibv7/jc7wo
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

Since the introduction of A6xx support, we've been enabling the CX GMU
power counter 0 in a bit of a weird spot. Move it to hw_init so that
GMU wrapper GPUs can reuse the same code paths. As a bonus, this order
makes it easier to compare mainline and downstream register access traces.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 906bed49f27d..aae7ea651607 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -479,12 +479,6 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
 
-	/* Set up CX GMU counter 0 to count busy ticks */
-	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
-	gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, 0x20);
-
-	/* Enable the power counter */
-	gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8aa4670b4308..0efecde2af1a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1256,6 +1256,13 @@ static int hw_init(struct msm_gpu *gpu)
 			0x3f0243f0);
 	}
 
+	/* Set up the CX GMU counter 0 to count busy ticks */
+	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
+
+	/* Enable the power counter */
+	gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
+	gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
+
 	/* Protect registers from the CP */
 	a6xx_set_cp_protect(gpu);
 

-- 
2.41.0

