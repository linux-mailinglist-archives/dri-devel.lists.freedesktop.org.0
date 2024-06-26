Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38168917B24
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05BB10E7C2;
	Wed, 26 Jun 2024 08:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CAB10E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:41:49 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4W8FYR4pxZz4x2dB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:41:47 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1dff:b715:1a2c:c3f5])
 by albert.telenet-ops.be with bizsmtp
 id g8hm2C00G0lK4vA068hmGN; Wed, 26 Jun 2024 10:41:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sMODm-000OVr-Fx;
 Wed, 26 Jun 2024 10:41:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sMODq-00Aonj-By;
 Wed, 26 Jun 2024 10:41:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] drm/panic: Restrict graphical logo handling to built-in
Date: Wed, 26 Jun 2024 10:41:45 +0200
Message-Id: <4009fca99a7c05f617cc9899c6d0a5748415595d.1719391132.git.geert+renesas@glider.be>
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

When CONFIG_DRM_PANIC=y, but CONFIG_DRM=m:

    ld: drivers/gpu/drm/drm_panic.o: in function `drm_panic_setup_logo':
    drivers/gpu/drm/drm_panic.c:99: multiple definition of `init_module'; drivers/gpu/drm/drm_drv.o:drivers/gpu/drm/drm_drv.c:1079: first defined here

Fix this by restricting the graphical logo handling and its
device_initcall() to the built-in case.  Logos are freed during late
kernel initialization, so they are no longer available at module load
time anyway.

Fixes: 294bbd1f2697ff28 ("drm/panic: Add support for drawing a monochrome graphical logo")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406261341.GYsbLpN1-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 67f78b5a76b61e3d..948aed00595eb6dd 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -91,7 +91,7 @@ static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE(" \\___)=(___/"),
 };
 
-#ifdef CONFIG_LOGO
+#if defined(CONFIG_LOGO) && !defined(MODULE)
 static const struct linux_logo *logo_mono;
 
 static int drm_panic_setup_logo(void)
-- 
2.34.1

