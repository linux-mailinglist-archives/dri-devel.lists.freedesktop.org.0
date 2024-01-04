Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C88245B7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2DD10E503;
	Thu,  4 Jan 2024 16:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F04510E502
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704384258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSP1ZJYQ3/8xJ8Wa+IiDZutqgJtGgOWvSJ+Bzdezxwg=;
 b=Edg0aEjLaw7bSAXejBLxZYvHlxj5XvOG5M+wUoL3a8ze/8LhLOE8XK/DNS2MIKeLhfSFSH
 f/PkkpC+WvhxSRQudGTzzvbrakvQuersRoS61QePZ0Lt94IhOc82azS6oKJ7Co/QZRcLW5
 sAtH2oEoIJAk2p2yUONJx6LtKTzCfCc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-xw4sZiu7NgikDMQbScjoAQ-1; Thu,
 04 Jan 2024 11:04:13 -0500
X-MC-Unique: xw4sZiu7NgikDMQbScjoAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E17238135E8;
 Thu,  4 Jan 2024 16:04:12 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE62F1C060AF;
 Thu,  4 Jan 2024 16:04:10 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v7 7/9] drm/mgag200: Add drm_panic support
Date: Thu,  4 Jan 2024 17:00:51 +0100
Message-ID: <20240104160301.185915-8-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-1-jfalempe@redhat.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
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

v7:
 * use drm_for_each_primary_visible_plane()

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 2fb18b782b05..2bf5918eadc5 100644
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
@@ -84,6 +86,25 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
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
+	drm_for_each_primary_visible_plane(plane, dev) {
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
@@ -99,6 +120,7 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	.get_scanout_buffer = mgag200_get_scanout_buffer,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
-- 
2.43.0

