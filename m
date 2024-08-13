Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743209502DF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26C610E2F0;
	Tue, 13 Aug 2024 10:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J//+aEs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380C10E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42817bee9e8so39958395e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546304; x=1724151104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jy+nd+TAf4IESSyfkjPEUCiVjjMM3g7sHyZYE6lpLK4=;
 b=J//+aEs38T1Zh0K7A8Mi2lcuuVDQcz2uoOMtGIjLdl46F2A2n7E19bslubd8RdQrQN
 guWhuHKOOm11PLiHnSVy96kICdBURMnlsJUVGvEi7MWq0+Cj8nh6ogauPqGrv+3u4fMU
 Ak8oPLlAqNhLgNMLrevrLSj5SKEjjRvvZTNq0+EUsp8p1hy0HokKFsy3tAdVwW/jZ7uz
 Z3J7oYVZcZTuHwcz/3loMlMosiCMk/HSvVb/CvG8Vn4aqdvBeogzxWm6+wys5aUONSaS
 hHA+ouwfhuPyO4Q/n9yXnSkUk7F40qLfESJkJq0iLOWzXb8W6J0ZTTuniShXa3RNVElh
 q2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546304; x=1724151104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jy+nd+TAf4IESSyfkjPEUCiVjjMM3g7sHyZYE6lpLK4=;
 b=lf6HoJhfDIdbDLPIzLm/nLJAbNKAAijBvfPpwlegTcU5pRK6u559p6DFUyWxbXpOEU
 HC4lIRxf+ySReOZg/easrLjhRp2/H389xU0hgcfD50A92e6a1dBPz4Fvnxg0MOlshNwx
 qT/+DdA/ZjrbDF5IxKZFaOxHNVDgsYVsSOTf2d4KPelkizPlVIQel+JMVyScKIgXbzUy
 ivVtkiHKE5Sd5iVIgYYEOboMVEOVa2pZNbIfBBzRu8YoW0igd/MFQ2w+lCu1BbsZcJMM
 CFWE3AWsl7yBNO1ByVlBY71Rznt3qNn0hyOMXXErwMudyVlUuqAnMOlC134ShgJHB1U2
 /cjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL8WJq9DWrSC2vsNfcdjR+jyPMtqN9c0lvt6dqEvJbB03cmP+pOes/JJ4T+y9O7+b1sjaYKwRPPlaFYZOoQq60fv9ehVUs0hLsGyLqfuoI
X-Gm-Message-State: AOJu0YxmQ/T2zhC9Z0q1SoXnwdBaAYNxdR9xKMBAh6wywuelh8ABN5lo
 F2+uuhY1XOaNc1/dr4mTeiId4VkmMLK1bafr1KL602cbwMmlmqV6vX82M5g4
X-Google-Smtp-Source: AGHT+IF3l5a4JzrfLhkKB4hv+VwVgn6Mbv1kVLmbzNJj3J6TXJA+MNrPOXrNN/qld+ZDEq9xJpiUQQ==
X-Received: by 2002:a05:600c:474d:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-429d47f1e4emr20048745e9.6.1723546304134; 
 Tue, 13 Aug 2024 03:51:44 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 04/17] drm/vkms: Allow to configure multiple CRTCs
Date: Tue, 13 Aug 2024 12:44:15 +0200
Message-ID: <20240813105134.17439-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a list of CRTC configurations to vkms_config and add as many CRTCs
as configured during output initialization.

For backwards compatibility, create a single CRTC in the default
configuration.

Since writeback support, vblank and composer states are now per CRTC,
extract all the fields to the vkms_crtc structure and allow each
vkms_device to have a list of CRTCs.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  | 30 ++++----
 drivers/gpu/drm/vkms/vkms_config.c    | 54 ++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h    | 15 +++-
 drivers/gpu/drm/vkms/vkms_crtc.c      | 99 ++++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_drv.c       | 10 ++-
 drivers/gpu/drm/vkms/vkms_drv.h       | 35 +++++++---
 drivers/gpu/drm/vkms/vkms_output.c    | 38 +++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 27 ++++----
 8 files changed, 197 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..b1723cf02ed3 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -306,13 +306,13 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool crc_pending, wb_pending;
 	u64 frame_start, frame_end;
 	u32 crc32 = 0;
 	int ret;
 
-	spin_lock_irq(&out->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	frame_start = crtc_state->frame_start;
 	frame_end = crtc_state->frame_end;
 	crc_pending = crtc_state->crc_pending;
@@ -336,7 +336,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->gamma_lut.base = NULL;
 	}
 
