Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C33DA18C42
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 07:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FD810E11C;
	Wed, 22 Jan 2025 06:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L0GkzAkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D810C10E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 06:47:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1D4C5C47E3;
 Wed, 22 Jan 2025 06:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C18C4CED6;
 Wed, 22 Jan 2025 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737528420;
 bh=k0TcVNYOkFo0OjNw5zjwtybg6Pjk0UGlNrXTS/BXu8U=;
 h=From:To:Cc:Subject:Date:From;
 b=L0GkzAkFCU1pbcxpYLYlPZo23sehZA54Jnrom+v5zCd3hpGrOTDcEKXgEdND64gjV
 gneHYNuckvL2sSLuLLn2KjOodF9x7YtU7v8KpqKpaTXQtAOGgrp1XIEEoO/azFhm2W
 639FDKwJEU5akn+KA/9mNIMIhGItEL618CZxI4d6ui0Xr53AEBh99hxXjA8XPvFzLV
 F1INLh+px8I1ZiGQJpjRmUu9VXRBhY4pipvjqfriys3AeQhCjc/+la0B1TUkAzOH83
 Ze8fbS6RAbzfVq0+NkJ1Y4GPPEDpzMocvAu5JxqaXnQkuk/cFO2xZLpk9w5zkyy38J
 CbWuhaIuFzssw==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
Date: Wed, 22 Jan 2025 07:46:33 +0100
Message-Id: <20250122064655.1095176-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

In the combination of DRM_KMS_HELPER=m, DRM_GEM_SHMEM_HELPER=y, DRM_FBDEV_EMULATION=y,
The shmem code fails to link against the KMS helpers:

x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_driver_fbdev_probe':
(.text+0xeec601): undefined reference to `drm_fb_helper_alloc_info'
x86_64-linux-ld: (.text+0xeec633): undefined reference to `drm_fb_helper_fill_info'
x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_get_page':
drm_fbdev_shmem.c:(.text+0xeec7d2): undefined reference to `drm_gem_fb_get_obj'
x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_fb_mmap':
drm_fbdev_shmem.c:(.text+0xeec9f6): undefined reference to `drm_gem_fb_get_obj'
x86_64-linux-ld: vmlinux.o: in function `drm_fbdev_shmem_defio_imageblit':
(.rodata+0x5b2288): undefined reference to `drm_fb_helper_check_var'
x86_64-linux-ld: (.rodata+0x5b2290): undefined reference to `drm_fb_helper_set_par'

This can happen for a number of device drivers that select DRM_GEM_SHMEM_HELPER
without also selecting DRM_KMS_HELPER. To work around this, add another select
that forces DRM_KMS_HELPER to be built-in rather than a loadable module, but
only if FBDEV emulation is also enabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0fe99d440bfa..a8d2dffbc82f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -311,6 +311,7 @@ config DRM_GEM_SHMEM_HELPER
 	depends on DRM && MMU
 	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM shmem helper functions
 
-- 
2.39.5

