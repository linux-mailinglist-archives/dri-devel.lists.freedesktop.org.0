Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C065326F17
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 22:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9F6E096;
	Sat, 27 Feb 2021 21:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA1C6E096
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 21:50:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id C1C721F441E1
Received: by jupiter.universe (Postfix, from userid 1000)
 id 8F83A4800E2; Sat, 27 Feb 2021 22:50:42 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
Date: Sat, 27 Feb 2021 22:45:42 +0100
Message-Id: <20210227214542.99961-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <YDnyVV/O78sQjtWb@atomide.com>
References: <YDnyVV/O78sQjtWb@atomide.com>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sre@kernel.org>

Disable TE for Droid 4 panel, since implementation is currently
broken. Also disable it for N950 panel, which is untested.

Reported-by: Tony Lindgren <tony@atomide.com>
Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
I suggest to start by fix the regression like this and look into
proper Droid 4 TE support separatly. Assumption is, that Tomi
tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
is untested [*], so choosing safe default. Patch is compile-tested
only.

[*] N950 display is not yet functional on mainline, since it needs
the omap3 FIFO workaround:
https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/commit/?h=n950-display-tony&id=d4cbc226a30b29bf2583ffff97b052c9ec68c8a3
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index af381d756ac1..5fbfb71ca3d9 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -37,6 +37,7 @@ struct dsic_panel_data {
 	u32 height_mm;
 	u32 max_hs_rate;
 	u32 max_lp_rate;
+	bool te_support;
 };
 
 struct panel_drv_data {
@@ -334,9 +335,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (r)
-		goto err;
+	if (ddata->panel_data->te_support) {
+		r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+		if (r)
+			goto err;
+	}
 
 	/* possible panel bug */
 	msleep(100);
@@ -619,6 +622,7 @@ static const struct dsic_panel_data taal_data = {
 	.height_mm = 0,
 	.max_hs_rate = 300000000,
 	.max_lp_rate = 10000000,
+	.te_support = true,
 };
 
 static const struct dsic_panel_data himalaya_data = {
@@ -629,6 +633,7 @@ static const struct dsic_panel_data himalaya_data = {
 	.height_mm = 88,
 	.max_hs_rate = 300000000,
 	.max_lp_rate = 10000000,
+	.te_support = false,
 };
 
 static const struct dsic_panel_data droid4_data = {
@@ -639,6 +644,7 @@ static const struct dsic_panel_data droid4_data = {
 	.height_mm = 89,
 	.max_hs_rate = 300000000,
 	.max_lp_rate = 10000000,
+	.te_support = false,
 };
 
 static const struct of_device_id dsicm_of_match[] = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
