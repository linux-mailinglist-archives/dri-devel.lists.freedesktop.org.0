Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC3B13A9A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 14:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2C310E155;
	Mon, 28 Jul 2025 12:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kWLH9hHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995E10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OK5T6uLGwmqn3hf1RmQGBueNfkd9EIhFCH8Lf+T1dH4=; b=kWLH9hHV9FwGnzuLVaUm5i56+P
 EhJuA5KZLglaBdxkl1ID8nlApi5OYmtg9BZge0EDaWB1zPxfmE8WI1Ad0aJQVHErdnXPpFatCXhBj
 hd7q18TiWktk1zeaB5fSJjCq5FkRTeI/qaWQtupQivld3BAovUg8M6nm+noyhyNkcFLt8mjLp2Qwc
 pbauB3uwRLXwVJiJnAhdwuPKuQ5glF7Tfd+SXqw5X3E6drlo48NOMJ4lDhfAHlX80hscae1whydxJ
 pEAWnRx8KRY4teQkLB/z5R7eON4allTr/Bxta4oP+cwEeVCF0pzJ7lyTupD671Bph2eO9546b9f56
 h8io8efg==;
Received: from [189.7.87.79]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ugN5e-004u0J-9I; Mon, 28 Jul 2025 14:36:26 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 28 Jul 2025 09:35:38 -0300
Subject: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
In-Reply-To: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pZZomASi24vggMR8j71ADAoeO3BXAe5jDYmwLalGNxQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoh26+suwpumaA/wn+o2MjmzSVpSXOUkLEBC56k
 q7kRLvz5BiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIduvgAKCRA/8w6Kdoj6
 qr/jCADgO02yc7qcjaMiFwUuEvy50CDhC+sepCAyp2+fSb4QTq5oj3h3Oc0Oq/VdPYslrovrVXI
 9Ol8N0vo7erv/C6qCjUu1pvBKoMQCI5jPTcqqO/K1mqwqyAyrUCH5eVMoTgFZiJ7wj2TKgb//ww
 99nhNkO0jfany3jhizw4XykRlMaH3q6RDuEExQuXHvEXlURYhXMLlU5jc4K7d+PEvjtyAl/+7+U
 LZbIWJvQJPjB0nvftbyi90KQUvMc7f+w9nn01GxhbKSPx8J32llhOEEJIWEER8zxeQS1V8gw7gf
 Z6koR4sDZkH4ykwgmOJiFTm81zHjUUesBEj3XbOgHbd4SDEo
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

Currently, when we prepare or unprepare RPi's clocks, we don't actually
enable/disable the firmware clock. This means that
`clk_disable_unprepare()` doesn't actually change the clock state at
all, nor does it lowers the clock rate.

From the Mailbox Property Interface documentation [1], we can see that
we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
prepare and an unprepare hook for RPi's firmware clock.

As now the clocks are actually turned off, some of them are now marked
with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
early boot or are required during reboot.

Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface [1]
Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 41 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd685e696b423985cac0 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
+	u32		flags;
 };
 
 static struct raspberrypi_clk_variant
@@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_ARM_CLK_ID] = {
 		.export = true,
 		.clkdev = "cpu0",
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
@@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * always use the minimum the drivers will let us.
 		 */
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * drivers will let us.
 		 */
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
@@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
@@ -259,7 +265,40 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int raspberrypi_fw_prepare(struct clk_hw *hw)
+{
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk *rpi = data->rpi;
+	u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
+	int ret;
+
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
+	if (ret)
+		dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
+			data->id, ret);
+
+	return ret;
+}
+
+static void raspberrypi_fw_unprepare(struct clk_hw *hw)
+{
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk *rpi = data->rpi;
+	u32 state = 0;
+	int ret;
+
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
+	if (ret)
+		dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
+			data->id, ret);
+}
+
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
+	.prepare        = raspberrypi_fw_prepare,
+	.unprepare      = raspberrypi_fw_unprepare,
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
 	.determine_rate	= raspberrypi_fw_dumb_determine_rate,
@@ -289,7 +328,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	if (!init.name)
 		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = variant->flags | CLK_GET_RATE_NOCACHE;
 
 	data->hw.init = &init;
 

-- 
2.50.0

