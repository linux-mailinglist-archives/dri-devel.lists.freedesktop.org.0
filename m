Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794C45AE52
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 22:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3126E89CB3;
	Tue, 23 Nov 2021 21:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDC189CAD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 21:21:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637702505; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QomOaa1KdT9KI/KFkjVWVBY6qyReR8rMmkhwXGghb0I=;
 b=LiiFK1XuAWDzvkq1qbbIhWd7hj0fFATMQ8+DxYLdrWG16y/i1EWRsXlS183Vxl8+Rbo2HbRL
 x3rTyhWg3QlA+yg5DyL43FAcrfFBD2xEVcOrbpUj5SPckJ9CJPbv2UqcXkgogzSMJtXoQ132
 ukaB/1t8XeTYyfiP+J01fZkMYqw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 619d5b686bacc185a5fd0592 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 21:21:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 325CDC4361C; Tue, 23 Nov 2021 21:21:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AEA3C4360D;
 Tue, 23 Nov 2021 21:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6AEA3C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 4/6] drm/msm/a6xx: Capture gmu log in devcoredump
Date: Wed, 24 Nov 2021 02:47:53 +0530
Message-Id: <20211124024436.v2.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
References: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Linux Patches Robot
 <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture gmu log in coredump to enhance debugging.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

Changes in v2:
- Fix kernel test robot's warning about size_t's format specifier

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index e8f65cd..e6f5571 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -42,6 +42,8 @@ struct a6xx_gpu_state {
 	struct a6xx_gpu_state_obj *cx_debugbus;
 	int nr_cx_debugbus;
 
+	struct msm_gpu_state_bo *gmu_log;
+
 	struct list_head objs;
 };
 
@@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
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
+	gmu_log = state_kcalloc(a6xx_state,
+		1, sizeof(*a6xx_state->gmu_log));
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
@@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_get_gmu_registers(gpu, a6xx_state);
 
+	a6xx_get_gmu_log(gpu, a6xx_state);
+
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
@@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
+	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
+		kvfree(a6xx_state->gmu_log->data);
+
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
 		kfree(obj);
 
@@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
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
index 1539b8e..b43346e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -638,7 +638,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
 }
 
 /* len is expected to be in bytes */
-static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
+void adreno_show_object(struct drm_printer *p, void **ptr, int len,
 		bool *encoded)
 {
 	if (!*ptr || !len)
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

