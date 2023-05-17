Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1528A706E97
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3544610E457;
	Wed, 17 May 2023 16:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20B10E459
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:50:24 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af0f139a22so5011851fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342222; x=1686934222;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CoLKDA4nls3CGbrXvxh61SjvP4v8d9SGkB682PI8Y9w=;
 b=i1dbxqi1eNd4Yl7qbKa/DzCua/Zv8bljh0np7sIKjpbnORXCN9UsIhb5KLwUY+3dBD
 u3QBbSJoeQafLR5qSuG5M56upGulM+buDf5h6zXgu6IJ/+z9q21Pc4Bh06H2v0pzwbhE
 yysaAAtLWODaCtqxXB/SZ4cRvzh51IFPxZCyiECJ9CianawcNL6GfVVPvTqSDkChueop
 sx73h9FNmjFTg9uXTkJr3CFgFEodDdOPEK5UN2HIdTHfxVD6iSTXT3KdPrHm1j8NZHqT
 jEUZzg3jTxcRCBziiaA3RJUytD4cQN0zjblIst5AZJQCrV4VLjV+Ma8G2xOLMeoh1+4o
 /4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342222; x=1686934222;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoLKDA4nls3CGbrXvxh61SjvP4v8d9SGkB682PI8Y9w=;
 b=kKyD3FVB/PsLWPhzN9X71Pa9+jOf/q6Bs2G67A9+nBTd7LtL5CBfk66LG31ZN9SFOy
 FpdGejFp9qYnVNOVhbitkn33bbtyR0leILSXdCpJM5kJG2yhsJxrgcD5ErJ7H1WMNWVQ
 5Ur+feNcTxePimp6KstlNhe96DT2Eeq0lXxKnHWsCfLDzc8BOsQsgn6ex7Y20hrnqCpz
 t7s0F6uFHnR+Zf88pxHf8pFMh94yYBN6w0VL/6X18niVTWCrMuxhelq4TAj7F2Zq63n7
 W1qFNs3boo7YNs/0cijJMKovANQNfNX73CxZyErK6lrUeWG2Xe1q0C0r26m1nduQTflP
 EzwA==
X-Gm-Message-State: AC+VfDxCWghUIKYIlC43JthSId9pM0jj37a2smtoFI4NDJakKh4fX+7j
 egmv9XkVQSO9j+a2KMwOhUSV0w==
X-Google-Smtp-Source: ACHHUZ4jLbe6d4GH4iLPsue2yFWhS8POeGWQvmRFqujlYCuVRms6eu9CsVJJf+zBSskasB3XfoOD2w==
X-Received: by 2002:a2e:a408:0:b0:2ac:6f6f:ff63 with SMTP id
 p8-20020a2ea408000000b002ac6f6fff63mr11229311ljn.47.1684342222724; 
 Wed, 17 May 2023 09:50:22 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:50:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 May 2023 18:50:13 +0200
Subject: [PATCH 6/6] drm/msm/a6xx: Fix up GMU region reservations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v1-6-7a964f2e99c2@linaro.org>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=1342;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=btUFgb1HmX4JzaeMKMcU2R1/tETWRJTF/5M21P54ufE=;
 b=2iOzY8M2I2x7twxabI/OJXdaVxfB9SkZvzqmhiZsOvaZVWXV/x0sZHjUtqXXsmMTWRk4wRQQM
 64+sM1IyjWSAs6uhXWBqPJWO2gwmSn1SumxzfMpgnd2I0KV4SOOH3kn
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the order of region allocations to make the addresses match
downstream. This shouldn't matter very much, but helps eliminate one
more difference when comparing register accesses.

Also, make the log region 16K long. That's what it is, unconditionally
on A6xx and A7xx.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8004b582e45f..386c81e1a2f3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1614,13 +1614,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_memory;
 	}
 
-	/* Allocate memory for for the HFI queues */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
+	/* Allocate memory for the GMU log region */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_16K, 0, "log");
 	if (ret)
 		goto err_memory;
 
-	/* Allocate memory for the GMU log region */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0, "log");
+	/* Allocate memory for for the HFI queues */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
 	if (ret)
 		goto err_memory;
 

-- 
2.40.1