-	spin_unlock_irq(&out->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	/*
 	 * We raced with the vblank hrtimer and previous work already computed
@@ -354,10 +354,10 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
+		drm_writeback_signal_completion(&vkms_crtc->wb_connector, 0);
+		spin_lock_irq(&vkms_crtc->composer_lock);
 		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
+		spin_unlock_irq(&vkms_crtc->composer_lock);
 	}
 
 	/*
@@ -407,31 +407,31 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
 {
 	bool old_enabled;
 
 	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+		drm_crtc_vblank_get(&vkms_crtc->base);
 
-	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+	spin_lock_irq(&vkms_crtc->lock);
+	old_enabled = vkms_crtc->composer_enabled;
+	vkms_crtc->composer_enabled = enabled;
+	spin_unlock_irq(&vkms_crtc->lock);
 
 	if (old_enabled)
-		drm_crtc_vblank_put(&out->crtc);
+		drm_crtc_vblank_put(&vkms_crtc->base);
 }
 
 int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	bool enabled = false;
 	int ret = 0;
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	vkms_set_composer(out, enabled);
+	vkms_set_composer(vkms_crtc, enabled);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 6ab8091bf72f..3af750071f04 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -17,6 +17,7 @@ struct vkms_config *vkms_config_create(char *dev_name)
 		return ERR_PTR(-ENOMEM);
 
 	config->dev_name = dev_name;
+	config->crtcs = (struct list_head)LIST_HEAD_INIT(config->crtcs);
 
 	return config;
 }
@@ -26,20 +27,29 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_overlay)
 {
 	struct vkms_config *config;
+	struct vkms_config_crtc *crtc_cfg;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
 	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
 
+	crtc_cfg = vkms_config_add_crtc(config, enable_writeback);
+	if (IS_ERR(crtc_cfg))
+		return ERR_CAST(crtc_cfg);
+
 	return config;
 }
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
+
+	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
+		vkms_config_destroy_crtc(config, crtc_cfg);
+
 	kfree(config);
 }
 
@@ -48,12 +58,20 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	struct vkms_config_crtc *crtc_cfg;
+	int n;
 
 	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
 
+	n = 0;
+	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, list) {
+		seq_printf(m, "crtc(%d).writeback=%d\n", n,
+			   crtc_cfg->writeback);
+		n++;
+	}
+
 	return 0;
 }
 
@@ -66,3 +84,35 @@ void vkms_config_debugfs_init(struct vkms_device *vkms_device)
 	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
+
+struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
+					      bool enable_writeback)
+{
+	struct vkms_config_crtc *crtc_cfg;
+
+	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
+	if (!crtc_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	crtc_cfg->writeback = enable_writeback;
+
+	crtc_cfg->index = 0;
+	if (!list_empty(&config->crtcs)) {
+		struct vkms_config_crtc *last;
+
+		last = list_last_entry(&config->crtcs, struct vkms_config_crtc,
+				       list);
+		crtc_cfg->index = last->index + 1;
+	}
+
+	list_add_tail(&crtc_cfg->list, &config->crtcs);
+
+	return crtc_cfg;
+}
+
+void vkms_config_destroy_crtc(struct vkms_config *config,
+			      struct vkms_config_crtc *crtc_cfg)
+{
+	list_del(&crtc_cfg->list);
+	kfree(crtc_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index ba06aad32799..bc40a0e3859a 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,15 +3,22 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/list.h>
 #include <linux/types.h>
 
 struct vkms_device;
 
+struct vkms_config_crtc {
+	struct list_head list;
+	unsigned int index;
+	bool writeback;
+};
+
 struct vkms_config {
 	char *dev_name;
-	bool writeback;
 	bool cursor;
 	bool overlay;
+	struct list_head crtcs;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -26,4 +33,10 @@ void vkms_config_destroy(struct vkms_config *config);
 /* DebugFS */
 void vkms_config_debugfs_init(struct vkms_device *vkms_device);
 
+/* CRTCs */
+struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
+					      bool enable_writeback);
+void vkms_config_destroy_crtc(struct vkms_config *config,
+			      struct vkms_config_crtc *crtc_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 40b4d084e3ce..41ab8f47331c 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -11,35 +11,34 @@
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
-	struct vkms_output *output = container_of(timer, struct vkms_output,
-						  vblank_hrtimer);
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_crtc *vkms_crtc = timer_to_vkms_crtc(timer);
+	struct drm_crtc *crtc = &vkms_crtc->base;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
 	bool ret, fence_cookie;
 
 	fence_cookie = dma_fence_begin_signalling();
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
+	ret_overrun = hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
+					  vkms_crtc->period_ns);
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
+	spin_lock(&vkms_crtc->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
-	state = output->composer_state;
-	spin_unlock(&output->lock);
+	state = vkms_crtc->composer_state;
+	spin_unlock(&vkms_crtc->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && vkms_crtc->composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
 		 * has read the data
 		 */
-		spin_lock(&output->composer_lock);
+		spin_lock(&vkms_crtc->composer_lock);
 		if (!state->crc_pending)
 			state->frame_start = frame;
 		else
@@ -47,9 +46,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 					 state->frame_start, frame);
 		state->frame_end = frame;
 		state->crc_pending = true;
-		spin_unlock(&output->composer_lock);
+		spin_unlock(&vkms_crtc->composer_lock);
 
-		ret = queue_work(output->composer_workq, &state->composer_work);
+		ret = queue_work(vkms_crtc->composer_workq, &state->composer_work);
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
@@ -62,32 +61,30 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
 
-	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	out->vblank_hrtimer.function = &vkms_vblank_simulate;
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	vkms_crtc->vblank_hrtimer.function = &vkms_vblank_simulate;
+	vkms_crtc->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns, HRTIMER_MODE_REL);
 
 	return 0;
 }
 
 static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
