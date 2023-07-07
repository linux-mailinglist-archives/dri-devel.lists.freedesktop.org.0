Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2F74B9F9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AAD10E630;
	Fri,  7 Jul 2023 23:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF2410E61C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6f9edac8dso37291101fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771577; x=1691363577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNaj92kmqpUe6Apmr5rPerOQykI/eCFdLNtnHUiUOtA=;
 b=opvnxwOcSTS3VvSBKcXactZMc0pZP/VXGA6o8yijrUGb5+PbaCS1rNylwmtaL7Y3fW
 EG6DXJge3mOYkErRx1EEJLbW4TfYaDUkgbsa7ZIMx7vHjmn7q4+XM9zzkADHBepaNqWq
 x018fn9cBTPseA60B/DqujD5EnkDvGjDlb3zKNpT93waqZjAQ3w+Vta/GEZFVyEQQQy9
 vsJaZnfCY/hfITZTAG2WICy0G68y4D5JgCYrjavWRE63DQ0tEK8tMbqgHTMm0dXrTC9s
 fmUcMX8eMim9sEm7ZUEgLqJIQy4ojQsn/5rgnxsgOonDdAlp0yKqvBZgTSYPTsZv7mPm
 h28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771577; x=1691363577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNaj92kmqpUe6Apmr5rPerOQykI/eCFdLNtnHUiUOtA=;
 b=LRmXMtDVU2Kgjqz8ecejkdEMPZkJZx7/cxxCzg/y5wDa7kMAnMM+NNYLijRYTCNXHF
 Sx+uA1RCSuHOooxRmTDKTgWzjKkv2RDsVBVPNcQpqFfYBCX35zC4qVIeyR9wxeiVbhUn
 MdihHRrcRjAa3M+4NXH62Jil+z7opbR4IRkrZl7vTq6S/bpUDDGJQdhBCqNRma7o4xCx
 TCpZoME4kv4KT8XGCVv07b/K/uRxRRZIguSUW/D18TRmrnpu9oledY+O0tPp403Devva
 aEg0vWD3ikgT6e/fAlG4vu+iu02qEdY+894A6ae2TplqnmYGI1+vvTuk8MAO7bTqJj5c
 Sd4Q==
X-Gm-Message-State: ABy/qLaDYf9VhouifijA6oEpdAZHNFmn4tG/uigIP61FGWfYnDLezbXl
 AIrwV2IWg7tJYFz802HKBycRXA==
X-Google-Smtp-Source: APBJJlE2GuAxHtDIPcL5fur4n6VVJTwcSUAjRg7kccA6inS+aA80ZB4GkArMotCYu54Du7Q5IPsTaQ==
X-Received: by 2002:a05:6512:3b1e:b0:4f6:3677:553 with SMTP id
 f30-20020a0565123b1e00b004f636770553mr6000212lfv.38.1688771577124; 
 Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 06/13] drm/msm/dpu: use devres-managed allocation for HW
 blocks
Date: Sat,  8 Jul 2023 02:12:44 +0300
Message-Id: <20230707231251.3849701-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create HW block structure. This allows us to remove
corresponding kfree and drop all dpu_hw_*_destroy() functions as well as
dpu_rm_destroy(), which becomes empty afterwards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 12 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    | 10 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c    |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 13 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 23 files changed, 119 insertions(+), 238 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c278fb9d2b5b..d22e3f11ae34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/delay.h>
+
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_kms.h"
@@ -674,14 +677,15 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
 
-struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
-		void __iomem *addr,
-		u32 mixer_count,
-		const struct dpu_lm_cfg *mixer)
+struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
+				   const struct dpu_ctl_cfg *cfg,
+				   void __iomem *addr,
+				   u32 mixer_count,
+				   const struct dpu_lm_cfg *mixer)
 {
 	struct dpu_hw_ctl *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -696,8 +700,3 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx)
