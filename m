Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849C5B91B3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E510E1F8;
	Thu, 15 Sep 2022 00:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BD110E207
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H68P8iepWfLJpYbHEar6qJMBNCk2+2oF4KGUobttlNs=;
 b=aj0kUje5kLQ0wii/FYzCEtLisxXrYRKLK4/OPQM4R2qf/fvo3eHuBl8RxPRnh5HMSzXaJf
 GgoHwiLc2sk9RfC9DFuvO0Qj4jPurcVC/ERFAOVLgB7dEDNggOd1WkW9Bq22K3L6+16D6p
 o2j5rZww8pTR4V+cLSWa3Q6dBhIXYn0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-Es73KfFgOX--sM-zx8Yvxg-1; Wed, 14 Sep 2022 20:32:46 -0400
X-MC-Unique: Es73KfFgOX--sM-zx8Yvxg-1
Received: by mail-ed1-f72.google.com with SMTP id
 v11-20020a056402348b00b004516e0b7eedso9091834edc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H68P8iepWfLJpYbHEar6qJMBNCk2+2oF4KGUobttlNs=;
 b=BLa+CF+yhfHwm+KOjE07anYV5itflQqldFOakWOQ8E9cCP5HYJUGXoJBo5/80MhqZ5
 fJ46bt5WmBmtu0CnuAj39UJre5ae2XLo3UZnDeHUDcVfYVX1B8akkTZTiOF2qI2cqAPm
 uyQ7FlVw41gPO2w4FGaklXS5Lk1ZWzX1Qh6OyPh4RFkGg0VlMeZ5tAoUIBkovZHOTKKt
 RG/h0WQZ8QJZYDCNaUNcdsaPwpFmWng/mhZXm4A3mWBbwPRWSNmAirxevrpCgAY1IkwQ
 IBjdUY1JImeP8Ek1RDrdTE8Kkacz3BEtRgYE5ZeM8ZkFT31ZgzLqyKjgFpjTxh9agr8x
 frPA==
X-Gm-Message-State: ACgBeo399rWZ0coCW9ZWZP5duTCx6js/nLe+WwspFotDiUmNSS8fDj1M
 x9BTHuaGde7/5k+J0ulepHY/2/8U2jonEx/b6MF2UO6vOcUi31K1oc7Dg987sLR53jmsv5gHhca
 1Bya+dGvi4H/vEkTuaHDVNwWL7Kzc
X-Received: by 2002:a05:6402:4449:b0:445:cdb6:2de9 with SMTP id
 o9-20020a056402444900b00445cdb62de9mr32642913edb.59.1663201964989; 
 Wed, 14 Sep 2022 17:32:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7XNJXfGvj3h4Jld1qFi2NofTMl3y+rFRcL6dz+AggRntBTERzg0GqzFfVhJIIbLhDdTFEEtw==
X-Received: by 2002:a05:6402:4449:b0:445:cdb6:2de9 with SMTP id
 o9-20020a056402444900b00445cdb62de9mr32642901edb.59.1663201964831; 
 Wed, 14 Sep 2022 17:32:44 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s15-20020aa7c54f000000b004466f5375a5sm10786760edr.53.2022.09.14.17.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:32:44 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 2/8] drm/fsl-dcu: replace drm->dev_private with
 drm_to_fsl_dcu_drm_dev()
Date: Thu, 15 Sep 2022 02:32:25 +0200
Message-Id: <20220915003231.363447-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  | 12 ++++++------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c   | 13 ++++---------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h   |  2 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c |  8 ++++----
 4 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index a1b8ce70928a..e05311e2b0e0 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -24,7 +24,7 @@ static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 					  struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	struct drm_pending_vblank_event *event = crtc->state->event;
 
 	regmap_write(fsl_dev->regmap,
@@ -48,7 +48,7 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
 									      crtc);
 	struct drm_device *dev = crtc->dev;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 
 	/* always disable planes on the CRTC */
 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, true);
