Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550EF146E9A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 17:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826EA6E0EB;
	Thu, 23 Jan 2020 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDABC6E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 16:42:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579797769; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ptRas4jwa9ygjLeLDjT7j5xI302MWi2R8Z9TLbhwROw=;
 b=rLBBEItokXKEJbnoKTsiXFVFUuaK4sg43ubI7m3UhbnG9ibe6TLMdjZvvbWIybSPYOJ4EhLn
 eoEBjSYRc+zf2EpXdhq0B3gZh2HBGxsAAHURcZCpZOmzmUR+A+OYP5Z0DXItQLaAEwULVI5L
 1V3BwSHiQ3UGW8LbrPtfaMkR6z8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e29cd02.7fdff335f180-smtp-out-n03;
 Thu, 23 Jan 2020 16:42:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49C73C4479F; Thu, 23 Jan 2020 16:42:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 73D4BC43383;
 Thu, 23 Jan 2020 16:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73D4BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm: Fix a6xx GMU shutdown sequence
Date: Thu, 23 Jan 2020 09:42:36 -0700
Message-Id: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
updating the VBIF flush in a6xx_gmu_shutdown and instead
inserted the new sequence into a6xx_pm_suspend along with a redundant
GMU idle.

Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
the appropriate place in the shutdown routine and remove the redundant
idle call.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 36 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 -----------------------------------
 2 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 983afea..f371227 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -796,6 +796,36 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu)
 	return true;
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
 /* Gracefully try to shut down the GMU and by extension the GPU */
 static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 {
@@ -819,11 +849,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 			return;
 		}
 
-		/* Clear the VBIF pipe before shutting down */
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
-		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) & 0xf)
-			== 0xf);
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
+		a6xx_bus_clear_pending_transactions(adreno_gpu);
 
 		/* tell the GMU we want to slumber */
 		a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index daf0780..b580e47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -748,39 +748,6 @@ static const u32 a6xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
 	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A6XX_CP_RB_CNTL),
 };
 
-#define GBIF_CLIENT_HALT_MASK             BIT(0)
-#define GBIF_ARB_HALT_MASK                BIT(1)
-
-static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
-{
-	struct msm_gpu *gpu = &adreno_gpu->base;
-
-	if(!a6xx_has_gbif(adreno_gpu)){
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
-	/*
-	 * GMU needs DDR access in slumber path. Deassert GBIF halt now
-	 * to allow for GMU to access system memory.
-	 */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
-}
-
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -805,16 +772,6 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
-	/*
-	 * Make sure the GMU is idle before continuing (because some transitions
-	 * may use VBIF
-	 */
-	a6xx_gmu_wait_for_idle(&a6xx_gpu->gmu);
-
-	/* Clear the VBIF pipe before shutting down */
-	/* FIXME: This accesses the GPU - do we need to make sure it is on? */
-	a6xx_bus_clear_pending_transactions(adreno_gpu);
-
 	return a6xx_gmu_stop(a6xx_gpu);
 }
 
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
