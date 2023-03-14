Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058796B992D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B229010E84E;
	Tue, 14 Mar 2023 15:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A197D10E83C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:48 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h9so16424300ljq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=St31qEiBWKoRteqqRq8R4XXaVrODiETBsusFnrIXDy0=;
 b=GzXSp7KSnCAoQGOyLE8PUdsR6qJiFoVrOSNzF8GVBiP4WVV9GNKn2BgH6cSjbjmG+X
 OKtxmT/OfjcdsRsc05JjD0UunbXdOayz8v4uIst4y7fVa6f4CB1Gbw80m2OGRvrOKmlm
 K1aJaYGpdv6tjcx3ua5g+5OxTymuIT6v1D3BXXheCaXhhAs2zNnkx8Fcxeby9V128g7Y
 4OgpjitS/jvzZWETPdNtNsU9Int03mj3kKgoIy9BGLYNJhq9It3BP7wguOeJm88h5NK1
 gJuK1ZHHah+50B5eEU697A04oUY4JLeKlkNx4kDHpOi54vz9fHqJSb6b8NR34sVAw7rI
 57Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=St31qEiBWKoRteqqRq8R4XXaVrODiETBsusFnrIXDy0=;
 b=bOzAZNhX4F5lVWLiVmoDEyvv1qhkbAQ/83Iq0q/tT1waeyJ+MPII6czaW67q5aOo9H
 RXbRANxUT58FlM6G3j0JFxbj/MTjWMDocK/NRCeLqISwy/Zu9reyrKgLIL40B35J7vuS
 FFBVT5w1D0QJxNU+jc6g/YfQCt7zw+AbuGjVTnGPnMgVEHJaVMUdwN8VSvQ9qmhMdNHD
 94fFwNAAZFoCLrAMr+wqEzv7zgwvkz2Eprcuooa9abxG6bx309D1OVkZqGSbLdr/eBww
 Rv8Uzhjv5UYM3UzifPpWlcJZtaxRtmsfrgIbXEOz6Gr91/byvx2zzKmrzhpVDDQKirZp
 7KbQ==
X-Gm-Message-State: AO0yUKW8WWQxMdrb9v2XcAHQplEpzO0JxVY8Fu2iNzBRFwr37uh+eMQp
 QNfks5+5bzf5TZ/7ACPOP9KFuQ==
X-Google-Smtp-Source: AK7set9aVoQz7CWVxU+uRbCphW8bPppOo+AKeDooiOWl7Wo4iFpwUaGKYHwyyyslqzjpmXWspQ3lMA==
X-Received: by 2002:a2e:7804:0:b0:295:b3df:4942 with SMTP id
 t4-20020a2e7804000000b00295b3df4942mr11344510ljc.40.1678807726789; 
 Tue, 14 Mar 2023 08:28:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:36 +0100
Subject: [PATCH v4 05/14] drm/msm/a6xx: Introduce GMU wrapper support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-5-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=19221;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jpS8eOVezzz/F28mXHuOAM+A63HkjMpcKU5ZfGuiRds=;
 b=WrvnUl6YG5UiNc2LVPjd+AW0IU8Q7/F9SncvXEXLDYcONd1ve9ty8IOfblApWmKrmOBPyY5s/Tm9
 G2wdbZcJBOGLWdKNqdA2EvkGOSjJfPp2H306zT93nI6q09vSGqSw
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

Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
but don't implement the associated GMUs. This is due to the fact that
the GMU directly pokes at RPMh. Sadly, this means we have to take care
of enabling & scaling power rails, clocks and bandwidth ourselves.

Reuse existing Adreno-common code and modify the deeply-GMU-infused
A6XX code to facilitate these GPUs. This involves if-ing out lots
of GMU callbacks and introducing a new type of GMU - GMU wrapper (it's
the actual name that Qualcomm uses in their downstream kernels).

This is essentially a register region which is convenient to model
as a device. We'll use it for managing the GDSCs. The register
layout matches the actual GMU_CX/GX regions on the "real GMU" devices
and lets us reuse quite a bit of gmu_read/write/rmw calls.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  53 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 244 +++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
 5 files changed, 282 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 229a54ec82b4..4ba059157177 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1474,6 +1474,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 
@@ -1493,10 +1494,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->mmio = NULL;
 	gmu->rscc = NULL;
 
-	a6xx_gmu_memory_free(gmu);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		a6xx_gmu_memory_free(gmu);
 
-	free_irq(gmu->gmu_irq, gmu);
-	free_irq(gmu->hfi_irq, gmu);
+		free_irq(gmu->gmu_irq, gmu);
+		free_irq(gmu->hfi_irq, gmu);
+	}
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
@@ -1504,6 +1507,50 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->initialized = false;
 }
 