@@ -67,7 +67,7 @@ static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 
 	clk_prepare_enable(fsl_dev->pix_clk);
 	regmap_update_bits(fsl_dev->regmap, DCU_DCU_MODE,
@@ -82,7 +82,7 @@ static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	struct drm_connector *con = &fsl_dev->connector.base;
 	struct drm_display_mode *mode = &crtc->state->mode;
 	unsigned int pol = 0;
@@ -135,7 +135,7 @@ static const struct drm_crtc_helper_funcs fsl_dcu_drm_crtc_helper_funcs = {
 static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	unsigned int value;
 
 	regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
@@ -148,7 +148,7 @@ static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 static void fsl_dcu_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	unsigned int value;
 
 	regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index a47b72995fcf..4139f674c5de 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -52,7 +52,7 @@ static const struct regmap_config fsl_dcu_regmap_config = {
 
 static void fsl_dcu_irq_reset(struct drm_device *dev)
 {
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 
 	regmap_write(fsl_dev->regmap, DCU_INT_STATUS, ~0);
 	regmap_write(fsl_dev->regmap, DCU_INT_MASK, ~0);
@@ -61,7 +61,7 @@ static void fsl_dcu_irq_reset(struct drm_device *dev)
 static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	unsigned int int_status;
 	int ret;
 
@@ -91,7 +91,7 @@ static int fsl_dcu_irq_install(struct drm_device *dev, unsigned int irq)
 
 static void fsl_dcu_irq_uninstall(struct drm_device *dev)
 {
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 
 	fsl_dcu_irq_reset(dev);
 	free_irq(fsl_dev->irq, dev);
@@ -99,7 +99,7 @@ static void fsl_dcu_irq_uninstall(struct drm_device *dev)
 
 static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 {
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
@@ -133,8 +133,6 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 
 	drm_mode_config_cleanup(dev);
 done_vblank:
-	dev->dev_private = NULL;
-
 	return ret;
 }
 
@@ -145,8 +143,6 @@ static void fsl_dcu_unload(struct drm_device *dev)
 
 	drm_mode_config_cleanup(dev);
 	fsl_dcu_irq_uninstall(dev);
-
-	dev->dev_private = NULL;
 }
 
 DEFINE_DRM_GEM_DMA_FOPS(fsl_dcu_drm_fops);
@@ -322,7 +318,6 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 
 	fsl_dev->dev = dev;
 	fsl_dev->np = dev->of_node;
-	drm->dev_private = fsl_dev;
 	dev_set_drvdata(dev, fsl_dev);
 
 	ret = drm_dev_register(drm, 0);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
index 20ca13ff618a..5b61d443da96 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
@@ -193,6 +193,8 @@ struct fsl_dcu_drm_device {
 	const struct fsl_dcu_soc_data *soc;
 };
 
+#define drm_to_fsl_dcu_drm_dev(x) container_of(x, struct fsl_dcu_drm_device, base)
+
 int fsl_dcu_drm_modeset_init(struct fsl_dcu_drm_device *fsl_dev);
 
 #endif /* __FSL_DCU_DRM_DRV_H__ */
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 794a87d16f88..91865956da02 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -22,7 +22,7 @@
 
 static int fsl_dcu_drm_plane_index(struct drm_plane *plane)
 {
-	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(plane->dev);
 	unsigned int total_layer = fsl_dev->soc->total_layer;
 	unsigned int index;
 
@@ -63,7 +63,7 @@ static int fsl_dcu_drm_plane_atomic_check(struct drm_plane *plane,
 static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 					     struct drm_atomic_state *state)
 {
-	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(plane->dev);
 	unsigned int value;
 	int index;
 
@@ -80,7 +80,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 
 {
-	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(plane->dev);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -194,7 +194,7 @@ static const u32 fsl_dcu_drm_plane_formats[] = {
 
 void fsl_dcu_drm_init_planes(struct drm_device *dev)
 {
-	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	int i, j;
 
 	for (i = 0; i < fsl_dev->soc->total_layer; i++) {
-- 
2.37.3

