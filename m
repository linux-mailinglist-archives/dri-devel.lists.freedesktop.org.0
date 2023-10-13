Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C27C912E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 01:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340E10E07D;
	Fri, 13 Oct 2023 23:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8B210E07A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 23:07:59 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so3380485e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697238478; x=1697843278; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ntpWA0KpoWbL2Mip0SNW/VcCmMEOAdpN3Qpqu/MvN+k=;
 b=IxOj7CLgThdJyk+HByJFf/wtHtgmjnQKdMchSfLvp/PNTFxP7vCLVAKLwIf8OoUvVF
 /8RBfWroOcYAjA/w+JmTxA6wbIKWhxaM345EGnC0UBdmmoZ4hnD/k5z1fNBcz7tkyiyh
 DyLn76QAyWQTfQD3585I9mkMUEASTfqtJEilmNzPda9QR/G8OrOAUJREhgznsCqVuSAK
 qmnScD0VhezfdEoftHHqwJT4K8Qn8HC9UopH1QtJ2+4qEkrX4Nn3vgI5NtvVf2lgymFt
 h9PnAM6VdkN+SBpBlEUOsE41+4EUol3SjK2eN78FHhmVMHtynZ5A7zuC22vmcaQmiw2y
 2P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697238478; x=1697843278;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ntpWA0KpoWbL2Mip0SNW/VcCmMEOAdpN3Qpqu/MvN+k=;
 b=Tua1zF3d83yGz4ocijy4ak7H2XaNsIxQqKUHQk0G3+wHJxqki5TxIwUioTJ8NO1qaQ
 difaN5ai7aGciLodJXIvmJOQe+/te+Qsyuw0+mUL50iz0wmYo3q3EVE5UVD6DyPGKKt4
 IjFxnYAOn7sueJ1qjz0ZumW8MowmYA9/gbf6Z8Y+HcQmBhjWLfdZebTPG69axwat8uzS
 zM4ng9DyxyCXmfOHVWK1uNzLbraD0ZRHN8rnwqm9ElGcUMYdvByPuXnPV0Q0ImYJn3FW
 RrNo+avf6S9ZOTcztxKlkj4GQZgQEFGrkWSf1jMQz2U7qh+zwQ+NIBQz2i6jIkWfLq3I
 qC4Q==
X-Gm-Message-State: AOJu0YzPM6aDJhiWhDf3MX50ssUsNpiUFFs/OffUSgQhaWNZlBIwsbfF
 hJIvLIU3NCpqnj/3Q/SmPomcIg==
X-Google-Smtp-Source: AGHT+IEJMwBj1J0JzYtqJnElPMCb2Qn7Ch45pieeJc7RnMmM9cj9AkGLOPOfCuprWfC3Xg3v4+RMlA==
X-Received: by 2002:a05:6512:1246:b0:500:9839:b13a with SMTP id
 fb6-20020a056512124600b005009839b13amr30206505lfb.66.1697238477814; 
 Fri, 13 Oct 2023 16:07:57 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177169.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.169])
 by smtp.gmail.com with ESMTPSA id
 u13-20020ac248ad000000b00504818fcb07sm3553202lfg.266.2023.10.13.16.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 16:07:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 14 Oct 2023 01:07:46 +0200
Subject: [PATCH] drm/msm/a6xx: Fix up QMP handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231014-topic-a7xxv3-v1-1-616bc95f21ce@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMHNKWUC/x2N0QqDMAwAf0XyvEBTNxR/RfYQ2zgDUqV1UhD/f
 WGPd3DcBUWySoGhuSDLqUW3ZECPBsLC6SOo0Ri88y05euKx7RqQu1rPFqOb2UfqO08vsGTiIjh
 lTmGxKH3X1eSeZdb6f4zv+/4Bzr+H7HMAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697238476; l=2554;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L0RoG9B+wKNyrZ4UA2Vwj13Xo0muadgjIRaCHVUzQ3I=;
 b=0Tz640xtbRU3aIFgDrl3cQRCFtrEfteAL/Yvax+E5GHso3rsWZ6bqFX9Y5eSvxekDoMSTJduI
 Bz7I7UTi6RMAfWwBf2cx/MoFPYBqP+UETorzEdjQS28mwPa60aYQxVG
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit referenced in the Fixes tag had a couple problems (as
pointed out by Dan):

- qmp_put was never called, resulting in refcnt leaks
- failling to acquire the QMP mailbox on A7xx would not undo the probe
  function properly
- the qmp_put call present in the code was unreachable

Fix all of these issues.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 88a0997f2f94 ("drm/msm/a6xx: Send ACD state to QMP at GMU resume")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0555a0134fad..8c4900444b2c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1558,6 +1558,9 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		dev_pm_domain_detach(gmu->gxpd, false);
 	}
 
+	if (!IS_ERR_OR_NULL(gmu->qmp))
+		qmp_put(gmu->qmp);
+
 	iounmap(gmu->mmio);
 	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
 		iounmap(gmu->rscc);
@@ -1654,6 +1657,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = of_find_device_by_node(node);
+	struct device_link *link;
 	int ret;
 
 	if (!pdev)
@@ -1777,15 +1781,17 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
-	if (!device_link_add(gmu->dev, gmu->cxpd,
-					DL_FLAG_PM_RUNTIME)) {
+	link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
+	if (!link) {
 		ret = -ENODEV;
 		goto detach_cxpd;
 	}
 
 	gmu->qmp = qmp_get(gmu->dev);
-	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu))
-		return PTR_ERR(gmu->qmp);
+	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
+		ret = PTR_ERR(gmu->qmp);
+		goto remove_device_link;
+	}
 
 	init_completion(&gmu->pd_gate);
 	complete_all(&gmu->pd_gate);
@@ -1810,8 +1816,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	return 0;
 
-	if (!IS_ERR_OR_NULL(gmu->qmp))
-		qmp_put(gmu->qmp);
+remove_device_link:
+	device_link_del(link);
 
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);

---
base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
change-id: 20231014-topic-a7xxv3-d0fa2d187215

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

