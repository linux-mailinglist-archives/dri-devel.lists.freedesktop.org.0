Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEF56A79B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 18:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430111B2FE;
	Thu,  7 Jul 2022 16:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3782811B2B8;
 Thu,  7 Jul 2022 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657210324; x=1688746324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=tyYbr5uLnIZqK1l6rPe9Mu0A10ziMjsV8DX7LsaWdio=;
 b=JtYK6GcL9TjMzGrTJaJR082vUL3ef1NLgWCgahLXilSC5CczuAqEtCnz
 PSLObg0G+NDfiuRESPCWusDrUkyAoOK4zNPxMb4wyFi70wkyqMRsTt04P
 u+ByB5tphjMBNRChEPiHKbw+hpz22Ai94Me4QI224P+4p0NtLOUriOsZD k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jul 2022 09:12:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 09:12:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:12:02 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:11:56 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 6/7] drm/msm/a6xx: Improve gpu recovery sequence
Date: Thu, 7 Jul 2022 21:41:01 +0530
Message-ID: <20220707213950.6.Idf2ba51078e87ae7ceb75cc77a5bd4ff2bd31eab@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Wang Qing <wangqing@vivo.com>,
 David Airlie <airlied@linux.ie>, Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can do a few more things to improve our chance at a successful gpu
recovery, especially during a hangcheck timeout:
1. Halt CP and GMU core
2. Do RBBM GBIF HALT sequence
3. Do a soft reset of GPU core

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx.xml.h |  4 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 77 +++++++++++++++++++++--------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  7 ++++
 3 files changed, 58 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index b03e2c4..beea4a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1413,6 +1413,10 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL			0x00000011
 
+#define REG_A6XX_RBBM_GBIF_HALT					0x00000016
+
+#define REG_A6XX_RBBM_GBIF_HALT_ACK				0x00000017
+
 #define REG_A6XX_RBBM_WAIT_FOR_GPU_IDLE_CMD			0x0000001c
 #define A6XX_RBBM_WAIT_FOR_GPU_IDLE_CMD_WAIT_GPU_IDLE		0x00000001
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9f76f5b..db05942 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -869,9 +869,47 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		(val & 1), 100, 1000);
 }
 
+#define GBIF_CLIENT_HALT_MASK             BIT(0)
+#define GBIF_ARB_HALT_MASK                BIT(1)
+
+static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
+	if (!a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
+		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
+								0xf) == 0xf);
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
+
+		return;
+	}
+
+	/* Halt the gx side of GBIF */
+	gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
+	spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
+
+	/* Halt new client requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
+	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
+
+	/* Halt all AXI requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
+	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
+
+	/* The GBIF halt needs to be explicitly cleared */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
+}
+
 /* Force the GMU off in case it isn't responsive */
 static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
 	/* Flush all the queues */
 	a6xx_hfi_stop(gmu);
 
@@ -883,6 +921,15 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
+
+	/* Halt the gmu cm3 core */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
+
+	a6xx_bus_clear_pending_transactions(adreno_gpu);
+
+	/* Reset GPU core blocks */
+	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
+	udelay(100);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
@@ -1010,36 +1057,6 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu)
 	return true;
 }
 
-#define GBIF_CLIENT_HALT_MASK             BIT(0)
-#define GBIF_ARB_HALT_MASK                BIT(1)
-
-static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
-{
-	struct msm_gpu *gpu = &adreno_gpu->base;
-
-	if (!a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
-		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
-								0xf) == 0xf);
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
-
-		return;
-	}
-
-	/* Halt new client requests on GBIF */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
-	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
-			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
-
-	/* Halt all AXI requests on GBIF */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
-	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
-			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
-
-	/* The GBIF halt needs to be explicitly cleared */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
-}
-
 /* Gracefully try to shut down the GMU and by extension the GPU */
 static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e956a13..719e419 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -919,6 +919,10 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Make sure the GMU keeps the GPU on while we set it up */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
+	/* Clear GBIF halt in case GX domain was not collapsed */
+	if (a6xx_has_gbif(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	/*
@@ -1208,6 +1212,9 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	if (hang_debug)
 		a6xx_dump(gpu);
 
+	/* Halt SQE first */
+	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
+
 	/*
 	 * Turn off keep alive that might have been enabled by the hang
 	 * interrupt
-- 
2.7.4

