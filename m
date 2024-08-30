Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66AB965BBD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6210E9C8;
	Fri, 30 Aug 2024 08:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6BF10E936;
 Fri, 30 Aug 2024 08:45:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 311B71FD16;
 Fri, 30 Aug 2024 08:45:23 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC2AA13A3D;
 Fri, 30 Aug 2024 08:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sM6RMKKG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 69/81] drm/nouveau: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:40:53 +0200
Message-ID: <20240830084456.77630-70-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 311B71FD16
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

The nouveau driver specifies a preferred color mode depending on
the available video memory, with a default of 32. Adapt this for
the new client interface.

v2:
- style changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4a9a9b9c3935..628c47a60de5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -31,6 +31,7 @@
 #include <linux/dynamic_debug.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -836,6 +837,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 {
 	struct nvkm_device *device;
 	struct nouveau_drm *drm;
+	const struct drm_format_info *format;
 	int ret;
 
 	if (vga_switcheroo_client_probe_defer(pdev))
@@ -873,9 +875,11 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 		goto fail_pci;
 
 	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
-		drm_fbdev_ttm_setup(drm->dev, 8);
+		format = drm_format_info(DRM_FORMAT_C8);
 	else
-		drm_fbdev_ttm_setup(drm->dev, 32);
+		format = NULL;
+
+	drm_client_setup(drm->dev, format);
 
 	quirk_broken_nv_runpm(pdev);
 	return 0;
@@ -1317,6 +1321,8 @@ driver_stub = {
 	.dumb_create = nouveau_display_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 
+	DRM_FBDEV_TTM_DRIVER_OPS,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 #ifdef GIT_REVISION
-- 
2.46.0

