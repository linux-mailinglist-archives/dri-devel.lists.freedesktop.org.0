Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744CB45B8DD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 12:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325086E303;
	Wed, 24 Nov 2021 11:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E786E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 11:07:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637752072; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RclkjATUDFWQq54Fbsi5TpigwXgFNrYKr9p3UzdZuX4=;
 b=GiJDPaRRymjgCSNIMUI5qS9o5uuiQfOjo5kMPTTDTzy9AYdoHxEHM3VM3ZH1Ti7tN4spcSjx
 y/qz/NX0uLeUXHp6qGPiqEgBhd4cacVRoEvwGouy443N14P4uil6LEAfrBOy4Tm5NzyhPa5S
 JngrVtkos5lO9hhoADVdIEIzqGM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 619e1ce71abc6f02d0c31c7a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 11:07:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 34C1AC43639; Wed, 24 Nov 2021 11:07:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 902CEC43619;
 Wed, 24 Nov 2021 11:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 902CEC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 2/2] drm/msm/a6xx: Capture gmu log in devcoredump
Date: Wed, 24 Nov 2021 16:36:56 +0530
Message-Id: <20211124163500.v3.2.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20211124163500.v3.1.Ie4ac321feb10168af569d9c2b4cf6828bed8122c@changeid>
References: <20211124163500.v3.1.Ie4ac321feb10168af569d9c2b4cf6828bed8122c@changeid>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture gmu log in coredump to enhance debugging.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

Changes in v3:
- Fix style and a minor suggestion from Bjorn

Changes in v2:
- Fix kernel test robot's warning about size_t's format specifier

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 40 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  4 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7501849..ad8e77a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -42,6 +42,8 @@ struct a6xx_gpu_state {
 	struct a6xx_gpu_state_obj *cx_debugbus;
 	int nr_cx_debugbus;
 
+	struct msm_gpu_state_bo *gmu_log;
+
 	struct list_head objs;
 };
 
@@ -800,6 +802,29 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		&a6xx_state->gmu_registers[2], false);
 }
 
+static void a6xx_get_gmu_log(struct msm_gpu *gpu,
+		struct a6xx_gpu_state *a6xx_state)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	struct msm_gpu_state_bo *gmu_log;
+
+	gmu_log = state_kcalloc(a6xx_state, 1, sizeof(*gmu_log));
+	if (!gmu_log)
+		return;
+
+	gmu_log->iova = gmu->log.iova;
+	gmu_log->size = gmu->log.size;
+	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
+	if (!gmu_log->data)
+		return;
+
+	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
+
+	a6xx_state->gmu_log = gmu_log;
+}
+
 #define A6XX_GBIF_REGLIST_SIZE   1
 static void a6xx_get_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
@@ -937,6 +962,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_get_gmu_registers(gpu, a6xx_state);
 
+	a6xx_get_gmu_log(gpu, a6xx_state);
+
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
@@ -978,6 +1005,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
+	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
+		kvfree(a6xx_state->gmu_log->data);
+
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
 		kfree(obj);
 
@@ -1191,6 +1221,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	adreno_show(gpu, state, p);
 
+	drm_puts(p, "gmu-log:\n");
+	if (a6xx_state->gmu_log) {
+		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
+
+		drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
+		drm_printf(p, "    size: %zu\n", gmu_log->size);
+		adreno_show_object(p, &gmu_log->data, gmu_log->size,
+				&gmu_log->encoded);
+	}
+
 	drm_puts(p, "registers:\n");
 	for (i = 0; i < a6xx_state->nr_registers; i++) {
 		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 7486652..d7ffbb2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -630,8 +630,8 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
 }
 
 /* len is expected to be in bytes */
-static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
-		bool *encoded)
+void adreno_show_object(struct drm_printer *p, void **ptr, int len,
+		       bool *encoded)
 {
 	if (!*ptr || !len)
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 225c277..6762308 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
 
 int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
 int adreno_gpu_state_put(struct msm_gpu_state *state);
+void adreno_show_object(struct drm_printer *p, void **ptr, int len,
+		bool *encoded);
 
 /*
  * Common helper function to initialize the default address space for arm-smmu
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

