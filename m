Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445739F2BF6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B503710E53F;
	Mon, 16 Dec 2024 08:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rzWTKc1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED6B10E542;
 Mon, 16 Dec 2024 08:33:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CB1F6A40B98;
 Mon, 16 Dec 2024 08:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6D6C4CED0;
 Mon, 16 Dec 2024 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734338005;
 bh=nNpiYk/Bgo7XjluscFFgC12Os5gcxVOGXcf8Cg321mI=;
 h=From:To:Cc:Subject:Date:From;
 b=rzWTKc1FTUX3lkjT2ZRELBXxGj5388ZHH8nL6+dQH7mjhagII/7tnPkM2x0H4JhGG
 0EgjtTDsY7ZuwcJDYYMfHeInCZ1koYnMxnJ+5FytWRlk2xJdWXBG2/6rt8ZRQpbeLk
 ArZO5waWAHlav+0fu0VDeZGyXz/NdIJXCFdSr3rO9i8NHaTkss61lB/oZGtOFgTtL5
 84HtFnyyXN5fPxg6kotu+iiOkoaAAVUMoLJgWPYy7cb4Csohem4hO5pOZ+kLrIKx97
 Bx7/og/Xh6b+kL1+ewjfqAkkmcKLj2d7Ud2u78catf4Il1vB10LRTYdVoeP8SpBPRt
 FN8pTDOrdjwWg==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: fix -Wformat-security warnings
Date: Mon, 16 Dec 2024 09:33:13 +0100
Message-Id: <20241216083319.1838449-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Passing a variable string as a printf style format is potentially
dangerous that -Wformat-security can warn about if enabled. A new
instance just got added:

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
 1046 |                                             vbif->name);
      |                                             ~~~~^~~~~~

Fix this one and the preexisting -Wformat-security warnings the in the
DRM code for snapdragon.

Fixes: 1a40bb31fcf1 ("drm/msm/dpu: Add VBIF to DPU snapshot") # and others
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have a larger series that I still plan to send eventually, sending this
one now as I just saw another one get added. The warning is enabled by
default because there are still over 100 other files with the same problem.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 28 ++++++++++++++++---------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712..fac3128695c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1265,7 +1265,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	bo->virt = msm_gem_get_vaddr(bo->obj);
 	bo->size = size;
 
-	msm_gem_object_set_name(bo->obj, name);
+	msm_gem_object_set_name(bo->obj, "%s", name);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dae8a94d3366..cdd6379545d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -938,12 +938,14 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	/* dump CTL sub-blocks HW regs info */
 	for (i = 0; i < cat->ctl_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
-				dpu_kms->mmio + cat->ctl[i].base, cat->ctl[i].name);
+				dpu_kms->mmio + cat->ctl[i].base, "%s",
+				cat->ctl[i].name);
 
 	/* dump DSPP sub-blocks HW regs info */
 	for (i = 0; i < cat->dspp_count; i++) {
 		base = dpu_kms->mmio + cat->dspp[i].base;
-		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, base, cat->dspp[i].name);
+		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, base,
+					    "%s", cat->dspp[i].name);
 
 		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
 			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
@@ -955,13 +957,14 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	/* dump INTF sub-blocks HW regs info */
 	for (i = 0; i < cat->intf_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
-				dpu_kms->mmio + cat->intf[i].base, cat->intf[i].name);
+				dpu_kms->mmio + cat->intf[i].base, "%s",
+				cat->intf[i].name);
 
 	/* dump PP sub-blocks HW regs info */
 	for (i = 0; i < cat->pingpong_count; i++) {
 		base = dpu_kms->mmio + cat->pingpong[i].base;
 		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, base,
-					    cat->pingpong[i].name);
+					    "%s", cat->pingpong[i].name);
 
 		/* TE2 sub-block has length of 0, so will not print it */
 
@@ -975,7 +978,8 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	/* dump SSPP sub-blocks HW regs info */
 	for (i = 0; i < cat->sspp_count; i++) {
 		base = dpu_kms->mmio + cat->sspp[i].base;
-		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, base, cat->sspp[i].name);
+		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, base,
+					    "%s", cat->sspp[i].name);
 
 		if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
 			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->scaler_blk.len,
@@ -993,12 +997,14 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	/* dump LM sub-blocks HW regs info */
 	for (i = 0; i < cat->mixer_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
-				dpu_kms->mmio + cat->mixer[i].base, cat->mixer[i].name);
+				dpu_kms->mmio + cat->mixer[i].base,
+				"%s", cat->mixer[i].name);
 
 	/* dump WB sub-blocks HW regs info */
 	for (i = 0; i < cat->wb_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
-				dpu_kms->mmio + cat->wb[i].base, cat->wb[i].name);
+				dpu_kms->mmio + cat->wb[i].base, "%s",
+				cat->wb[i].name);
 
 	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
@@ -1013,7 +1019,8 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	/* dump DSC sub-blocks HW regs info */
 	for (i = 0; i < cat->dsc_count; i++) {
 		base = dpu_kms->mmio + cat->dsc[i].base;
-		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, base, cat->dsc[i].name);
+		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, base,
+					    "%s", cat->dsc[i].name);
 
 		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
 			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
@@ -1028,14 +1035,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
 	if (cat->cdm)
 		msm_disp_snapshot_add_block(disp_state, cat->cdm->len,
-					    dpu_kms->mmio + cat->cdm->base, cat->cdm->name);
+					    dpu_kms->mmio + cat->cdm->base,
+					    "%s", cat->cdm->name);
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
 
 		msm_disp_snapshot_add_block(disp_state, vbif->len,
 					    dpu_kms->vbif[vbif->id] + vbif->base,
-					    vbif->name);
+					    "%s", vbif->name);
 	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-- 
2.39.5

