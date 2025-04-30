Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426DAA4A23
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 13:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCD110E742;
	Wed, 30 Apr 2025 11:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XRG4QgrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8549410E73D;
 Wed, 30 Apr 2025 11:35:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 13EAC4516E;
 Wed, 30 Apr 2025 11:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBD7C4CEE9;
 Wed, 30 Apr 2025 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746012906;
 bh=LHZnKYex6dp3WNbtjSac96l2EBFyL8TSY4xUGq1SAvE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XRG4QgrYDDqy2pyDvrZxUwkD2x99Mj+xkFm1HRm0bmEc6G35MIYIz24JTtRezUGIi
 id0/QZUCUlucs5RyR+S4U37jeIAG5nS8d98xxXjXANsGxNhQXKw2B7EU1ydlQINj3D
 opfrK7uzyZ4UuewCMOiqnzp0q+hTtMbuFLuhO6tunU/ElLwbIbNEmVAZ+tddKWAUSo
 F20k4Nosu9pQR+4Qry4JtBqUbzF/Sh8315BU42CuLoWcCFc42yH+eGA8pWVy/Bb8eh
 bmFYDNfJ9aTifXXoEb+EGYj1P53OpBc8MgDvKzLqrUWJ5TER6k7Cxkp81ZqLaVzToI
 BxWv/nNE946vQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Apr 2025 13:34:38 +0200
Subject: [PATCH RFT v6 4/5] drm/msm/adreno: Redo the speedbin assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-topic-smem_speedbin_respin-v6-4-954ff66061cf@oss.qualcomm.com>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746012880; l=9709;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MXMEfrafFdHw21/4rMFRCNuIKP/bMWP/Sji0DMRotDc=;
 b=pjpXsv2BUAU2H/AP19P8nny7lZqF5RVQ0EZQ6U2rswYLsvgGs8SAXFqcR8+nzR7T9CgKjlrhE
 FENSo/J/LbqAcOxQGmDRbwM+0cb9RogKH3cljoCqLl+OVFngF0N1ns3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@linaro.org>

There is no need to reinvent the wheel for simple read-match-set logic.

Make speedbin discovery and assignment generation independent.

This implicitly removes the bogus 0x80 / BIT(7) speed bin on A5xx,
which has no representation in hardware whatshowever.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 34 --------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 56 -----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 81 +++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 --
 4 files changed, 71 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..7b9e4292ff53aa608244525063577baae0314abd 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1717,38 +1717,6 @@ static const struct adreno_gpu_funcs funcs = {
 	.get_timestamp = a5xx_get_timestamp,
 };
 
-static void check_speed_bin(struct device *dev)
-{
-	struct nvmem_cell *cell;
-	u32 val;
-
-	/*
-	 * If the OPP table specifies a opp-supported-hw property then we have
-	 * to set something with dev_pm_opp_set_supported_hw() or the table
-	 * doesn't get populated so pick an arbitrary value that should
-	 * ensure the default frequencies are selected but not conflict with any
-	 * actual bins
-	 */
-	val = 0x80;
-
-	cell = nvmem_cell_get(dev, "speed_bin");
-
-	if (!IS_ERR(cell)) {
-		void *buf = nvmem_cell_read(cell, NULL);
-
-		if (!IS_ERR(buf)) {
-			u8 bin = *((u8 *) buf);
-
-			val = (1 << bin);
-			kfree(buf);
-		}
-
-		nvmem_cell_put(cell);
-	}
-
-	devm_pm_opp_set_supported_hw(dev, &val, 1);
-}
-
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -1771,8 +1739,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	a5xx_gpu->lm_leakage = 0x4E001A;
 
-	check_speed_bin(&pdev->dev);
-
 	nr_rings = 4;
 
 	if (config->info->revn == 510)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0db57e4b7596b01c091ed82510cf14cf2a8e0d03..ac6a8acceffc5b5ea0262c8ba49d5774f03894d8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2316,55 +2316,6 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
