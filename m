Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB7804EBA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60EA10E4B9;
	Tue,  5 Dec 2023 09:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE1410E4B9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701769931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvUOlHS8abGXMPw9cfHvHr7p3nx6kOp9fz1PNSZ9cRA=;
 b=F3WYoPMhTxlXgVvyy93kjKAOf9zM2Pj1DVwq+/RcDvVqAvvPbil3IhAuoX3BZm2edeDXLe
 Rif+OeWU9xrHssoHPlp+ZhdhqACfsfRHkK06R7wuKQB0Y2VlTcf3pQvGf/3fcarDrJx7WO
 xjAuC39xvLid74dArX1q+oz7D2kV5n8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-umTBInmLNZmkG_cL-b81HA-1; Tue, 05 Dec 2023 04:52:08 -0500
X-MC-Unique: umTBInmLNZmkG_cL-b81HA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30358108BCA3;
 Tue,  5 Dec 2023 09:52:08 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 933EF492BC6;
 Tue,  5 Dec 2023 09:52:06 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v6 4/5] drm/mgag200: Add drm_panic support
Date: Tue,  5 Dec 2023 10:48:26 +0100
Message-ID: <20231205095051.269841-5-jfalempe@redhat.com>
In-Reply-To: <20231205095051.269841-1-jfalempe@redhat.com>
References: <20231205095051.269841-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
index 2fb18b782b05..c79f3d9ee39a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -13,10 +13,12 @@
 #include <drm/drm_atomic_helper.h>
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
@@ -84,6 +86,28 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
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
@@ -99,6 +123,7 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	.get_scanout_buffer = mgag200_get_scanout_buffer,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
-- 
2.42.0

