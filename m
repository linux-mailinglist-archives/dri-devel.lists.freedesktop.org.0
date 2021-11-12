Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1244DF00
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 01:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BE96E9D9;
	Fri, 12 Nov 2021 00:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC7D6E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 00:27:14 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D09FE203CA;
 Fri, 12 Nov 2021 01:27:11 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [RESEND PATCH v2 03/13] backlight: qcom-wled: Use cpu_to_le16 macro
 to perform conversion
Date: Fri, 12 Nov 2021 01:26:56 +0100
Message-Id: <20211112002706.453289-4-marijn.suijten@somainline.org>
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

The kernel already provides appropriate primitives to perform endianness
conversion which should be used in favour of manual bit-wrangling.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/qcom-wled.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index d413b913fef3..977cd75827d7 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -231,14 +231,14 @@ struct wled {
 static int wled3_set_brightness(struct wled *wled, u16 brightness)
 {
 	int rc, i;
-	u8 v[2];
+	u16 v;

-	v[0] = brightness & 0xff;
-	v[1] = (brightness >> 8) & 0xf;
+	v = cpu_to_le16(brightness & WLED3_SINK_REG_BRIGHT_MAX);

 	for (i = 0;  i < wled->cfg.num_strings; ++i) {
 		rc = regmap_bulk_write(wled->regmap, wled->ctrl_addr +
-				       WLED3_SINK_REG_BRIGHT(i), v, 2);
+				       WLED3_SINK_REG_BRIGHT(i),
+				       &v, sizeof(v));
 		if (rc < 0)
 			return rc;
 	}
@@ -249,19 +249,18 @@ static int wled3_set_brightness(struct wled *wled, u16 brightness)
 static int wled4_set_brightness(struct wled *wled, u16 brightness)
 {
 	int rc, i;
-	u16 low_limit = wled->max_brightness * 4 / 1000;
-	u8 v[2];
+	u16 v, low_limit = wled->max_brightness * 4 / 1000;

 	/* WLED4's lower limit of operation is 0.4% */
 	if (brightness > 0 && brightness < low_limit)
 		brightness = low_limit;

-	v[0] = brightness & 0xff;
-	v[1] = (brightness >> 8) & 0xf;
+	v = cpu_to_le16(brightness & WLED3_SINK_REG_BRIGHT_MAX);

 	for (i = 0;  i < wled->cfg.num_strings; ++i) {
 		rc = regmap_bulk_write(wled->regmap, wled->sink_addr +
-				       WLED4_SINK_REG_BRIGHT(i), v, 2);
+				       WLED4_SINK_REG_BRIGHT(i),
+				       &v, sizeof(v));
 		if (rc < 0)
 			return rc;
 	}
@@ -272,22 +271,20 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
 static int wled5_set_brightness(struct wled *wled, u16 brightness)
 {
 	int rc, offset;
-	u16 low_limit = wled->max_brightness * 1 / 1000;
-	u8 v[2];
+	u16 v, low_limit = wled->max_brightness * 1 / 1000;

 	/* WLED5's lower limit is 0.1% */
 	if (brightness < low_limit)
 		brightness = low_limit;

-	v[0] = brightness & 0xff;
-	v[1] = (brightness >> 8) & 0x7f;
+	v = cpu_to_le16(brightness & WLED5_SINK_REG_BRIGHT_MAX_15B);

 	offset = (wled->cfg.mod_sel == MOD_A) ?
 		  WLED5_SINK_REG_MOD_A_BRIGHTNESS_LSB :
 		  WLED5_SINK_REG_MOD_B_BRIGHTNESS_LSB;

 	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
-			       v, 2);
+			       &v, sizeof(v));
 	return rc;
 }

--
2.33.0

