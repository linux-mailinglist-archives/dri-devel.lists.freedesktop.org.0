Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD070AFBF
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 21:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2F410E1EF;
	Sun, 21 May 2023 19:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C8210E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 19:04:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f37b860173so5716581e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684695885; x=1687287885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbfXT77wHq9+wy/6x4vsEnIvwEN0VE9/c9ZgZg5ShrY=;
 b=LXiEmGbd/ZoKLF3r6fdM2oP6mWwr9KAbZgyk03FtGX27sTMDxbraU7blsgn+6w6VsO
 CFHVG8uTpdjI+ju6MOjl77WXwmPyv+ZTPHjCs0IuM91VdusdUUfH+TjlXnxu4m6d5UZo
 0jA7IU+Ry1Ac3zkbRwYFMN4/7h3cCgPWHyE+DE0AkasH4a70nVCCBjO+Yv5hx3/gT0U8
 A3Ha40S143opyXb6IYz1t3ai7ldF+jLleqkzpmRWZI4h2EsVtDlnjDApkD36sFQBPc59
 t+RlHHnM50ZVI6XCTGYWZM4vPO+Im9ihUj3WkUR+FmgHBY7TIUAY0P6KmpL4Rrahjh7Q
 EfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684695885; x=1687287885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbfXT77wHq9+wy/6x4vsEnIvwEN0VE9/c9ZgZg5ShrY=;
 b=BYxjQq9zIsA/xEUCZX7ERZdIsOS4VyVFqj81fg0eus5uCtamdnosXgEQ7uTWsiLiH/
 1t3pLcbV9dgkGdP8dkl5rUBMhn84dYpx6XIrPLMiyWDH8edVCmqxiqTxi7ht+8S/FQ54
 JTrMISbUNKAiq/P7Jf3xlXsHz7w0gSPuCFDqhmi+GFLfAO3CecUuScx8aZtjmn5HeyOa
 g2W7Wv8hb81zVBh5nJQUd8m9WZ2QBTdnR1qZIIaJyK9xrlC8lDvkSPmWfU2y5CwcICRg
 SBx+XR+clZOCy7Nl+euzZw5UnzoCxujaWy7ZzjUjrvUeEBaoqWhUz6aM+SErnjrmtqlH
 YagA==
X-Gm-Message-State: AC+VfDz79oyZ4UNtb8psrTW9/Or7zSuOVjzIZX2HwB72VsOic6Wpkf/w
 HWQUu8DY4yhKLH9Vw9DfydNpmA==
X-Google-Smtp-Source: ACHHUZ5CnpGNRKDfwg0ehWSc+wGw8MEaBcq35RjEWCn6+J4Fs+ZzOUHLyvas+hSaF8qn3nlOmVplRA==
X-Received: by 2002:a05:6512:4c5:b0:4f3:a485:919a with SMTP id
 w5-20020a05651204c500b004f3a485919amr2498937lfq.57.1684695885397; 
 Sun, 21 May 2023 12:04:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r22-20020ac252b6000000b004f1d884a4efsm694495lfm.242.2023.05.21.12.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 12:04:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
Date: Sun, 21 May 2023 22:04:42 +0300
Message-Id: <20230521190442.8293-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
References: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_debugfs_add_file() for encoder's status file. This changes the
name of the status file from encoder%d/status to just encoder%d.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index af34932729db..0ac68f44ec74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
 
@@ -142,7 +143,6 @@ enum dpu_enc_rc_states {
  * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
  *				all CTL paths
  * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
- * @debugfs_root:		Debug file system root file node
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
@@ -186,7 +186,6 @@ struct dpu_encoder_virt {
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
-	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
 	void (*crtc_frame_event_cb)(void *, u32 event);
@@ -2091,7 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
-	struct dpu_encoder_virt *dpu_enc = s->private;
+	struct drm_debugfs_entry *entry = s->private;
+	struct dpu_encoder_virt *dpu_enc = entry->file.data;
 	int i;
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -2110,48 +2110,31 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
-
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
+static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	char name[12];
+	char *name;
 
 	if (!drm_enc->dev) {
 		DPU_ERROR("invalid encoder or kms\n");
-		return -EINVAL;
+		return;
 	}
 
-	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
+	name = devm_kasprintf(drm_enc->dev->dev, GFP_KERNEL, "encoder%u", drm_enc->base.id);
 
-	/* create overall sub-directory for the encoder */
-	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
-
-	/* don't error check these */
-	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
-
-	return 0;
+	drm_debugfs_add_file(drm_enc->dev, name, _dpu_encoder_status_show, dpu_enc);
 }
 #else
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
+static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
-	return 0;
 }
 #endif
 
 static int dpu_encoder_late_register(struct drm_encoder *encoder)
 {
-	return _dpu_encoder_init_debugfs(encoder);
-}
-
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
+	_dpu_encoder_init_debugfs(encoder);
 
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
+	return 0;
 }
 
 static int dpu_encoder_virt_add_phys_encs(
@@ -2380,7 +2363,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
 };
 
 int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
-- 
2.39.2