+int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+{
+	struct platform_device *pdev = of_find_device_by_node(node);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int ret;
+
+	if (!pdev)
+		return -ENODEV;
+
+	gmu->dev = &pdev->dev;
+
+	of_dma_configure(gmu->dev, node, true);
+
+	pm_runtime_enable(gmu->dev);
+
+	/* Mark legacy for manual SPTPRAC control */
+	gmu->legacy = true;
+
+	/* Map the GMU registers */
+	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
+	if (IS_ERR(gmu->mmio)) {
+		ret = PTR_ERR(gmu->mmio);
+		goto err_mmio;
+	}
+
+	/* Get a link to the GX power domain to reset the GPU */
+	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
+	if (IS_ERR(gmu->gxpd))
+		goto err_mmio;
+
+	gmu->initialized = true;
+
+	return 0;
+
+err_mmio:
+	iounmap(gmu->mmio);
+	ret = -ENODEV;
+
+	/* Drop reference taken in of_find_device_by_node */
+	put_device(gmu->dev);
+
+	return ret;
+}
+
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2f55dac52833..a90847a3379a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -20,9 +20,11 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
-	/* Check that the GMU is idle */
-	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
-		return false;
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Check that the GMU is idle */
+		if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
+			return false;
+	}
 
 	/* Check tha the CX master is idle */
 	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS) &
@@ -612,13 +614,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
 }
@@ -1002,10 +1006,13 @@ static int hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	int ret;
 
-	/* Make sure the GMU keeps the GPU on while we set it up */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Make sure the GMU keeps the GPU on while we set it up */
+		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
 	if (a6xx_has_gbif(adreno_gpu))
@@ -1131,6 +1138,17 @@ static int hw_init(struct msm_gpu *gpu)
 			0x3f0243f0);
 	}
 
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Do it here, as GMU wrapper only inits the GMU for memory reservation etc. */
+
+		/* Set up the CX GMU counter 0 to count busy ticks */
+		gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
+
+		/* Enable power counter 0 */
+		gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
+		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
+	}
+
 	/* Protect registers from the CP */
 	a6xx_set_cp_protect(gpu);
 
@@ -1239,6 +1257,8 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 out:
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return ret;
 	/*
 	 * Tell the GMU that we are done touching the GPU and it can start power
 	 * management
@@ -1273,6 +1293,9 @@ static void a6xx_dump(struct msm_gpu *gpu)
 	adreno_dump(gpu);
 }
 
+#define GBIF_GX_HALT_MASK	BIT(0)
+#define GBIF_CLIENT_HALT_MASK	BIT(0)
+#define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
 #define VBIF_RESET_ACK_MASK	0x00f0
 
@@ -1304,7 +1327,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 * Turn off keep alive that might have been enabled by the hang
 	 * interrupt
 	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
@@ -1328,6 +1352,35 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* Call into gpucc driver to poll for cx gdsc collapse */
 	reset_control_reset(gpu->cx_collapse);
 
+	/* Software-reset the GPU */
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		/* Halt the GX side of GBIF */
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
+		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
+			   GBIF_GX_HALT_MASK);
+
+		/* Halt new client requests on GBIF */
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
+		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			   (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
+
+		/* Halt all AXI requests on GBIF */
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
+		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			   (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
+
+		/* Clear the halts */
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+
+		if (adreno_is_a619_holi(adreno_gpu))
+			gpu_write(gpu, 0x18, 0);
+		else
+			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+
+		/* This *really* needs to go through before we do anything else! */
+		mb();
+	}
+
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
 	if (active_submits)
@@ -1512,7 +1565,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	 * Force the GPU to stay on until after we finish
 	 * collecting information
 	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
 
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
@@ -1673,7 +1727,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
-static int a6xx_pm_resume(struct msm_gpu *gpu)
+static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -1693,10 +1747,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	a6xx_llc_activate(a6xx_gpu);
 
-	return 0;
+	return ret;
 }
 
-static int a6xx_pm_suspend(struct msm_gpu *gpu)
+static int a6xx_pm_resume(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	int ret;
+
+	gpu->needs_hw_init = true;
+
+	trace_msm_gpu_resume(0);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+
+	pm_runtime_resume_and_get(gmu->dev);
+	pm_runtime_resume_and_get(gmu->gxpd);
+
+	/* Set the core clock, having VDD scaling in mind */
+	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
+	if (ret)
+		goto err;
+
+	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
+	if (ret)
+		goto err;
+
+	ret = clk_prepare_enable(gpu->ebi1_clk);
+	if (ret)
+		goto err;
+
+err:
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	if (!ret)
+		msm_devfreq_resume(gpu);
+
+	return ret;
+}
+
+static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -1723,11 +1815,62 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
+static int a6xx_pm_suspend(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned long freq = 0;
+	struct dev_pm_opp *opp;
+	int i, ret;
+
+	trace_msm_gpu_suspend(0);
+
+	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
+	dev_pm_opp_put(opp);
+
+	msm_devfreq_suspend(gpu);
+
+	mutex_lock(&a6xx_gpu->gmu.lock);
+
+	clk_disable_unprepare(gpu->ebi1_clk);
+
+	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
+
+	/* Set frequency to the minimum supported level (no 27MHz on A6xx!) */
+	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, freq);
+	if (ret)
+		goto err;
+
+	pm_runtime_put_sync(gmu->gxpd);
+	pm_runtime_put_sync(gmu->dev);
+
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	if (a6xx_gpu->shadow_bo)
+		for (i = 0; i < gpu->nr_rings; i++)
+			a6xx_gpu->shadow[i] = 0;
+
+	gpu->suspend_count++;
+
+	return 0;
+
+err:
+	mutex_unlock(&a6xx_gpu->gmu.lock);
+
+	return ret;
+}
+
 static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
