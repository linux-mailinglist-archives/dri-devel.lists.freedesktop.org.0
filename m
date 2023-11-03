Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8237E0513
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 15:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23F810E478;
	Fri,  3 Nov 2023 14:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4250410EA0A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699023356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cW8v2ylzMuTpsTFKGtEUookRLzzq8OGcEd2jTfzIx6A=;
 b=bH22Y3PzzQ+ZmO63sGSVXKbB/4W2gL7D1YVLnPx5OEvVlEoBK1SlD4MZIMyLP888dKHdDi
 Wq2oPBy+LmxCtszeZnS4Dt5DyIawSnpPDBy3ufojuf3KJpvn79bioEYCInDLgKJG3U8tZX
 z0Ln0mgpE8HaTcejkl1asmyzVO8XEE4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-XGkdMpXOMS6yv1IFw3DXBQ-1; Fri, 03 Nov 2023 10:55:52 -0400
X-MC-Unique: XGkdMpXOMS6yv1IFw3DXBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3E86862CA9;
 Fri,  3 Nov 2023 14:55:51 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3621C060BA;
 Fri,  3 Nov 2023 14:55:49 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v5 4/6] drm/mgag200: Add drm_panic support
Date: Fri,  3 Nov 2023 15:53:28 +0100
Message-ID: <20231103145526.628138-5-jfalempe@redhat.com>
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

Add support for the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

v5:
 * Also check that the plane is visible and primary. (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index abddf37f0ea1..7bfcc66485db 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -12,10 +12,12 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_pciids.h>
 
 #include "mgag200_drv.h"
@@ -83,6 +85,28 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
 	return offset - 65536;
 }
 
+static int mgag200_get_scanout_buffer(struct drm_device *dev,
+				      struct drm_scanout_buffer *sb)
+{
+	struct drm_plane *plane;
+	struct mga_device *mdev = to_mga_device(dev);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
+
+	/* find the primary and visible plane */
+	drm_for_each_plane(plane, dev) {
+		if (!plane->state || !plane->state->visible || !plane->state->fb ||
+		    plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch = plane->state->fb->pitches[0];
+		sb->map = map;
+		return 0;
+	}
+	return -ENODEV;
+}
+
 /*
  * DRM driver
  */
@@ -98,6 +122,7 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	.get_scanout_buffer = mgag200_get_scanout_buffer,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
-- 
2.41.0

