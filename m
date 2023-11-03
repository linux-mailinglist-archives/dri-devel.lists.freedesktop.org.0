Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444437E0514
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 15:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6754010EA0B;
	Fri,  3 Nov 2023 14:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056110EA0B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699023360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjCQ+cV1FMoNtEIcekeTt13h853smglKWWCY/L1jeEI=;
 b=IxBOjf3xDgZwR4+uLoxP/iGHvaq87zXbgzsx1l/ybPYyVdwseQUjCeEQ+Bnp21qQ0kvA7R
 lGcmXOVuV6YXujlw3XM39wMsEM9/jXk7Ip3M2bhcDYzo02wRRykvufpj2gi/pNKYOl/1MZ
 On99eczQsrZSmMXvzpfNzxfTKDXAwdo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-670-jcSCvDgJM6y3ziNnqunSUg-1; Fri,
 03 Nov 2023 10:55:56 -0400
X-MC-Unique: jcSCvDgJM6y3ziNnqunSUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E15B51C0CCA9;
 Fri,  3 Nov 2023 14:55:55 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47D841C060BA;
 Fri,  3 Nov 2023 14:55:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v5 6/6] drm/imx: Add drm_panic support
Date: Fri,  3 Nov 2023 15:53:30 +0100
Message-ID: <20231103145526.628138-7-jfalempe@redhat.com>
In-Reply-To: <20231103145526.628138-1-jfalempe@redhat.com>
References: <20231103145526.628138-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Proof of concept to add drm_panic support on an arm based GPU.
I've tested it with X11/llvmpipe, because I wasn't able to have
3d rendering with etnaviv on my imx6 board.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4a866ac60fff..db24b4976c61 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -10,6 +10,7 @@
 #include <linux/dma-buf.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/iosys-map.h>
 
 #include <video/imx-ipu-v3.h>
 
@@ -17,9 +18,12 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -160,6 +164,31 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 	return ret;
 }
 
+static int imx_drm_get_scanout_buffer(struct drm_device *dev,
+				      struct drm_scanout_buffer *sb)
+{
+	struct drm_plane *plane;
+	struct drm_gem_dma_object *dma_obj;
+
+	drm_for_each_plane(plane, dev) {
+		if (!plane->state || !plane->state->fb || !plane->state->visible ||
+		    plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
+
+		dma_obj = drm_fb_dma_get_gem_obj(plane->state->fb, 0);
+		if (!dma_obj->vaddr)
+			continue;
+
+		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
+		sb->format = plane->state->fb->format;
+		sb->height = plane->state->fb->height;
+		sb->width = plane->state->fb->width;
+		sb->pitch = plane->state->fb->pitches[0];
+		return 0;
+	}
+	return -ENODEV;
+}
+
 static const struct drm_driver imx_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(imx_drm_dumb_create),
@@ -172,6 +201,7 @@ static const struct drm_driver imx_drm_driver = {
 	.major			= 1,
 	.minor			= 0,
 	.patchlevel		= 0,
+	.get_scanout_buffer	= imx_drm_get_scanout_buffer,
 };
 
 static int compare_of(struct device *dev, void *data)
-- 
2.41.0

