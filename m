Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F287CFEF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714C10E64E;
	Fri, 15 Mar 2024 15:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L7BCP03q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482710F041
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710515649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RA8/7nRRn/CZsbN36yoQJsa4ZoxQdL5/dHnVXv6eQE=;
 b=L7BCP03q+HQh6P8nNwOnzJNclzLas/gFCyVTQ4JClpIqav6eLS/TEh5MK6vZ3o7S7fJp6M
 tuqMo1KTx8thAJUT2Zi1e9Ro2Cd9GibA353Tr8e0tefYve21xINr+Sepj9EkZHjYGjeoPa
 2pVpLLc5Wgz1wJKcjoXTZO9WDVNU1kM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-NPiO1sfhN_2gqVPPjaWT3Q-1; Fri,
 15 Mar 2024 11:14:05 -0400
X-MC-Unique: NPiO1sfhN_2gqVPPjaWT3Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 412082804811;
 Fri, 15 Mar 2024 15:14:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 560E1492BCB;
 Fri, 15 Mar 2024 15:14:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v10 6/9] drm/simpledrm: Add drm_panic support
Date: Fri, 15 Mar 2024 16:10:58 +0100
Message-ID: <20240315151317.857684-7-jfalempe@redhat.com>
In-Reply-To: <20240315151317.857684-1-jfalempe@redhat.com>
References: <20240315151317.857684-1-jfalempe@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a user-friendly
message to the screen when a kernel panic occurs.

v8:
 * Replace get_scanout_buffer() with drm_panic_set_buffer()
   (Thomas Zimmermann)

v9:
 * Revert to using get_scanout_buffer() (Sima)
 * move get_scanout_buffer() to plane helper functions (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7ce1c4617675..f498665be8c4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #define DRIVER_NAME	"simpledrm"
@@ -671,11 +672,26 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 	drm_dev_exit(idx);
 }
 
+static int simpledrm_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+							     struct drm_scanout_buffer *sb)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(plane->dev);
+
+	sb->width = sdev->mode.hdisplay;
+	sb->height = sdev->mode.vdisplay;
+	sb->format = sdev->format;
+	sb->pitch = sdev->pitch;
+	sb->map = sdev->screen_base;
+
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
 	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
 	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
+	.get_scanout_buffer = simpledrm_primary_plane_helper_get_scanout_buffer,
 };
 
 static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
-- 
2.44.0

