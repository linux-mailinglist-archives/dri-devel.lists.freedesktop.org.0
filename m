Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40191AE2A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 19:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B14910E0E7;
	Thu, 27 Jun 2024 17:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fpXf3VPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7263D10E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719509743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=356Lg5UUSnmEm4pXEbf26iOKxmVufXs5pH3pFisEAVQ=;
 b=fpXf3VPldT9AjsZUvdOtjiAjD3eYve80SLzrt+MqbZT38JOcZjEH2OK4J+Dxfoe42ZOhbW
 a2N4kdXUPKIeC15ynXiUDdWfnwnSRHSOYTSpy/BN9kzinYjxSY4LXnl9hMrh/xmvJua0xe
 sK+ctwmRAeMU0443a3OvzrqLg+FIi5w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-ekehw8qOMUmLpp6EyUneIw-1; Thu,
 27 Jun 2024 13:35:39 -0400
X-MC-Unique: ekehw8qOMUmLpp6EyUneIw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 850161956096; Thu, 27 Jun 2024 17:35:37 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.31])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6788A3000603; Thu, 27 Jun 2024 17:35:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH] drm/fbdev-generic: Fix framebuffer on big endian devices
Date: Thu, 27 Jun 2024 19:35:30 +0200
Message-ID: <20240627173530.460615-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

Starting with kernel 6.7, the framebuffer text console is not working
anymore with the virtio-gpu device on s390x hosts. Such big endian fb
devices are usinga different pixel ordering than little endian devices,
e.g. DRM_FORMAT_BGRX8888 instead of DRM_FORMAT_XRGB8888.

This used to work fine as long as drm_client_buffer_addfb() was still
calling drm_mode_addfb() which called drm_driver_legacy_fb_format()
internally to get the right format. But drm_client_buffer_addfb() has
recently been reworked to call drm_mode_addfb2() instead with the
format value that has been passed to it as a parameter (see commit
6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()").

That format parameter is determined in drm_fbdev_generic_helper_fb_probe()
via the drm_mode_legacy_fb_format() function - which only generates
formats suitable for little endian devices. So to fix this issue
switch to drm_driver_legacy_fb_format() here instead to take the
device endianness into consideration.

Fixes: 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()")
Closes: https://issues.redhat.com/browse/RHEL-45158
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 97e579c33d84..1e200d815e1a 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -84,7 +84,8 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		    sizes->surface_width, sizes->surface_height,
 		    sizes->surface_bpp);
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
+					     sizes->surface_depth);
 	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
-- 
2.45.2

