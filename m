Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DBC4352C8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11D6E328;
	Wed, 20 Oct 2021 18:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2766E158
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:39:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634755155; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=fMhK37NgLablZIXyn9LXXzethSwsYFf/HVVYPlJwWJA=;
 b=osUSJt71C+4GxENsnPOjZE2s1f2bbHpRIIlEdj1JgkiT8oIBSOFJvuV4xP5XwwTgoFfCOR5X
 WQgWUbJj6zIrbsvrX6Sb/iGuBbMxG/O3VwA+NgxXVUWFhR+4uQUbG75yxssGHuaA/n1zejjG
 cKE+9PIJQa2fKvPPnZTPFCqKGLM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61706239321f240051eaeead (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 18:38:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF653C43616; Wed, 20 Oct 2021 18:38:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 777B3C4338F;
 Wed, 20 Oct 2021 18:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 777B3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jessica Zhang <jesszhan@codeaurora.org>
To: freedreno@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dan.carpenter@oracle.com, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org, nganji@codeaurora.org,
 aravindh@codeaurora.org, abhinavk@codeaurora.org
Subject: [PATCH] drm/msm: Fix potential NULL dereference in DPU
Date: Wed, 20 Oct 2021 11:38:37 -0700
Message-Id: <20211020183837.959-1-jesszhan@codeaurora.org>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add NULL checks in KMS CRTC funcs to avoid potential NULL
dereference.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c      | 8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          | 5 +++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c        | 3 +++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 3 +++
 drivers/gpu/drm/msm/msm_gpu.c                     | 3 +++
 5 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index d2457490930b..53d80572181e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -208,8 +208,16 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
 	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
 			sizeof(struct list_head), GFP_KERNEL);
+
+	if (!dpu_kms->irq_obj.irq_cb_tbl)
+		return;
+
 	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
 			sizeof(atomic_t), GFP_KERNEL);
+
+	if (!dpu_kms->irq_obj.irq_counts)
+		return;
+
 	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
 		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
 		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 768012243b44..0a1cad0cfcc0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -921,6 +921,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
 
+	if (!pstates) {
+		rc = -ENOMEM;
+		goto end;
+	}
+
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69afcbac8..09751b480db5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -92,6 +92,9 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
 
+	if (!mdp5_state)
+		return;
+
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 		mdp5_state->base.zpos = STAGE_BASE;
 	else
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..71e209d07120 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -170,6 +170,9 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 
 	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
 
+	if (!new_blk)
+		return;
+
 	va_start(va, fmt);
 
 	vaf.fmt = fmt;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8a3a592da3a4..ddd23f3a4a99 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -296,6 +296,9 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
+		if (!state->bos)
+			return;
+
 		for (i = 0; i < submit->nr_bos; i++) {
 			if (should_dump(submit, i)) {
 				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

