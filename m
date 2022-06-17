Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782B54F741
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 14:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B267311AEA8;
	Fri, 17 Jun 2022 12:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8C211AEA6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:10:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 186A321D1D;
 Fri, 17 Jun 2022 12:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655467830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2D1ohQdszgugWZUnjjSJLwYBS2g7KQSkU6g+LHbbumk=;
 b=oWzXFqK0bOOjiGtvP0rt0hhdZQ86UC7e1hxHqds38D64SpI8jnl7jtatmJV4OCxiClSaMh
 0xfRwXbKIzOJV015kEziUFz/B7XalmKpsWfufIeMhKcu/PLej4jd8d5nAErpPHNjip6sTx
 0VuX2ORIVfenwfPYv429/3D2h2qTj8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655467830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2D1ohQdszgugWZUnjjSJLwYBS2g7KQSkU6g+LHbbumk=;
 b=PculpmOLADg4nEJQJYRFgDxfLuYWOm7ApX1+EhiVmL5Xdbvsxv2Uhy+R07yw0q3j8QEHyU
 S35yPVlKjInfcQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8B6A1348E;
 Fri, 17 Jun 2022 12:10:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1rknMDVvrGIsdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 12:10:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Date: Fri, 17 Jun 2022 14:10:27 +0200
Message-Id: <20220617121027.30273-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Always run fbdev removal first to remove simpledrm via
sysfb_disable(). This clears the internal state. The later call
to drm_aperture_detach_drivers() then does nothing. Otherwise,
with drm_aperture_detach_drivers() running first, the call to
sysfb_disable() uses inconsistent state.

Example backtrace show below:

[   11.663422] ==================================================================
[   11.663426] BUG: KASAN: use-after-free in device_del+0x79/0x5f0
[   11.663435] Read of size 8 at addr ffff888108185050 by task systemd-udevd/311
[   11.663440] CPU: 0 PID: 311 Comm: systemd-udevd Tainted: G            E     5
	.19.0-rc2-1-default+ #1689
[   11.663445] Hardware name: HP ProLiant DL120 G7, BIOS J01 04/21/2011
[   11.663447] Call Trace:
[   11.663449]  <TASK>
[   11.663451]  ? device_del+0x79/0x5f0
[   11.663456]  dump_stack_lvl+0x5b/0x73
[   11.663462]  print_address_description.constprop.0+0x1f/0x1b0
[   11.663468]  ? device_del+0x79/0x5f0
[   11.663471]  ? device_del+0x79/0x5f0
[   11.663475]  print_report.cold+0x3c/0x21c
[   11.663481]  ? lock_acquired+0x87/0x1e0
[   11.663484]  ? lock_acquired+0x87/0x1e0
[   11.663489]  ? device_del+0x79/0x5f0
[   11.663492]  kasan_report+0xbf/0xf0
[   11.663498]  ? device_del+0x79/0x5f0
[   11.663503]  device_del+0x79/0x5f0
[   11.663509]  ? device_remove_attrs+0x170/0x170
[   11.663514]  ? lock_is_held_type+0xe8/0x140
[   11.663523]  platform_device_del.part.0+0x19/0xe0
[   11.663530]  platform_device_unregister+0x1c/0x30
[   11.663535]  sysfb_disable+0x2d/0x70
[   11.663540]  remove_conflicting_framebuffers+0x1c/0xf0
[   11.663546]  remove_conflicting_pci_framebuffers+0x130/0x1a0
[   11.663554]  drm_aperture_remove_conflicting_pci_framebuffers+0x86/0xb0
[   11.663561]  ? mgag200_pci_remove+0x30/0x30 [mgag200]
[   11.663578]  mgag200_pci_probe+0x2d/0x140 [mgag200]

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 873eb3b11860 ("fbdev: Disable sysfb device registration when removing conflicting FBs")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/drm_aperture.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 74bd4a76b253..059fd71424f6 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -329,7 +329,20 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver)
 {
 	resource_size_t base, size;
-	int bar, ret = 0;
+	int bar, ret;
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+#if IS_REACHABLE(CONFIG_FB)
+	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
+	if (ret)
+		return ret;
+#endif
+	ret = vga_remove_vgacon(pdev);
+	if (ret)
+		return ret;
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
@@ -339,15 +352,6 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 		drm_aperture_detach_drivers(base, size);
 	}
 
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
-#endif
-	if (ret == 0)
-		ret = vga_remove_vgacon(pdev);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
-- 
2.36.1

