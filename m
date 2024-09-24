Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174E983EEC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDA910E63D;
	Tue, 24 Sep 2024 07:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mKhrN+yB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jjR+GFVg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mKhrN+yB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jjR+GFVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23E410E576;
 Tue, 24 Sep 2024 07:18:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 262BA1FCA1;
 Tue, 24 Sep 2024 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6FcHarDj+um8ua0aTLs7Tp1tFr+QmTL5/EQRpvrOC4=;
 b=mKhrN+yBJozFKFwL4PYOyh3cNC5FdyBSDdGynJ0bXIQ36rzRcdwX/7qWWM2UmTsFfmOd+k
 sedXeKFrEmh1NacE0Ny6tGvQpBVYc8iwQD1hAe8UIaBbQJVxscrCbvFBfAyr1WpxpbcRgm
 f2cko/ut9LyTAfuB+sUtONalkGasehc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6FcHarDj+um8ua0aTLs7Tp1tFr+QmTL5/EQRpvrOC4=;
 b=jjR+GFVg2yJMti9P+ZsdK3RnZQx8IIlSGXcfzO9jxUuUQJV0Tk2+cyVNB7/czvCoYDsdYT
 nQ6UyqkPXQIz74Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6FcHarDj+um8ua0aTLs7Tp1tFr+QmTL5/EQRpvrOC4=;
 b=mKhrN+yBJozFKFwL4PYOyh3cNC5FdyBSDdGynJ0bXIQ36rzRcdwX/7qWWM2UmTsFfmOd+k
 sedXeKFrEmh1NacE0Ny6tGvQpBVYc8iwQD1hAe8UIaBbQJVxscrCbvFBfAyr1WpxpbcRgm
 f2cko/ut9LyTAfuB+sUtONalkGasehc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6FcHarDj+um8ua0aTLs7Tp1tFr+QmTL5/EQRpvrOC4=;
 b=jjR+GFVg2yJMti9P+ZsdK3RnZQx8IIlSGXcfzO9jxUuUQJV0Tk2+cyVNB7/czvCoYDsdYT
 nQ6UyqkPXQIz74Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C420513AE2;
 Tue, 24 Sep 2024 07:17:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aNOzLqZn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH v5 65/80] drm/amdgpu: Run DRM default client setup
Date: Tue, 24 Sep 2024 09:13:03 +0200
Message-ID: <20240924071734.98201-66-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[13]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO
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

The amdgpu driver specifies a preferred color mode depending on
the available video memory, with a default of 32. Adapt this for
the new client interface.

v5:
- select DRM_CLIENT_SELECTION
v2:
- style changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Tested-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index fc3237da8090..680a94c361ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -5,6 +5,7 @@ config DRM_AMDGPU
 	depends on DRM && PCI && MMU
 	depends on !UML
 	select FW_LOADER
+	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 86cff30d5c4e..cd82437cf860 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -23,6 +23,7 @@
  */
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem.h>
@@ -2364,11 +2365,15 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	 */
 	if (adev->mode_info.mode_config_initialized &&
 	    !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) {
+		const struct drm_format_info *format;
+
 		/* select 8 bpp console on low vram cards */
 		if (adev->gmc.real_vram_size <= (32*1024*1024))
-			drm_fbdev_ttm_setup(adev_to_drm(adev), 8);
+			format = drm_format_info(DRM_FORMAT_C8);
 		else
-			drm_fbdev_ttm_setup(adev_to_drm(adev), 32);
+			format = NULL;
+
+		drm_client_setup(adev_to_drm(adev), format);
 	}
 
 	ret = amdgpu_debugfs_init(adev);
@@ -2980,6 +2985,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
 #ifdef CONFIG_PROC_FS
@@ -3006,6 +3012,7 @@ const struct drm_driver amdgpu_partition_driver = {
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
+	DRM_FBDEV_TTM_DRIVER_OPS,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
 
-- 
2.46.0

