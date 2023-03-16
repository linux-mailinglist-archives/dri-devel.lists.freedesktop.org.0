Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BE6BD672
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B86110ED85;
	Thu, 16 Mar 2023 16:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534310ED7A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:47 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id by8so1170002ljb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saytMIkpGhudVZZGUKLnl/rX4PTDbjaLuv5yYMZgTsw=;
 b=n8vm/miaTM7W4qwoCzaaLSHlpXvxJVajrBjiWoyW/T1AK2b/wBXDrsQeWa3GFF8roF
 eOWSDJ6rmQm5+PBrGKBONxUmOihaSXcjh8rmPtqoh9KWmb2fVpsQiu9hVDAUNjTRjjxD
 sR7KQ8pNXlMm1ILVd+P+36kp3NIA7IOke3glcPEPRLuEs4jE3MAqowz50PP73ra1Rr8P
 5/2wRIV31UTlr5mGTGCKnK8lqU4af1sF2+l9J4X++85+riO6eRbhvLR3YHVK31/3vjI2
 /6spNv6NcwJQZVeP6i87+aqEzXitVbqoQsbv14vkTEauHwMwQD3NoWCNOZuBv7WQYvSf
 UDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=saytMIkpGhudVZZGUKLnl/rX4PTDbjaLuv5yYMZgTsw=;
 b=gJALS0Mn48InjSy8H9wrl1XzdMmb2B380QHo31bIbGX/uViEgK6oIrgUwMPkMvvTWi
 wgt6VNPiCXFsVHzdlN62Zu1hjbs0mkOxyWvq9cQPk29OsCp7lTK3lTaz6aNd0tcgXFjO
 64IbNi4etrWh0FqUP94lamCmFK91OrRXfH1KvBU931FH0GzWAWDo3u16HXV3knQnFXQX
 CoJkSCYhjUsNErida+i/t1Gxs7q85ZJCpZmjanaexPVxe5VkiYwYR0kk3mRmRNNty3+9
 6jqz4EDTG0oI00rVyXxm391mO4tGzd3Y9xomOhPSIyXLBo+dbCrgeQgcoVP0zCftkRJy
 qLzA==
X-Gm-Message-State: AO0yUKXFtSo3pZ11jBfbF1u28velUn22LEZkmAbfewYq1UFNB9E3o7aZ
 pyI9FOZZKd4jmKaHgXAzBaYSCg==
X-Google-Smtp-Source: AK7set+awZDWFqmcjxXZIAfyl8qegSuFFrk/Md32NrZuY4GwgNXXHZFahgY2XR6fQDkYtcnFP7ZjvA==
X-Received: by 2002:a05:651c:516:b0:295:a207:5378 with SMTP id
 o22-20020a05651c051600b00295a2075378mr3373450ljp.9.1678985745521; 
 Thu, 16 Mar 2023 09:55:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v1 02/12] drm/msm/dpu: encoder: simplify debugfs handling
Date: Thu, 16 Mar 2023 19:55:32 +0300
Message-Id: <20230316165542.4109764-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
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

