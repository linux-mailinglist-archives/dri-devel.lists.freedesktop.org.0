Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E256D2EFF42
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1E96E949;
	Sat,  9 Jan 2021 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E052B89870
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 11:25:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 78BB81F416A5
Received: by jupiter.universe (Postfix, from userid 1000)
 id 5A3E74800B9; Fri,  8 Jan 2021 12:24:59 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCHv1] video: omapfb2: Make standard and custom DSI command mode
 panel driver mutually exclusive
Date: Fri,  8 Jan 2021 12:24:41 +0100
Message-Id: <20210108112441.14609-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108122540.657501b2@canb.auug.org.au>
References: <20210108122540.657501b2@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-next@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Standard DRM panel driver for DSI command mode panel used by omapfb2 is also
available now. Just like the other panels its module name clashes with the
module from drivers/video/fbdev/omap2/omapfb/displays, part of the deprecated
omapfb2 fbdev driver. As omapfb2 can only be compiled when the omapdrm driver
is disabled, and the DRM panel drivers are useless in that case, make the
omapfb2 panel depend on the standard DRM panels being disabled to fix
the name clash.

Fixes: cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Laurent introduced and fixed the same issue for the other panels and
this simply replicates the same solution for DSI command mode panel.
---
 drivers/video/fbdev/omap2/omapfb/displays/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/Kconfig b/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
index 744416dc530e..384d74a126dc 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
@@ -43,6 +43,7 @@ config FB_OMAP2_PANEL_DPI
 config FB_OMAP2_PANEL_DSI_CM
 	tristate "Generic DSI Command Mode Panel"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_PANEL_DSI_CM = n
 	help
 	  Driver for generic DSI command mode panels.
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
