Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38001478E4F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D8911279D;
	Fri, 17 Dec 2021 14:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26A112782;
 Fri, 17 Dec 2021 14:46:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF0F92114D;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639752379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EI8fjsRDy/kuLOzZ9L6Dl3QtWiUXVsoY5SvWWy4OAwY=;
 b=Mfuk3G0/ks64TyBVZEG36a+Uv7nF9D7ym07/CXCX2z5m/uM+fLzAfqZckyU7Vt5coQ99rt
 2br4GwAuG+Fx8dd1sTXyQAgEmj5dUHY0lu9LWVc/t9RoAI8cqDplgfWs+gUUBLuVp/K9FU
 Z4sRbk17KwqyKMyyKN+pOQgL0lKY4qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639752379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EI8fjsRDy/kuLOzZ9L6Dl3QtWiUXVsoY5SvWWy4OAwY=;
 b=rIrG7g19mxVE96XcmnItNoeQBg0eHIJTvCh2Cu1F0pX9t5VM2YiZFDWbT5cft3EGLsfx2W
 n+E+4Qgnz//HQYBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABCC013E1C;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sK0FKbuivGH9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:46:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 09/10] drm/vboxvideo: Replace module-init boiler-plate code
 with DRM helpers
Date: Fri, 17 Dec 2021 15:46:14 +0100
Message-Id: <20211217144615.32733-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217144615.32733-1-tzimmermann@suse.de>
References: <20211217144615.32733-1-tzimmermann@suse.de>
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove custom vbox_init() and vbox_exit() functions and initialize
the module with DRM module helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index f35d9e44c6b7..f4f2bd79a7cb 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_module.h>
 
 #include "vbox_drv.h"
 
@@ -190,24 +191,7 @@ static const struct drm_driver driver = {
 	DRM_GEM_VRAM_DRIVER,
 };
 
-static int __init vbox_init(void)
-{
-	if (drm_firmware_drivers_only() && vbox_modeset == -1)
-		return -EINVAL;
-
-	if (vbox_modeset == 0)
-		return -EINVAL;
-
-	return pci_register_driver(&vbox_pci_driver);
-}
-
-static void __exit vbox_exit(void)
-{
-	pci_unregister_driver(&vbox_pci_driver);
-}
-
-module_init(vbox_init);
-module_exit(vbox_exit);
+drm_module_pci_driver_if_modeset(vbox_pci_driver, vbox_modeset);
 
 MODULE_AUTHOR("Oracle Corporation");
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
-- 
2.34.1

