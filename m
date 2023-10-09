Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84A7BEC27
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B0410E2EE;
	Mon,  9 Oct 2023 20:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331EA10E2EA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:35 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso59926361fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885053; x=1697489853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ArTNHECreYuQA115CCTpUIP9lX7NmDsLaxdoYp/EqZs=;
 b=NpOVUTyK47lI1H7zy2J1C/AouKahrs+3nz1xd0F4O3xrEeNq3ZbWcWKKC9l5Ws2ARp
 cv7O/Q3PTPiUZS7lxP0Kj3FaKSQ+qP2pmHu3VmMPSpa0k5srttJXBY3bnU1h4rq4abEH
 Y1bKHAFbqJRilRriA037onAWCPzLwQaIGiu6zYOLNNqF6OfHFriK1lQb8vl+WXUqO1Mx
 fVcG7g4yEW8valRr1Yag6WXUkJtw6dkHc2tRUsWK6TgpkfCQXZsU0vUD3g2fNCLdLSZk
 jqo89dXx+hxl3qp/Z6NKiCNUMSzvR7asj+1dZAQS2wwrnxe7LuTnWAVMiBVRbGeRdQzr
 7v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885053; x=1697489853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ArTNHECreYuQA115CCTpUIP9lX7NmDsLaxdoYp/EqZs=;
 b=wgK/KHdDZc1YelMMUM1KGsBl+FFXTVZHXHcbMjX/5xls+vDvqyxcqM1PwxYEXhzZ1c
 ePGe9M1uax2Zz1pnR54QVAe1KOF1gu/ZkeIrbtNHKolUfOrW52iT8/2HZgXi08uPBuJN
 2YOnJO++u/8SvoO14MLfZiG00tdvAXOMa5fiyMn3WonuYVYkaduQTS/OfNb7lQIIZ+lG
 A1aC79Mzy4nv5Gnz+KMcaUumzf2THF+2VR/xX/XWme846ihgb9FCr+K5dO9CHovggVSP
 ficcXxPSmSEzNuhRS2vio5rgRrsEBylbrVifKtjKCPuvTX9j+p2JvMb6WqF92SNvPgwy
 pERA==
X-Gm-Message-State: AOJu0Yz+BHgRCwrUccYZhUpiXT+eS+wflq0/8RLkt5SSTy7q9eBT5nTF
 fIVXlJpkzUJbfFWQQ6xT13ncn0I4UnmVgyeduy8=
X-Google-Smtp-Source: AGHT+IFtjkuBxGl/3Nes/WDrdrp39PAnSs0zIGl0jOFF7dz7VMinE6ZC8w+igb8Uj57ZYYH5paVm0g==
X-Received: by 2002:a19:f015:0:b0:503:3654:37bd with SMTP id
 p21-20020a19f015000000b00503365437bdmr12804812lfc.45.1696885053426; 
 Mon, 09 Oct 2023 13:57:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 5/5] drm/msm/mdp5: drop split display support
Date: Mon,  9 Oct 2023 23:57:27 +0300
Message-Id: <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
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

The MSM DSI driver has dropped support for calling
mdp_kms_funcs::set_split_display() callback. Drop corresponding callback
from the mdp5 driver together with the rest of the infrastructure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 -------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 -------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ----
 drivers/gpu/drm/msm/msm_kms.h                 |  4 --
 5 files changed, 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index a640af22eafc..e5662412db9b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -158,46 +158,4 @@ void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
 
 	mdp5_cmd_enc->enabled = true;
 }
-
-int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder)
-{
-	struct mdp5_encoder *mdp5_cmd_enc = to_mdp5_encoder(encoder);
-	struct mdp5_kms *mdp5_kms;
-	struct device *dev;
-	int intf_num;
-	u32 data = 0;
-
-	if (!encoder || !slave_encoder)
-		return -EINVAL;
-
-	mdp5_kms = get_kms(encoder);
-	intf_num = mdp5_cmd_enc->intf->num;
-
-	/* Switch slave encoder's trigger MUX, to use the master's
-	 * start signal for the slave encoder
-	 */
-	if (intf_num == 1)
-		data |= MDP5_SPLIT_DPL_UPPER_INTF2_SW_TRG_MUX;
-	else if (intf_num == 2)
-		data |= MDP5_SPLIT_DPL_UPPER_INTF1_SW_TRG_MUX;
-	else
-		return -EINVAL;
-
-	/* Smart Panel, Sync mode */
-	data |= MDP5_SPLIT_DPL_UPPER_SMART_PANEL;
-
-	dev = &mdp5_kms->pdev->dev;
-
-	/* Make sure clocks are on when connectors calling this function. */
-	pm_runtime_get_sync(dev);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_UPPER, data);
-
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_LOWER,
-		   MDP5_SPLIT_DPL_LOWER_SMART_PANEL);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_EN, 1);
-	pm_runtime_put_sync(dev);
-
-	return 0;
-}
 #endif /* CONFIG_DRM_MSM_DSI */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index 79d67c495780..7c2092ca4040 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -274,48 +274,6 @@ u32 mdp5_encoder_get_framecount(struct drm_encoder *encoder)
 	return mdp5_read(mdp5_kms, REG_MDP5_INTF_FRAME_COUNT(intf));
 }
 
