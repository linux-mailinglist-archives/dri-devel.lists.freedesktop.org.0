Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D18ACA9C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4859310F540;
	Mon, 22 Apr 2024 10:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A291112982
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:30:48 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4VNM394bsQz4x1QW
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by xavier.telenet-ops.be with bizsmtp
 id EAWj2C00L0SSLxL01AWjBN; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqw1-001cwA-AV;
 Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqwd-005i3s-Ar;
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
Subject: [PATCH 06/11] Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends
 on"
Date: Mon, 22 Apr 2024 12:30:34 +0200
Message-Id: <a40e70a0abd3d841c23c107d452a43fdd70ef37a.1713780345.git.geert+renesas@glider.be>
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

This reverts commit 3166e7e6d935caaef07605a5c90773fbf9ffeaf4, as helper
code should always be selected by the driver that needs it, for the
convenience of the final user configuring a kernel.

The user who configures a kernel should not need to know which helpers
are needed for the driver he is interested in.  Making a driver depend
on helper code means that the user needs to know which helpers to enable
first, which is very user-unfriendly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig      | 2 +-
 drivers/gpu/drm/bridge/Kconfig          | 2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig | 2 +-
 drivers/gpu/drm/bridge/cadence/Kconfig  | 2 +-
 drivers/gpu/drm/display/Kconfig         | 1 -
 drivers/gpu/drm/i915/Kconfig            | 2 +-
 drivers/gpu/drm/xe/Kconfig              | 2 +-
 7 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 1662dc49f18ed11e..ba09121e7debb247 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -4,13 +4,13 @@ config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d1fbf8796fea8dbe..ad38cd201b006251 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -94,9 +94,9 @@ config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select EXTCON
 	select CRYPTO
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 12bfea53bf24b2c2..9659df6718de6db4 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -35,9 +35,9 @@ config DRM_ANALOGIX_ANX7625
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 7817f6f56607141f..3480fd4d0a5f76e4 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -24,9 +24,9 @@ endif
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index d65f1a37c08c7cf8..9801f47a3704530d 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -67,7 +67,6 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 config DRM_DISPLAY_HDCP_HELPER
 	bool "DRM HDCD Helpers"
 	depends on DRM_DISPLAY_HELPER
-	default y
 	help
 	  DRM display helpers for HDCP.
 
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 87ef8c4d72a53768..dbde4e29d93a79dc 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -3,7 +3,6 @@ config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
@@ -13,6 +12,7 @@ config DRM_I915
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1fa8ef75823c7a6b..02da2faf5ae33bdb 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -4,7 +4,6 @@ config DRM_XE
 	depends on (m || (y && KUNIT=y))
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
@@ -19,6 +18,7 @@ config DRM_XE
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_MIPI_DSI
 	select RELAY
-- 
2.34.1

