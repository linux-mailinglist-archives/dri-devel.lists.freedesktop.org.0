Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA116BC51
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06B89FED;
	Tue, 25 Feb 2020 08:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FCA6E9B9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 539202939B9
Received: by earth.universe (Postfix, from userid 1000)
 id 029AC3C0C95; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 18/56] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3
 defines
Date: Tue, 25 Feb 2020 00:20:48 +0100
Message-Id: <20200224232126.3385250-19-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop local definition of common MIPI DCS 1.3 defines.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 9a2ccec27f7e..92c9dc211aeb 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -28,8 +28,6 @@
 #include "../dss/omapdss.h"
 
 #define DCS_READ_NUM_ERRORS	0x05
-#define DCS_BRIGHTNESS		0x51
-#define DCS_CTRL_DISPLAY	0x53
 #define DCS_GET_ID1		0xda
 #define DCS_GET_ID2		0xdb
 #define DCS_GET_ID3		0xdc
@@ -333,8 +331,10 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 		src->ops->dsi.bus_lock(src);
 
 		r = dsicm_wake_up(ddata);
-		if (!r)
-			r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, level);
+		if (!r) {
+			r = dsicm_dcs_write_1(ddata,
+				MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
+		}
 
 		src->ops->dsi.bus_unlock(src);
 	}
@@ -597,11 +597,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, 0xff);
+	r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, DCS_CTRL_DISPLAY,
+	r = dsicm_dcs_write_1(ddata, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 			(1<<2) | (1<<5));	/* BL | BCTRL */
 	if (r)
 		goto err;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
