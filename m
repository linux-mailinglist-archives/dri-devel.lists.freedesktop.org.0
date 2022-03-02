Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B8F4CAB9C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C4410EEF2;
	Wed,  2 Mar 2022 17:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB76110EEF1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:28:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1646242094; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FahHoiUWoVSfLkjv3np6zeTjDtOx+mm590A3YyC9fDI=;
 b=pfBj6u2GAKRxRpZ8EVt42uMHrT87VLUrat+jCIScUjGL86aFRc1labJAgGmmHRxhFQV7W81w
 +YV7k325OJD6ajzlC6q5dZyFRnDLBMYpbYqYQMuuF8XTB+GW5NdV6vep6ud57FG50QIgUdrp
 yRuZE9IZTqyU1Wqu3St3o2Ttq1g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 621fa92e18892df15f8bd240 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Mar 2022 17:28:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 67E34C43617; Wed,  2 Mar 2022 17:28:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
 version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 60E27C4361C;
 Wed,  2 Mar 2022 17:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 60E27C4361C
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
Subject: [PATCH v1 04/10] drm/msm/a6xx: Enhance debugging of gmu faults
Date: Wed,  2 Mar 2022 22:57:30 +0530
Message-Id: <20220302225551.v1.4.Iafa6582dfdabdcf79fbce6141e50e7a3299e5821@changeid>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Wang Qing <wangqing@vivo.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for inline capture of gmu coredump in gmu resume/suspend
path to help debug gmu error/faults. This is sort of a lite version of
gpu coredump with just gmu states. And we can't use recover_worker
in these scenarios because gmu is collapsed after a failure in this
path. Hence we need to capture the gmu states inline before it is
collapsed.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 18 +++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 60 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 10 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 +
 drivers/gpu/drm/msm/msm_gpu.c               | 23 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 11 ++++--
 7 files changed, 105 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f208a81..f121d798 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1024,6 +1024,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
 		disable_irq(gmu->gmu_irq);
+		a6xx_gmu_inline_coredump(gmu);
 		a6xx_rpmh_stop(gmu);
 		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
@@ -1082,6 +1083,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	int ret = 0;
 	u32 val;
 
 	/*
@@ -1091,10 +1093,11 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	val = gmu_read(gmu, REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE);
 
 	if (val != 0xf) {
-		int ret = a6xx_gmu_wait_for_idle(gmu);
+		ret = a6xx_gmu_wait_for_idle(gmu);
 
 		/* If the GMU isn't responding assume it is hung */
 		if (ret) {
+			a6xx_gmu_inline_coredump(gmu);
 			a6xx_gmu_force_off(gmu);
 			return;
 		}
@@ -1102,7 +1105,9 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 		a6xx_bus_clear_pending_transactions(adreno_gpu);
 
 		/* tell the GMU we want to slumber */
-		a6xx_gmu_notify_slumber(gmu);
+		ret = a6xx_gmu_notify_slumber(gmu);
+		if (ret)
+			goto out;
 
 		ret = gmu_poll_timeout(gmu,
 			REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS, val,
@@ -1123,6 +1128,10 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 					REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS2));
 	}
 
+out:
+	if (ret)
+		a6xx_gmu_inline_coredump(gmu);
+
 	/* Turn off HFI */
 	a6xx_hfi_stop(gmu);
 
@@ -1146,9 +1155,10 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 	 * Force the GMU off if we detected a hang, otherwise try to shut it
 	 * down gracefully
 	 */
-	if (gmu->hung)
+	if (gmu->hung) {
+		a6xx_gmu_inline_coredump(gmu);
 		a6xx_gmu_force_off(gmu);
-	else
+	} else
 		a6xx_gmu_shutdown(gmu);
 
 	/* Remove the bus vote */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 675aef0..2599443 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -86,5 +86,6 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
 bool a6xx_is_smmu_stalled(struct msm_gpu *gpu);
+void a6xx_gmu_inline_coredump(struct a6xx_gmu *gmu);
 
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 09b2ff0..4d4588a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -3,6 +3,7 @@
 
 #include <linux/ascii85.h>
 #include "msm_gem.h"
+#include "msm_gpu.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.h"
 #include "a6xx_gpu_state.h"
@@ -970,10 +971,19 @@ void a6xx_get_gmu_state(struct msm_gpu *gpu, struct a6xx_gpu_state *a6xx_state)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 
-	if (gmu->hung)
+	if (gmu->hung) {
+		mutex_lock(&gmu->lock);
 		a6xx_gmu_send_nmi(gmu);
+		mutex_unlock(&gmu->lock);
+	}
 
 	a6xx_get_gmu_registers(gpu, a6xx_state);
+
+	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
+	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
+	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
+
+	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
 }
 
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
@@ -994,12 +1004,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_get_gmu_state(gpu, a6xx_state);
 
-	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
-	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
-	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
-
-	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
-
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
@@ -1343,3 +1347,45 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 	drm_puts(p, "debugbus:\n");
 	a6xx_show_debugbus(a6xx_state, p);
 }
