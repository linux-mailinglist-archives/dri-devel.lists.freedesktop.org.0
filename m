Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2953AACE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 18:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C624E10EED0;
	Wed,  1 Jun 2022 16:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0BB10EED0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 16:13:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id g12so2546531lja.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKtAwgKsvfWTTuGD0xoOQN8yo99BGUWcdTs+0dzp78Q=;
 b=r9KsPCNxh79MaEKHUFh6kAPpwe3ErCVaARaw2UHyLsMWh4gIjB4o7yImlpfEpMyUtR
 33iSQgcXomiAp4/Qi7nPQPJErY5n1Ef3WqGB/h/yoqEqAO7CPzAKRdvSOpCbQa/FOkDi
 M0hIqaPsnZG1zcFp81Kxzqjqe3XNSHLSGiOwg/7FIjAo/UYHLFnNt8KW+A8/ibFnxXCK
 j9qf39n8foNg7HchF3Y9AtNHNwPWRXO2SNeGoqHkJiBjVvXFGzhqZ5ZgDT5qhDxszLaS
 ko3PAQcCRgzx+M8mI2shyY+0Rgn4LrTzfnL0wA+Fu1bNPLOL/Lnb60Ur2uV3EWSdcqUF
 fotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKtAwgKsvfWTTuGD0xoOQN8yo99BGUWcdTs+0dzp78Q=;
 b=IfHCT9FNYtOKx14gbf9gRBqLFoYXMwtA90DFriMYxDJDpV7ZKFWCHDe/7oqhQX18JE
 OCqW5SVjg6OLnWRLDtfGo+aVGfaSwVyet1U3FjYYIhIiisVAFJk8hcxj56FDjZGlOCb2
 lZXuRg5CDmRp1uJ5/++6yS8xgwgSts4V2Z7tvT0cxT+fpKjt/I9nFfWDoEZ58LHxYqgy
 i0E92hKY/w6SNdkQEcpDTLzlliTzt2C3jxd9gM8yB1GikQrqAJnMMPgefNgwpZMYWB5V
 A7CnESmuLp7rfQSmwNYsIOM15D8hWN4OtnbiJbarF7a+ZjG962euKPlo99adyMF16+74
 d6iw==
X-Gm-Message-State: AOAM533P94EgPXWuQpG9QiJpPQ+rD16DcNYUwPu3Wfc4/6iefkNhRUw7
 tKJapiKTWkayfZIzMxBtDd8L1g==
X-Google-Smtp-Source: ABdhPJzJ9KhZoabEqclzLpRPsXWiNK8RXKGdgdZv1Mr+HNobHSrhmyNvO5HHKLpRxWXIuqDLRB1Yjw==
X-Received: by 2002:a2e:8090:0:b0:255:51b2:17a6 with SMTP id
 i16-20020a2e8090000000b0025551b217a6mr7840285ljg.352.1654100032867; 
 Wed, 01 Jun 2022 09:13:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 09:13:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 3/4] drm/msm/dpu: merge base_off with blk_off in struct
 dpu_hw_blk_reg_map
