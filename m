Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E04801522
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E071210E968;
	Fri,  1 Dec 2023 21:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAC410E96C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:18:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9e9c2989dso5373101fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465533; x=1702070333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzvBTqAbtQPAJxPKFFOGdIeQs7KrLc2Oz1IAsyeUgBY=;
 b=GX5xVSKCxb4IIgXBcFzwcEMSbgrWV57mhnl/Sq7bprBlFBn/sGMK9pWyhOpvn5Y4Oq
 0MuZ6LjPBMnJ2YjDai3+zzSbQDM6s4Gz5eCbGt2gPSm46WnL46OPjRRjqmof/CUvjw4/
 Ng2Ht7A6CujUjdXwAPGYWJjXOr8f6GJb/ItGISUSUvZzw0nU4umyymMPu+pr/MXPGOQ9
 2Zo/1q0gB+k4667P34mnVspg2ntGNwgT2j2teN6ncczA/PsvIKu0/2CjU5bbNTT3qbLR
 PqEcXGx9bKrKuYDL1dLxQzP+exxGLnNagXP3dVBeVhKvx/axPDfstZGHdHdTC4SCxJCt
 YIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465533; x=1702070333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzvBTqAbtQPAJxPKFFOGdIeQs7KrLc2Oz1IAsyeUgBY=;
 b=cRy6XbcDduMGXsbnTl4QnolMtPpYlOBGv7eNexrr9awUrJzoZ1h7Ez8iutyaQfykWx
 zKh4Fe97xeKkZSCJ2kWU84STxAtAS1ZEPpYfJTDGTthCwjXYZbTFYZZnaZHUkO91RSaC
 X3bQuZK7JZyoOuzuPdPw8XALa6AFP5coPxnAE9kClOMF77ka68Yw3NKu6snL2dVQVdme
 Xr49wkr9ZxwmBUi5eeaApFMvXQr8QysvGasmdVcO7R8COMPsfRldAeS3bfLU+mm1GNJJ
 5Zaf8N6YZiAf4ZiTWqSqYTnLccoqtWJb+p43V3IaVVl6gHKHtP7tbEKqqqE0J+KCMQPc
 uQJw==
X-Gm-Message-State: AOJu0YwD1xPhp3K1Gtmb298jt9+SjD9//6j9LBSo/jVxkJROHk+pctga
 e9lajEZYC1AssusSwd8QuzeBDA==
X-Google-Smtp-Source: AGHT+IGKb2JtwQGnY4tlkQQtgjvnrBu7eI5XAQzKD/z+m0MyZKP5hcjU0N86LHj515HRPg8eglvcnQ==
X-Received: by 2002:a2e:97ca:0:b0:2c9:c50c:b116 with SMTP id
 m10-20020a2e97ca000000b002c9c50cb116mr1174519ljj.14.1701465532967; 
 Fri, 01 Dec 2023 13:18:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 05/13] drm/msm/dpu: use devres-managed allocation for MDP
 TOP
Date: Sat,  2 Dec 2023 00:18:37 +0300
Message-Id: <20231201211845.1026967-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_kzalloc to create MDP TOP structure. This allows us to remove
corresponding kfree and drop dpu_hw_mdp_destroy() function.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 24e734768a72..05e48cf4ec1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_top.h"
@@ -247,16 +249,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
-struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
+				      const struct dpu_mdp_cfg *cfg,
+				      void __iomem *addr,
+				      const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_mdp *mdp;
 
 	if (!addr)
 		return ERR_PTR(-EINVAL);
 
-	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
+	mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp)
 		return ERR_PTR(-ENOMEM);
 
@@ -271,9 +274,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
 
 	return mdp;
 }
-
-void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
-{
-	kfree(mdp);
-}
-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 8b1463d2b2f0..6f3dc98087df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -145,13 +145,15 @@ struct dpu_hw_mdp {
 
 /**
  * dpu_hw_mdptop_init - initializes the top driver for the passed config
+ * @dev:  Corresponding device for devres management
  * @cfg:  MDP TOP configuration from catalog
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
+				      const struct dpu_mdp_cfg *cfg,
+				      void __iomem *addr,
+				      const struct dpu_mdss_cfg *m);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e1fbac351fc2..c675c9a76c74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -821,8 +821,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 
 	dpu_kms->catalog = NULL;
 
-	if (dpu_kms->hw_mdp)
-		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
 	dpu_kms->hw_mdp = NULL;
 }
 
@@ -1105,7 +1103,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
-	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
+	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
+					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
-- 
2.39.2

