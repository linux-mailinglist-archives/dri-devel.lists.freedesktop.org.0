Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948FC8B3924
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 15:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2194F112429;
	Fri, 26 Apr 2024 13:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FXZy47Tm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9A6112429
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 13:56:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DBE6062098;
 Fri, 26 Apr 2024 13:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A74FC2BD10;
 Fri, 26 Apr 2024 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714139769;
 bh=0+zg+HziepsJXdpuYfXEg99K1gcbh+aTdTuGOHhJCk8=;
 h=From:To:Cc:Subject:Date:From;
 b=FXZy47TmOUSg3WqWMcMut1Z7zIiZ4tmxrMRafdj5yH1iWAAh+yHzXlHbaNlxGA5Ot
 CV1+3AWLq9oEj0+MZ7uk/d+XiQu63zslESmwEqQQX9z6z0W+R1wuNRxIP5T9PM2c04
 jfx9fVrA+LYvBpDU0VnsR0E+lIOIAY2091nAM2v+fX30k0457MkPQ9idi8rce6dtT6
 AAyOfHXcG2It/3dta/8aCg923akzlajAkTsmmr6Juu0iRFGp2wry9p+icBkfFRDYg7
 3L1heWYtSAESsX+VLYZC+GmrUGY2MfMugWazphB0375F0QSv4ZJVzqzrd5+L9906bz
 c1IgnoFFGR6wQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Masahiro Yamada <masahiroy@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: move DRM-related CONFIG options into DRM submenu
Date: Fri, 26 Apr 2024 22:56:02 +0900
Message-Id: <20240426135602.2500125-1-masahiroy@kernel.org>
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
ambiguity about its end because the code between 'menu' and 'endmenu'
becomes the submenu.

In contrast, 'menuconfig' does not have the corresponding end marker.
Instead, the end of the submenu is inferred from symbol dependencies.

This is detailed in Documentation/kbuild/kconfig-language.rst, starting
line 348. It outlines two methods to place the code under the submenu:

 (1) Open an if-block immediately after 'menuconfig', enclosing the
     submenu content within it

 (2) Add 'depends on' to every symbol intended for the submenu

Many subsystems opt for (1) because it reliably maintains the submenu
structure.

The DRM subsystem adopts (2). The submenu ends when the sequence of
'depends on DRM' breaks. It can be confirmed by running a GUI frontend
such as 'make menuconfig' and visiting the DRM menu:

    < > Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)  ----

If you toggle this, you will notice most of the DRM-related options
appear below it, not in the submenu.

I highly recommend the approach (1). Obviously, (2) is not reliable,
as the submenu breaks whenever someone forgets to add 'depends on DRM'.

This commit encloses the entire DRM configuration with 'if DRM' and
'endif', except for DRM_PANEL_ORIENTATION_QUIRKS.

Note:
 Now, 'depends on DRM' properties inside the if-block are all redundant.
 I leave it as follow-up cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---

Changes in v2:
  - Rebased onto next-20240426

 drivers/gpu/drm/Kconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 959b19a04101..7df15543a70a 100644
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
@@ -439,10 +441,6 @@ config DRM_HYPERV
 config DRM_EXPORT_FOR_TESTS
 	bool
 
-# Separate option because drm_panel_orientation_quirks.c is shared with fbdev
-config DRM_PANEL_ORIENTATION_QUIRKS
-	tristate
-
 config DRM_LIB_RANDOM
 	bool
 	default n
@@ -463,3 +461,9 @@ config DRM_WERROR
 	  this config option is disabled by default.
 
 	  If in doubt, say N.
+
+endif
+
+# Separate option because drm_panel_orientation_quirks.c is shared with fbdev
+config DRM_PANEL_ORIENTATION_QUIRKS
+	tristate
-- 
2.40.1

