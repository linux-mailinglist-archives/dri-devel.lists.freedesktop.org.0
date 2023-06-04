Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FED7219DA
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4643510E172;
	Sun,  4 Jun 2023 20:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38D510E0FD
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:41 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso4564256e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910939; x=1688502939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXkE2NfAHePyz3idBKodRpkJ8oDX1JJCsK2F3C8yVR0=;
 b=uUXWWACQO4lRc6IubWn33Z9EY94/mA2qJ+aVn97S4D2Ehk0Z5MPKwT1Ddem+KW8tpQ
 3THitjLGgLPDbws0t04p5zRS1AgAJJ/JLgC5gX2vebGQXsff11F4uKHFF1461uaXsUbY
 Rb4KiWp5BnERGhbtiNhMzFY4oewkTNvpYMmjDJ+Tjah46x1O29yGi+RMA95icyDotDjR
 Y+QsINQi+ygpogro4IMmb7kHqfurfDpdo64N6Qk/+6BFk3xRzoxO2lAKsLyfNu21ikwD
 LCHzqtES34e35OJE+PCRG9kXDzsXl97GLwREGU6r222icBbkVB9Zw/z/LB0wt+CVX7G3
 ksQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910939; x=1688502939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KXkE2NfAHePyz3idBKodRpkJ8oDX1JJCsK2F3C8yVR0=;
 b=QWcZCvYKGUpYp+7f2CCVbojIGX9yHwoG+GwPskfJ+W6WVOUJJxmhUp3xE57Bj0ynKp
 lLWcbf/9M5usuwdYJNa8hXQ26j66VA3ltKgJxgV4D9QUZQsSQghTJ8n2QT9ITR5jpL94
 TZ/LbyowyuVqn+NXv4ZXsSf2mQ+ykBV++0xzAM087numT7HCxIam/nXqFqDI/qnQEuj8
 A6AYBlColTs2vP8oa4ofl6DV1O2WHW+hAsL+4CARf81HdiqknsrbXQjcuiFbOsT6Elpo
 LH+XVNi5vhKrluYMRY9svRY5770pt680HnX9XCRE2aKPbYBnV5S5dZjeQcbYODFz5T/S
 GKbA==
X-Gm-Message-State: AC+VfDyKeTkl0mls01Dtq6JuD9ZMIa4hav2nXwiwKP14RP6eNtzjsciK
 vrSrNm/ZCQAwCs2q9+i0YzJl/Q==
X-Google-Smtp-Source: ACHHUZ5cNvUlW7vyXXLiwcfDJDIXx2Gbu5WTG0t7a4WPzN8VpbkMoWv/bzOVOHpDhM4paw1TxbHCWg==
X-Received: by 2002:ac2:4ace:0:b0:4f3:78dd:8e0b with SMTP id
 m14-20020ac24ace000000b004f378dd8e0bmr2639932lfp.32.1685910939596; 
 Sun, 04 Jun 2023 13:35:39 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 05/22] drm/msm/dpu: simplify peer LM handling
Date: Sun,  4 Jun 2023 23:35:15 +0300
Message-Id: <20230604203532.1094249-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For each LM there is at max 1 peer LM which can be driven by the same
CTL, so there no need to have a mask instead of just an ID of the peer
LM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 34 +++++++------------
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fdc0d0c4ffd7..00c0b48f577f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -394,7 +394,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
 	.features = _fmask, \
 	.sblk = _sblk, \
 	.pingpong = _pp, \
-	.lm_pair_mask = (1 << _lmpair), \
+	.lm_pair = _lmpair, \
 	.dspp = _dspp \
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d6365144af8a..3cb554ca00ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -528,14 +528,14 @@ struct dpu_sspp_cfg {
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
- * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
+ * @lm_pair:           ID of LM that can be controlled by same CTL
  */
 struct dpu_lm_cfg {
 	DPU_HW_BLK_INFO;
 	const struct dpu_lm_sub_blks *sblk;
 	u32 pingpong;
 	u32 dspp;
-	unsigned long lm_pair_mask;
+	unsigned long lm_pair;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2ca3c666e22f..742c73b28115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -248,28 +248,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 }
 
 /**
- * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
+ * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary
  * @rm: dpu resource manager handle
  * @primary_idx: index of primary mixer in rm->mixer_blks[]
- * @peer_idx: index of other mixer in rm->mixer_blks[]
- * Return: true if rm->mixer_blks[peer_idx] is a peer of
- *          rm->mixer_blks[primary_idx]
  */
-static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
-		int peer_idx)
+static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
 {
 	const struct dpu_lm_cfg *prim_lm_cfg;
-	const struct dpu_lm_cfg *peer_cfg;
 
 	prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
-	peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
 
-	if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
-		DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
-				peer_cfg->id);
-		return false;
-	}
-	return true;
+	if (prim_lm_cfg->lm_pair >= LM_0 && prim_lm_cfg->lm_pair < LM_MAX)
+		return prim_lm_cfg->lm_pair - LM_0;
+	return -EINVAL;
 }
 
 /**
@@ -346,7 +337,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int lm_idx[MAX_BLOCKS];
 	int pp_idx[MAX_BLOCKS];
 	int dspp_idx[MAX_BLOCKS] = {0};
-	int i, j, lm_count = 0;
+	int i, lm_count = 0;
 
 	if (!reqs->topology.num_lm) {
 		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
@@ -371,16 +362,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
-				lm_count < reqs->topology.num_lm; j++) {
-			if (!rm->mixer_blks[j])
+		if (lm_count < reqs->topology.num_lm) {
+			int j = _dpu_rm_get_lm_peer(rm, i);
+
+			/* ignore the peer if there is an error or if the peer was already processed */
+			if (j < 0 || j < i)
 				continue;
 
-			if (!_dpu_rm_check_lm_peer(rm, i, j)) {
-				DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
-						LM_0 + i);
+			if (!rm->mixer_blks[j])
 				continue;
-			}
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
-- 
2.39.2

