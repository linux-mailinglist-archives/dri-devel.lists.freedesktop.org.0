Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF596142E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3910E38B;
	Tue, 27 Aug 2024 16:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59CDC10E389
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:37:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.10,180,1719846000"; d="scan'208";a="216735631"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2024 01:37:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.25])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5AB654004BAB;
 Wed, 28 Aug 2024 01:37:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rz-du: Add Kconfig dependency between RZG2L_DU
 and RZG2L_MIPI_DSI
Date: Tue, 27 Aug 2024 17:37:24 +0100
Message-ID: <20240827163727.108405-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

Add Kconfig dependency between RZG2L_DU and RZG2L_MIPI_DSI, so that
DSI module has functional dependency on DU. It is similar way that
the R-Car MIPI DSI encoder is handled.

While at it drop ARCH_RENESAS dependency as DRM_RZG2L_DU depend on
ARCH_RZG2L.

Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/Kconfig | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 8ec14271ebba..a9488f873436 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -11,10 +11,15 @@ config DRM_RZG2L_DU
 	  Choose this option if you have an RZ/G2L alike chipset.
 	  If M is selected the module will be called rzg2l-du-drm.
 
-config DRM_RZG2L_MIPI_DSI
-	tristate "RZ/G2L MIPI DSI Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
-	depends on ARCH_RENESAS || COMPILE_TEST
-	select DRM_MIPI_DSI
+config DRM_RZG2L_USE_MIPI_DSI
+	bool "RZ/G2L MIPI DSI Encoder Support"
+	depends on DRM_BRIDGE && OF
+	depends on DRM_RZG2L_DU || COMPILE_TEST
+	default DRM_RZG2L_DU
 	help
 	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
+
+config DRM_RZG2L_MIPI_DSI
+	def_tristate DRM_RZG2L_DU
+	depends on DRM_RZG2L_USE_MIPI_DSI
+	select DRM_MIPI_DSI
-- 
2.43.0