+	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO);
+		return 0;
+	}
+
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Force the GPU power on so we can read this register */
@@ -1765,7 +1908,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a6xx_gpu->shadow_bo);
 	}
 
-	a6xx_llc_slices_destroy(a6xx_gpu);
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		a6xx_llc_slices_destroy(a6xx_gpu);
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
 	a6xx_gmu_remove(a6xx_gpu);
@@ -2005,8 +2149,8 @@ static const struct adreno_gpu_funcs funcs = {
 		.get_param = adreno_get_param,
 		.set_param = adreno_set_param,
 		.hw_init = a6xx_hw_init,
-		.pm_suspend = a6xx_pm_suspend,
-		.pm_resume = a6xx_pm_resume,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
 		.recover = a6xx_recover,
 		.submit = a6xx_submit,
 		.active_ring = a6xx_active_ring,
@@ -2030,6 +2174,34 @@ static const struct adreno_gpu_funcs funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 };
 
+static const struct adreno_gpu_funcs funcs_gmuwrapper = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.pm_suspend = a6xx_pm_suspend,
+		.pm_resume = a6xx_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_address_space = a6xx_create_address_space,
+		.create_private_address_space = a6xx_create_private_address_space,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.get_timestamp = a6xx_get_timestamp,
+};
+
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -2051,18 +2223,36 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = NULL;
 
+	/* Check if there is a GMU phandle and set it up */
+	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	/* FIXME: How do we gracefully handle this? */
+	BUG_ON(!node);
+
+	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
+
 	/*
 	 * We need to know the platform type before calling into adreno_gpu_init
 	 * so that the hw_apriv flag can be correctly set. Snoop into the info
 	 * and grab the revision number
 	 */
 	info = adreno_info(config->rev);
-
-	if (info && (info->revn == 650 || info->revn == 660 ||
-			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	/* Assign these early so that we can use the is_aXYZ helpers */
+	/* Numeric revision IDs (e.g. 630) */
+	adreno_gpu->revn = info->revn;
+	/* New-style ADRENO_REV()-only */
+	adreno_gpu->rev = info->rev;
+	/* Quirk data */
+	adreno_gpu->info = info;
+
+	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
 		adreno_gpu->base.hw_apriv = true;
 
-	a6xx_llc_slices_init(pdev, a6xx_gpu);
+	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
+	if (!adreno_has_gmu_wrapper(adreno_gpu))
+		a6xx_llc_slices_init(pdev, a6xx_gpu);
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
 	if (ret) {
@@ -2070,7 +2260,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
+	else
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -2083,13 +2276,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		priv->gpu_clamp_to_idle = true;
 
-	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
-
-	/* FIXME: How do we gracefully handle this? */
-	BUG_ON(!node);
-
-	ret = a6xx_gmu_init(a6xx_gpu, node);
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
+	else
+		ret = a6xx_gmu_init(a6xx_gpu, node);
 	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eea2e60ce3b7..51a7656072fa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
+int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b7e217d00a22..e11e8a02ac22 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the generic state from the adreno core */
 	adreno_gpu_state_get(gpu, &a6xx_state->base);
 
-	a6xx_get_gmu_registers(gpu, a6xx_state);
+	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+		a6xx_get_gmu_registers(gpu, a6xx_state);
 
-	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
-	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
-	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
+		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
+		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
+		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
 
-	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
+		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
+	}
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
-	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
 
 	/* Get the banks of indexed registers */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b4f9b1343d63..2c0f0ef094cb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -115,6 +115,7 @@ struct adreno_gpu {
 	 * code (a3xx_gpu.c) and stored in this common location.
 	 */
 	const unsigned int *reg_offsets;
+	bool gmu_is_wrapper;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 
@@ -145,6 +146,11 @@ struct adreno_platform_config {
 
 bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
+static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
+{
+	return gpu->gmu_is_wrapper;
+}
+
 static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
 {
 	return (gpu->revn < 300);

-- 
2.39.2