+
+void a6xx_gmu_inline_coredump(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct a6xx_gpu_state *a6xx_state;
+
+	WARN_ON(mutex_is_locked(&gmu->lock));
+
+	mutex_lock(&gpu->crashstate_lock);
+
+	if (gpu->crashstate) {
+		mutex_unlock(&gpu->crashstate_lock);
+		DRM_DEV_ERROR(gmu->dev, "Skipping GMU coredump\n");
+		return;
+	}
+
+	a6xx_state = kzalloc(sizeof(*a6xx_state), GFP_KERNEL);
+	if (!a6xx_state) {
+		mutex_unlock(&gpu->crashstate_lock);
+		DRM_DEV_ERROR(gmu->dev,
+				"Failed to allocate memory for GMU coredump\n");
+		return;
+	}
+
+	INIT_LIST_HEAD(&a6xx_state->objs);
+	adreno_gpu_state_init(&a6xx_state->base);
+
+	/*
+	 * Set hung=true here so that an NMI is sent to gmu while capturing
+	 * coredump
+	 */
+	gmu->hung = true;
+	a6xx_get_gmu_state(gpu, a6xx_state);
+
+	gpu->crashstate = &a6xx_state->base;
+
+	mutex_unlock(&gpu->crashstate_lock);
+
+	msm_gpu_create_devcoredump(gpu);
+}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 15c8997..d3ae42f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -503,6 +503,12 @@ bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return false;
 }
 
+void adreno_gpu_state_init(struct msm_gpu_state *state)
+{
+	kref_init(&state->ref);
+	ktime_get_real_ts64(&state->time);
+}
+
 int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -510,9 +516,7 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	WARN_ON(!mutex_is_locked(&gpu->lock));
 
-	kref_init(&state->ref);
-
-	ktime_get_real_ts64(&state->time);
+	adreno_gpu_state_init(state);
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		int size = 0, j;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index b1ee453..9472183 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -316,6 +316,8 @@ int adreno_gpu_state_put(struct msm_gpu_state *state);
 void adreno_show_object(struct drm_printer *p, void **ptr, int len,
 		bool *encoded);
 
+void adreno_gpu_state_init(struct msm_gpu_state *state);
+
 /*
  * Common helper function to initialize the default address space for arm-smmu
  * attached targets
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index bacdabb..e8a442a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -259,6 +259,12 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	state->nr_bos++;
 }
 
+void msm_gpu_create_devcoredump(struct msm_gpu *gpu)
+{
+	dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
+		msm_gpu_devcoredump_read, msm_gpu_devcoredump_free);
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -268,13 +274,19 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (!gpu->funcs->gpu_state_get)
 		return;
 
+	mutex_lock(&gpu->crashstate_lock);
+
 	/* Only save one crash state at a time */
-	if (gpu->crashstate)
+	if (gpu->crashstate) {
+		mutex_unlock(&gpu->crashstate_lock);
 		return;
+	}
 
 	state = gpu->funcs->gpu_state_get(gpu);
-	if (IS_ERR_OR_NULL(state))
+	if (IS_ERR_OR_NULL(state)) {
+		mutex_unlock(&gpu->crashstate_lock);
 		return;
+	}
 
 	/* Fill in the additional crash state information */
 	state->comm = kstrdup(comm, GFP_KERNEL);
@@ -316,6 +328,8 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
+	mutex_unlock(&gpu->crashstate_lock);
+
 	/* FIXME: Release the crashstate if this errors out? */
 	dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
 		msm_gpu_devcoredump_read, msm_gpu_devcoredump_free);
@@ -325,6 +339,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
 }
+
+void msm_gpu_create_devcoredump(struct msm_gpu *gpu)
+{
+}
 #endif
 
 /*
@@ -856,6 +874,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	INIT_LIST_HEAD(&gpu->active_list);
 	mutex_init(&gpu->active_lock);
 	mutex_init(&gpu->lock);
+	mutex_init(&gpu->crashstate_lock);
 	init_waitqueue_head(&gpu->retire_event);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index c99627f..b33f508 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -250,6 +250,7 @@ struct msm_gpu {
 	uint32_t suspend_count;
 
 	struct msm_gpu_state *crashstate;
+	struct mutex crashstate_lock;
 
 	/* Enable clamping to idle freq when inactive: */
 	bool clamp_to_idle;
@@ -578,30 +579,32 @@ static inline struct msm_gpu_state *msm_gpu_crashstate_get(struct msm_gpu *gpu)
 {
 	struct msm_gpu_state *state = NULL;
 
-	mutex_lock(&gpu->lock);
+	mutex_lock(&gpu->crashstate_lock);
 
 	if (gpu->crashstate) {
 		kref_get(&gpu->crashstate->ref);
 		state = gpu->crashstate;
 	}
 
-	mutex_unlock(&gpu->lock);
+	mutex_unlock(&gpu->crashstate_lock);
 
 	return state;
 }
 
 static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 {
-	mutex_lock(&gpu->lock);
+	mutex_lock(&gpu->crashstate_lock);
 
 	if (gpu->crashstate) {
 		if (gpu->funcs->gpu_state_put(gpu->crashstate))
 			gpu->crashstate = NULL;
 	}
 
-	mutex_unlock(&gpu->lock);
+	mutex_unlock(&gpu->crashstate_lock);
 }
 
+void msm_gpu_create_devcoredump(struct msm_gpu *gpu);
+
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
  * support expanded privileges
-- 
2.7.4

