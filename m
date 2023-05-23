Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB170E08E
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49D10E461;
	Tue, 23 May 2023 15:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEA210E461
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 15:32:45 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4QQdc9011Yz4x1bf
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:32:41 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
 by michel.telenet-ops.be with bizsmtp
 id 0FXf2A0030Jkz7G06FXfv6; Tue, 23 May 2023 17:31:40 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1Tyu-002t3m-Lw;
 Tue, 23 May 2023 17:31:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1Tz9-00Ckb5-3w;
 Tue, 23 May 2023 17:31:39 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3 5/5] drm: shmobile: Make DRM_SHMOBILE visible on Renesas
 SoC platforms
Date: Tue, 23 May 2023 17:31:37 +0200
Message-Id: <40ac67e0887d833ab4a3f1ec24828dedf0d8e108.1684854992.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684854992.git.geert+renesas@glider.be>
References: <cover.1684854992.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCD Controller supported by the drm-shmob driver is present
on SuperH SH-Mobile SoCs, and on Renesas ARM SH/R-Mobile SoCs.
Unfortunately its config option is not visible on either, so the user
can never enable the support.

Fix this by dropping the dependency on ARM (for SuperH), and by widening
the dependency range to ARCH_RENESAS (for ARM).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by,
  - Drop dependency on ARM, reword.

The driver was disabled on SuperH in commit c66de8cc2ea62941
("drm/shmobile: Add run-time dependencies") in v3.16 because of build
issues.  I couldn't find further details, but currently it builds fine
on (at least) arm, arm64, sh, riscv, and m68k.
---
 drivers/gpu/drm/shmobile/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/Kconfig b/drivers/gpu/drm/shmobile/Kconfig
index 4ec5dc74a6b0b880..ad14112999ad8aba 100644
--- a/drivers/gpu/drm/shmobile/Kconfig
+++ b/drivers/gpu/drm/shmobile/Kconfig
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_SHMOBILE
 	tristate "DRM Support for SH Mobile"
-	depends on DRM && ARM
-	depends on ARCH_SHMOBILE || COMPILE_TEST
+	depends on DRM
+	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.34.1