-int mdp5_vid_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder)
-{
-	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
-	struct mdp5_encoder *mdp5_slave_enc = to_mdp5_encoder(slave_encoder);
-	struct mdp5_kms *mdp5_kms;
-	struct device *dev;
-	int intf_num;
-	u32 data = 0;
-
-	if (!encoder || !slave_encoder)
-		return -EINVAL;
-
-	mdp5_kms = get_kms(encoder);
-	intf_num = mdp5_encoder->intf->num;
-
-	/* Switch slave encoder's TimingGen Sync mode,
-	 * to use the master's enable signal for the slave encoder.
-	 */
-	if (intf_num == 1)
-		data |= MDP5_SPLIT_DPL_LOWER_INTF2_TG_SYNC;
-	else if (intf_num == 2)
-		data |= MDP5_SPLIT_DPL_LOWER_INTF1_TG_SYNC;
-	else
-		return -EINVAL;
-
-	dev = &mdp5_kms->pdev->dev;
-	/* Make sure clocks are on when connectors calling this function. */
-	pm_runtime_get_sync(dev);
-
-	/* Dumb Panel, Sync mode */
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_UPPER, 0);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_LOWER, data);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_EN, 1);
-
-	mdp5_ctl_pair(mdp5_encoder->ctl, mdp5_slave_enc->ctl, true);
-
-	pm_runtime_put_sync(dev);
-
-	return 0;
-}
-
 void mdp5_encoder_set_intf_mode(struct drm_encoder *encoder, bool cmd_mode)
 {
 	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..22f2d2ec4a9c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -190,19 +190,6 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 		mdp5_smp_complete_commit(mdp5_kms->smp, &global_state->smp);
 }
 
-static int mdp5_set_split_display(struct msm_kms *kms,
-		struct drm_encoder *encoder,
-		struct drm_encoder *slave_encoder,
-		bool is_cmd_mode)
-{
-	if (is_cmd_mode)
-		return mdp5_cmd_encoder_set_split_display(encoder,
-							slave_encoder);
-	else
-		return mdp5_vid_encoder_set_split_display(encoder,
-							  slave_encoder);
-}
-
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
 static void mdp5_kms_destroy(struct msm_kms *kms)
@@ -275,7 +262,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
 		.get_format      = mdp_get_format,
-		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 29bf11f08601..ee68e9913f8c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -291,8 +291,6 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 
 struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 		struct mdp5_interface *intf, struct mdp5_ctl *ctl);
-int mdp5_vid_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder);
 void mdp5_encoder_set_intf_mode(struct drm_encoder *encoder, bool cmd_mode);
 int mdp5_encoder_get_linecount(struct drm_encoder *encoder);
 u32 mdp5_encoder_get_framecount(struct drm_encoder *encoder);
@@ -303,8 +301,6 @@ void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *adjusted_mode);
 void mdp5_cmd_encoder_disable(struct drm_encoder *encoder);
 void mdp5_cmd_encoder_enable(struct drm_encoder *encoder);
-int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder);
 #else
 static inline void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 					     struct drm_display_mode *mode,
@@ -317,11 +313,6 @@ static inline void mdp5_cmd_encoder_disable(struct drm_encoder *encoder)
 static inline void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
 {
 }
-static inline int mdp5_cmd_encoder_set_split_display(
-	struct drm_encoder *encoder, struct drm_encoder *slave_encoder)
-{
-	return -EINVAL;
-}
 #endif
 
 #endif /* __MDP5_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 44aa435d68ce..0641f6111b93 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -105,10 +105,6 @@ struct msm_kms_funcs {
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);
-	int (*set_split_display)(struct msm_kms *kms,
-			struct drm_encoder *encoder,
-			struct drm_encoder *slave_encoder,
-			bool is_cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.39.2

