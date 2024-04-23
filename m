Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149208AE214
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 12:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863D41132A0;
	Tue, 23 Apr 2024 10:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mHCxxhVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5201132A0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 10:25:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FFA9612E8;
 Tue, 23 Apr 2024 10:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F57BC3277B;
 Tue, 23 Apr 2024 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713867945;
 bh=n09yJzubRKA9cSYp8TkeTpJhWQ1QQIIQzpKSNmbwu1k=;
 h=From:To:Cc:Subject:Date:From;
 b=mHCxxhVA6cyU/PoiepmDlSLS+H7E3lXEVZZ7SkQkbRwU8wsJn7yq/gsrdZ/KQ8EWQ
 qTdpyo+2/eOC0aeBtVgoHDfCIzopETuwzyuMteiQN0gOmyQFRX7HK+D8L6Qhs1nSf6
 QSW5QnB3PyHGaVi8/l72o8F+us2LH4bpe0oFOeOkxpMCBJBY9IfpsuMMMLnryGz3cD
 xE/GSa9LVnBLrOWUt19DDw6R4yEA4xjbFxKiOupkHRJaRa4+MRQgeR4IoqQPpzY+Y2
 /eI7tzFD1uKkwRbUpC0GOeZz2y8yY+HaAhUWdjcPSqVCGFWqu84OB0sN7tXOLyUw0i
 tbJVwJjELHQGQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] drm: move DRM-related CONFIG options into DRM submenu
Date: Tue, 23 Apr 2024 19:24:43 +0900
Message-Id: <20240423102443.453261-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
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

When you create a submenu using the 'menu' syntax, there is no
ambiguity about the end of the submenu because the code between
'menu' and 'endmenu' becomes the submenu.

In contrast, 'menuconfig' does not have the corresponding end marker.
Instead, it infers the end of submenu from symbol dependency.

This is described in Documentation/kbuild/kconfig-language.rst,
starting line 348. It demonstrates two ways to place the code under
the submenu:

 (1) open an if-block right after the 'menuconfig', placing the submenu
     content inside the if-block

 (2) give 'depends on' to every symbol that should go into the submenu

Many subsystems adopt (1) because it is the only reliable way to
maintain the submenu structure. It ensures the code enclosed within the
if-block is placed under the submenu.

The DRM subsystem adopts (2). The submenu ends when the sequence of
'depends on' breaks. DRM_DEBUG_MODESET_LOCK is the first option that
does not depend on DRM. So, DRM_DEBUG_MODESET_LOCK and subsequent
options reside outside the DRM submenu.

You can confirm it by running a GUI frontend such as 'make menuconfig'
and visiting the DRM menu:

    < > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)  ----

If you toggle '< >', you will notice most of the DRM-related options
appear below it, not in the submenu.

I highly recommend the approach (1). Obviously, (2) is not a reliable
way because the submenu breaks whenever someone forgets to add
'depends on DRM'.

This commit surrounds the entire DRM configuration with 'if DRM' and
'endif', except DRM_PANEL_ORIENTATION_QUIRKS.

Note:
 Now, 'depends on DRM' properties inside 'if DRM' ... 'endif' are
 all redundant. I leave it as follow-up cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/Kconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5a0c476361c3..11f952d540aa 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -29,6 +29,8 @@ menuconfig DRM
 	  details.  You should also select and configure AGP
 	  (/dev/agpgart) support if it is available for your platform.
 
+if DRM
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
@@ -403,10 +405,6 @@ config DRM_HYPERV
 config DRM_EXPORT_FOR_TESTS
 	bool
 
-# Separate option because drm_panel_orientation_quirks.c is shared with fbdev
-config DRM_PANEL_ORIENTATION_QUIRKS
-	tristate
-
 config DRM_LIB_RANDOM
 	bool
 	default n
@@ -414,3 +412,9 @@ config DRM_LIB_RANDOM
 config DRM_PRIVACY_SCREEN
 	bool
 	default n
+
+endif
+
+# Separate option because drm_panel_orientation_quirks.c is shared with fbdev
+config DRM_PANEL_ORIENTATION_QUIRKS
+	tristate
-- 
2.40.1

