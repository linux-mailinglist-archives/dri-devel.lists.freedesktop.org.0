Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3C11F215
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1BC6E357;
	Sat, 14 Dec 2019 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4B36EC04
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:20:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id AC9633ADCB0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:13:52 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A9E9920003;
 Fri, 13 Dec 2019 18:13:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: simple: Support reset GPIOs
Date: Fri, 13 Dec 2019 19:13:25 +0100
Message-Id: <20191213181325.26228-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel common bindings provide a gpios-reset property which is
active low by default. Let's support it in the simple driver.

De-asserting the reset pin implies a physical high, which in turns is
a logic low.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d487686d25c..15dd495c347d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -110,6 +110,7 @@ struct panel_simple {
 	struct i2c_adapter *ddc;
 
 	struct gpio_desc *enable_gpio;
+	struct gpio_desc *reset_gpio;
 
 	struct drm_display_mode override_mode;
 };
@@ -433,12 +434,21 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	if (IS_ERR(panel->supply))
 		return PTR_ERR(panel->supply);
 
+	panel->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(panel->reset_gpio)) {
+		err = PTR_ERR(panel->reset_gpio);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "failed to request reset pin: %d\n", err);
+		return err;
+	}
+
 	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(panel->enable_gpio)) {
 		err = PTR_ERR(panel->enable_gpio);
 		if (err != -EPROBE_DEFER)
-			dev_err(dev, "failed to request GPIO: %d\n", err);
+			dev_err(dev, "failed to request enable pin: %d\n", err);
 		return err;
 	}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
