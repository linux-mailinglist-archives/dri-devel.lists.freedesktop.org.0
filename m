Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FDD8C35D2
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 11:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3172F10E0FD;
	Sun, 12 May 2024 09:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HsypAjXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6910E0FD;
 Sun, 12 May 2024 09:04:07 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52327368e59so146182e87.1; 
 Sun, 12 May 2024 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715504645; x=1716109445; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Om7z4z/nZPkmvzc/xv1BUHiiD4wa9VFdhmgBrAsUs88=;
 b=HsypAjXeylkQxPCVRqPNS/XxZmxWxGxoRvSKz+6nq879PsGUTifpe2M5y65P5NcqwA
 A8yHAZttnxQx6a+l8jDtdoUY6ERnnAlLvt8lz2gBWbZYHGjuwD3fzvBSIuO98TeUkU5R
 Uk7aT79yPOU9jp9PN1aNa9+4IlVuQSvPSoZZbM/b4rChizEi+GVkWGpDOlNqPMDWw9kk
 4f04DWZvCtw/+WknhzBKC8onkKUoC9OAian/RMQN/ImQTDg3BAi3aqaQxhFWM8s304oW
 ZWDB4CWaiwTaNH7rZtASmuAOzBZDXcU9CLLrJVS4cXKsyyaYVKlzWPm/yT3F6LfXdQI6
 5Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715504645; x=1716109445;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Om7z4z/nZPkmvzc/xv1BUHiiD4wa9VFdhmgBrAsUs88=;
 b=dCahjNNwTePvu9qyQx8kU8Mb1vfgO0SbBei4axcW1aPCEtvya7xRf/nknx84ms6sWQ
 cNHLXwQPJvtUYNP4Z3/lieHevQPsDS3iJdzduImRy3zX805P9x2Go8npSOETPz0s51yT
 gDiGCWg3HYnGG8E54J6Cq381MuBo+24u64TJuH0gBLcuVEW31LUhLsZetlQVhsfNhLkK
 VDd2z250fgBG8QyWR8CyQC2CbcseE7n6lAaPFgZmkr5k2WCpAY5EedWenO0PuTdGCGOK
 IQulUitFB6zFGGbCduwUStLzeSG4JfBsrAHAZPOv+vjnY+mejmoq6+/xhIWT/KyVe5c0
 z16Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ZZ/pFTA3brYeudBbQ9nA67n1msIJ1Lq0+Ho0blDIUgJLqBnfo1vNAhiFO77wQnnUcBjnXwoNuzlK7m6tX9IgmRQK3Z+J6kqlKWPwyUegV+NK+lbuzetqANsZvorgyRm9CFH4n7qJ5IkwLF+e9B5V
X-Gm-Message-State: AOJu0YzjqbqIim6xCpu+PsDK5Q52ZPg812K7ZZDtAVq7Nasv7YRI5Bo8
 8rJQko5hgyVDeXeOuvZDBXCuOle6UzR7oMxmzVB0+KLw2xJPnsPX
X-Google-Smtp-Source: AGHT+IGmyKXU7smaDw09zDngJdmSsV9gZLDt6vpCR+JOFX7ZIkID5MSda4g1IoGmjVtbcawOzD+2+Q==
X-Received: by 2002:a05:6512:158d:b0:519:5df9:d945 with SMTP id
 2adb3069b0e04-5220fb77429mr6289711e87.4.1715504644872; 
 Sun, 12 May 2024 02:04:04 -0700 (PDT)
Received: from kali.localhost (static.47.50.88.23.clients.your-server.de.
 [23.88.50.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cd9csm431372766b.37.2024.05.12.02.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 02:04:04 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sun, 12 May 2024 05:03:53 -0400
Subject: [PATCH v4] drm/msm/a6xx: request memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPiFQGYC/43NQQ7CIBAF0KsY1o5hBiriynsYF7RMK4m0Bkyja
 Xp30VXjwnT5f+a/mUTmFDiL42YSiceQw9CXoLcb0Vxd3zEEX7IgSVpWiBBzBOcT9wNEjkN6QeK
 ujIDqpsbGVoc9oSjze+I2PL/0+VLyNeRHOf9+GvHTrkBHBARvlDXSoPGaTl104bZrhig+6EhrI
 SqQbZVqNbGprf2F1BKiP5ACCdIZOjivK4lyCc3z/Aa630hMUgEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715504642; l=3699;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=kxKl9BXWLII/5XSxmShz9Co5it81zM/OD7dKzTsMN9M=;
 b=xRPIc85k3y6TGkCNJxSA4BeWf0WJ7DJiAXVEhvBPjZehWCkKoB4l8MM88zzi4HYJcgmofRN/o
 fJ3Zn/CLvVnA27wDoh3NXuF70UpNoRuIhMhYVcitDiqaoBICyaolCZo
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
Changes in v4:
- Combine v3 commits into a singel commit
- Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com

Changes in v3:
- Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.

Changes in v2:
- update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..cf0b3b3d8f34 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -524,9 +524,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
 
-	if (IS_ERR(pdcptr))
-		goto err;
-
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
@@ -540,8 +537,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (!pdc_in_aop) {
 		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
-		if (IS_ERR(seqptr))
-			goto err;
 	}
 
 	/* Disable SDE clock gating */
@@ -633,12 +628,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 	a6xx_rpmh_stop(gmu);
-
-err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
 }
 
 /*
@@ -1503,7 +1492,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1613,13 +1602,11 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
 	}
 
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
-		goto err_mmio;
 	}
 
 	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
@@ -1635,7 +1622,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1631,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1825,9 +1808,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>

