Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519AFA18E06
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811BD10E3A4;
	Wed, 22 Jan 2025 09:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bMX1jIuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BCF10E3A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:02:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D52C6A41DA1;
 Wed, 22 Jan 2025 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA55FC4CED6;
 Wed, 22 Jan 2025 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737536536;
 bh=cHGaAR0+/1s5/4TD3iKm/3CaJjr0/Y+2x9Rqn037+Wk=;
 h=From:To:Cc:Subject:Date:From;
 b=bMX1jIuhdvDBsBu6TRaWJuhjllpcf/2C0dd0pzwPHxkmIK7UkXC5jqBTbOgK+gBE1
 Z/D5XhaWZm8sh65B/qmL4+F6Gp+hNUHMFAJi+bcmYabzBPVC0tJJiSLAT3Aw4Qa06j
 fxIYHWkxIv3+nxkkm8Og6iEIHQIqd103qLefk2ZtP68WO1jMcrNKJifZSdm4l3YWuG
 aAUaZZWZfEf0Rljv+M+dP8iTKQ9XBwbezNtzZgU0gEhK/M4L2il4blj0fkNkYL83AK
 q4lNAGz+7iuFP/Z/8N7gNgWbPORQoGzFpVGnLN4PrWG9pal8XCgy6abNc4bFFtwFnZ
 hPw0PdHZmxxbw==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
Date: Wed, 22 Jan 2025 10:02:03 +0100
Message-Id: <20250122090211.3161186-1-arnd@kernel.org>
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
only if FBDEV emulation is also enabled. DRM_TTM_HELPER and DRM_GEM_DMA_HELPER
look like they have the same problem in theory even if there is no possible
configuration that shows it. For consistency, do the same change to those.

Closes: https://lore.kernel.org/all/20250121-greedy-flounder-of-abundance-4d2ee8-mkl@pengutronix.de
Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0fe99d440bfa..805c6c78498f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -293,6 +293,7 @@ config DRM_TTM_HELPER
 	tristate
 	depends on DRM
 	select DRM_TTM
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
@@ -301,6 +302,7 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
@@ -309,6 +311,7 @@ config DRM_GEM_DMA_HELPER
 config DRM_GEM_SHMEM_HELPER
 	tristate
 	depends on DRM && MMU
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	select FB_CORE if DRM_FBDEV_EMULATION
 	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
-- 
2.39.5