-{
-	kfree(ctx);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 1c242298ff2e..279ebd8dfbff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -274,20 +274,16 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
+ * @dev:  Corresponding device for devres management
  * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  * @mixer_count: Number of mixers in @mixer
  * @mixer: Pointer to an array of Layer Mixers defined in the catalog
  */
-struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
-		void __iomem *addr,
-		u32 mixer_count,
-		const struct dpu_lm_cfg *mixer);
-
-/**
- * dpu_hw_ctl_destroy(): Destroys ctl driver context
- * should be called to free the context
- */
-void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx);
+struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
+				   const struct dpu_ctl_cfg *cfg,
+				   void __iomem *addr,
+				   u32 mixer_count,
+				   const struct dpu_lm_cfg *mixer);
 
 #endif /*_DPU_HW_CTL_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 509dbaa51d87..5e9aad1b2aa2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2020-2022, Linaro Limited
  */
 
+#include <drm/drm_managed.h>
+
 #include <drm/display/drm_dsc_helper.h>
 
 #include "dpu_kms.h"
@@ -188,12 +190,13 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 };
 
-struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
+struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
+				   const struct dpu_dsc_cfg *cfg,
 				   void __iomem *addr)
 {
 	struct dpu_hw_dsc *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -206,8 +209,3 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc)
-{
-	kfree(dsc);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index d5b597ab8c5c..989c88d2449b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,20 +64,24 @@ struct dpu_hw_dsc {
 
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
+ * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: Error code or allocated dpu_hw_dsc context
  */
-struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
-		void __iomem *addr);
+struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
+				   const struct dpu_dsc_cfg *cfg,
+				   void __iomem *addr);
 
 /**
  * dpu_hw_dsc_init_1_2() - initializes the v1.2 DSC hw driver object
+ * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Returns: Error code or allocated dpu_hw_dsc context
  */
-struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
+struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
+				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index 24fe1d98eb86..ba193b0376fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
  */
 
+#include <drm/drm_managed.h>
+
 #include <drm/display/drm_dsc_helper.h>
 
 #include "dpu_kms.h"
@@ -367,12 +369,13 @@ static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
 	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
 }
 
-struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
+struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
+				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr)
 {
 	struct dpu_hw_dsc *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 9419b2209af8..b1da88e2935f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_lm.h"
@@ -68,15 +70,16 @@ static void _setup_dspp_ops(struct dpu_hw_dspp *c,
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 }
 
-struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
-			void __iomem *addr)
+struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
+				     const struct dpu_dspp_cfg *cfg,
+				     void __iomem *addr)
 {
 	struct dpu_hw_dspp *c;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -90,10 +93,3 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp)
-{
-	kfree(dspp);
-}
-
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index bea965681330..3b435690b6cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -81,18 +81,14 @@ static inline struct dpu_hw_dspp *to_dpu_hw_dspp(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
+ * @dev:  Corresponding device for devres management
  * @cfg:  DSPP catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: pointer to structure or ERR_PTR
  */
-struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
-	void __iomem *addr);
-
-/**
- * dpu_hw_dspp_destroy(): Destroys DSPP driver context
- * @dspp: Pointer to DSPP driver context
- */
-void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp);
+struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
+				     const struct dpu_dspp_cfg *cfg,
+				     void __iomem *addr);
 
 #endif /*_DPU_HW_DSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 5b0f6627e29b..08304fc3d1d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -12,6 +12,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_managed.h>
+
 #define INTF_TIMING_ENGINE_EN           0x000
 #define INTF_CONFIG                     0x004
 #define INTF_HSYNC_CTL                  0x008
@@ -547,8 +549,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->enable_compression = dpu_hw_intf_enable_compression;
 }
 
-struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
+				     const struct dpu_intf_cfg *cfg,
+				     void __iomem *addr)
 {
 	struct dpu_hw_intf *c;
 
@@ -557,7 +560,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 		return NULL;
 	}
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -573,9 +576,3 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_intf_destroy(struct dpu_hw_intf *intf)
-{
-	kfree(intf);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 99e21c4137f9..79240fbeeb53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -125,16 +125,12 @@ struct dpu_hw_intf {
 /**
  * dpu_hw_intf_init() - Initializes the INTF driver for the passed
  * interface catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  interface catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  */
-struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_intf_destroy(): Destroys INTF driver context
- * @intf:   Pointer to INTF driver context
- */
-void dpu_hw_intf_destroy(struct dpu_hw_intf *intf);
+struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
+				     const struct dpu_intf_cfg *cfg,
+				     void __iomem *addr);
 
 #endif /*_DPU_HW_INTF_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index d1c3bd8379ea..25af52ab602f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_kms.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hwio.h"
@@ -156,8 +158,9 @@ static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
 	ops->collect_misr = dpu_hw_lm_collect_misr;
 }
 
-struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
+				    const struct dpu_lm_cfg *cfg,
+				    void __iomem *addr)
 {
 	struct dpu_hw_mixer *c;
 
@@ -166,7 +169,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 		return NULL;
 	}
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -180,8 +183,3 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
-{
-	kfree(lm);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 36992d046a53..8835fd106413 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -95,16 +95,12 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
+ * @dev:  Corresponding device for devres management
  * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  */
-struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_lm_destroy(): Destroys layer mixer driver context
- * @lm:   Pointer to LM driver context
- */
-void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm);
+struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
+				    const struct dpu_lm_cfg *cfg,
+				    void __iomem *addr);
 
 #endif /*_DPU_HW_LM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 90e0e05eff8d..ddfa40a959cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -4,6 +4,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hw_mdss.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
@@ -37,12 +39,13 @@ static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
 
-struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
+					     const struct dpu_merge_3d_cfg *cfg,
+					     void __iomem *addr)
 {
 	struct dpu_hw_merge_3d *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -55,8 +58,3 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *hw)
-{
-	kfree(hw);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index 19cec5e88722..c192f02ec1ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -48,18 +48,13 @@ static inline struct dpu_hw_merge_3d *to_dpu_hw_merge_3d(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_merge_3d_init() - Initializes the merge_3d driver for the passed
  * merge3d catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: Error code or allocated dpu_hw_merge_3d context
  */
-struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_merge_3d_destroy - destroys merge_3d driver context
- *	should be called to free the context
- * @pp:   Pointer to PP driver context returned by dpu_hw_merge_3d_init
- */
-void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *pp);
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
+					     const struct dpu_merge_3d_cfg *cfg,
+					     void __iomem *addr);
 
 #endif /*_DPU_HW_MERGE3D_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 437d9e62a841..72292af91a18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -4,6 +4,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hw_mdss.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
@@ -302,12 +304,13 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
-struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
+					     const struct dpu_pingpong_cfg *cfg,
+					     void __iomem *addr)
 {
 	struct dpu_hw_pingpong *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -320,8 +323,3 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp)
-{
-	kfree(pp);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index d3246a9a5808..96eb2b87e7ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -121,18 +121,13 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
 /**
  * dpu_hw_pingpong_init() - initializes the pingpong driver for the passed
  * pingpong catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * Return: Error code or allocated dpu_hw_pingpong context
  */
-struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_pingpong_destroy - destroys pingpong driver context
- *	should be called to free the context
- * @pp:   Pointer to PP driver context returned by dpu_hw_pingpong_init
- */
-void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp);
+struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
+					     const struct dpu_pingpong_cfg *cfg,
+					     void __iomem *addr);
 
 #endif /*_DPU_HW_PINGPONG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b364cf75bb3f..fb8ecfb9b922 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -9,6 +9,7 @@
 #include "dpu_kms.h"
 
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
 
@@ -669,15 +670,17 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 }
 #endif
 
-struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc)
+struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
+				     const struct dpu_sspp_cfg *cfg,
+				     void __iomem *addr,
+				     const struct dpu_ubwc_cfg *ubwc)
 {
 	struct dpu_hw_sspp *hw_pipe;
 
 	if (!addr || !ubwc)
 		return ERR_PTR(-EINVAL);
 
-	hw_pipe = kzalloc(sizeof(*hw_pipe), GFP_KERNEL);
+	hw_pipe = drmm_kzalloc(dev, sizeof(*hw_pipe), GFP_KERNEL);
 	if (!hw_pipe)
 		return ERR_PTR(-ENOMEM);
 
@@ -692,9 +695,3 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 
 	return hw_pipe;
 }
-
-void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx)
-{
-	kfree(ctx);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 085f34bc6b88..5dd4f78d424c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -331,12 +331,15 @@ struct dpu_kms;
 /**
  * dpu_hw_sspp_init() - Initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
+ * @dev:  Corresponding device for devres management
  * @cfg:  Pipe catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * @ubwc: UBWC configuration data
  */
-struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc);
+struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
+				     const struct dpu_sspp_cfg *cfg,
+				     void __iomem *addr,
+				     const struct dpu_ubwc_cfg *ubwc);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index ebc416400382..106540eee5f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -3,6 +3,8 @@
   * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved
   */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hw_mdss.h"
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
@@ -194,15 +196,16 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 }
 
-struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
+				 const struct dpu_wb_cfg *cfg,
+				 void __iomem *addr)
 {
 	struct dpu_hw_wb *c;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -216,8 +219,3 @@ struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_wb_destroy(struct dpu_hw_wb *hw_wb)
-{
-	kfree(hw_wb);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 2d7db2efa3d0..98d1129238cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -72,17 +72,13 @@ struct dpu_hw_wb {
 
 /**
  * dpu_hw_wb_init() - Initializes the writeback hw driver object.
+ * @dev:  Corresponding device for devres management
  * @cfg:  wb_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
  * Return: Error code or allocated dpu_hw_wb context
  */
-struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
-		void __iomem *addr);
-
-/**
- * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
- * @hw_wb:  Pointer to writeback hw driver object
- */
-void dpu_hw_wb_destroy(struct dpu_hw_wb *hw_wb);
+struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
+				 const struct dpu_wb_cfg *cfg,
+				 void __iomem *addr);
 
 #endif /*_DPU_HW_WB_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 48c3f8b6b88f..1e29de32b7c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -816,10 +816,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_kms->hw_vbif[i] = NULL;
 	}
 
-	if (dpu_kms->rm_init)
-		dpu_rm_destroy(&dpu_kms->rm);
-	dpu_kms->rm_init = false;
-
 	dpu_kms->catalog = NULL;
 
 	dpu_kms->hw_mdp = NULL;
@@ -1041,14 +1037,12 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
+	rc = dpu_rm_init(dev, &dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
 		goto err_pm_put;
 	}
 
