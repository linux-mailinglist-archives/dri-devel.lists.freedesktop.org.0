Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09370632BDD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C79410E32C;
	Mon, 21 Nov 2022 18:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 21 Nov 2022 18:16:31 UTC
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6C6110E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 18:16:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,182,1665414000"; d="scan'208";a="143437121"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2022 03:11:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.177])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6BE0840A598F;
 Tue, 22 Nov 2022 03:11:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: rcar-du: Fix Kconfig dependency between DRM and
 RZG2L_MIPI_DSI
Date: Mon, 21 Nov 2022 18:11:21 +0000
Message-Id: <20221121181121.168278-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DRM=m and CONFIG_DRM_RZG2L_MIPI_DSI=y, it results in a
build failure. This patch fixes the build issue by adding dependency
to DRM.

Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref:
 * https://lore.kernel.org/linux-renesas-soc/OS0PR01MB592298E75153A52245D789D4860A9@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#u
---
 drivers/gpu/drm/rcar-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 1065dca885ef..b2bddbeca878 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -56,7 +56,7 @@ config DRM_RCAR_MIPI_DSI
 
 config DRM_RZG2L_MIPI_DSI
 	tristate "RZ/G2L MIPI DSI Encoder Support"
-	depends on DRM_BRIDGE && OF
+	depends on DRM && DRM_BRIDGE && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_MIPI_DSI
 	help
-- 
2.25.1

