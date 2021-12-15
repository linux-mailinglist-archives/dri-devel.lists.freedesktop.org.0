Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044E47552F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70DE10E2F4;
	Wed, 15 Dec 2021 09:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5610E2F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:27:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id WZTr2600c4C55Sk06ZTraj; Wed, 15 Dec 2021 10:27:52 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxQZi-0056TJ-2O; Wed, 15 Dec 2021 10:27:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxQZh-009ai4-CA; Wed, 15 Dec 2021 10:27:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on
 ARCH_RENESAS
Date: Wed, 15 Dec 2021 10:27:47 +0100
Message-Id: <c8599f5ba4f281a71240b3d6a8f27f450dfb5d17.1639559338.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639559338.git.geert+renesas@glider.be>
References: <cover.1639559338.git.geert+renesas@glider.be>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Renesas R-Car Display Unit embedded MIPI DSI encoder is only present
on Renesas R-Car V3U SoCs.  Hence add a dependency on ARCH_RENESAS, to
prevent asking the user about this driver when configuring a kernel
without Renesas SoC support.

Fixes: 155358310f013c23 ("drm: rcar-du: Add R-Car DSI driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index a7aa556e301d1087..2f4f6ac5fd4e66b1 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -48,6 +48,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_MIPI_DSI
 	tristate "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM && DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_MIPI_DSI
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
-- 
2.25.1

