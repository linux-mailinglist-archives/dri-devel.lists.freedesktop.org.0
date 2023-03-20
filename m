Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536576C1534
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDB810E1CA;
	Mon, 20 Mar 2023 14:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5B710E5BE;
 Mon, 20 Mar 2023 14:45:03 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 j3-20020a17090adc8300b0023d09aea4a6so16728138pjv.5; 
 Mon, 20 Mar 2023 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRudoYKJ/9RBEgJ+2j3GsDNIAjaLf24fOR0Git+DXzM=;
 b=FSiCBrQqb/DttiCvh4W10nxnr4IwYmxqhvZrOxgMDQkWUirVLq87/u2vJrBad/daDh
 qw++XRKpNrVXUMtZedrPPKhpDSyZukdY/4ufBj5U2makZ08JuIbMHnJSOiC4xm1bzrjS
 HzPLQJOPxkS0Er/frUYuRF9+wzmCTAdEXPRxpH9m4E1e4+TSidc5nWZdbGAXgA9UJObW
 LQ8eG98up+TO8k88KCpl5YaCgqinGhFAOq+NXZiPa6fHGsmnWtfhPJltAZ0vlG4R9Kn2
 hJvQqOIM1WcqtU43N+oX6hFcHJ9/IKX54VNK/yLNmLJEvxRuIOe1TvBoZvweJE5xupP+
 mKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRudoYKJ/9RBEgJ+2j3GsDNIAjaLf24fOR0Git+DXzM=;
 b=6hhR2p4ntZM+QJj5k7sHiFEwLitcBnbETJL768RtWJQH252QBNbRbUQafTHVH+D7jU
 YRl7JCg1wqpyKPPpuG1L2EYCoqgH+tvkxT/GtVkzJm0GlWxy0KEXc3XC3UCPvw6ccoBa
 LRMxxuxKDMBPYLm4DAr+ctwrIdrGm6Hb+ksxdf9BmJx86B1MyTwn5alcKAQMs4kg4S4M
 LCoLoXEPgKTwVaD6ODQqe4yLC5e4WS4h9F2kg1pxRo6nodQk19Kj8to5dmD7lVuLow5x
 ceGt8v/Pz6I9cL+7Hoer/ymVtRvq0g2CyTp5F8R3g+6TPJD8+wjfb8sPwFq92ES3GO8g
 3SSA==
X-Gm-Message-State: AO0yUKW/5JC9pRy3KS0zERneZjMzjq2dAGc+/odbGEzEvhVNsGB+jxKr
 +RfFpL5dFDg6YBqt5RGSEPx0EWB0lbo=
X-Google-Smtp-Source: AK7set9ulfPXo9jK6KpDY96RxgLMtzdpXoEn31dcDtWIB8HP/mch1ngRHsDe2j2Y+tM8AsYX9Ahm6g==
X-Received: by 2002:a17:902:e5c3:b0:19e:7d67:84e6 with SMTP id
 u3-20020a170902e5c300b0019e7d6784e6mr21119604plf.0.1679323502456; 
 Mon, 20 Mar 2023 07:45:02 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b0019aa5528a5csm6793088plb.144.2023.03.20.07.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/23] drm/msm/a6xx: Move ioremap out of hw_init path
Date: Mon, 20 Mar 2023 07:43:36 -0700
Message-Id: <20230320144356.803762-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Move the one-time RPMh setup to a6xx_gmu_init().  To get rid of the hack
for one-time init vs start, add in an extra a6xx_rpmh_stop() at the end
of the init sequence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f3c9600221d4..30a1bf39ea83 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -621,6 +621,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
 
+	a6xx_rpmh_stop(gmu);
+
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
 		iounmap(pdcptr);
@@ -753,7 +755,6 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 
 static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 {
-	static bool rpmh_init;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int ret;
@@ -776,15 +777,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		/* Turn on register retention */
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-		/* We only need to load the RPMh microcode once */
-		if (!rpmh_init) {
-			a6xx_gmu_rpmh_init(gmu);
-			rpmh_init = true;
-		} else {
-			ret = a6xx_rpmh_start(gmu);
-			if (ret)
-				return ret;
-		}
+		ret = a6xx_rpmh_start(gmu);
+		if (ret)
+			return ret;
 
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
@@ -1633,6 +1628,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Set up the HFI queues */
 	a6xx_hfi_init(gmu);
 
+	/* Initialize RPMh */
+	a6xx_gmu_rpmh_init(gmu);
+
 	gmu->initialized = true;
 
 	return 0;
-- 
2.39.2