Date: Wed,  1 Jun 2022 19:13:48 +0300
Message-Id: <20220601161349.1517667-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little point in keeping a separate MDP address and block offset
in this struct. Merge them to form a new blk_addr field used for all
register access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c        | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c       | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h       | 7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 2 +-
 15 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 1120ff408dae..e12b7fa48a7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -58,8 +58,7 @@ static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 
 	for (i = 0; i < m->ctl_count; i++) {
 		if (ctl == m->ctl[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->ctl[i].base;
+			b->blk_addr = addr + m->ctl[i].base;
 			b->log_mask = DPU_DBG_MASK_CTL;
 			return &m->ctl[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index dfe6e4c11917..411689ae6382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -166,8 +166,7 @@ static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 
 	for (i = 0; i < m->dsc_count; i++) {
 		if (dsc == m->dsc[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->dsc[i].base;
+			b->blk_addr = addr + m->dsc[i].base;
 			b->log_mask = DPU_DBG_MASK_DSC;
 			return &m->dsc[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 8196ae47dea8..8ab5ace34a2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -80,8 +80,7 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 
 	for (i = 0; i < m->dspp_count; i++) {
 		if (dspp == m->dspp[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->dspp[i].base;
+			b->blk_addr = addr + m->dspp[i].base;
 			b->log_mask = DPU_DBG_MASK_DSPP;
 			return &m->dspp[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index d83503ea2419..cf1b6d84c18a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -401,8 +401,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 static void __intr_offset(const struct dpu_mdss_cfg *m,
 		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
 {
-	hw->base_off = addr;
-	hw->blk_off = m->mdp[0].base;
+	hw->blk_addr = addr + m->mdp[0].base;
 }
 
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index c7eb314f1d7a..d8aff0f459f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -77,8 +77,7 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 	for (i = 0; i < m->intf_count; i++) {
 		if ((intf == m->intf[i].id) &&
 		(m->intf[i].type != INTF_NONE)) {
-			b->base_off = addr;
-			b->blk_off = m->intf[i].base;
+			b->blk_addr = addr + m->intf[i].base;
 			b->log_mask = DPU_DBG_MASK_INTF;
 			return &m->intf[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 87a4a5869b9b..75d55fd65f19 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -43,8 +43,7 @@ static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 
 	for (i = 0; i < m->mixer_count; i++) {
 		if (mixer == m->mixer[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->mixer[i].base;
+			b->blk_addr = addr + m->mixer[i].base;
 			b->log_mask = DPU_DBG_MASK_LM;
 			return &m->mixer[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 538691f7bf66..def0a87fdba5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -23,8 +23,7 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
 
 	for (i = 0; i < m->merge_3d_count; i++) {
 		if (idx == m->merge_3d[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->merge_3d[i].base;
+			b->blk_addr = addr + m->merge_3d[i].base;
 			b->log_mask = DPU_DBG_MASK_PINGPONG;
 			return &m->merge_3d[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 0aa63636bc9a..0fcad9760b6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -51,8 +51,7 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
 
 	for (i = 0; i < m->pingpong_count; i++) {
 		if (pp == m->pingpong[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->pingpong[i].base;
+			b->blk_addr = addr + m->pingpong[i].base;
 			b->log_mask = DPU_DBG_MASK_PINGPONG;
 			return &m->pingpong[i];
 		}
@@ -156,7 +155,7 @@ static int dpu_hw_pp_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp,
 		return -EINVAL;
 
 	c = &pp->hw;
-	rc = readl_poll_timeout(c->base_off + c->blk_off + PP_LINE_COUNT,
+	rc = readl_poll_timeout(c->blk_addr + PP_LINE_COUNT,
 			val, (val & 0xffff) >= 1, 10, timeout_us);
 
 	return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 876ae8faa8e5..102c21bb4192 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -769,8 +769,7 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 	if ((sspp < SSPP_MAX) && catalog && addr && b) {
 		for (i = 0; i < catalog->sspp_count; i++) {
 			if (sspp == catalog->sspp[i].id) {
-				b->base_off = addr;
-				b->blk_off = catalog->sspp[i].base;
+				b->blk_addr = addr + catalog->sspp[i].base;
 				b->log_mask = DPU_DBG_MASK_SSPP;
 				return &catalog->sspp[i];
 			}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 843cb607d411..c3110a25a30d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -285,8 +285,7 @@ static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
 
 	for (i = 0; i < m->mdp_count; i++) {
 		if (mdp == m->mdp[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->mdp[i].base;
+			b->blk_addr = addr + m->mdp[i].base;
 			b->log_mask = DPU_DBG_MASK_TOP;
 			return &m->mdp[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 512316f25a51..b2104001d2aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -80,13 +80,13 @@ void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
 	/* don't need to mutex protect this */
 	if (c->log_mask & dpu_hw_util_log_mask)
 		DPU_DEBUG_DRIVER("[%s:0x%X] <= 0x%X\n",
-				name, c->blk_off + reg_off, val);
-	writel_relaxed(val, c->base_off + c->blk_off + reg_off);
+				name, reg_off, val);
+	writel_relaxed(val, c->blk_addr + reg_off);
 }
 
 int dpu_reg_read(struct dpu_hw_blk_reg_map *c, u32 reg_off)
 {
-	return readl_relaxed(c->base_off + c->blk_off + reg_off);
+	return readl_relaxed(c->blk_addr + reg_off);
 }
 
 u32 *dpu_hw_util_get_log_mask_ptr(void)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index b745ef4ac16f..d5338701fc2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -17,12 +17,11 @@
  * This is the common struct maintained by each sub block
  * for mapping the register offsets in this block to the
  * absoulute IO address
- * @base_off:     mdp register mapped offset
- * @blk_off:      pipe offset relative to mdss offset
+ * @blk_addr:     hw block register mapped address
+ * @log_mask:     log mask for this block
  */
 struct dpu_hw_blk_reg_map {
-	void __iomem *base_off;
-	u32 blk_off;
+	void __iomem *blk_addr;
 	u32 log_mask;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index 41ca4b179f1a..16c56e240706 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -220,8 +220,7 @@ static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
 
 	for (i = 0; i < m->vbif_count; i++) {
 		if (vbif == m->vbif[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->vbif[i].base;
+			b->blk_addr = addr + m->vbif[i].base;
 			b->log_mask = DPU_DBG_MASK_VBIF;
 			return &m->vbif[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 12f32cd3075e..2d28afdf860e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -60,8 +60,7 @@ static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
 
 	for (i = 0; i < m->wb_count; i++) {
 		if (wb == m->wb[i].id) {
-			b->base_off = addr;
-			b->blk_off = m->wb[i].base;
+			b->blk_addr = addr + m->wb[i].base;
 			return &m->wb[i];
 		}
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a3bfc0fe72a8..a526345abc69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -951,7 +951,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
 	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + top->hw.blk_off, "top");
+			dpu_kms->mmio + cat->mdp[0].base, "top");
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

