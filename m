Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A6965B0D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7831510E8E1;
	Fri, 30 Aug 2024 08:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95510E8A5;
 Fri, 30 Aug 2024 08:45:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 548CC21A24;
 Fri, 30 Aug 2024 08:45:07 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EDDA13A3D;
 Fri, 30 Aug 2024 08:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mEZvApOG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 24/81] drm/logicvc: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:40:08 +0200
Message-ID: <20240830084456.77630-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 548CC21A24
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The logicvc driver specifies a preferred color mode from the value
in struct drm_mode_config.preferred_depth. The fbdev client also
looks at this value for the default pixel format. Thus remove the
format selection from logicvc.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index 01a37e28c080..e4d90701b29d 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -16,8 +16,10 @@
 #include <linux/types.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_print.h>
 
@@ -55,6 +57,7 @@ static struct drm_driver logicvc_drm_driver = {
 	.minor				= 0,
 
 	DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(logicvc_drm_gem_dma_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 };
 
 static struct regmap_config logicvc_drm_regmap_config = {
@@ -301,7 +304,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	struct regmap *regmap = NULL;
 	struct resource res;
 	void __iomem *base;
-	unsigned int preferred_bpp;
 	int irq;
 	int ret;
 
@@ -439,17 +441,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		goto error_mode;
 	}
 
-	switch (drm_dev->mode_config.preferred_depth) {
-	case 16:
-		preferred_bpp = 16;
-		break;
-	case 24:
-	case 32:
-	default:
-		preferred_bpp = 32;
-		break;
-	}
-	drm_fbdev_dma_setup(drm_dev, preferred_bpp);
+	drm_client_setup(drm_dev, NULL);
 
 	return 0;
 
-- 
2.46.0

