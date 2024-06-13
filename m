Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA9907C3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0010EB7A;
	Thu, 13 Jun 2024 19:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485110EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:18:10 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4W0XHh3plKz4x2KM
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:18:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
 by albert.telenet-ops.be with bizsmtp
 id b7J62C00K3w30qz067J6PC; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpwS-00Ax6q-EI;
 Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpxW-00FL8b-F6;
 Thu, 13 Jun 2024 21:18:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/7] lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if
 DRM_PANIC
Date: Thu, 13 Jun 2024 21:18:01 +0200
Message-Id: <ac474c6755800e61e18bd5af407c6acb449c5149.1718305355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
References: <cover.1718305355.git.geert+renesas@glider.be>
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

When CONFIG_FONTS ("Select compiled-in fonts") is not enabled, the user
should not be asked about any fonts.  However, when CONFIG_DRM_PANIC is
enabled, the user is still asked about the Sparc console 12x22 and
Terminus 16x32 fonts.

Fix this by moving the "|| DRM_PANIC" to where it belongs.
Split the dependency in two rules to improve readability.

Fixes: b94605a3889b9084 ("lib/fonts: Allow to select fonts for drm_panic")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 lib/fonts/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
index befcb463f7381d1a..3ac26bdbc3ff01a3 100644
--- a/lib/fonts/Kconfig
+++ b/lib/fonts/Kconfig
@@ -105,7 +105,8 @@ config FONT_SUN8x16
 
 config FONT_SUN12x22
 	bool "Sparc console 12x22 font (not supported by all drivers)"
-	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
+	depends on !SPARC && FONTS
 	help
 	  This is the high resolution console font for Sun machines with very
 	  big letters (like the letters used in the SPARC PROM). If the
@@ -113,7 +114,8 @@ config FONT_SUN12x22
 
 config FONT_TER16x32
 	bool "Terminus 16x32 font (not supported by all drivers)"
-	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
+	depends on !SPARC && FONTS || SPARC
 	help
 	  Terminus Font is a clean, fixed width bitmap font, designed
 	  for long (8 and more hours per day) work with computers.
-- 
2.34.1

