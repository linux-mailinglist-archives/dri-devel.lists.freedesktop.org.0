Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441166C09F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 15:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF30E10E14B;
	Mon, 16 Jan 2023 14:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015B110E03D;
 Mon, 16 Jan 2023 14:02:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 81686CE1169;
 Mon, 16 Jan 2023 14:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBB6C433F2;
 Mon, 16 Jan 2023 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877770;
 bh=c1dLUwLzKCg211SfEHv4A5E+XPyoUTVlsOTJ08S8uLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QhjQO0iMneDDr6zm6B5ku1kwHIvlUF/AOXRW7f7WwdVw9e7qK9t8SYUcH7+fHBJn5
 x79k9mqywvKIe0jPfmy7wFWEDAGgQJ4GfjTwRCEgoK9ufJnypTt8VwseK6NSCTu0Kc
 cvKdMqkQztvzoWiXTb/2ej+OyDk+Hvbp7OATYDRid+GttMyWIPJ9X6WqH4eskxl3WO
 gVOXMGAoNhmKI2XGgLJtuGHsQRCyWTpip1IbP2Xg+lEZsrl1NUhVZoqcP/yklGXzmA
 BBW0PhbHSdUvKEs2YIqbWZ1ZfJhzPtvRPKTBKq3PXvOGdjfWWWotZ+QbJJTmxymlMO
 yKFdluySDqCAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 16/53] drm/msm/a6xx: Avoid gx gbit halt during rpm
 suspend
Date: Mon, 16 Jan 2023 09:01:16 -0500
Message-Id: <20230116140154.114951-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, geert@linux-m68k.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akhil P Oommen <quic_akhilpo@quicinc.com>

[ Upstream commit f4a75b5933c998e60fd812a7680e0971eb1c7cee ]

As per the downstream driver, gx gbif halt is required only during
recovery sequence. So lets avoid it during regular rpm suspend.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/515279/
Link: https://lore.kernel.org/r/20221216223253.1.Ice9c47bfeb1fddb8dc377a3491a043a3ee7fca7d@changeid
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 +++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  7 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e033d6a67a20..870252bef23f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -876,7 +876,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 #define GBIF_CLIENT_HALT_MASK             BIT(0)
 #define GBIF_ARB_HALT_MASK                BIT(1)
 
-static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
+static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu,
+		bool gx_off)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
@@ -889,9 +890,11 @@ static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
 		return;
 	}
 
-	/* Halt the gx side of GBIF */
-	gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
-	spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
+	if (gx_off) {
+		/* Halt the gx side of GBIF */
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
+		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
+	}
 
 	/* Halt new client requests on GBIF */
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
@@ -929,7 +932,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu);
+	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
@@ -1083,7 +1086,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 			return;
 		}
 
-		a6xx_bus_clear_pending_transactions(adreno_gpu);
+		a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
 
 		/* tell the GMU we want to slumber */
 		ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e846e629c00d..9d7fc44c1e2a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1277,6 +1277,12 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	if (hang_debug)
 		a6xx_dump(gpu);
 
+	/*
+	 * To handle recovery specific sequences during the rpm suspend we are
+	 * about to trigger
+	 */
+	a6xx_gpu->hung = true;
+
 	/* Halt SQE first */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
@@ -1319,6 +1325,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->active_lock);
 
 	msm_gpu_hw_init(gpu);
+	a6xx_gpu->hung = false;
 }
 
 static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ab853f61db63..eea2e60ce3b7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -32,6 +32,7 @@ struct a6xx_gpu {
 	void *llc_slice;
 	void *htw_llc_slice;
 	bool have_mmu500;
+	bool hung;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
-- 
2.35.1

