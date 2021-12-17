Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E73478E56
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555ED89EAC;
	Fri, 17 Dec 2021 14:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D6111278C;
 Fri, 17 Dec 2021 14:46:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 210A31F399;
 Fri, 17 Dec 2021 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639752380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9p0b/UO2aAGE+FKoN3E/QTM5Llqovoio+wsWZtcwals=;
 b=j4dQGTKzONv1M/e/tIWgsxfgqtq+q56Il4QZmXzw25l8uZsHoZmktm8McUAFvlT0TVQjvB
 BcUuMQzp/ZRRpVDfUjndAwj2ahICFFynXs71lhYukj7JfC9vWOhgFFrdOynIwGz57zrhn/
 RgY8zE++JKwFB0Atmhtg88Nu/UtOU18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639752380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9p0b/UO2aAGE+FKoN3E/QTM5Llqovoio+wsWZtcwals=;
 b=qAgRp5VJino9ZjV5gPSc7+KYpkrgTxLK75cIBH+SpQYmITzuFs2/edohXkb4qqtzYDMdHx
 w/uipfWv1bUuUGDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E460A13E1C;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2HbANruivGH9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:46:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 10/10] drm/vmwgfx: Replace module-init boiler-plate code with
 DRM helpers
Date: Fri, 17 Dec 2021 15:46:15 +0100
Message-Id: <20211217144615.32733-11-tzimmermann@suse.de>
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

Remove custom vmwgfx_init() and vmwgfx_exit() functions and initialize
the module with DRM_module helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2d59bdad0373..0c1ccf174787 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -32,9 +32,10 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_module.h>
 #include <drm/drm_sysfs.h>
-#include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_placement.h>
@@ -1651,26 +1652,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return ret;
 }
 
-static int __init vmwgfx_init(void)
-{
-	int ret;
-
-	if (drm_firmware_drivers_only())
-		return -EINVAL;
-
-	ret = pci_register_driver(&vmw_pci_driver);
-	if (ret)
-		DRM_ERROR("Failed initializing DRM.\n");
-	return ret;
-}
-
-static void __exit vmwgfx_exit(void)
-{
-	pci_unregister_driver(&vmw_pci_driver);
-}
-
-module_init(vmwgfx_init);
-module_exit(vmwgfx_exit);
+drm_module_pci_driver(vmw_pci_driver);
 
 MODULE_AUTHOR("VMware Inc. and others");
 MODULE_DESCRIPTION("Standalone drm driver for the VMware SVGA device");
-- 
2.34.1

