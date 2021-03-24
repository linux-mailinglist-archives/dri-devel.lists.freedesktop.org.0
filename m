Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA8347B5B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B7D6EC5C;
	Wed, 24 Mar 2021 15:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C156EC5B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y1so30574611ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InxB8LW00zB5UoFHTCsqm7Ebz3Ngcyc7bbqEDUAHS2E=;
 b=f5bNMXa/zhnBJ1YDuk4EwV081W0yUX2F6G0S73I3Qj2+wCqTQFjLy3f51+T9eOBxDJ
 kjmFubN/MpCdTjx21EhK9kQNtrzmLALB+5RrMAWnVhMdYEIuwMsnS17kvfaE7S0aFt7O
 Vn4xoKbKTRNHUxwRTzzZ31y3+cwDOoyUl+l4ggY4H6QKJBwdtKdJTnr/d7KowTmBbhPm
 3WQ468Wb7aobtpxGCtm6cMSFhpafOQi5iO0t10IXUKN5l0ksIDnTJXN64T0hF2GOB1qd
 llkxvZ5sNpscxQo97C+pUN5nEmbGYAcs40tcUUv0OXT9xQiyniYJiKjjEyOg3ocdHuYk
 OJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InxB8LW00zB5UoFHTCsqm7Ebz3Ngcyc7bbqEDUAHS2E=;
 b=ewcwbC4/5uop6jzxPVcnv6k/fnZ5JH/z0M8vjEH/S+J+KG+8hWq7a+ozgKf3CD/YME
 TpqJXBsu8A0+LOQyZQgSSl0kCJ/4t4SdGTkF2VOMR0iLalEmWAdLM3zUVlwbLozS+dZN
 q1sLgfrnK9mCOrjRLYHdssdaMUC2vUQtfkoc6He/NDQNjmYqmJF4lLy89t3CgsuEU+8k
 KDI26eoRVknY6UYOQgJSAWPGP/0Mb4NjnRpQSdH9Vfo5XHWRRd2ZjloYpe9R0UdUPoUS
 hZi546r1qM4ufa7WoJ+z6+TnrakrLN23ob9T++zInl4KWnuCAH9tYSE/dxK1Q5xGUG+Y
 qcJw==
X-Gm-Message-State: AOAM533Cb/WX0+M0UI9HHqSYuXrf5HV9BxffVyGPrngq8zhsy8N5foL2
 CI28la9A5ArwFoi2jspMS0YkjA==
X-Google-Smtp-Source: ABdhPJwmTkykf0MLHiVcPBQgtPtjq0/TeGKif/1s6wyjV7Rl6VlCjHX1VZrdFZvUep3sAUo+JDZIeQ==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr2305388ljl.348.1616598044960; 
 Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 12/21] drm/msm/dpu: call hw_dspp ops directly
Date: Wed, 24 Mar 2021 18:00:15 +0300
Message-Id: <20210324150024.2768215-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace dpu_hw_dspp callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 15 ++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h | 19 ++++++-------------
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5a0a6741a431..bf3048e44001 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -462,14 +462,14 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 		ctl = mixer[i].lm_ctl;
 		dspp = mixer[i].hw_dspp;
 
-		if (!dspp || !dspp->ops.setup_pcc)
+		if (!dspp)
 			continue;
 
 		if (!state->ctm) {
-			dspp->ops.setup_pcc(dspp, NULL);
+			dpu_hw_dspp_setup_pcc(dspp, NULL);
 		} else {
 			_dpu_crtc_get_pcc_coeff(state, &cfg);
-			dspp->ops.setup_pcc(dspp, &cfg);
+			dpu_hw_dspp_setup_pcc(dspp, &cfg);
 		}
 
 		mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 977b25968f34..c17f2bf3324f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -22,7 +22,7 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 
-static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+void dpu_hw_dspp_setup_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
@@ -33,6 +33,11 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		return;
 	}
 
+	if (!test_bit(DPU_DSPP_PCC, &ctx->cap->features)) {
+		DRM_ERROR("called for wrong DSPP block\n");
+		return;
+	}
+
 	if (!cfg) {
 		DRM_DEBUG_DRIVER("disable pcc feature\n");
 		DPU_REG_WRITE(&ctx->hw, base, PCC_DIS);
@@ -54,13 +59,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -108,7 +106,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 	/* Assign ops */
 	c->idx = idx;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 7fa189cfcb06..e712e3e4c67b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -36,19 +36,15 @@ struct dpu_hw_pcc_cfg {
 };
 
 /**
- * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
  * Caller must call the init function to get the dspp context for each dspp
  * Assumption is these functions will be called after clocks are enabled
  */
-struct dpu_hw_dspp_ops {
-	/**
-	 * setup_pcc - setup dspp pcc
-	 * @ctx: Pointer to dspp context
-	 * @cfg: Pointer to configuration
-	 */
-	void (*setup_pcc)(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
-
-};
+/**
+ * setup_pcc - setup dspp pcc
+ * @ctx: Pointer to dspp context
+ * @cfg: Pointer to configuration
+ */
+void dpu_hw_dspp_setup_pcc(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
 
 /**
  * struct dpu_hw_dspp - dspp description
@@ -65,9 +61,6 @@ struct dpu_hw_dspp {
 	/* dspp */
 	int idx;
 	const struct dpu_dspp_cfg *cap;
-
-	/* Ops */
-	struct dpu_hw_dspp_ops ops;
 };
 
 /**
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
