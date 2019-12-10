Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC9D1182C2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915216E86C;
	Tue, 10 Dec 2019 08:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1B66E865
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B866AB08C;
 Tue, 10 Dec 2019 08:49:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 5/9] drm/udl: Set preferred color depth to 16 bpp
Date: Tue, 10 Dec 2019 09:49:01 +0100
Message-Id: <20191210084905.5570-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210084905.5570-1-tzimmermann@suse.de>
References: <20191210084905.5570-1-tzimmermann@suse.de>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current default color depth of 24 bpp is not even supported by
the driver. Being the native format for communicating with the adapter,
16 bpp is the correct choice.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/udl/udl_drv.c     | 2 +-
 drivers/gpu/drm/udl/udl_modeset.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index b3fa6bf41acc..e6c1cd77d4d4 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -105,7 +105,7 @@ static int udl_usb_probe(struct usb_interface *interface,
 
 	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
 
-	r = drm_fbdev_generic_setup(&udl->drm, 16);
+	r = drm_fbdev_generic_setup(&udl->drm, 0);
 	if (r)
 		goto err_drm_dev_unregister;
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index fc7aa8cb8296..943e937837e1 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -380,7 +380,7 @@ int udl_modeset_init(struct drm_device *dev)
 	dev->mode_config.max_height = 2048;
 
 	dev->mode_config.prefer_shadow = 0;
-	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.preferred_depth = 16;
 
 	dev->mode_config.funcs = &udl_mode_funcs;
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
