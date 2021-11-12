Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B944DF13
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 01:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681D6EAB3;
	Fri, 12 Nov 2021 00:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E790C6E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 00:27:19 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5521B203CB;
 Fri, 12 Nov 2021 01:27:17 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [RESEND PATCH v2 09/13] backlight: qcom-wled: Respect enabled-strings
 in set_brightness
Date: Fri, 12 Nov 2021 01:27:02 +0100
Message-Id: <20211112002706.453289-10-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112002706.453289-1-marijn.suijten@somainline.org>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware is capable of controlling any non-contiguous sequence of
LEDs specified in the DT using qcom,enabled-strings as u32
array, and this also follows from the DT-bindings documentation.  The
numbers specified in this array represent indices of the LED strings
that are to be enabled and disabled.

Its value is appropriately used to setup and enable string modules, but
completely disregarded in the set_brightness paths which only iterate
over the number of strings linearly.
Take an example where only string 2 is enabled with
qcom,enabled_strings=<2>: this string is appropriately enabled but
subsequent brightness changes would have only touched the zero'th
brightness register because num_strings is 1 here.  This is simply
addressed by looking up the string for this index in the enabled_strings
array just like the other codepaths that iterate over num_strings.

Likewise enabled_strings is now also used in the autodetection path for
consistent behaviour: when a list of strings is specified in DT only
those strings will be probed for autodetection, analogous to how the
number of strings that need to be probed is already bound by
qcom,num-strings.  After all autodetection uses the set_brightness
helpers to set an initial value, which could otherwise end up changing
brightness on a different set of strings.

Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
Fixes: 03b2b5e86986 ("backlight: qcom-wled: Add support for WLED4 peripheral")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 4524e80591cd..bdda6b424113 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -237,7 +237,7 @@ static int wled3_set_brightness(struct wled *wled, u16 brightness)

 	for (i = 0; i < wled->cfg.num_strings; ++i) {
 		rc = regmap_bulk_write(wled->regmap, wled->ctrl_addr +
-				       WLED3_SINK_REG_BRIGHT(i),
+				       WLED3_SINK_REG_BRIGHT(wled->cfg.enabled_strings[i]),
 				       &v, sizeof(v));
 		if (rc < 0)
 			return rc;
@@ -259,7 +259,7 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)

 	for (i = 0; i < wled->cfg.num_strings; ++i) {
 		rc = regmap_bulk_write(wled->regmap, wled->sink_addr +
-				       WLED4_SINK_REG_BRIGHT(i),
+				       WLED4_SINK_REG_BRIGHT(wled->cfg.enabled_strings[i]),
 				       &v, sizeof(v));
 		if (rc < 0)
 			return rc;
@@ -569,7 +569,7 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)

 static void wled_auto_string_detection(struct wled *wled)
 {
-	int rc = 0, i, delay_time_us;
+	int rc = 0, i, j, delay_time_us;
 	u32 sink_config = 0;
 	u8 sink_test = 0, sink_valid = 0, val;
 	bool fault_set;
@@ -616,14 +616,15 @@ static void wled_auto_string_detection(struct wled *wled)

 	/* Iterate through the strings one by one */
 	for (i = 0; i < wled->cfg.num_strings; i++) {
-		sink_test = BIT((WLED4_SINK_REG_CURR_SINK_SHFT + i));
+		j = wled->cfg.enabled_strings[i];
+		sink_test = BIT((WLED4_SINK_REG_CURR_SINK_SHFT + j));

 		/* Enable feedback control */
 		rc = regmap_write(wled->regmap, wled->ctrl_addr +
-				  WLED3_CTRL_REG_FEEDBACK_CONTROL, i + 1);
+				  WLED3_CTRL_REG_FEEDBACK_CONTROL, j + 1);
 		if (rc < 0) {
 			dev_err(wled->dev, "Failed to enable feedback for SINK %d rc = %d\n",
-				i + 1, rc);
+				j + 1, rc);
 			goto failed_detect;
 		}

@@ -632,7 +633,7 @@ static void wled_auto_string_detection(struct wled *wled)
 				  WLED4_SINK_REG_CURR_SINK, sink_test);
 		if (rc < 0) {
 			dev_err(wled->dev, "Failed to configure SINK %d rc=%d\n",
-				i + 1, rc);
+				j + 1, rc);
 			goto failed_detect;
 		}

@@ -659,7 +660,7 @@ static void wled_auto_string_detection(struct wled *wled)

 		if (fault_set)
 			dev_dbg(wled->dev, "WLED OVP fault detected with SINK %d\n",
-				i + 1);
+				j + 1);
 		else
 			sink_valid |= sink_test;

@@ -699,15 +700,16 @@ static void wled_auto_string_detection(struct wled *wled)
 	/* Enable valid sinks */
 	if (wled->version == 4) {
 		for (i = 0; i < wled->cfg.num_strings; i++) {
+			j = wled->cfg.enabled_strings[i];
 			if (sink_config &
-			    BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
+			    BIT(WLED4_SINK_REG_CURR_SINK_SHFT + j))
 				val = WLED4_SINK_REG_STR_MOD_MASK;
 			else
 				/* Disable modulator_en for unused sink */
 				val = 0;

 			rc = regmap_write(wled->regmap, wled->sink_addr +
-					  WLED4_SINK_REG_STR_MOD_EN(i), val);
+					  WLED4_SINK_REG_STR_MOD_EN(j), val);
 			if (rc < 0) {
 				dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
 					rc);
--
2.33.0

