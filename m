Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D156A722
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EE910EFEF;
	Thu,  7 Jul 2022 15:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E49D10F24D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:40:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED6F51FF4F;
 Thu,  7 Jul 2022 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657208399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=De8S57X+suSKIr+oaW7vvkAWfi5bTh0xCCKRzOI4SBg=;
 b=gTksLONgi9XMbEZBHCWg+oA3de/owUCQvCsFwwTun7xhsO3/MRxk/EkUbWzD4Pw15CE58e
 PJXgQQM9RE9K9u4NyWRRXE6kaObCS/XkffzNC9qCoqEBgKUvKv2IIONICuA0Pba0O3xO81
 gtVqRMZieOXcM3Brx/FltRnFMsJuSj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657208399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=De8S57X+suSKIr+oaW7vvkAWfi5bTh0xCCKRzOI4SBg=;
 b=AFqUMXg/peIvvHIotk3Kttpf/scYDzXh9K1KG/2sg4a9NBvv2bbybMZaa5bgSS55XvlQXu
 jH6nBLE/KR2NjKDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A082413A33;
 Thu,  7 Jul 2022 15:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kPI9Jk/+xmI9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:39:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH 07/11] video/aperture: Disable and unregister sysfb devices
 via aperture helpers
Date: Thu,  7 Jul 2022 17:39:48 +0200
Message-Id: <20220707153952.32264-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707153952.32264-1-tzimmermann@suse.de>
References: <20220707153952.32264-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-staging@lists.linux.dev, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call sysfb_disable() before removing conflicting devices in aperture
helpers. Fixes sysfb state if fbdev has been disabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: fb84efa28a48 ("drm/aperture: Run fbdev removal before internal helpers")
Cc: Zack Rusin <zackr@vmware.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/aperture.c         | 14 ++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 12 ------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index f42a0d8bc211..101e13c2cf41 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sysfb.h>
 #include <linux/types.h>
 #include <linux/vgaarb.h>
 
@@ -286,7 +287,20 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 #if IS_REACHABLE(CONFIG_FB)
 	struct apertures_struct *a;
 	int ret;
+#endif
+
+	/*
+	 * If a driver asked to unregister a platform device registered by
+	 * sysfb, then can be assumed that this is a driver for a display
+	 * that is set up by the system firmware and has a generic driver.
+	 *
+	 * Drivers for devices that don't have a generic driver will never
+	 * ask for this, so let's assume that a real driver for the display
+	 * was already probed and prevent sysfb to register devices later.
+	 */
+	sysfb_disable();
 
+#if IS_REACHABLE(CONFIG_FB)
 	a = alloc_apertures(1);
 	if (!a)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 877de85309f3..3ee3ea018245 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -19,7 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/major.h>
 #include <linux/slab.h>
-#include <linux/sysfb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/vt.h>
@@ -1765,17 +1764,6 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 		do_free = true;
 	}
 
-	/*
-	 * If a driver asked to unregister a platform device registered by
-	 * sysfb, then can be assumed that this is a driver for a display
-	 * that is set up by the system firmware and has a generic driver.
-	 *
-	 * Drivers for devices that don't have a generic driver will never
-	 * ask for this, so let's assume that a real driver for the display
-	 * was already probed and prevent sysfb to register devices later.
-	 */
-	sysfb_disable();
-
 	mutex_lock(&registration_lock);
 	do_remove_conflicting_framebuffers(a, name, primary);
 	mutex_unlock(&registration_lock);
-- 
2.36.1

