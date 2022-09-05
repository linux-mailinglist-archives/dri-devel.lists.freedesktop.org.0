Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5C5AD61B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78DE10E63F;
	Mon,  5 Sep 2022 15:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0E10E411
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ijy3Q7tFZuVJZh+APF9uvbAJEvF3VUDq7eKTxt/Smo=;
 b=cwl7L2kBfe/CdljFux4/w5cIW42Zyj1KZcCVbRvrlwTPe94YyYdt9NztN3Lc3Fb29f8XAp
 U5ydF/+Uh+TGHm95sL9X4EoTyruqgPZjXpddmM0w4ntmgTg7oCPTF3pxmFErHjX3jJyWhh
 N/AzsIr3buMRYRIsTfYk2OUytPinC4o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38--mChF-pDM9CV300ijuEjEQ-1; Mon, 05 Sep 2022 11:19:24 -0400
X-MC-Unique: -mChF-pDM9CV300ijuEjEQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw34-20020a1709066a2200b00730ca5a94bfso2451933ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+Ijy3Q7tFZuVJZh+APF9uvbAJEvF3VUDq7eKTxt/Smo=;
 b=iW69AdwUQRY1jubqdldo43jae7SoG+EJShIChfrdpjI0aQSdji+D5AYl681RlvlqMy
 5b4OvoqLdihhUJ21YT3RKiIDzt8ZfOY8u+8AjAzFFZHN1+uqLveJxrjf5yLpC+9KQVTK
 bNg0aI+vSWSxz6qIAk/4bmKljVs5mZDgCSzKMTmub/vHBSc3MKJLNaHwxuF6fNOiFVQK
 K6Qj/mtXdGNLkE9125+GTEzA4JiJVPpGg4j3ADcgZN1iWN3lrsYylD+nPgf+QD9R7il4
 MkSbEfDSI0J0ugvDZLW9sphi0NJoOlyEh2IiFEHE1T1CYxr4CgcyjnUxzJzI6ssEoFMi
 icoA==
X-Gm-Message-State: ACgBeo3NxznFVZkLtON87pf9ju0ytXxznoo39hWQmEiPs8BXMHFHY2fD
 ktOYzaaqT9IjhZZNym556dR6ALR4mSpmX20AE7mY0dpKejmAWINGB5fXhfaBVI0sHwfa+JQshaM
 7eMyRILlM7WlR58BbDG2UXofIa1b4
X-Received: by 2002:a17:907:c28:b0:73d:beb7:b9c2 with SMTP id
 ga40-20020a1709070c2800b0073dbeb7b9c2mr36050715ejc.336.1662391162417; 
 Mon, 05 Sep 2022 08:19:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5D6BD20Y7BO4BpAVZZV1+RjC8V4b8roXG6JtlVzadUiNGkMeZvUPWuLxdiCH3NIg5cMXFMaA==
X-Received: by 2002:a17:907:c28:b0:73d:beb7:b9c2 with SMTP id
 ga40-20020a1709070c2800b0073dbeb7b9c2mr36050695ejc.336.1662391162125; 
 Mon, 05 Sep 2022 08:19:22 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a170906925000b0073d9d887eddsm5177440ejx.56.2022.09.05.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:21 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 2/8] drm/arm/malidp: replace
 drm->dev_private with drm_to_malidp()
