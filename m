Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C602EC23D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 18:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F8289ACD;
	Wed,  6 Jan 2021 17:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A2589ACD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 17:30:11 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxCdN-0002cf-OY; Wed, 06 Jan 2021 18:30:09 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/imx: dw_hdmi-imx: depend on OF to fix randconfig compile
 tests on x86_64
Date: Wed,  6 Jan 2021 18:30:03 +0100
Message-Id: <20210106173003.14117-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i.MX6 HDMI driver uses of_drm_find_bridge() and thus cannot be built
with CONFIG_OF disabled:

    ld: drivers/gpu/drm/imx/dw_hdmi-imx.o: in function `dw_hdmi_imx_probe':
    dw_hdmi-imx.c:(.text+0x29f): undefined reference to `of_drm_find_bridge'

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: c805ec7eb210 ("drm/imx: dw_hdmi-imx: move initialization into probe")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 73fe2bc5633c..b5fa0e45a839 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -37,7 +37,7 @@ config DRM_IMX_LDB
 config DRM_IMX_HDMI
 	tristate "Freescale i.MX DRM HDMI"
 	select DRM_DW_HDMI
-	depends on DRM_IMX
+	depends on DRM_IMX && OF
 	help
 	  Choose this if you want to use HDMI on i.MX6.
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
