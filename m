Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182FA9CEFCD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85CE10E88F;
	Fri, 15 Nov 2024 15:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kXFYnPI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F13F10E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:27:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C4365C56D5;
 Fri, 15 Nov 2024 15:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58C7C4CED2;
 Fri, 15 Nov 2024 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731684447;
 bh=InVAmuX7ITlUUswBCI+3uXLXjNaqQWFzo6gGSknDshs=;
 h=From:To:Cc:Subject:Date:From;
 b=kXFYnPI6I6M2vubKOWgG0JCP7MQYhyQgueCG9T1Xw9k/HBObrYpbv9Ig0lBW8fwFb
 5AGtW7psVWcdAFsT+HCl7rn8UFjIyM2w1pugigNETWDrCwtpKpUad7InTvDIqEqT3f
 j+XwHQvbm78yHFnBwNV98NtEjlQBTxyN03K5k7pPgj7dwiz0WC87aTNtDStYMklspd
 9D0YaP5J9AkvPZSOujby4rVG+1+elm4q/yP/IDN+t+LqyYfAiARO/v+sWihVWjqu/p
 LuGlQTIjT6tAnlDiYpIv239fVRS5H3IYPWy/OvJ9IIyIOHlQA3KYEi8hBfT+O8RyrC
 G4OJ1QqnZj/oA==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jani Nikula <jani.nikula@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: rework FB_CORE dependency
Date: Fri, 15 Nov 2024 16:27:10 +0100
Message-Id: <20241115152722.3537630-1-arnd@kernel.org>
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

The 'select FB_CORE' statement moved from CONFIG_DRM to DRM_CLIENT_LIB,
but there are now configurations that have code calling into fb_core
as built-in even though the client_lib itself is a loadable module:

x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_driver_fbdev_probe':
drm_fbdev_shmem.c:(.text+0x1fc): undefined reference to `fb_deferred_io_init'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_destroy':
drm_fbdev_shmem.c:(.text+0x2e1): undefined reference to `fb_deferred_io_cleanup'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_mmap':
drm_fbdev_shmem.c:(.text+0x34c): undefined reference to `fb_deferred_io_mmap'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_imageblit':
drm_fbdev_shmem.c:(.text+0x35f): undefined reference to `sys_imageblit'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_copyarea':
drm_fbdev_shmem.c:(.text+0x38b): undefined reference to `sys_copyarea'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_fillrect':
drm_fbdev_shmem.c:(.text+0x3b7): undefined reference to `sys_fillrect'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_write':
drm_fbdev_shmem.c:(.text+0x3e9): undefined reference to `fb_sys_write'
x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_read':
drm_fbdev_shmem.c:(.text+0x413): undefined reference to `fb_sys_read'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
drm_fb_helper.c:(.text+0x2c6): undefined reference to `fb_set_suspend'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
drm_fb_helper.c:(.text+0x2e1): undefined reference to `fb_set_suspend'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_info':
drm_fb_helper.c:(.text+0x33a): undefined reference to `framebuffer_alloc'
x86_64-linux-ld: drm_fb_helper.c:(.text+0x359): undefined reference to `fb_alloc_cmap'
x86_64-linux-ld: drm_fb_helper.c:(.text+0x368): undefined reference to `framebuffer_release'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_release_info':
drm_fb_helper.c:(.text+0x3a4): undefined reference to `fb_dealloc_cmap'
x86_64-linux-ld: drm_fb_helper.c:(.text+0x3ab): undefined reference to `framebuffer_release'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_info':
drm_fb_helper.c:(.text+0x3bb): undefined reference to `unregister_framebuffer'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
drm_fb_helper.c:(.text+0xb6d): undefined reference to `register_framebuffer'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
drm_fb_helper.c:(.text+0x167a): undefined reference to `fb_set_suspend'

Since the code that calls into fb_core is not actually in the client_lib
module but in other helper libraries, move the 'select' again to the
places that actually call into fb_core, in this case DRM_GEM_SHMEM_HELPER
and DRM_KMS_HELPER.

Fixes: dadd28d4142f ("drm/client: Add client-lib module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have only given this light build testing. It seems sensible on the surface,
but there is a chance that there are additional helpers that need the same
'select'. Moving it into CONFIG_DRM itself would be the safer option, but
that seems to defeat the purpose of the client-lib module.
---
 drivers/gpu/drm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index a4a092ee70d9..4f21bff6282a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -98,6 +98,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
@@ -220,7 +221,6 @@ config DRM_CLIENT_LIB
 	tristate
 	depends on DRM
 	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
-	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  This option enables the DRM client library and selects all
 	  modules and components according to the enabled clients.
@@ -372,6 +372,7 @@ config DRM_GEM_SHMEM_HELPER
 	tristate
 	depends on DRM && MMU
 	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM shmem helper functions
 
-- 
2.39.5

