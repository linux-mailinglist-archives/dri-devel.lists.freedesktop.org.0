Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862304F1953
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EB110E5CF;
	Mon,  4 Apr 2022 16:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6210E5CF;
 Mon,  4 Apr 2022 16:35:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A604B816F4;
 Mon,  4 Apr 2022 16:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A89C34111;
 Mon,  4 Apr 2022 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649090126;
 bh=97AuxegGoUll1qcITUP5BRc/wzaj9s6TR3mxBS6KHjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dt4ZAHDziKrl6lZcmy9oeTCD8kMvxquz43HyPNvGKwBDaod/CTG6eWy2DNpfVCpV1
 WILnlVJWtbzOhY9pfZMMXVfElbPStzWuQoquGrm4OhKgoGqVzaaT3Hyoib0IasTPl3
 OncG1pGznzYyxpJiQDwoqyTBStMODBsNmzwijPsngjE1qtHy+KIitnT2f/NilJ+R6X
 4fffYBXxZWOgwIotfHbIYu8iMPbEwjtf/Q6TzGDvwklvzGyFModzIRtQzGueIhP2NO
 7jkAGh1cMYGCWkgmSs27B398o8L4kH9qejkey8h6+5oZB9ZXXz945x6dCSD81ZzDkN
 id2iFhRwgM9Pw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v6 08/14] drm/msm/dpu: don't use merge_3d if DSC merge
 topology is used
Date: Mon,  4 Apr 2022 22:04:30 +0530
Message-Id: <20220404163436.956875-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404163436.956875-1-vkoul@kernel.org>
References: <20220404163436.956875-1-vkoul@kernel.org>
MIME-Version: 1.0
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

DPU supports different topologies for the case when multiple INTFs are
being driven by the single phys_enc. The driver defaults to using 3DMux
in such cases. Don't use it if DSC merge is used instead.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 16 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 +++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4052486f19d8..95d1588f3bb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -511,6 +511,22 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
+bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	int i, intf_count = 0, num_dsc = 0;
+
+	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
+		if (dpu_enc->phys_encs[i])
+			intf_count++;
+
+	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	if (dpu_enc->dsc)
+		num_dsc = 2;
+
+	return (num_dsc > 0) && (num_dsc > intf_count);
+}
+
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ef873e5285a0..084c5265d7e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -172,4 +172,10 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
  */
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 4842070fdfa8..b5ad43b8a19b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -314,8 +314,10 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	dpu_cstate = to_dpu_crtc_state(phys_enc->parent->crtc->state);
 
+	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS)
+	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
 	return BLEND_3D_NONE;
-- 
2.34.1

