Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A3485C21
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C4E10E3F3;
	Wed,  5 Jan 2022 23:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39B510E3E9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:10:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h2so1171645lfv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XphhH0V3XTsT3U3EruqPNJqssblwVHA/YCk1rgg6+kI=;
 b=P1eTDHjLnqM5lseoBVT4PPTWkXwgAyiUZtzsqEkORJ8AJLpT8YqzHWdBw7RtlJOqiU
 ifMMxwmGR7NyEZ9zkLarwErkVVsFQEUaqWTrod7uGMi8ucIXNcWc8KYDE6eB/yuINRbx
 aUQWQDvZ7JK/vzYMiUaELFjXYfiqAmCrZUpb1YM5irYayZ7xv2oumlP/oWGm/QGB4OV7
 b0OwBZQr2tvpm640zbo2pJBIKC4knUPS+pm9qPOqRnDGA8J8Bmg5Mq9e86sDaUXzokJK
 GBju6q5Hs0NFrk0VqMUsQaknt212JZjP7kxeJxR6zNK8K6Mj4KvteI/O975c/p7w4Oee
 KXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XphhH0V3XTsT3U3EruqPNJqssblwVHA/YCk1rgg6+kI=;
 b=IGHK1vg8NLsd7h5LUwohFHByJtZzO4wmR05KMYvz0C35Dca/qoADOpHylxm+bvgbPO
 ETSvtF1oo6lToh0EwxZTMkF64Nn2vNFxMu9xfqt60yq4tH9PPcg2QXdm68fmmrkp2o59
 JOWd4K5o5PUuaxvPhQsrWk5luyzmtDK9484h8KfTWFyw2nNYpBE25bfdHFHxBolvCNA+
 +BrTp3UQzIVVzQA3APi84H/PgBtTTJNrqTl+dEhi+hG4xwrn66Z6LTOZQWfqM2V0cqtb
 SqW0jbHVbHrcNQPDz5OvOt7O8Jobh+G5Vd85pciLE1iDxN3c4oQwK+tk043QkqskM4Rq
 iXcg==
X-Gm-Message-State: AOAM531+s2ptsbeY4zdZ0tbZqGHnVP/BPZ0WElKsD5wn9UEGBa9xVf6z
 yqsw8+ONNU2onlSRYZctcqVLbw==
X-Google-Smtp-Source: ABdhPJwiAQ2aUsDUWqoUINZXM1TN91GYJCt3dR3cLRiUYlG4IuDq9awuMNGw+yiBFFCvgN6jp0Ye/Q==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id
 k12mr2966070lfv.461.1641424238191; 
 Wed, 05 Jan 2022 15:10:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:10:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 4/5] drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
Date: Thu,  6 Jan 2022 02:10:30 +0300
Message-Id: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
(and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
use dpu_hw_intf directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 11 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  9 ++++++---
 3 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 3568be80dab5..230d122fa43b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -78,7 +78,6 @@ struct dpu_hw_intf_ops {
 };
 
 struct dpu_hw_intf {
-	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 
 	/* intf */
@@ -90,16 +89,6 @@ struct dpu_hw_intf {
 	struct dpu_hw_intf_ops ops;
 };
 
-/**
- * to_dpu_hw_intf - convert base object dpu_hw_base to container
- * @hw: Pointer to base hardware block
- * return: Pointer to hardware block container
- */
-static inline struct dpu_hw_intf *to_dpu_hw_intf(struct dpu_hw_blk *hw)
-{
-	return container_of(hw, struct dpu_hw_intf, base);
-}
-
 /**
  * dpu_hw_intf_init(): Initializes the intf driver for the passed
  * interface idx.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 8df21a46308e..bf4d72356a12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -74,13 +74,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_ctl_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->intf_blks); i++) {
-		struct dpu_hw_intf *hw;
-
-		if (rm->intf_blks[i]) {
-			hw = to_dpu_hw_intf(rm->intf_blks[i]);
-			dpu_hw_intf_destroy(hw);
-		}
+	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++) {
+		if (rm->hw_intf[i])
+			dpu_hw_intf_destroy(rm->hw_intf[i]);
 	}
 
 	return 0;
@@ -179,7 +175,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
 			goto fail;
 		}
-		rm->intf_blks[intf->id - INTF_0] = &hw->base;
+		rm->hw_intf[intf->id - INTF_0] = hw;
 	}
 
 	for (i = 0; i < cat->ctl_count; i++) {
@@ -593,8 +589,3 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
-
-struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
-{
-	return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ee50f6651b6e..9b13200a050a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -18,14 +18,14 @@ struct dpu_global_state;
  * @pingpong_blks: array of pingpong hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
- * @intf_blks: array of intf hardware resources
+ * @hw_intf: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
-	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
+	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 };
@@ -90,7 +90,10 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
  * @rm: DPU Resource Manager handle
  * @intf_idx: INTF's index
  */
-struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx);
+static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
+{
+	return rm->hw_intf[intf_idx - INTF_0];
+}
 
 #endif /* __DPU_RM_H__ */
 
-- 
2.34.1

