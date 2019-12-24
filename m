Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F512A236
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2F6E5D5;
	Tue, 24 Dec 2019 14:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D2689F43
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:06:00 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7442F24000D;
 Tue, 24 Dec 2019 14:05:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] drm/panel: simple: Add Satoz SAT050AT40H12R2 panel
 support
Date: Tue, 24 Dec 2019 15:05:51 +0100
Message-Id: <20191224140551.21227-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224140551.21227-1-miquel.raynal@bootlin.com>
References: <20191224140551.21227-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Satoz SAT050AT40H12R2 RGB panel.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v1:
* Switched to display_timing's instead of display_mode.

 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ac6f6b5d200d..00538553a188 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2559,6 +2559,31 @@ static const struct panel_desc samsung_ltn140at29_301 = {
 	},
 };
 
+static const struct display_timing satoz_sat050at40h12r2_timing = {
+	.pixelclock = { 33300000, 33300000, 50000000 },
+	.hactive = {800, 800, 800},
+	.hfront_porch = {16, 210, 354},
+	.hback_porch = {46, 46, 46},
+	.hsync_len = {1, 1, 40},
+	.vactive = {480, 480, 480},
+	.vfront_porch = {7, 22, 147},
+	.vback_porch = {23, 23, 23},
+	.vsync_len = {1, 1, 20},
+};
+
+static const struct panel_desc satoz_sat050at40h12r2 = {
+	.timings = &satoz_sat050at40h12r2_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 65,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.reset_time = 10,
+	.reset_wait = 1,
+};
+
 static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
 	.clock = 168480,
 	.hdisplay = 1920,
@@ -3354,6 +3379,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,ltn140at29-301",
 		.data = &samsung_ltn140at29_301,
+	}, {
+		.compatible = "satoz,sat050at40h12r2",
+		.data = &satoz_sat050at40h12r2,
 	}, {
 		.compatible = "sharp,ld-d5116z01b",
 		.data = &sharp_ld_d5116z01b,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
