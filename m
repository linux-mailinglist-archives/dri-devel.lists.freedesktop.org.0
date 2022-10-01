Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DB5F1D09
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7AD10E46A;
	Sat,  1 Oct 2022 14:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24710E405
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H68P8iepWfLJpYbHEar6qJMBNCk2+2oF4KGUobttlNs=;
 b=VuxtWRztgPv6Tbo85uKG+JCJrrj9Qy3zFz28OzrJuQNmIr4bpWi96ElQ5KOFjHqK7iV+We
 25UBjKff3SNJnzN/QoDMzsA39xois2XwuxEI0FnUNIJuWJm/EiK1P8EZycd3fqBjncv8eW
 5XQejbre2e9iYWDRVT2sVR6KG2rUXuY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-Jofvsy2_M1upsdonSygREg-1; Sat, 01 Oct 2022 10:58:16 -0400
X-MC-Unique: Jofvsy2_M1upsdonSygREg-1
Received: by mail-ed1-f70.google.com with SMTP id
 s17-20020a056402521100b004511c8d59e3so5669217edd.11
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H68P8iepWfLJpYbHEar6qJMBNCk2+2oF4KGUobttlNs=;
 b=Vx+7KAy8YGGvC0ti3snqCe+RYLnIpcUAGA6QfgB2BQUnkm4Gi9cbAN5h2Bl9ul5lkX
 lOSL9JsAgsz/o00918SgR2VAaQxZxQ0b49Rx3cHNbzHbQ34BG9C1kyQhcQQWxNCO7bH9
 rAESij5U5ZfisocHqHrmVOAYqtrsbSurdkHhlaC9JJX59Al3YsjbQQi3c++yU9+1UMgn
 cWci1o5jqUVSZzcjX40cw8q/aL9mSsB92CMMTHpuVpT/lCCscFwMHewWY5ytqacdtIXj
 lP6A5ZzvdJaJ9l7cDRiyWGmdh5HAU12IIuSCJUYYNZAryXtHSdZ1IcHneKkD9sroIiHV
 c5TQ==
X-Gm-Message-State: ACrzQf3zHQugLc7rVRxGHJCOeHWlmur/R/81w81OCsJZoEEf071xjw40
 JnKuRkNjelNLGiOAoHlxwN3S/zOTE1T2YpS4gugq9w9OaMqxBBTtL5oCObDbZ2t6dJwTXQDhL55
 bFVkZDO2PqNcH5KhJt2uqMQTsgklg
X-Received: by 2002:a17:907:1607:b0:788:799e:dc97 with SMTP id
 hb7-20020a170907160700b00788799edc97mr4561646ejc.747.1664636295093; 
 Sat, 01 Oct 2022 07:58:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VJBdJUX0WjKukx6WE4HACChCOch/Y067lt40Lp/eZFkvVlX4nIZuEOa8HPfaHF1kX200UDQ==
X-Received: by 2002:a17:907:1607:b0:788:799e:dc97 with SMTP id
 hb7-20020a170907160700b00788799edc97mr4561641ejc.747.1664636294860; 
 Sat, 01 Oct 2022 07:58:14 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1709066a9400b0072f112a6ad2sm2805616ejr.97.2022.10.01.07.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:14 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 2/9] drm/fsl-dcu: replace drm->dev_private
 with drm_to_fsl_dcu_drm_dev()
Date: Sat,  1 Oct 2022 16:57:55 +0200
Message-Id: <20221001145802.515916-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001145802.515916-1-dakr@redhat.com>
References: <20221001145802.515916-1-dakr@redhat.com>
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