-static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
-{
-	if (!info->speedbins)
-		return UINT_MAX;
-
-	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++)
-		if (info->speedbins[i].fuse == fuse)
-			return BIT(info->speedbins[i].speedbin);
-
-	return UINT_MAX;
-}
-
-static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
-				 struct device *dev,
-				 const struct adreno_info *info)
-{
-	u32 supp_hw;
-	u32 speedbin;
-	int ret;
-
-	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
-	/*
-	 * -ENOENT/EOPNOTSUPP means that the platform doesn't support speedbin
-	 * which is fine
-	 */
-	if (ret == -ENOENT || ret == -EOPNOTSUPP) {
-		return 0;
-	} else if (ret) {
-		dev_err_probe(dev, ret,
-			      "failed to read speed-bin. Some OPPs may not be supported by hardware\n");
-		return ret;
-	}
-
-	supp_hw = fuse_to_supp_hw(info, speedbin);
-
-	if (supp_hw == UINT_MAX) {
-		DRM_DEV_ERROR(dev,
-			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-			speedbin);
-		supp_hw = BIT(0); /* Default */
-	}
-
-	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -2497,13 +2448,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
-	if (ret) {
-		a6xx_llc_slices_destroy(a6xx_gpu);
-		kfree(a6xx_gpu);
-		return ERR_PTR(ret);
-	}
-
 	if ((enable_preemption == 1) || (enable_preemption == -1 &&
 	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b0ec64e9a35591507f26e16b4ef60ec874dafe12..339e210db06398eae88f425574e684ea5b5ad68b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1093,13 +1093,13 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 			   adreno_ocmem->hdl);
 }
 
-int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
-			 struct device *dev, u32 *fuse)
+static int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+				struct device *dev, u32 *fuse)
 {
 	int ret;
 
 	/*
-	 * Try reading the speedbin via a nvmem cell first
+	 * Try reading the speedbin via a nvmem cell first.
 	 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
 	 * "nvmem fuse is irrelevant", simply assume it's fine.
 	 */
@@ -1114,8 +1114,7 @@ int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
 
 	/*
 	 * Only check the feature code - the product code only matters for
-	 * proto SoCs unavailable outside Qualcomm labs, as far as GPU bin
-	 * matching is concerned.
+	 * prototype SoCs, as far as GPU bin matching is concerned.
 	 *
 	 * Ignore EOPNOTSUPP, as not all SoCs expose this info through SMEM.
 	 */
@@ -1126,7 +1125,70 @@ int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
 		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
 #endif
 
-	return ret;
+	return 0;
+}
+
+#define ADRENO_SPEEDBIN_FUSE_NODATA	0xFFFF /* Made-up large value, expected by mesa */
+static int adreno_set_speedbin(struct adreno_gpu *adreno_gpu, struct device *dev)
+{
+	const struct adreno_info *info = adreno_gpu->info;
+	u32 fuse = ADRENO_SPEEDBIN_FUSE_NODATA;
+	u32 supp_hw = UINT_MAX;
+	int ret;
+
+	/* No speedbins defined for this GPU SKU => allow all defined OPPs. */
+	if (!info->speedbins) {
+		/*
+		 * Due to OPP framework's safety assumptions, the speedbin data
+		 * must be defined either in both the driver catalog and DT, or
+		 * in neither.
+		 *
+		 * This means that having a too old DT (with no opp-supported-hw)
+		 * or a "too new" one (with opp-supported-hw, but the kernel not
+		 * having the fuse matching tables) becomes a problem.
+		 *
+		 * We can only work around one of these at a time, so choose the
+		 * more real issue of outdated DT and skip setting compatibility
+		 * constraints so as not to trip off any alarms in _opp_is_supported()
+		 */
+		adreno_gpu->speedbin = ADRENO_SPEEDBIN_FUSE_NODATA;
+
+		return 0;
+	}
+
+	/*
+	 * If a real error (not counting older devicetrees having no nvmem references)
+	 * occurs when trying to get the fuse value, bail out.
+	 */
+	ret = adreno_read_speedbin(adreno_gpu, dev, &fuse);
+	if (ret) {
+		return ret;
+	} else if (fuse == ADRENO_SPEEDBIN_FUSE_NODATA) {
+		/* The info struct has speedbin data, but the DT doesn't => allow all OPPs */
+		DRM_DEV_INFO(dev, "No GPU speed bin fuse, please update your device tree\n");
+
+		/*
+		 * In this case, the DT doesn't point us to speedbin info.
+		 * We can then assume the opp-supported-hw properties are missing as well,
+		 * as having one in place but not the other would be rather invalid anyway.
+		 *
+		 * We're not calling set_supported_hw(ALLOW_ALL_OPPS) here, as OPP APIs
+		 * would then still expect opp-supported-hw, which we may lack
+		 */
+		return 0;
+	}
+
+	adreno_gpu->speedbin = fuse;
+
+	/* Traverse the known speedbins */
+	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++) {
+		if (info->speedbins[i].fuse == fuse) {
+			supp_hw = BIT(info->speedbins[i].speedbin);
+			return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+		}
+	}
+
+	return dev_err_probe(dev, -EINVAL, "Unknown speed bin fuse value: 0x%x\n", fuse);
 }
 
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
@@ -1138,7 +1200,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	const char *gpu_name;
-	u32 speedbin;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
@@ -1166,9 +1227,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			devm_pm_opp_set_clkname(dev, "core");
 	}
 
-	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
-		speedbin = 0xffff;
-	adreno_gpu->speedbin = speedbin;
+	ret = adreno_set_speedbin(adreno_gpu, dev);
+	if (ret)
+		return ret;
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 3946b9e992b9a8e2fd81f3e03354f9f83717b270..bc46ed5608cd3f5c05142826a03b97d5cdab9eff 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -638,9 +638,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
-int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
-			 struct device *dev, u32 *speedbin);
-
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode

-- 
2.49.0

