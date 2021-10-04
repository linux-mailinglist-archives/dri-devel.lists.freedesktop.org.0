Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42905421790
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 21:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2456E9D2;
	Mon,  4 Oct 2021 19:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D6F6E937
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 19:27:54 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0BA441F6E8;
 Mon,  4 Oct 2021 21:27:52 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] backlight: qcom-wled: Consider enabled_strings in
 autodetection
Date: Mon,  4 Oct 2021 21:27:41 +0200
Message-Id: <20211004192741.621870-11-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004192741.621870-1-marijn.suijten@somainline.org>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the previous commit using enabled_strings in set_brightness,
enabled_strings is now also used in the autodetection path for
consistent behaviour: when a list of strings is specified in DT only
those strings will be probed for autodetection, analogous to how the
number of strings that need to be probed is already bound by
qcom,num-strings.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index c0b8d10c20a2..2c49f5d8dc26 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
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

