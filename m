Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9721A4CAB98
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F6010EEEB;
	Wed,  2 Mar 2022 17:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF010EEEA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:28:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1646242084; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=odXa6b5fU8MQd02N9WcX5w0ikkxNFvzlNrIqygo8Kz0=;
 b=DRzdh5+sHp5UcnCcP6iB7b8Rk3ZF8nGkMZcCUSR3OL7Eu71fg/X86dlrx7FDRONpmWZieh3p
 YyoGRXcfHE2fOX3eDCjDH3W4SA/dc6K6dgAab9Be45BuTZQWmjOOr6uav/UzTHrj4uBbQWOr
 RYCMJyS9+7EttYJc99vDFfCYAJY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 621fa923e1c212bb9c1eeec9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Mar 2022 17:28:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48833C43619; Wed,  2 Mar 2022 17:28:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DA49DC43617;
 Wed,  2 Mar 2022 17:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DA49DC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v1 02/10] drm/msm/a6xx: Send NMI to gmu when it is hung
Date: Wed,  2 Mar 2022 22:57:28 +0530
Message-Id: <20220302225551.v1.2.Icda301aa85f1e4367601fa9b830b3365d377e669@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646242056-2456-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1646242056-2456-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Wang Qing <wangqing@vivo.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While capturing gmu state, first send an NMI to gmu when it is hung.
This helps to move gmu to a safe state.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 37 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 14 ++++++++++-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3e325e2..f208a81 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -14,6 +14,37 @@
 #include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
+void a6xx_gmu_send_nmi(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 val;
+
+	if (a6xx_gmu_gx_is_on(gmu) && a6xx_is_smmu_stalled(gpu)) {
+		DRM_DEV_ERROR(gmu->dev,
+				"Skipping GMU NMI since SMMU is stalled\n");
+	}
+
+	/* Don't retrigger NMI if gmu reset is already active */
+	val = gmu_read(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT);
+	if (val & 0xE00)
+		return;
+
+	/* Mask all interrupts from GMU first */
+	gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_MASK, 0xFFFFFFFF);
+
+	/* Trigger NMI to make gmu save it's internal state to ddr */
+	val = gmu_read(gmu, REG_A6XX_GMU_CM3_CFG);
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, val | BIT(9));
+
+	/* Barrier to ensure write is posted before we proceed */
+	wmb();
+
+	/* Small delay to ensure state copy is ddr is complete at GMU */
+	udelay(200);
+}
+
 static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -790,6 +821,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, 0);
 	gmu_write(gmu, REG_A6XX_GMU_CM3_BOOT_CONFIG, 0x02);
 
+	/*
+	 * Make sure that the NMI bit is cleared by configuring the reset value
+	 * here
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	/* Write the iova of the HFI table */
 	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_ADDR, gmu->hfi.iova);
 	gmu_write(gmu, REG_A6XX_GMU_HFI_QTBL_INFO, 1);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 84bd516..4228ec1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -186,5 +186,6 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_gmu_send_nmi(struct a6xx_gmu *gmu);
 
 #endif
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7de9d2f..09b2ff0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -964,6 +964,18 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	a6xx_state->nr_indexed_regs = count;
 }
 
+void a6xx_get_gmu_state(struct msm_gpu *gpu, struct a6xx_gpu_state *a6xx_state)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+
+	if (gmu->hung)
+		a6xx_gmu_send_nmi(gmu);
+
+	a6xx_get_gmu_registers(gpu, a6xx_state);
+}
+
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 {
 	struct a6xx_crashdumper _dumper = { 0 }, *dumper = NULL;
@@ -980,7 +992,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the generic state from the adreno core */
 	adreno_gpu_state_get(gpu, &a6xx_state->base);
 
-	a6xx_get_gmu_registers(gpu, a6xx_state);
+	a6xx_get_gmu_state(gpu, a6xx_state);
 
 	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
 	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
-- 
2.7.4