-	dpu_kms->rm_init = true;
-
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
 					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index f3bdd4f11108..2af1767ada9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -87,7 +87,6 @@ struct dpu_kms {
 	struct drm_private_obj global_state;
 
 	struct dpu_rm rm;
-	bool rm_init;
 
 	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
 	struct dpu_hw_mdp *hw_mdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index e333f4eeafc1..d10025b8f659 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -34,72 +34,8 @@ struct dpu_rm_requirements {
 	struct msm_display_topology topology;
 };
 
-int dpu_rm_destroy(struct dpu_rm *rm)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(rm->dspp_blks); i++) {
-		struct dpu_hw_dspp *hw;
-
-		if (rm->dspp_blks[i]) {
-			hw = to_dpu_hw_dspp(rm->dspp_blks[i]);
-			dpu_hw_dspp_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
-		struct dpu_hw_pingpong *hw;
-
-		if (rm->pingpong_blks[i]) {
-			hw = to_dpu_hw_pingpong(rm->pingpong_blks[i]);
-			dpu_hw_pingpong_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->merge_3d_blks); i++) {
-		struct dpu_hw_merge_3d *hw;
-
-		if (rm->merge_3d_blks[i]) {
-			hw = to_dpu_hw_merge_3d(rm->merge_3d_blks[i]);
-			dpu_hw_merge_3d_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
-		struct dpu_hw_mixer *hw;
-
-		if (rm->mixer_blks[i]) {
-			hw = to_dpu_hw_mixer(rm->mixer_blks[i]);
-			dpu_hw_lm_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->ctl_blks); i++) {
-		struct dpu_hw_ctl *hw;
-
-		if (rm->ctl_blks[i]) {
-			hw = to_dpu_hw_ctl(rm->ctl_blks[i]);
-			dpu_hw_ctl_destroy(hw);
-		}
-	}
-	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
-		dpu_hw_intf_destroy(rm->hw_intf[i]);
-
-	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
-		struct dpu_hw_dsc *hw;
-
-		if (rm->dsc_blks[i]) {
-			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
-			dpu_hw_dsc_destroy(hw);
-		}
-	}
-
-	for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
-		dpu_hw_wb_destroy(rm->hw_wb[i]);
-
-	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++)
-		dpu_hw_sspp_destroy(rm->hw_sspp[i]);
-
-	return 0;
-}
-
-int dpu_rm_init(struct dpu_rm *rm,
+int dpu_rm_init(struct drm_device *dev,
+		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
 		void __iomem *mmio)
 {
@@ -118,7 +54,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);
@@ -131,7 +67,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_merge_3d *hw;
 		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
 
-		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
+		hw = dpu_hw_merge_3d_init(dev, merge_3d, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed merge_3d object creation: err %d\n",
@@ -145,7 +81,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
 
-		hw = dpu_hw_pingpong_init(pp, mmio);
+		hw = dpu_hw_pingpong_init(dev, pp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
@@ -161,7 +97,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
 
-		hw = dpu_hw_intf_init(intf, mmio);
+		hw = dpu_hw_intf_init(dev, intf, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
@@ -174,7 +110,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_wb *hw;
 		const struct dpu_wb_cfg *wb = &cat->wb[i];
 
-		hw = dpu_hw_wb_init(wb, mmio);
+		hw = dpu_hw_wb_init(dev, wb, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed wb object creation: err %d\n", rc);
@@ -187,7 +123,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
+		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);
@@ -200,7 +136,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dspp *hw;
 		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
 
-		hw = dpu_hw_dspp_init(dspp, mmio);
+		hw = dpu_hw_dspp_init(dev, dspp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dspp object creation: err %d\n", rc);
@@ -214,9 +150,9 @@ int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
 		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
-			hw = dpu_hw_dsc_init_1_2(dsc, mmio);
+			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -230,7 +166,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
+		hw = dpu_hw_sspp_init(dev, sspp, mmio, cat->ubwc);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed sspp object creation: err %d\n", rc);
@@ -242,8 +178,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 	return 0;
 
 fail:
-	dpu_rm_destroy(rm);
-
 	return rc ? rc : -EFAULT;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index d62c2edb2460..7199a09f3ce3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -38,22 +38,17 @@ struct dpu_rm {
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
+ * @dev:  Corresponding device for devres management
  * @rm: DPU Resource Manager handle
  * @cat: Pointer to hardware catalog
  * @mmio: mapped register io address of MDP
  * @Return: 0 on Success otherwise -ERROR
  */
-int dpu_rm_init(struct dpu_rm *rm,
+int dpu_rm_init(struct drm_device *dev,
+		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
 		void __iomem *mmio);
 
-/**
- * dpu_rm_destroy - Free all memory allocated by dpu_rm_init
- * @rm: DPU Resource Manager handle
- * @Return: 0 on Success otherwise -ERROR
- */
-int dpu_rm_destroy(struct dpu_rm *rm);
-
 /**
  * dpu_rm_reserve - Given a CRTC->Encoder->Connector display chain, analyze
  *	the use connections and user requirements, specified through related
-- 
2.39.2

