Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2012A246
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0772B888AE;
	Tue, 24 Dec 2019 14:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435DD89F3B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:21:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 58A5C200006;
 Tue, 24 Dec 2019 14:21:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/panel: simple: Support reset GPIOs
Date: Tue, 24 Dec 2019 15:21:34 +0100
Message-Id: <20191224142134.22902-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel common bindings provide a gpios-reset property. Let's
support it in the simple driver.

Two fields are added to the panel description structure: the time to
assert the reset and the time to wait right after before starting to
interact with it in any manner. In case these default values are not
filled but the GPIO is present in the DT, default values are applied.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v1:
* Add two parameters in the panel description structure.
* Ensure the reset is asserted the right amount of time and the
  deasserted before continuing if a reset GPIO is given.

 drivers/gpu/drm/panel/panel-simple.c | 32 +++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 28fa6ba7b767..ac6f6b5d200d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -38,6 +38,9 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
+#define MIN_DEFAULT_RESET_US 10
+#define MIN_DEFAULT_WAIT_US 10
+
 /**
  * @modes: Pointer to array of fixed modes appropriate for this panel.  If
  *         only one mode then this can just be the address of this the mode.
@@ -94,6 +97,10 @@ struct panel_desc {
 
 	u32 bus_format;
 	u32 bus_flags;
+
+	/* Minimum reset duration and wait period after it in us */
+	u32 reset_time;
+	u32 reset_wait;
 };
 
 struct panel_simple {
@@ -109,6 +116,7 @@ struct panel_simple {
 	struct i2c_adapter *ddc;
 
 	struct gpio_desc *enable_gpio;
+	struct gpio_desc *reset_gpio;
 
 	struct drm_display_mode override_mode;
 };
@@ -432,12 +440,34 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	if (IS_ERR(panel->supply))
 		return PTR_ERR(panel->supply);
 
+	panel->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(panel->reset_gpio)) {
+		err = PTR_ERR(panel->reset_gpio);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "failed to request reset pin: %d\n", err);
+		return err;
+	} else if (panel->reset_gpio) {
+		u32 reset_time = panel->desc->reset_time;
+		u32 reset_wait = panel->desc->reset_wait;
+
+		if (!reset_time)
+			reset_time = MIN_DEFAULT_RESET_US;
+
+		if (!reset_wait)
+			reset_wait = MIN_DEFAULT_WAIT_US;
+
+		usleep_range(reset_time, 2 * reset_time);
+		gpiod_set_value_cansleep(panel->reset_gpio, 0);
+		usleep_range(reset_wait, 2 * reset_wait);
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
