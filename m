Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA34B177AC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00010E7F1;
	Thu, 31 Jul 2025 21:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aVZPGeU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1E510E7EE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R0L6qLTIbgNKzyTAVrO1jq098ae1s1ramXFJMC9SSFk=; b=aVZPGeU15Dg0ocf1NoZH2/pE3I
 E/OlyuNPWw1LNKCXw/TLdZv42+51FvWxzK2MbBOz4nxk/SIWGd7Sjh7Eivy6bvb65IRNS5ovt5c7M
 rHK0hfL0FHi+ev11qmKSfMHyN0dnNLQDji6wF795U1z0eY9OE8xXqSXaRb6/dtNYInG5ld70LmG9q
 /cuiU8rg9B8CoNggYjCUnkMFmgt1zD8rm/B4PxlsivqMB8dl8Cp3JmZ7LNYoQFfFGMcscCslPnPXH
 bvUFF8/rZ8e/Op+GnfNIp3kZdnD2+JbKgL08Cqc4wFwWQeNimQCnYU+lZZoljh61anJTiiNdaZj48
 +8Iz2y7w==;
Received: from [189.7.87.79]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uhaUA-006udv-3M; Thu, 31 Jul 2025 23:06:46 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:18 -0300
Subject: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
In-Reply-To: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5387; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=6jEVVfLodSL8WKKFdrKFm+68yujmWpqJOl3UO5TrSOY=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rTNjfx8cUF70MY7STvsmHbIDyPWkML21DCd
 Y0YRV/hsdiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva0wAKCRA/8w6Kdoj6
 qlaYB/0UrxewmCHO5GGkGp99jtIF+2AbtXzOxTipYUDiwzbLR7XilOHjKQscCRv3CWUOaeNSQzy
 5KWQG5pYtk12wrlywB2FW4zPGpQfYDNsfzMLJa53Nncd/oVn1eyuvhRi6XvlDV+rIaoQFt9L5Ww
 2IHaDgEGi5i0+jQXW7WK7cxjfhAz7FPgnFCOcKQdW4XqNYez+Mn6yM6z3ILG5gyvdf/X27YsqXv
 M7/+MsbWDs280NX1C181cAFLXTo+ZN9e10TFIvPFzsJhHmeIfCembgsifyMWj2c5xQexKhHIkmw
 18xFjAo2EPIDs5aMWmYWlhjJU0Y5j5/TzcnEqZRPvpcUSN4m
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
CLK_IS_CRITICAL, as those are required to be on during the whole system
operation.

Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface [1]
Signed-off-by: Maíra Canal <mcanal@igalia.com>

---

About the pixel clock: currently, if we actually disable the pixel
clock during a hotplug, the system will crash. This happens in the
RPi 4.

The crash happens after we disabled the CRTC (thus, the pixel clock),
but before the end of atomic commit tail. As vc4's pixel valve doesn't
directly hold a reference to its clock – we use the HDMI encoder to
manage the pixel clock – I believe we might be disabling the clock
before we should.

After this investigation, I decided to keep things as they current are:
the pixel clock is never disabled, as fixing it would go out of
the scope of this series.
---
 drivers/clk/bcm/clk-raspberrypi.c | 56 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 166d0bec380310e8b98f91568efa4aa88401af4f..70acfa68827d84670c645bedd17bf0e181aadfbb 100644
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
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
@@ -90,6 +92,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * always use the minimum the drivers will let us.
 		 */
 		.minimize = true,
+
+		/*
+		 * It should never be disabled as it drives the bus for
+		 * everything else.
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -115,6 +123,15 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * drivers will let us.
 		 */
 		.minimize = true,
+
+		/*
+		 * As mentioned above, this clock is disabled during boot,
+		 * the firmware will skip the HSM initialization, resulting
+		 * in a bus lockup. Therefore, make sure it's enabled
+		 * during boot, but after it, it can be enabled/disabled
+		 * by the driver.
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -123,10 +140,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
@@ -135,6 +154,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
@@ -265,7 +285,41 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
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
+		dev_err_ratelimited(rpi->dev,
+				    "Failed to set clock %s state to on: %d\n",
+				    clk_hw_get_name(hw), ret);
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
+		dev_err_ratelimited(rpi->dev,
+				    "Failed to set clock %s state to off: %d\n",
+				    clk_hw_get_name(hw), ret);
+}
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
+	.prepare        = raspberrypi_fw_prepare,
+	.unprepare      = raspberrypi_fw_unprepare,
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
 	.determine_rate	= raspberrypi_fw_dumb_determine_rate,
@@ -295,7 +349,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	if (!init.name)
 		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = variant->flags | CLK_GET_RATE_NOCACHE;
 
 	data->hw.init = &init;
 

-- 
2.50.0

