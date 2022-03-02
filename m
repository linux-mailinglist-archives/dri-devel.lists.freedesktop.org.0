Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8EA4CAB96
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A7C10EEE6;
	Wed,  2 Mar 2022 17:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EEF10EEE3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:27:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1646242078; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fiuOHSkeh6OQQMokHhaN2vVABcx0efu+KtOyko8hBdc=;
 b=fs3HaxtMtX9pbhBf/5dF8XWf6yuIXvyrmw65gsgSmMvqpfeN9LE5Z7W1tnVzmYS4b94mGgT7
 wyLcigQHvwk/+3nAZ47yV9A//WcxL9L63fcg3jE9su35uzkhsF9cPpic8jIyehgpZZ2yz/L2
 eTeco73jUBhVjHoijgPilAZbCHg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 621fa91ce1c212bb9c1ec19a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Mar 2022 17:27:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3C39BC4360C; Wed,  2 Mar 2022 17:27:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C9D1C4360C;
 Wed,  2 Mar 2022 17:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3C9D1C4360C
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
Subject: [PATCH v1 01/10] drm/msm/a6xx: Add helper to check smmu is stalled
Date: Wed,  2 Mar 2022 22:57:27 +0530
Message-Id: <20220302225551.v1.1.I043e079f8a427b93ddce112a3c74d53b08ee97f2@changeid>
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
 Douglas Anderson <dianders@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function to check for stalled smmu and also avoid reading
RBBM_STATUS3 register which is in GX domain before ensuring GX is
ON.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 8 +++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       | 1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 +---
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7d23c74..3faf551 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -14,6 +14,12 @@
 
 #define GPU_PAS_ID 13
 
+bool a6xx_is_smmu_stalled(struct msm_gpu *gpu)
+{
+	return !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
+			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
+}
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1346,7 +1352,7 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	 * to otherwise resume normally rather than killing the submit, so
 	 * just bail.
 	 */
-	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
+	if (a6xx_is_smmu_stalled(gpu))
 		return;
 
 	/*
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 86e0a7c..675aef0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -85,5 +85,6 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
+bool a6xx_is_smmu_stalled(struct msm_gpu *gpu);
 
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 55f4433..7de9d2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -971,8 +971,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
 		GFP_KERNEL);
-	bool stalled = !!(gpu_read(gpu, REG_A6XX_RBBM_STATUS3) &
-			A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT);
 
 	if (!a6xx_state)
 		return ERR_PTR(-ENOMEM);
@@ -1003,7 +1001,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	 * write out GPU state, so we need to skip this when the SMMU is
 	 * stalled in response to an iova fault
 	 */
-	if (!stalled && !gpu->needs_hw_init &&
+	if (!a6xx_is_smmu_stalled(gpu) &&
 	    !a6xx_crashdumper_init(gpu, &_dumper)) {
 		dumper = &_dumper;
 	}
-- 
2.7.4

