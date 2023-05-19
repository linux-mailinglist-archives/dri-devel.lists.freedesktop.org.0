Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28B709847
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 15:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB6310E275;
	Fri, 19 May 2023 13:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0493410E217
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:29:25 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac831bb762so36371241fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502963; x=1687094963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xbg/GarYLH0aFj2Z0GcGyUdxXKd4AWIEjgCUU5KwNKM=;
 b=vJuSxGYk/KQ7DJM8LMmmyVUgzqptU4GWlxJl2iPW+t5MM4OSpQeXAOGSISVK5GBoZ5
 lQLfAMinnu3hVvPIQx7So0vMnFfLrNF1Xbro3spArt3sitaMsyprZCiRmesL3LzsFqTe
 bue4u8C7eXuVRgCx9jdHpIMOF6JkQKkkJESB2rUnksQ/SuBvAYmKLxTebQALspUgY6iZ
 GLFAgQ3iOk64ezVs0Q37K3j1Vw81Wyv97Pvo11VMrMS1eqAO/+o+vQCrBBGzlbfvWjHB
 2GkLVfJ1zfm5Hz1mKURus7lkBUYYNighIwJoXV0cFsrJxqxhcq9op8TMrb5/WPlOLjJY
 /fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502963; x=1687094963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xbg/GarYLH0aFj2Z0GcGyUdxXKd4AWIEjgCUU5KwNKM=;
 b=NiUUz2L2KxO74Qu6QT2OCQx/I9bifCZSVJMBDsVAens/U/JHoznCzmqz3nmfs1xb2j
 fZEWJcmA5rBQSPYpNQfyW/6DTu6d2K8Gyz7ipw0IjNXrCpQcqRTitvVHjb84A96X4/3a
 Au7l5FxEznFrCe+hoKbsoSV9qJyQP+pPDcvF7yridC7bR2RvXPTLZfQ7WD7QDZmtcy8T
 xjhXr9OfYqp8jcMIZWZ3mQhXH+8/YcuypQEMukwH31BD6H5gID55DaUN4ETllcx1n54F
 Mcr4+h6OLQSTjRqMhYlryUM/IvHcGg0aR9HG3AUudT8wS0qIOz9GvJaCdHPxr20YGAZe
 7GXQ==
X-Gm-Message-State: AC+VfDyPlw3Lvbd+m/b+zN9VEByxp7SeB11KrDksCUIpTjF0QkqpisKU
 mZVDYoxFEHNv3JdLM91Eia3RpA==
X-Google-Smtp-Source: ACHHUZ4Yth2SAVNi+Eug5CJ7mED480E+0pZkEVoxH2yZS/EH5piYwWMVhulX5pbYglTdS2y1CwboTQ==
X-Received: by 2002:a2e:2417:0:b0:2aa:3cee:c174 with SMTP id
 k23-20020a2e2417000000b002aa3ceec174mr887376ljk.13.1684502963335; 
 Fri, 19 May 2023 06:29:23 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:10 +0200
Subject: [PATCH v2 5/6] drm/msm/a6xx: Improve GMU force shutdown sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-5-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=999;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tIqOHRwnY5c8M0EJh8c6iF51VO5nfDTSDxvclL4zDow=;
 b=KYPo2qeuYKLdvjj9oKoR1uGIGtpjAhcYDxd18dm3Lwi5iPiyTSKITY8bEUzM2vOEEa3w8ByAg
 sTMUWlNlnzwBn7Mt3wFvyNRhmol24Y9mXySPWHFi9n360y5ZUZIDaAF
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMU force shutdown sequence involves some additional register cleanup
which was not implemented previously. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ea6d671e7c6c..8004b582e45f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -930,6 +930,13 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
 
+	/* Clear the WRITEDROPPED fields and put fence into allow mode */
+	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, 0x7);
+	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+
+	/* Make sure the above writes go through */
+	wmb();
+
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 

-- 
2.40.1

