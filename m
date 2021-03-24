Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E19347B5E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284A6EC72;
	Wed, 24 Mar 2021 15:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B6D6EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u20so30557164lja.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4xBWnRFLzgW237I3IPU/dTmdpNU+vr+gRr0l627r2lg=;
 b=F3Ho8iwroYaQFu7HWMIfe3Za6LaUXey1JCQsLwM4KwIUpSki/hqQymQW42OZosdgwz
 3zMdOEsKwEwVGqlho38UHAsxn06rGlrTlbPvvhf/B45A3hDb/9oNty/00/oqfYvIYVat
 A7e8+SkMO656TvubyMtLYrP6WldX+xkv8OoBI/v+Ct18NXRoxvOlkUXR/XOwTMwvQrGA
 Js5LvJnwKjvcNpZO7j4GO0B+WSa5ENHcYoIZIuJ/J76mcVsWnh07FCd2owUSXMMibp9M
 Zo74urrWNJJMxxPrHoMR7BohLQjITVKt4YM1yGpIrzMO5ULU4t5QIi2iu/6F5ueBvFWR
 g8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xBWnRFLzgW237I3IPU/dTmdpNU+vr+gRr0l627r2lg=;
 b=tUR9Z0oUs081U2zat0vTiRkXmZCsMPwvyNOYJnkIfRkvNqwB4kDgc1mKykhGvFEXdY
 qdD4OHVJViQMbGnEVDyTnZjXIbE4uILE/ZWgtUcm6HlX9NKFvokCD/NEr4XeEYXQAMzU
 vG7YGVTPQoKnfKS8zSuiSDTw6GLOzfPiXnT2QFv1ND0QeVsXuzr+C9SHQLPUe4qiCiwt
 5tGH/ixMjVDhPJBGEfJGixWWaK0cCsv4ilM2t3NJlEZC75R2UpeC6hub6rK5kt4MupyZ
 L74J2vOCsStMqnWZ9SWRjOvJsr0ekRmclPPIUU7jetyYVpCkHD8XhU++0X2n9qd9ykuR
 MGcA==
X-Gm-Message-State: AOAM532Vgidb6YPerRUVqUwucKFniOJhwsEleubQ3CStZp8ThzsnojWa
 q7fnIZbjx70Pnwlp6SKQNNr8Gw==
X-Google-Smtp-Source: ABdhPJw/1RFMmGWS/+ddpoGpWFFHQqI/jXqv4YP30SQqM0oTtdHyWByokbJH4u3YHs3JXKdcT//Q1A==
X-Received: by 2002:a2e:9809:: with SMTP id a9mr2339301ljj.323.1616598048646; 
 Wed, 24 Mar 2021 08:00:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 15/21] drm/msm/dpu: call hw_merge_3d ops directly
Date: Wed, 24 Mar 2021 18:00:18 +0300
Message-Id: <20210324150024.2768215-16-dmitry.baryshkov@linaro.org>
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

Replace dpu_hw_merge_3d callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c      |  9 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h      | 13 ++-----------
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b6a004ca3927..868bb2f06125 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -299,7 +299,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 				phys_enc->hw_pp->idx);
 
 	if (phys_enc->hw_pp->merge_3d)
-		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d, intf_cfg.mode_3d);
+		dpu_hw_merge_3d_setup_3d_mode(phys_enc->hw_pp->merge_3d, intf_cfg.mode_3d);
 
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 406ba950a066..4f23bd96b6b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -35,7 +35,7 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
 	return ERR_PTR(-EINVAL);
 }
 
-static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
+void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 			enum dpu_3d_blend_mode mode_3d)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -52,12 +52,6 @@ static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 	}
 }
 
-static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
-				unsigned long features)
-{
-	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
-};
-
 struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -77,7 +71,6 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 
 	c->idx = idx;
 	c->caps = cfg;
-	_setup_merge_3d_ops(c, c->caps->features);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index 870bdb14613e..024e8462ef7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -12,18 +12,12 @@
 
 struct dpu_hw_merge_3d;
 
-/**
- *
- * struct dpu_hw_merge_3d_ops : Interface to the merge_3d Hw driver functions
+/*
  *  Assumption is these functions will be called after clocks are enabled
- *  @setup_3d_mode : enable 3D merge
  */
-struct dpu_hw_merge_3d_ops {
-	void (*setup_3d_mode)(struct dpu_hw_merge_3d *merge_3d,
+void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 			enum dpu_3d_blend_mode mode_3d);
 
-};
-
 struct dpu_hw_merge_3d {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
@@ -31,9 +25,6 @@ struct dpu_hw_merge_3d {
 	/* merge_3d */
 	enum dpu_merge_3d idx;
 	const struct dpu_merge_3d_cfg *caps;
-
-	/* ops */
-	struct dpu_hw_merge_3d_ops ops;
 };
 
 /**
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
