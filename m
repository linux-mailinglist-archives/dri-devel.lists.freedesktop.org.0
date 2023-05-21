Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9A070AFDC
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 21:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87B10E1F8;
	Sun, 21 May 2023 19:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342910E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 19:22:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f00c33c3d6so6122352e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684696952; x=1687288952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbfXT77wHq9+wy/6x4vsEnIvwEN0VE9/c9ZgZg5ShrY=;
 b=hoFiu88lK0BaCKadBYafTHsNicdZe309ZLytuPyhGD/3v8BGnFP2TGx308tcCfMet4
 ExeixEfk9cL3tU3JQi5BBGUZwrW4Phh/8Ng4znAYO2qkDvSmVE02QEHVNzJueOhiTcBJ
 CbFPnbKCEnAOpEBxcr9I9Z0duOcMrda54joRGQXbiP3UBaoV7Bblw4LqhZSa14URlM/c
 JpGHjDXF5fWWfFbFUoEIfj+D9WRFtQbreLEjk6K7qkFuTOvY4EwBLHab3e9WCPMHc+9o
 Wz68rvJeZutwHXB0SlYYHT9Y9VMPUq/R9YC9NiqbBX7j1toWeTHCrL1dT/u5/P7TR8Be
 9Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684696952; x=1687288952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbfXT77wHq9+wy/6x4vsEnIvwEN0VE9/c9ZgZg5ShrY=;
 b=ZBA1EfwzcbiXtw0xQjKCicXSTgJcL+9qga3v3WTfPjM5evFHoB7Bm1P9e89Ef3z1Tl
 CVYfi3FJz/pWEf/eqmJPcCCJuu/PPWdNlLjjKedhwK21//NvOPuhtt0f4uIhbvPA/wpS
 7Zzq9/amC6G6MlW/381G0KYEvS7wqXN7ZKrkuTqDGZlCh3x8imFVFAUn2T0OpEqv+NJj
 SDGxul+UPz8f4+V/Sg6VEUxUnp+x5dyDoYMAFFqV5IzSaCdl+EErZi6tVyqVazEopZxd
 yfDOQa/A0MK4Sa13lhxFvGrPiSHals7agJspV9Tee6vzDBJFNYGDYs6G7+Z/GPmGaKxS
 iXVA==
X-Gm-Message-State: AC+VfDzjyku4zWRE6Kda6AHgCVDQQN/tL5b18DPzb64JCpcaXzIeQtJO
 5jZpBe/XdOuPilDQds/ceXC+4g==
X-Google-Smtp-Source: ACHHUZ74mVAeNMZyry8dfKsoJFlLz6Nboga4meDTAhBJwyWKCa2TbJe1xsRmmk3fC1WbJzP2sbjN5w==
X-Received: by 2002:ac2:5dcc:0:b0:4f2:520e:f865 with SMTP id
 x12-20020ac25dcc000000b004f2520ef865mr2715691lfq.16.1684696952717; 
 Sun, 21 May 2023 12:22:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a19f80d000000b004edc9da63bdsm692707lff.160.2023.05.21.12.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 12:22:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/3] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
Date: Sun, 21 May 2023 22:22:30 +0300
Message-Id: <20230521192230.9747-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
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

