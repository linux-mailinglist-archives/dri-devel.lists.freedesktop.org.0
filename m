Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6259EB329
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1967010E2B4;
	Tue, 10 Dec 2024 14:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2024 14:26:13 UTC
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B1910E002
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:26:13 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Y717X2FCJz4x7PK
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:19:04 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:bf13:4c3:373e:7260])
 by laurent.telenet-ops.be with cmsmtp
 id n2Jp2D00h3K2VbF012JpoX; Tue, 10 Dec 2024 15:19:03 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1tL14a-000fT8-G4;
 Tue, 10 Dec 2024 15:18:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1tL14b-00AXmu-Mf;
 Tue, 10 Dec 2024 15:18:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
Date: Tue, 10 Dec 2024 15:18:46 +0100
Message-Id: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each bridge instance creates up to four auxiliary devices with different
names.  However, their IDs are always zero, causing duplicate filename
errors when a system has multiple bridges:

    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'

Fix this by using a unique instance ID per bridge instance.  The
instance ID is derived from the I2C adapter number and the bridge's I2C
address, to support multiple instances on the same bus.

Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
On the White Hawk development board:

    /sys/bus/auxiliary/devices/
    |-- ti_sn65dsi86.aux.1068
    |-- ti_sn65dsi86.aux.4140
    |-- ti_sn65dsi86.bridge.1068
    |-- ti_sn65dsi86.bridge.4140
    |-- ti_sn65dsi86.gpio.1068
    |-- ti_sn65dsi86.gpio.4140
    |-- ti_sn65dsi86.pwm.1068
    `-- ti_sn65dsi86.pwm.4140

Discussion after v1:
  - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be

Notes:
  - While the bridge supports only two possible I2C addresses, I2C
    translators may be present, increasing the address space.  Hence the
    instance ID calculation assumes 10-bit addressing.  Perhaps it makes
    sense to introduce a global I2C helper function for this?

  - I think this is the simplest solution.  If/when the auxiliary bus
    receives support à la PLATFORM_DEVID_AUTO, the driver can be
    updated.

v2:
  - Use I2C adapter/address instead of ida_alloc().
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9e31f750fd889745..fb452d1b46995673 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -480,6 +480,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 				       const char *name)
 {
 	struct device *dev = pdata->dev;
+	const struct i2c_client *client = to_i2c_client(dev);
 	struct auxiliary_device *aux;
 	int ret;
 
@@ -488,6 +489,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 		return -ENOMEM;
 
 	aux->name = name;
+	aux->id = (client->adapter->nr << 10) | client->addr;
 	aux->dev.parent = dev;
 	aux->dev.release = ti_sn65dsi86_aux_device_release;
 	device_set_of_node_from_dev(&aux->dev, dev);
-- 
2.34.1

