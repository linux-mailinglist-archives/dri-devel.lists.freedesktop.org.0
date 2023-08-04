Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C6770425
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFB210E721;
	Fri,  4 Aug 2023 15:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0E10E721
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:12:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7E16BFF802;
 Fri,  4 Aug 2023 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691161964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sVsvPzcZLc04k8Mm6Fe387YJusgHKs7kp3zgszuHqAA=;
 b=NbD5KjwDufaLxvHe0Ciehi2+EPqgpLicnDnl+PEqYwkZ6XBVbaVp9ZLRTdigY558uPrrvx
 acS4fzr5z/gxjW0qIJz0fvPvkzGwnAfelgL8MMGkchwUut+Xm9N0VDoIB/u20fRg42Jtq8
 KgwzwP839x6UWNrDxn0hmRqEXvylgVUPkqmTHYtLsQn8iekoF5DSMqpXHKRGCXD3+hYJGx
 GxUMPrIkZdFR3fFsk8QDxqS7vvNRzuOBxskNpaIF50kZQ+4tTZNTKcaJfupAlMvjoJR+M/
 ZkDTcSA8+F3fZtk2rvUfHY27sKG5Iu5frwKfgZFxbItqMAR9PY22ruck3+BfXg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Fix AUO G121EAN01 panel timings according
 to the docs
Date: Fri,  4 Aug 2023 17:12:39 +0200
Message-Id: <20230804151239.835216-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 03e909acd95a ("drm/panel: simple: Add support for AUO G121EAN01.4
panel") added support for this panel model, but the timings it implements
are very different from what the datasheet describes. I checked both the
G121EAN01.0 datasheet from [0] and the G121EAN01.4 one from [1] and they
all have the same timings: for example the LVDS clock typical value is 74.4
MHz, not 66.7 MHz as implemented.

Replace the timings with the ones from the documentation. These timings
have been tested and the clock frequencies verified with an oscilloscope to
ensure they are correct.

Also use struct display_timing instead of struct drm_display_mode in order
to also specify the minimum and maximum values.

[0] https://embedded.avnet.com/product/g121ean01-0/
[1] https://embedded.avnet.com/product/g121ean01-4/

Fixes: 03e909acd95a ("drm/panel: simple: Add support for AUO G121EAN01.4 panel")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 701013b3ad13..56854f78441e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -999,21 +999,21 @@ static const struct panel_desc auo_g104sn02 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode auo_g121ean01_mode = {
-	.clock = 66700,
-	.hdisplay = 1280,
-	.hsync_start = 1280 + 58,
-	.hsync_end = 1280 + 58 + 8,
-	.htotal = 1280 + 58 + 8 + 70,
-	.vdisplay = 800,
-	.vsync_start = 800 + 6,
-	.vsync_end = 800 + 6 + 4,
-	.vtotal = 800 + 6 + 4 + 10,
+static const struct display_timing auo_g121ean01_timing = {
+	.pixelclock = { 60000000, 74400000, 90000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 20, 50, 100 },
+	.hback_porch = { 20, 50, 100 },
+	.hsync_len = { 30, 100, 200 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 2, 10, 25 },
+	.vback_porch = { 2, 10, 25 },
+	.vsync_len = { 4, 18, 50 },
 };
 
 static const struct panel_desc auo_g121ean01 = {
-	.modes = &auo_g121ean01_mode,
-	.num_modes = 1,
+	.timings = &auo_g121ean01_timing,
+	.num_timings = 1,
 	.bpc = 8,
 	.size = {
 		.width = 261,
-- 
2.34.1

