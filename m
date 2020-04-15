Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5A1A9470
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AE16E876;
	Wed, 15 Apr 2020 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1E16E876
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x25so16190900wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EWAgpX9AyblYQxQ3GE4jCdldM3FKzVCxnzDptN3cAJ4=;
 b=SVEoOdcMTGN5GXVQn6/yGcss9K65DCVpbw+R4bpTLCA8TlyqAQTj5fgJIKuAGrn/pJ
 dB9YRAGbJzPOEewvCL5kpNPBIIG82sG+Hd+P4A3OXXp8i6qRPNqZA1STS7RNigWq9+EY
 6lcg8TWfXx55iEmLwJVpEjFm2b+DJ/+wi/q1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWAgpX9AyblYQxQ3GE4jCdldM3FKzVCxnzDptN3cAJ4=;
 b=MTR1kD4mBB+u6DyGWUm8qoXo9EfTZgE5LZ+RJTEXy80GoIf6+gDifYSm3w0ZeOqO+1
 8VnuMByyi7jszom5X23t9tAkY3SiEsqd8ww3xirQWptarg8vS6eU5DsOvbCRFD62xbeM
 O9JY3cjJ1CBxWFvCky/Rd5hOVt45luzjAbwkDQgLxGRVaaDfxXZ8zXfSgFqIT03Gm0jL
 cveM7lgXKRKgku7mUdfl6Cy0owPCT3x2VxDOgMrqzobULN9VnIirXPeepdUmdnGzsrZW
 i+9om5VUw7B+J0uVL0/+VDRGAl7kBaLVl3etwk1iJxYsWrlLuwBhAy8MOAjZhz2lyIuB
 zneg==
X-Gm-Message-State: AGi0PuahuaJVKCx6FC+t+8bPwekZWna3yOQjV2SBj6ca9yF9cfMEp20F
 SDBbZ32ImvKJFERI5/VnjS7Xdw==
X-Google-Smtp-Source: APiQypIw08yAxzp1XRKyrEG08mcPJEBZWtIo7aLqEAwzLz4XIPOu7d6OgJmIG/AtrQ7OavGxHg0bpQ==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr3915437wmm.48.1586936444547; 
 Wed, 15 Apr 2020 00:40:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 04/59] drm/vboxvideo: Stop using drm_device->dev_private
Date: Wed, 15 Apr 2020 09:39:39 +0200
Message-Id: <20200415074034.175360-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We use the baseclass pattern here, so lets to the proper (and more
typesafe) upcasting.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c  |  1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.h  |  1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c  |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++++-----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 7dd25c7a3768..cfa4639c5142 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -52,7 +52,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return PTR_ERR(vbox);
 
 	vbox->ddev.pdev = pdev;
-	vbox->ddev.dev_private = vbox;
 	pci_set_drvdata(pdev, vbox);
 	mutex_init(&vbox->hw_mutex);
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index 87421903816c..ac7c2effc46f 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -127,6 +127,7 @@ struct vbox_encoder {
 #define to_vbox_crtc(x) container_of(x, struct vbox_crtc, base)
 #define to_vbox_connector(x) container_of(x, struct vbox_connector, base)
 #define to_vbox_encoder(x) container_of(x, struct vbox_encoder, base)
+#define to_vbox_dev(x) container_of(x, struct vbox_private, ddev)
 
 bool vbox_check_supported(u16 id);
 int vbox_hw_init(struct vbox_private *vbox);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
index 16a1e29f5292..631657fa554f 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
@@ -34,7 +34,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
 irqreturn_t vbox_irq_handler(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
-	struct vbox_private *vbox = (struct vbox_private *)dev->dev_private;
+	struct vbox_private *vbox = to_vbox_dev(dev);
 	u32 host_flags = vbox_get_flags(vbox);
 
 	if (!(host_flags & HGSMIHOSTFLAGS_IRQ))
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 0883a435e62b..d9a5af62af89 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -36,7 +36,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 	u16 flags;
 	s32 x_offset, y_offset;
 
-	vbox = crtc->dev->dev_private;
+	vbox = to_vbox_dev(crtc->dev);
 	width = vbox_crtc->width ? vbox_crtc->width : 640;
 	height = vbox_crtc->height ? vbox_crtc->height : 480;
 	bpp = fb ? fb->format->cpp[0] * 8 : 32;
@@ -77,7 +77,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 static int vbox_set_view(struct drm_crtc *crtc)
 {
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
-	struct vbox_private *vbox = crtc->dev->dev_private;
+	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
 	struct vbva_infoview *p;
 
 	/*
@@ -174,7 +174,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
-	struct vbox_private *vbox = crtc->dev->dev_private;
+	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
 	bool needs_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
 
@@ -272,7 +272,7 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
 {
 	struct drm_crtc *crtc = plane->state->crtc;
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct vbox_private *vbox = fb->dev->dev_private;
+	struct vbox_private *vbox = to_vbox_dev(fb->dev);
 	struct drm_mode_rect *clips;
 	uint32_t num_clips, i;
 
@@ -704,7 +704,7 @@ static int vbox_get_modes(struct drm_connector *connector)
 	int preferred_width, preferred_height;
 
 	vbox_connector = to_vbox_connector(connector);
-	vbox = connector->dev->dev_private;
+	vbox = to_vbox_dev(connector->dev);
 
 	hgsmi_report_flags_location(vbox->guest_pool, GUEST_HEAP_OFFSET(vbox) +
 				    HOST_FLAGS_OFFSET);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