-	hrtimer_cancel(&out->vblank_hrtimer);
+	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
 }
 
 static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      int *max_error, ktime_t *vblank_time,
 				      bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -95,7 +92,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 		return true;
 	}
 
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+	*vblank_time = READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
 		return true;
@@ -107,7 +104,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	 * the vblank core expects. Therefore we need to always correct the
 	 * timestampe by one frame.
 	 */
-	*vblank_time -= output->period_ns;
+	*vblank_time -= vkms_crtc->period_ns;
 
 	return true;
 }
@@ -233,18 +230,18 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	/* This lock is held across the atomic commit to block vblank timer
 	 * from scheduling vkms_composer_worker until the composer is updated
 	 */
-	spin_lock_irq(&vkms_output->lock);
+	spin_lock_irq(&vkms_crtc->lock);
 }
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -259,9 +256,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_crtc->composer_state = to_vkms_crtc_state(crtc->state);
 
-	spin_unlock_irq(&vkms_output->lock);
+	spin_unlock_irq(&vkms_crtc->lock);
 }
 
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
@@ -272,30 +269,38 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor)
+struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor,
+				 unsigned int index)
 {
-	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
-	int ret;
+	struct vkms_crtc *crtc;
 
-	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
-					 &vkms_crtc_funcs, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init CRTC\n");
-		return ret;
+	crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base, primary,
+					   cursor, &vkms_crtc_funcs, NULL);
+	if (IS_ERR(crtc)) {
+		DRM_ERROR("Failed to alloc CRTC\n");
+		return crtc;
 	}
 
-	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
+	crtc->base.index = index;
+	primary->possible_crtcs = drm_crtc_mask(&crtc->base);
+	if (cursor)
+		cursor->possible_crtcs = drm_crtc_mask(&crtc->base);
 
-	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
+	INIT_LIST_HEAD(&crtc->list);
 
-	spin_lock_init(&vkms_out->lock);
-	spin_lock_init(&vkms_out->composer_lock);
+	drm_crtc_helper_add(&crtc->base, &vkms_crtc_helper_funcs);
 
-	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
-	if (!vkms_out->composer_workq)
-		return -ENOMEM;
+	drm_mode_crtc_set_gamma_size(&crtc->base, VKMS_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(&crtc->base, 0, false, VKMS_LUT_SIZE);
+
+	spin_lock_init(&crtc->lock);
+	spin_lock_init(&crtc->composer_lock);
+
+	crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
+	if (!crtc->composer_workq)
+		return ERR_PTR(-ENOMEM);
 
-	return ret;
+	return crtc;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2f9d1db0cfae..15a2ba26d190 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -54,9 +54,12 @@ DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
+	struct vkms_crtc *vkms_crtc;
 
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
+	list_for_each_entry(vkms_crtc, &vkms->crtcs, list) {
+		if (vkms_crtc->composer_workq)
+			destroy_workqueue(vkms_crtc->composer_workq);
+	}
 }
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -177,6 +180,7 @@ static int vkms_create(struct vkms_config *config)
 	}
 	vkms_device->platform = pdev;
 	vkms_device->config = config;
+	vkms_device->crtcs = (struct list_head)LIST_HEAD_INIT(vkms_device->crtcs);
 	config->dev = vkms_device;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
@@ -187,7 +191,7 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = drm_vblank_init(&vkms_device->drm, list_count_nodes(&config->crtcs));
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_devres;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 87e44b51a03f..3156ff896c33 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -4,6 +4,7 @@
 #define _VKMS_DRV_H_
 
 #include <linux/hrtimer.h>
