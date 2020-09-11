Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0A26606A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7059D6EA45;
	Fri, 11 Sep 2020 13:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6706E116
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-OX; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/21] drm/imx: imx-ldb: reduce scope of edid_len
Date: Fri, 11 Sep 2020 15:38:38 +0200
Message-Id: <20200911133855.29801-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911133855.29801-1-p.zabel@pengutronix.de>
References: <20200911133855.29801-1-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The edid_len variable is never used again. Use a local variable instead
of storing it in the device structure.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v2.
---
 drivers/gpu/drm/imx/imx-ldb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index af757d1e21fe..41e2978cb1eb 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -62,7 +62,6 @@ struct imx_ldb_channel {
 	struct i2c_adapter *ddc;
 	int chno;
 	void *edid;
-	int edid_len;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -536,15 +535,14 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
+		int edid_len;
+
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
-		edidp = of_get_property(child, "edid",
-					&channel->edid_len);
+		edidp = of_get_property(child, "edid", &edid_len);
 		if (edidp) {
-			channel->edid = kmemdup(edidp,
-						channel->edid_len,
-						GFP_KERNEL);
+			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
 		} else if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