Date: Mon,  5 Sep 2022 17:19:04 +0200
Message-Id: <20220905151910.98279-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using drm_device->dev_private is deprecated. Since we've switched to
devm_drm_dev_alloc(), struct drm_device is now embedded in struct
malidp_drm, hence we can use container_of() to get the struct drm_device
instance instead.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c   |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c    | 29 +++++++++++++----------------
 drivers/gpu/drm/arm/malidp_drv.h    |  1 +
 drivers/gpu/drm/arm/malidp_hw.c     | 10 +++++-----
 drivers/gpu/drm/arm/malidp_mw.c     |  6 +++---
 drivers/gpu/drm/arm/malidp_planes.c |  4 ++--
 6 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 962730772b2f..34ad7e1cd2b8 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -526,7 +526,7 @@ static const struct drm_crtc_funcs malidp_crtc_funcs = {
 
 int malidp_crtc_init(struct drm_device *drm)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct drm_plane *primary = NULL, *plane;
 	int ret;
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 41c80e905991..678c5b0d8014 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -169,7 +169,7 @@ static void malidp_atomic_commit_se_config(struct drm_crtc *crtc,
  */
 static int malidp_set_and_wait_config_valid(struct drm_device *drm)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	int ret;
 
@@ -190,7 +190,7 @@ static int malidp_set_and_wait_config_valid(struct drm_device *drm)
 static void malidp_atomic_commit_hw_done(struct drm_atomic_state *state)
 {
 	struct drm_device *drm = state->dev;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	int loop = 5;
 
 	malidp->event = malidp->crtc.state->event;
@@ -231,7 +231,7 @@ static void malidp_atomic_commit_hw_done(struct drm_atomic_state *state)
 static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *drm = state->dev;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int i;
@@ -393,7 +393,7 @@ static const struct drm_mode_config_funcs malidp_mode_config_funcs = {
 static int malidp_init(struct drm_device *drm)
 {
 	int ret;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
 	drm_mode_config_init(drm);
@@ -429,7 +429,7 @@ static int malidp_irq_init(struct platform_device *pdev)
 {
 	int irq_de, irq_se, ret = 0;
 	struct drm_device *drm = dev_get_drvdata(&pdev->dev);
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
 	/* fetch the interrupts from DT */
@@ -463,7 +463,7 @@ static int malidp_dumb_create(struct drm_file *file_priv,
 			      struct drm_device *drm,
 			      struct drm_mode_create_dumb *args)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	/* allocate for the worst case scenario, i.e. rotated buffers */
 	u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 1);
 
@@ -509,7 +509,7 @@ static void malidp_error_stats_dump(const char *prefix,
 static int malidp_show_stats(struct seq_file *m, void *arg)
 {
 	struct drm_device *drm = m->private;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	unsigned long irqflags;
 	struct malidp_error_stats de_errors, se_errors;
 
@@ -532,7 +532,7 @@ static ssize_t malidp_debugfs_write(struct file *file, const char __user *ubuf,
 {
 	struct seq_file *m = file->private_data;
 	struct drm_device *drm = m->private;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&malidp->errors_lock, irqflags);
@@ -553,7 +553,7 @@ static const struct file_operations malidp_debugfs_fops = {
 
 static void malidp_debugfs_init(struct drm_minor *minor)
 {
-	struct malidp_drm *malidp = minor->dev->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(minor->dev);
 
 	malidp_error_stats_init(&malidp->de_errors);
 	malidp_error_stats_init(&malidp->se_errors);
@@ -653,7 +653,7 @@ static ssize_t core_id_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 
 	return snprintf(buf, PAGE_SIZE, "%08x\n", malidp->core_id);
 }
@@ -671,7 +671,7 @@ ATTRIBUTE_GROUPS(mali_dp);
 static int malidp_runtime_pm_suspend(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
 	/* we can only suspend if the hardware is in config mode */
@@ -690,7 +690,7 @@ static int malidp_runtime_pm_suspend(struct device *dev)
 static int malidp_runtime_pm_resume(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
 	clk_prepare_enable(hwdev->pclk);
@@ -756,7 +756,6 @@ static int malidp_bind(struct device *dev)
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	drm->dev_private = malidp;
 	dev_set_drvdata(dev, drm);
 
 	/* Enable power management */
@@ -882,7 +881,6 @@ static int malidp_bind(struct device *dev)
 		pm_runtime_disable(dev);
 	else
 		malidp_runtime_pm_suspend(dev);
-	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
 	of_reserved_mem_device_release(dev);
 
@@ -892,7 +890,7 @@ static int malidp_bind(struct device *dev)
 static void malidp_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
 	drm_dev_unregister(drm);
@@ -910,7 +908,6 @@ static void malidp_unbind(struct device *dev)
 		pm_runtime_disable(dev);
 	else
 		malidp_runtime_pm_suspend(dev);
-	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
 	of_reserved_mem_device_release(dev);
 }
diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index 00be369b28f1..bc0387876dea 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -45,6 +45,7 @@ struct malidp_drm {
 #endif
 };
 
+#define drm_to_malidp(x) container_of(x, struct malidp_drm, base)
 #define crtc_to_malidp_device(x) container_of(x, struct malidp_drm, crtc)
 
 struct malidp_plane {
diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/malidp_hw.c
index e9de542f9b7c..9b845d3f34e1 100644
--- a/drivers/gpu/drm/arm/malidp_hw.c
+++ b/drivers/gpu/drm/arm/malidp_hw.c
@@ -1168,7 +1168,7 @@ static void malidp_hw_clear_irq(struct malidp_hw_device *hwdev, u8 block, u32 ir
 static irqreturn_t malidp_de_irq(int irq, void *arg)
 {
 	struct drm_device *drm = arg;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev;
 	struct malidp_hw *hw;
 	const struct malidp_irq_map *de;
@@ -1226,7 +1226,7 @@ static irqreturn_t malidp_de_irq(int irq, void *arg)
 static irqreturn_t malidp_de_irq_thread_handler(int irq, void *arg)
 {
 	struct drm_device *drm = arg;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 
 	wake_up(&malidp->wq);
 
@@ -1252,7 +1252,7 @@ void malidp_de_irq_hw_init(struct malidp_hw_device *hwdev)
 
 int malidp_de_irq_init(struct drm_device *drm, int irq)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	int ret;
 
@@ -1286,7 +1286,7 @@ void malidp_de_irq_fini(struct malidp_hw_device *hwdev)
 static irqreturn_t malidp_se_irq(int irq, void *arg)
 {
 	struct drm_device *drm = arg;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct malidp_hw *hw = hwdev->hw;
 	const struct malidp_irq_map *se = &hw->map.se_irq_map;
@@ -1363,7 +1363,7 @@ static irqreturn_t malidp_se_irq_thread_handler(int irq, void *arg)
 
 int malidp_se_irq_init(struct drm_device *drm, int irq)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	int ret;
 
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index ef76d0e6ee2f..626709bec6f5 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -129,7 +129,7 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_connector_state *conn_state)
 {
 	struct malidp_mw_connector_state *mw_state = to_mw_state(conn_state);
-	struct malidp_drm *malidp = encoder->dev->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(encoder->dev);
 	struct drm_framebuffer *fb;
 	int i, n_planes;
 
@@ -207,7 +207,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 
 int malidp_mw_connector_init(struct drm_device *drm)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	u32 *formats;
 	int ret, n_formats;
 
@@ -236,7 +236,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 void malidp_mw_atomic_commit(struct drm_device *drm,
 			     struct drm_atomic_state *old_state)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct drm_writeback_connector *mw_conn = &malidp->mw_connector;
 	struct drm_connector_state *conn_state = mw_conn->base.state;
 	struct malidp_hw_device *hwdev = malidp->dev;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 45f5e35e7f24..815d9199752f 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -151,7 +151,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 {
 	const struct drm_format_info *info;
 	const u64 *modifiers;
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	const struct malidp_hw_regmap *map = &malidp->dev->hw->map;
 
 	if (WARN_ON(modifier == DRM_FORMAT_MOD_INVALID))
@@ -931,7 +931,7 @@ static const uint64_t linear_only_modifiers[] = {
 
 int malidp_de_planes_init(struct drm_device *drm)
 {
-	struct malidp_drm *malidp = drm->dev_private;
+	struct malidp_drm *malidp = drm_to_malidp(drm);
 	const struct malidp_hw_regmap *map = &malidp->dev->hw->map;
 	struct malidp_plane *plane = NULL;
 	enum drm_plane_type plane_type;
-- 
2.37.2

