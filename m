Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ADA8ACAAF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10AA11298D;
	Mon, 22 Apr 2024 10:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4376D112985
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:30:48 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4VNM392Yh9z4wwdf
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by laurent.telenet-ops.be with bizsmtp
 id EAWj2C00H0SSLxL01AWjqs; Mon, 22 Apr 2024 12:30:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqw1-001cwT-Eo;
 Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqwd-005i4H-G5;
 Mon, 22 Apr 2024 12:30:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/11] Revert "drm/display: Make all helpers visible and
 switch to depends on"
Date: Mon, 22 Apr 2024 12:30:39 +0200
Message-Id: <3db958e3f4002e26cd963596d810c37feb315fb3.1713780345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713780345.git.geert+renesas@glider.be>
References: <cover.1713780345.git.geert+renesas@glider.be>
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

This reverts commit d674858ff979550a0e97b4ac766f2640f0d9d7e7, as helper
code should always be selected by the driver that needs it, for the
convenience of the final user configuring a kernel.

The user who configures a kernel should not need to know which helpers
are needed for the driver he is interested in.  Making a driver depend
on helper code means that the user needs to know which helpers to enable
first, which is very user-unfriendly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/display/Kconfig | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index c77e7f85bd674dc9..864a6488bfdf1499 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,21 +1,20 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_DISPLAY_HELPER
-	tristate "DRM Display Helpers"
+	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
 config DRM_DISPLAY_DP_AUX_BUS
-	tristate "DRM DisplayPort AUX bus support"
+	tristate
 	depends on DRM
 	depends on OF || COMPILE_TEST
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
@@ -25,24 +24,23 @@ config DRM_DISPLAY_DP_AUX_CEC
 	  that do support this they often do not hook up the CEC pin.
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
-	bool "DRM DisplayPort AUX Interface"
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on DRM_DISPLAY_DP_HELPER
+	bool "DRM DP AUX Interface"
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
 	  channel.
 
 config DRM_DISPLAY_DP_HELPER
-	bool "DRM DisplayPort Helpers"
+	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
 config DRM_DISPLAY_DP_TUNNEL
-	bool "DRM DisplayPort tunnels support"
-	depends on DRM_DISPLAY_DP_HELPER
+	bool
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Enable support for DisplayPort tunnels. This allows drivers to use
 	  DP tunnel features like the Bandwidth Allocation mode to maximize the
@@ -62,13 +60,13 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	  If in doubt, say "N".
 
 config DRM_DISPLAY_HDCP_HELPER
-	bool "DRM HDCD Helpers"
+	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
-	bool "DRM HDMI Helpers"
+	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
-- 
2.34.1

