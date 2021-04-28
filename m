Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5236E18B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 00:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8536EC4B;
	Wed, 28 Apr 2021 22:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757066E0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 22:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id CB09B1F42CA9
Received: by jupiter.universe (Postfix, from userid 1000)
 id A85244800C3; Thu, 29 Apr 2021 00:29:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
Date: Thu, 29 Apr 2021 00:29:49 +0200
Message-Id: <20210428222953.235280-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428222953.235280-1-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
modules SQW clock output defaults to 32768 Hz. This behaviour is
used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
the clock is disabled and all i.MX6 functionality depending on
the 32 KHz clock has undefined behaviour. For example when using
the hardware watchdog the system will likely do arbitrary reboots.

Referencing the m41t62 directly results in a deadlock. The kernel
will see, that i.MX6 system clock needs the RTC clock and do probe
deferral. But the i.MX6 I2C module never becomes usable without the
i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
from the kernel's perspective this is a chicken-and-egg problem.

Technically everything is fine by not touching anything, since
the RTC clock correctly enables the clock on reset (i.e. on
battery backup power loss) and also the bootloader enables it
in case an something (e.g. an unpatched kernel) disabled this
incorrectly.

A workaround for this issue is describing the square wave pin
as fixed-clock, which is registered early and basically how
this pin is used on the i.MX6.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
 drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
index c746cb221210..cdd196b1e9bd 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
@@ -21,10 +21,19 @@ Optional properties:
                       clock name
 - wakeup-source: Enables wake up of host system on alarm
 
+Optional child node:
+- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
+
 Example:
 	rtc@68 {
 		compatible = "st,m41t80";
 		reg = <0x68>;
 		interrupt-parent = <&UIC0>;
 		interrupts = <0x9 0x8>;
+
+		clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 89128fc29ccc..b3ece42b6f90 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -544,10 +544,22 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
 {
 	struct i2c_client *client = m41t80->client;
 	struct device_node *node = client->dev.of_node;
+	struct device_node *fixed_clock;
 	struct clk *clk;
 	struct clk_init_data init;
 	int ret;
 
+	fixed_clock = of_get_child_by_name(node, "clock");
+	if (fixed_clock) {
+		/*
+		 * skip registering square wave clock when a fixed
+		 * clock has been registered. The fixed clock is
+		 * registered automatically when being referenced.
+		 */
+		of_node_put(fixed_clock);
+		return 0;
+	}
+
 	/* First disable the clock */
 	ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
 	if (ret < 0)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
