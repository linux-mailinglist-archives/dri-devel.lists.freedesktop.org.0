Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98931A555E
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7C36E3AA;
	Sat, 11 Apr 2020 23:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719FA6E3A6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 23:11:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B49A20787;
 Sat, 11 Apr 2020 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646662;
 bh=GIEKuAB7s/9IVjXTZcyPCqV0JvHIW/FNUMj4+l00vTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ptVoHVjqHGuZSdEGAaHFiOHpFuxUhOrAvnlNDP2/rvD6qBHfrYqaAB9VOdYgFRhc3
 huZQr485yP6xYjfkdJlBhi4hA5E3Lag2Yjg0K4uEG5jx2ZvMqHEezi+6sErpvOGp6a
 djW19kHxdy8Z+YSh3xK4g2ndqEY2S5hQmkyitCeI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 063/108] drm/omap: dss: Cleanup DSS ports on
 initialisation failure
Date: Sat, 11 Apr 2020 19:08:58 -0400
Message-Id: <20200411230943.24951-63-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230943.24951-1-sashal@kernel.org>
References: <20200411230943.24951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 2a0a3ae17d36fa86dcf7c8e8d7b7f056ebd6c064 ]

When the DSS initialises its output DPI and SDI ports, failures don't
clean up previous successfully initialised ports. This can lead to
resource leak or memory corruption. Fix it.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200226112514.12455-22-laurent.pinchart@ideasonboard.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 43 +++++++++++++++++++------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 4bdd63b571002..ac93dae2a9c84 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1151,46 +1151,38 @@ static const struct dss_features dra7xx_dss_feats = {
 	.has_lcd_clk_src	=	true,
 };
 
-static int dss_init_ports(struct dss_device *dss)
+static void __dss_uninit_ports(struct dss_device *dss, unsigned int num_ports)
 {
 	struct platform_device *pdev = dss->pdev;
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
 	unsigned int i;
-	int r;
 
-	for (i = 0; i < dss->feat->num_ports; i++) {
+	for (i = 0; i < num_ports; i++) {
 		port = of_graph_get_port_by_id(parent, i);
 		if (!port)
 			continue;
 
 		switch (dss->feat->ports[i]) {
 		case OMAP_DISPLAY_TYPE_DPI:
-			r = dpi_init_port(dss, pdev, port, dss->feat->model);
-			if (r)
-				return r;
+			dpi_uninit_port(port);
 			break;
-
 		case OMAP_DISPLAY_TYPE_SDI:
-			r = sdi_init_port(dss, pdev, port);
-			if (r)
-				return r;
+			sdi_uninit_port(port);
 			break;
-
 		default:
 			break;
 		}
 	}
-
-	return 0;
 }
 
-static void dss_uninit_ports(struct dss_device *dss)
+static int dss_init_ports(struct dss_device *dss)
 {
 	struct platform_device *pdev = dss->pdev;
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
-	int i;
+	unsigned int i;
+	int r;
 
 	for (i = 0; i < dss->feat->num_ports; i++) {
 		port = of_graph_get_port_by_id(parent, i);
@@ -1199,15 +1191,32 @@ static void dss_uninit_ports(struct dss_device *dss)
 
 		switch (dss->feat->ports[i]) {
 		case OMAP_DISPLAY_TYPE_DPI:
-			dpi_uninit_port(port);
+			r = dpi_init_port(dss, pdev, port, dss->feat->model);
+			if (r)
+				goto error;
 			break;
+
 		case OMAP_DISPLAY_TYPE_SDI:
-			sdi_uninit_port(port);
+			r = sdi_init_port(dss, pdev, port);
+			if (r)
+				goto error;
 			break;
+
 		default:
 			break;
 		}
 	}
+
+	return 0;
+
+error:
+	__dss_uninit_ports(dss, i);
+	return r;
+}
+
+static void dss_uninit_ports(struct dss_device *dss)
+{
+	__dss_uninit_ports(dss, dss->feat->num_ports);
 }
 
 static int dss_video_pll_probe(struct dss_device *dss)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
