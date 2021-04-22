Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D522C368136
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48289CF7;
	Thu, 22 Apr 2021 13:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5DA89CB9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 13:08:11 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y4so31857896lfl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 06:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5DDTBrdtIX5m2n+pKNngs7kA+ovZXf2j+7G44yMR1F4=;
 b=lOY5CDyysiP6wLc9ELU69DbdSH9wkTPe4+Hze7Nn9mUVjFUwywus4/n/kzwp1W6LSX
 ZtTd/GTMOhTyurRUgyif8XQks5heuDWG3YOXTFkAfBG+IKv7Tl8xxeQxRzVgpVzjwS+A
 gnGHQPxu17xrlX26Fd6RTdiQo7tbztHX3cGjZklwxFFSaoXm7y89t4mBxCh4QBDdo/rX
 8zVCpWFjVPyImIi7hN52nPQs3rKo++7c2JDn6BXhylEW9954s/AuXvdkNf2dIewTioTV
 6UN9c/364nG/TUBS2Xo8K4lSHz2Z/YRymwkcd3gCbGJk27geXiJN2A7OIAAx9L+UODWk
 FffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5DDTBrdtIX5m2n+pKNngs7kA+ovZXf2j+7G44yMR1F4=;
 b=LbcEELA7D/Caw1mtYf6F7yeqICzq9T2wXmv++qey63Kyivf/dhziFC6hcpTBHCQ/3U
 3FdJ9Iju3CTXZjzXIg9jJ625Dp5CSTgyS1UdrHiaMVQFzMAjkxRxoUqlC/x4UkIXmb2s
 i+X38/jIIF/TU1Kww9pZ3CMo1tQWuwWanhOrM6nwB/C4GhUWF4CcyZZ7dBoyIFvSbNkw
 S+r8osSO78iBNaRzcnY3nbAtJjSWnaLxtn9wOjjDjX1/3l3uhL/YjuOiuHoXnzPqzAnP
 rZHxw90ScaaQhP7/XZkLufGq+rTAgg73HwdArup15OQavGSZWZviORHx89gcw1rKOm2+
 ZRTQ==
X-Gm-Message-State: AOAM5333GkTi1h89jV0yBSNU09S2NBLVytZjSn4xNnS5oZgbWozxLz68
 ikzEgMWpawOQlhl1Wyt+yh5qRg==
X-Google-Smtp-Source: ABdhPJyDSy5RkLtGGj0PCWMNpvjZbyaeOY6MgijdM6Zd+UJWXKNNkKxmWSXrQCmVll6sYKJ2o/rzVw==
X-Received: by 2002:a05:6512:985:: with SMTP id
 w5mr2465933lft.122.1619096889476; 
 Thu, 22 Apr 2021 06:08:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v17sm259833lfr.35.2021.04.22.06.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 06:08:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 3/3] drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque
 structure
Date: Thu, 22 Apr 2021 16:08:04 +0300
Message-Id: <20210422130804.825030-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
References: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code does not really use dpu_hw_blk fields, so drop them, making
dpu_hw_blk empty structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c    | 24 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    |  4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 12 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 610d630326bb..55dbde30c2a2 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -58,7 +58,6 @@ msm-y := \
 	disp/dpu1/dpu_encoder_phys_cmd.o \
 	disp/dpu1/dpu_encoder_phys_vid.o \
 	disp/dpu1/dpu_formats.o \
-	disp/dpu1/dpu_hw_blk.o \
 	disp/dpu1/dpu_hw_catalog.o \
 	disp/dpu1/dpu_hw_ctl.o \
 	disp/dpu1/dpu_hw_interrupts.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
deleted file mode 100644
index 1f2b74b9eb65..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
-
-#include <linux/mutex.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-
-#include "dpu_hw_mdss.h"
-#include "dpu_hw_blk.h"
-
-/**
- * dpu_hw_blk_init - initialize hw block object
- * @hw_blk: pointer to hw block object
- * @type: hw block type - enum dpu_hw_blk_type
- * @id: instance id of the hw block
- */
-void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id)
-{
-	hw_blk->type = type;
-	hw_blk->id = id;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
index 7768694b558a..52e92f37eda4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
@@ -19,9 +19,7 @@ struct dpu_hw_blk;
  * @refcount: reference/usage count
  */
 struct dpu_hw_blk {
-	u32 type;
-	int id;
+	/* opaque */
 };
 
-void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
 #endif /*_DPU_HW_BLK_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 441f66a4fb37..f8a74f6cdc4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -613,8 +613,6 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 	c->mixer_count = m->mixer_count;
 	c->mixer_hw_caps = m->mixer;
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx);
-
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 977b25968f34..a98e964c3b6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -110,8 +110,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 	c->cap = cfg;
 	_setup_dspp_ops(c, c->cap->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
-
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 17224556d5a8..116e2b5b1a90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -325,8 +325,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 	c->mdss = m;
 	_setup_intf_ops(&c->ops, c->cap->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx);
-
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 76f8b8f75b82..cb6bb7a22c15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -182,8 +182,6 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 	c->cap = cfg;
 	_setup_mixer_ops(m, &c->ops, c->cap->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx);
-
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 406ba950a066..c06d595d5df0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -79,8 +79,6 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 	c->caps = cfg;
 	_setup_merge_3d_ops(c, c->caps->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx);
-
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 92cd724263ce..55766c97c4c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -282,8 +282,6 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 	c->caps = cfg;
 	_setup_pingpong_ops(c, c->caps->features);
 
-	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx);
-
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 8734a47040aa..69eed7932486 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -733,8 +733,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
 
-	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx);
-
 	return hw_pipe;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index dae77d9c2c74..282e3c6c6d48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -322,8 +322,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 	mdp->caps = cfg;
 	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
-	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx);
-
 	return mdp;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index fd2d104f0a91..5afdfceeaa6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -428,7 +428,7 @@ static int _dpu_rm_reserve_ctls(
 		features = ctl->caps->features;
 		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", rm->ctl_blks[j]->id, features);
+		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
 		if (needs_split_display != has_split_display)
 			continue;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
