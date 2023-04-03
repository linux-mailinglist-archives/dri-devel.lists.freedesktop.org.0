Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B536D4256
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A501B10E3E4;
	Mon,  3 Apr 2023 10:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB7210E171
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:40:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FBBC1FDDD;
 Mon,  3 Apr 2023 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACLjVkyt3VovlDwfUdIE8wKNjM9R9TwK31LIfU8eoxw=;
 b=V6/Kd7g1xolN9o4PfXiyHHpEBZI7eI728fpe0RO/lH72ETihtGGd7O06tReHgPv81iXax3
 ZJfFxEL44s8CByMlpQy+ncFoeL5AjgtDJAY5vA6i649pjo6X75iCgJCh8s4Fqhxs/VraQd
 gxssfQz0FG4muutLV7nh2w+e47zN4MI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACLjVkyt3VovlDwfUdIE8wKNjM9R9TwK31LIfU8eoxw=;
 b=8PRhzDJYSrxxwXx+KkbjsfDuj2MdZEsMmZxXk2S6NoMIocsBuk6GpT+bKwBS8Vltnz5oAy
 XHYeILWrZ/iTNADQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26F2E1331A;
 Mon,  3 Apr 2023 10:40:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YDxqCCatKmQsDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:40:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 4/5] drm/omapdrm: Remove fbdev from struct omap_drm_private
Date: Mon,  3 Apr 2023 12:40:34 +0200
Message-Id: <20230403104035.15288-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403104035.15288-1-tzimmermann@suse.de>
References: <20230403104035.15288-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM device stores a pointer to the fbdev helper. Remove struct
omap_drm_private.fbdev, which contains the same value. No functional
changes.

v2:
	* don't clear dev->fb_helper unnecessarily (Tomi)
	* include omap_fbdev.h in omap_fbdev.c (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_debugfs.c | 6 +++---
 drivers/gpu/drm/omapdrm/omap_drv.c     | 1 +
 drivers/gpu/drm/omapdrm/omap_drv.h     | 3 ---
 drivers/gpu/drm/omapdrm/omap_fbdev.c   | 8 ++------
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index bfb2ccb40bd1..a3d470468e5b 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -47,15 +47,15 @@ static int fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct omap_drm_private *priv = dev->dev_private;
+	struct drm_fb_helper *helper = dev->fb_helper;
 	struct drm_framebuffer *fb;
 
 	seq_printf(m, "fbcon ");
-	omap_framebuffer_describe(priv->fbdev->fb, m);
+	omap_framebuffer_describe(helper->fb, m);
 
 	mutex_lock(&dev->mode_config.fb_lock);
 	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
-		if (fb == priv->fbdev->fb)
+		if (fb == helper->fb)
 			continue;
 
 		seq_printf(m, "user ");
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index fb403b44769c..6a2f446c960f 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -25,6 +25,7 @@
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
+#include "omap_fbdev.h"
 
 #define DRIVER_NAME		MODULE_NAME
 #define DRIVER_DESC		"OMAP DRM"
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 825960fd3ea9..4c7217b35f6b 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -21,7 +21,6 @@
 #include "omap_crtc.h"
 #include "omap_encoder.h"
 #include "omap_fb.h"
-#include "omap_fbdev.h"
 #include "omap_gem.h"
 #include "omap_irq.h"
 #include "omap_plane.h"
@@ -77,8 +76,6 @@ struct omap_drm_private {
 
 	struct drm_private_obj glob_obj;
 
-	struct drm_fb_helper *fbdev;
-
 	struct workqueue_struct *wq;
 
 	/* lock for obj_list below */
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index d04a20f95e3d..9ea863781ac6 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 
 #include "omap_drv.h"
+#include "omap_fbdev.h"
 
 MODULE_PARM_DESC(ywrap, "Enable ywrap scrolling (omap44xx and later, default 'y')");
 static bool ywrap_enabled = true;
@@ -250,8 +251,6 @@ void omap_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto fini;
 
-	priv->fbdev = helper;
-
 	return;
 
 fini:
@@ -265,8 +264,7 @@ void omap_fbdev_init(struct drm_device *dev)
 
 void omap_fbdev_fini(struct drm_device *dev)
 {
-	struct omap_drm_private *priv = dev->dev_private;
-	struct drm_fb_helper *helper = priv->fbdev;
+	struct drm_fb_helper *helper = dev->fb_helper;
 	struct drm_framebuffer *fb;
 	struct drm_gem_object *bo;
 	struct omap_fbdev *fbdev;
@@ -296,6 +294,4 @@ void omap_fbdev_fini(struct drm_device *dev)
 
 	drm_fb_helper_unprepare(helper);
 	kfree(fbdev);
-
-	priv->fbdev = NULL;
 }
-- 
2.40.0

