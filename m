Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C240917B25
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB29C10E7C3;
	Wed, 26 Jun 2024 08:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1910E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:41:49 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4W8FYR3h8qz4x4W4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:41:47 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1dff:b715:1a2c:c3f5])
 by laurent.telenet-ops.be with bizsmtp
 id g8hm2C00K0lK4vA018hmnr; Wed, 26 Jun 2024 10:41:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sMODm-000OVn-F9;
 Wed, 26 Jun 2024 10:41:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sMODq-00Aong-AJ;
 Wed, 26 Jun 2024 10:41:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] drm/panic: Do not select DRM_KMS_HELPER
Date: Wed, 26 Jun 2024 10:41:44 +0200
Message-Id: <60155f8c939ed286e324a7c12a1daa69fe49fcf6.1719391132.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719391132.git.geert+renesas@glider.be>
References: <cover.1719391132.git.geert+renesas@glider.be>
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

DRM core code cannot call into DRM helper code, as this would lead to
circular references in the modular case.  Hence drop the selection of
DRM_KMS_HELPER.  It was unused anyway, as v10 switched from using
the DRM format helpers to its own color format conversion, cfr. commit
9544309775c334c9 ("drm/panic: Add support for color format
conversion")).

Remove the unneeded include of <drm/drm_format_helper.h>.

Fixes: bf9fb17c6672868d ("drm/panic: Add a drm panic handler")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/Kconfig     | 1 -
 drivers/gpu/drm/drm_panic.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b903a2c0b5e8f95c..ce9bf2b6e9d332d4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -108,7 +108,6 @@ config DRM_KMS_HELPER
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
 	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
-	select DRM_KMS_HELPER
 	select FONT_SUPPORT
 	help
 	  Enable a drm panic handler, which will display a user-friendly message
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 8d2eded1fd19ff6c..67f78b5a76b61e3d 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -20,7 +20,6 @@
 #include <linux/types.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper_vtables.h>
-- 
2.34.1