+#include <linux/list.h>
 
 #include <drm/drm.h>
 #include <drm/drm_framebuffer.h>
@@ -98,10 +99,11 @@ struct vkms_crtc_state {
 	u64 frame_end;
 };
 
-struct vkms_output {
-	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector connector;
+struct vkms_crtc {
+	struct list_head list;
+
+	struct drm_crtc base;
+
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
@@ -119,19 +121,28 @@ struct vkms_output {
 
 struct vkms_config;
 
+struct vkms_output {
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 	struct vkms_output output;
+	struct list_head crtcs;
 	const struct vkms_config *config;
 };
 
-#define drm_crtc_to_vkms_output(target) \
-	container_of(target, struct vkms_output, crtc)
-
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
+#define drm_crtc_to_vkms_crtc(crtc) \
+	container_of(crtc, struct vkms_crtc, base)
+
+#define timer_to_vkms_crtc(timer) \
+	container_of(timer, struct vkms_crtc, vblank_hrtimer)
+
 #define to_vkms_crtc_state(target)\
 	container_of(target, struct vkms_crtc_state, base)
 
@@ -139,8 +150,10 @@ struct vkms_device {
 	container_of(target, struct vkms_plane_state, base.base)
 
 /* CRTC */
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
+struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor,
+				 unsigned int index);
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
@@ -156,11 +169,11 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_crtc *vkms_crtc);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index afe3945c1962..dcd32bc30e17 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,8 +32,7 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
-static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
-				  struct drm_crtc *crtc)
+static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index)
 {
 	struct vkms_plane *overlay;
 
@@ -42,7 +41,7 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
 		return PTR_ERR(overlay);
 
 	if (!overlay->base.possible_crtcs)
-		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+		overlay->base.possible_crtcs = BIT(index);
 
 	return 0;
 }
@@ -53,7 +52,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder = &output->encoder;
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_crtc *vkms_crtc;
+	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
@@ -65,7 +65,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	if (vkmsdev->config->overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
+			ret = vkms_add_overlay_plane(vkmsdev, index);
 			if (ret)
 				return ret;
 		}
@@ -77,15 +77,26 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 			return PTR_ERR(cursor);
 	}
 
-	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
-	if (ret)
-		return ret;
+	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, list) {
+		vkms_crtc = vkms_crtc_init(dev, &primary->base, &cursor->base,
+					   crtc_cfg->index);
+		if (IS_ERR(vkms_crtc))
+			return PTR_ERR(vkms_crtc);
+
+		list_add_tail(&vkms_crtc->list, &vkmsdev->crtcs);
+
+		if (crtc_cfg->writeback) {
+			writeback = vkms_enable_writeback_connector(vkms_crtc);
+			if (writeback)
+				DRM_ERROR("Failed to init writeback connector\n");
+		}
+	}
 
 	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
-		goto err_connector;
+		return ret;
 	}
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
@@ -104,12 +115,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		goto err_attach;
 	}
 
-	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
-		if (writeback)
-			DRM_ERROR("Failed to init writeback connector\n");
-	}
-
 	drm_mode_config_reset(dev);
 
 	return 0;
@@ -120,8 +125,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 err_encoder:
 	drm_connector_cleanup(connector);
 
-err_connector:
-	drm_crtc_cleanup(crtc);
-
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..b317cb291586 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -106,7 +106,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_device *vkmsdev;
+	struct vkms_crtc *vkms_crtc;
 
 	if (!job->fb)
 		return;
@@ -115,8 +115,8 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+	vkms_crtc = container_of(connector, struct vkms_crtc, wb_connector);
+	vkms_set_composer(vkms_crtc, false);
 	kfree(vkmsjob);
 }
 
@@ -125,11 +125,10 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_output *output = &vkmsdev->output;
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(connector_state->crtc);
+	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
-	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
 	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
 	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
@@ -140,15 +139,15 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	vkms_set_composer(vkms_crtc, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
-	spin_lock_irq(&output->composer_lock);
+	spin_lock_irq(&vkms_crtc->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
-	spin_unlock_irq(&output->composer_lock);
+	spin_unlock_irq(&vkms_crtc->composer_lock);
 
 	wb_frame_info->offset = fb->offsets[0];
 	wb_frame_info->pitch = fb->pitches[0];
@@ -168,16 +167,16 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_check = vkms_wb_atomic_check,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_crtc *vkms_crtc)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&vkmsdev->drm, wb,
+	return drm_writeback_connector_init(vkms_crtc->base.dev, wb,
 					    &vkms_wb_connector_funcs,
 					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
-					    1);
+					    drm_crtc_mask(&vkms_crtc->base));
 }
-- 
2.46.0

