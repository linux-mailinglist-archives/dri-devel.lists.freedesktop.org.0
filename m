Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEEF7BEA16
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326FE10E2CE;
	Mon,  9 Oct 2023 18:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D538C10E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:50:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso6429730e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696877452; x=1697482252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJl8C6IXpPDsexf1/6XSUISrlVEE9TRaYydcmDxqvy4=;
 b=A8uz6x3wGyCVglC/UgOWimKKRzkkEmvpt7qGkunmlCkKyGKv6V60I0N5jn55Obuh02
 PWsCVOXyUNeYECE1FqoYbNlZZclwJtx4FxFL5+X6drTkt78fWuOXhXUye4XMnXYq10xu
 rQrfsrm/bJKhMmqG4CSQn4e/vC8YghIl7227WfYAgo1n4MNM46blt5kEucZUtZRL9mPL
 5VZ6YeO9jb/pyb93PCUHsRanim7gAre9vX+NoFS/420H0fkOxyvhwc0CshOZnBqJfQrh
 h5aKbtIyQkxkdytHz6b1pFnbFjzq2T2RPa2gCq8kco+hWd8Sa6PxhkQLN/oS3W4iARmj
 yJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696877452; x=1697482252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJl8C6IXpPDsexf1/6XSUISrlVEE9TRaYydcmDxqvy4=;
 b=uEOAyGYiGTTt8OZL3bOiCkGv9qN+F2S5gDjeSMxfDB6E1XKqrAprbGzieL5B7pmUqA
 K8woeCV/HUI4qvPmZ8RKn48h93EMMa+g1VcDHAUffqzse1DUeD4ganpN8ACmfyTkrz1q
 ZwwP+2eUPFGBCK+FRoysngsg8pq14StcLEP8mp1P26joU0RCv7h0HayWi5TAaO2483FU
 HbWEjHXZlMF86kzcKoU7aX6RsWZxyQqb3bYGyg5RpunPvYGsg+Mp8F8ekQvblzQm5MjD
 CVHGH3MaGNiWZBXWJ31Nr4uXL9dj+sWJnERbiUQsh7sdeP3SZ2CXSaNH11b5D12BKh7m
 W1Mg==
X-Gm-Message-State: AOJu0Yw4GHguWyvgFVcNBhBcWMS48sG3SwMR1L76yqwVemfPrngdcruZ
 0giZKuB6Zkmv3OLy59/OFYs7Pw==
X-Google-Smtp-Source: AGHT+IGoylA7fdS9Jxzk9pg6DYBL1YPVHt1uyV4wEaPH95vEW5x7eyzqz91b+mbkdC+++yNVfr8cvw==
X-Received: by 2002:a19:9153:0:b0:503:2089:d3b8 with SMTP id
 y19-20020a199153000000b005032089d3b8mr12591134lfj.8.1696877452021; 
 Mon, 09 Oct 2023 11:50:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056512040700b00501ce0cacb6sm1529262lfk.188.2023.10.09.11.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:50:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/3] drm/msm/dpu: move encoder status to standard encoder
 debugfs dir
Date: Mon,  9 Oct 2023 21:50:48 +0300
Message-Id: <20231009185048.2758954-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
References: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as we have standard per-encoder debugfs directory, move DPU encoder
status file to that directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..498983e62f7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -184,7 +184,6 @@ struct dpu_encoder_virt {
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
-	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
 	void (*crtc_frame_event_cb)(void *, u32 event);
@@ -2108,7 +2107,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
-	struct dpu_encoder_virt *dpu_enc = s->private;
+	struct drm_encoder *drm_enc = s->private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i;
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -2130,48 +2130,16 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
+static void dpu_encoder_debugfs_init(struct drm_encoder *drm_enc, struct dentry *root)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	char name[12];
-
-	if (!drm_enc->dev) {
-		DPU_ERROR("invalid encoder or kms\n");
-		return -EINVAL;
-	}
-
-	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
-
-	/* create overall sub-directory for the encoder */
-	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
-
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
-
-	return 0;
+			    root, drm_enc, &_dpu_encoder_status_fops);
 }
 #else
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
-{
-	return 0;
-}
+#define dpu_encoder_debugfs_init NULL
 #endif
 
-static int dpu_encoder_late_register(struct drm_encoder *encoder)
-{
-	return _dpu_encoder_init_debugfs(encoder);
-}
-
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
@@ -2355,8 +2323,7 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
-		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
+		.debugfs_init = dpu_encoder_debugfs_init,
 };
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.39.2

