Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FE6C273B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433310E6B7;
	Tue, 21 Mar 2023 01:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABD210E6B0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j11so17185845lfg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saytMIkpGhudVZZGUKLnl/rX4PTDbjaLuv5yYMZgTsw=;
 b=rp4+T68S8glKGvufNTTwvL6fTJ2o5TiLoEUS1Qc/U2vuYYnVgeRKL5WeMisPojm2cf
 fbWmiJd0VavdrygU0HbPI9gDBIR2gtW3Ty1iVkgDHTkQ6LI0BQ0JfWfT4dt1HUu4o9Bl
 59dWjVGdb6SF6UV2k0/s+ly+857Mkt6SYGFFolEEEaZGcofazd+Cn/q3xIE2r/kANIcH
 WzJ9QCgYnskhfzn1+Oby7h6jzhS+aJ1UT3UCYQM3bFQ6gdkEoWGp2PsCH0TYghbrUXfe
 pfStCFoUVUQUfZvPiaJ0HVyBsifr+jPGQQfyJXSa6/4aVkw7jazG2mRuPCexAi8QeL8K
 R+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=saytMIkpGhudVZZGUKLnl/rX4PTDbjaLuv5yYMZgTsw=;
 b=ukrfw6q1VKHS08menpNdi8eUo76qh1QGzQO7R8F0MPvnVOfl2J9s6CDSV+YDgcVLHa
 6Xy+zyRZv3SIzWyPNWa2sdT6NvL4RzQKvnp73SQM4jfbQVShWoQSd9mStOIJxPHQUEyT
 93wjzx5+DgYSO0DSu3ssEWijSu8YsFaaGNQmc3TUuKTenEkEsSy+QY+TAaonxENJeE/A
 sTY0BKMUInndgmeruJW9mBvjVwbsBP4RkvtQkOxJyYC3bCqxnYR1vxENjeuFD6fM37Ma
 x1oqHAnIwV8wbYc41oZwOX4JTM5BeAByhFvAYVmUo5XinQHLF4mcvGCbDWWRuFqFrUfJ
 lvQQ==
X-Gm-Message-State: AO0yUKWFE+dpSFWW6VhOhRh3NigghO1AHJFLfdcv7NDGizJWOcgkuSHG
 Grwgqzvd+1Mprcl9Dzvu18/lTA==
X-Google-Smtp-Source: AK7set/YEBcHqrmDBTGPEklQ8uCa19L5EA4yHv5pswCWXxcbT2hviesVDI4Ad1FMcaHvR+3y5k6Few==
X-Received: by 2002:ac2:41c8:0:b0:4dd:ad88:ba65 with SMTP id
 d8-20020ac241c8000000b004ddad88ba65mr205720lfi.67.1679361504808; 
 Mon, 20 Mar 2023 18:18:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 03/13] drm/msm/dpu: encoder: simplify debugfs handling
Date: Tue, 21 Mar 2023 04:18:11 +0300
Message-Id: <20230321011821.635977-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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

As the debugfs is fully cleared on drm device removal, drop the
encoder-specific cleanup function, remove debugfs_root from dpu_encoder
struct and also remove phys_encoder late_register() ops which has been
unused since the driver being added.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 +++----------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ---
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 97d8d777f178..28729c77364f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -142,7 +142,6 @@ enum dpu_enc_rc_states {
  * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
  *				all CTL paths
  * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
- * @debugfs_root:		Debug file system root file node
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
@@ -186,7 +185,6 @@ struct dpu_encoder_virt {
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
-	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
 	void (*crtc_frame_event_cb)(void *, u32 event);
@@ -2134,7 +2132,7 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i;
+	struct dentry *debugfs_root;
 
 	char name[DPU_NAME_SIZE];
 
@@ -2146,18 +2144,12 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
 
 	/* create overall sub-directory for the encoder */
-	dpu_enc->debugfs_root = debugfs_create_dir(name,
+	debugfs_root = debugfs_create_dir(name,
 			drm_enc->dev->primary->debugfs_root);
 
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++)
-		if (dpu_enc->phys_encs[i]->ops.late_register)
-			dpu_enc->phys_encs[i]->ops.late_register(
-					dpu_enc->phys_encs[i],
-					dpu_enc->debugfs_root);
+		debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
 
 	return 0;
 }
@@ -2173,13 +2165,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
 	return _dpu_encoder_init_debugfs(encoder);
 }
 
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
-
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
-}
-
 static int dpu_encoder_virt_add_phys_encs(
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
@@ -2406,7 +2391,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
 };
 
 int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..9e29079a6fc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -63,7 +63,6 @@ struct dpu_encoder_phys;
 /**
  * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
  *	the containing virtual encoder.
- * @late_register:		DRM Call. Add Userspace interfaces, debugfs.
  * @prepare_commit:		MSM Atomic Call, start of atomic commit sequence
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
@@ -93,8 +92,6 @@ struct dpu_encoder_phys;
  */
 
 struct dpu_encoder_phys_ops {
-	int (*late_register)(struct dpu_encoder_phys *encoder,
-			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
-- 
2.30.2

