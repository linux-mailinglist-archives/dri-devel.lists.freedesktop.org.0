Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F1E381ABA
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 21:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C390B6E43D;
	Sat, 15 May 2021 19:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347D86E437
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 19:09:16 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id v9so1677276lfa.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NT3C87h3e5Xq0S8LgOZ6jDOdwjCJFaK/CbK5x+u4CQs=;
 b=aWCRmY7R3/oG3vn0M0TBH6TRY2cP/W8bvxK5oX7z9h7xZ3ylQwkbq2/qoZ7prv3yGz
 S7YyxfUGETrSL1b+BNNir/xdYIIDudrgoqEwBB1o3SvfNjk/SgQ5stNVx7yoKY8vw6sJ
 rhsNIpHex4jWOHxvI8ykFmkmLGop3TXA7Nm13bqQD1MzReCCBV3pZfVB+d1DlH5fJY/1
 9dxsG/EZfocA27gCpwA2TjOEIdgZxIfFJXIi5Mf+5TcElFyfOnLtq4Ybf21FQb4iR45i
 XaklIKzqYcbBGqpGBPGsimc2Lu5iH0ifGJELsoo39lDf4Pxb4RgIhSkW3hkG3vM9/HLw
 L34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NT3C87h3e5Xq0S8LgOZ6jDOdwjCJFaK/CbK5x+u4CQs=;
 b=rN7ojQzYL//hpvfIF75TmRJdV2jyDZXdehoQAFwQaSoZ7nQ7IWl4jt/DV1patNW6k2
 NUngKFFlWU1ZHXCTRyLW8BkfZxuHiUjao2rBKdu8UMqdpx+8PFyfpZa6UHjdnA1PB9Kz
 XegvONi6Mq9QjJTo+UU5vdU9gpBy1htHNClM4sYbFcIKIlvrOTVDSRGrjq+kKeyCV75X
 mPpMln1t2a9XMAXHghRU4RiWuAGWdVKYBubN6TISk2pMP5PDzRQMb24M6qeJDtL0+eeC
 WXkmNemgrF7EH29MmuoTkI30DZTzZ71IbCUCdgQeUFm6iHbQLAixDOlmN/FJ4s3jzZdr
 64dw==
X-Gm-Message-State: AOAM532eHUsEvnFN4G81ocWH0x3rQ5QEUJA5k3J/p7c6n5RcefVNlk6N
 ZvJIxbJ/JGkWVHIg3aB++1P7qw==
X-Google-Smtp-Source: ABdhPJxIXtdxAxnKuZjxNALJqfpQ3016DAVvgpurK6EM2TDHaD7a1QNXxdV1pU+zHrk/siIXMsFxlw==
X-Received: by 2002:a05:6512:2283:: with SMTP id
 f3mr6096479lfu.148.1621105754614; 
 Sat, 15 May 2021 12:09:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t15sm2184107ljk.99.2021.05.15.12.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 12:09:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 4/4] drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque
 structure
Date: Sat, 15 May 2021 22:09:09 +0300
Message-Id: <20210515190909.1809050-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
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
index c0eec12498e7..f9c83d6e427a 100644
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

