Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20662478E4B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE9F11277D;
	Fri, 17 Dec 2021 14:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F4611277D;
 Fri, 17 Dec 2021 14:46:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 83E0421119;
 Fri, 17 Dec 2021 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639752378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ox6dMkIbQ066SqNT/RhL5YnI7kFXYDxC3B0UMkQYWnQ=;
 b=tXtGiTja/ve/reZ/BWm1G1k0mPrDHqz5wegpLA2mHV2mMxPov0gBBkUrY2mvAw3oa5vL1S
 j7IrP/lfC3VL6noLIJYtbPZYt1X01ml2j2aXPe0GFB0sDXwPnom1BkC7eYwcqFIBHV6UIc
 UpDzvYyp2/5HDAeIDakghxETpmxwey4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639752378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ox6dMkIbQ066SqNT/RhL5YnI7kFXYDxC3B0UMkQYWnQ=;
 b=aFDsUoP7cWyBgIKT2C3iP2Vlb+vCqn38lEcFGcaD1j2uirmehkvr8lzPVfXTMtZbbLJHu3
 KkKEhK6JBODtDXDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5242B13E1C;
 Fri, 17 Dec 2021 14:46:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gCH7ErqivGH9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:46:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 03/10] drm/bochs: Replace module-init boiler-plate code with
 DRM helpers
Date: Fri, 17 Dec 2021 15:46:08 +0100
Message-Id: <20211217144615.32733-4-tzimmermann@suse.de>
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

Remove custom bochs_init() and bochs_exit() functions and initialize
the module with DRM module helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index fc26a1ce11ee..ed971c8bb446 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -716,24 +717,7 @@ static struct pci_driver bochs_pci_driver = {
 /* ---------------------------------------------------------------------- */
 /* module init/exit                                                       */
 
-static int __init bochs_init(void)
-{
-	if (drm_firmware_drivers_only() && bochs_modeset == -1)
-		return -EINVAL;
-
-	if (bochs_modeset == 0)
-		return -EINVAL;
-
-	return pci_register_driver(&bochs_pci_driver);
-}
-
-static void __exit bochs_exit(void)
-{
-	pci_unregister_driver(&bochs_pci_driver);
-}
-
-module_init(bochs_init);
-module_exit(bochs_exit);
+drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
 
 MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
-- 
2.34.1

