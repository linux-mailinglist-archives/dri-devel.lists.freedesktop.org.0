Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DE82145A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 17:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEE889D56;
	Mon,  1 Jan 2024 16:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C9789A5E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 16:16:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a27c6c88694so105853866b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 08:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704125776; x=1704730576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxKslzO12Rzu7e9CjOOzNcXsKs1X72Uim34HnVRTS1M=;
 b=iWjSAgJUZpO5oz32Xmtk9tNLoaXFmpABSp9IkYsHiNSaMDHhgDr+Dk//qLsCfRia4s
 RQBUCQw6uRzs0koqBbgf2fi93QXPUFG0Un+SxESX5wasGoXaqGcTJ9GTdoVDrWLdQqvT
 iFxWEB4WoUGe2q265uO4B/RjYTYXxNpHxBZaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704125776; x=1704730576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxKslzO12Rzu7e9CjOOzNcXsKs1X72Uim34HnVRTS1M=;
 b=b9A8CpK4cKmBqhobO1h66fa//sCp5n7zjR6B/RMnyBlhqcdkECjxiqyb6hiQ/vR43k
 RY+4RHvUNg3op4Lv8c2og+9PUjspLlTnl51o7SAOBiUWTLKr4Lcb4NUOdIlQxDVwq0oc
 XQK9o+J4JssJhWh7EuIzkq5+EzfEoDhXcOUg0sQNON29KCRZm7S5N8NLLB07Ujnf5VnX
 pl/q5AoLFh1XQ4rvqmxYjZIEw4EVTjn2xJF9/cv4nX4j+uK7pwKnLbwzpvfb7Q/F8tkg
 J9S2Y3+zFu5sCTnwEM8fJIc0GTtz/LcYHOMuok6VDQiLm1xYxUVpZC+mcRYHgjSrnSGd
 IJOg==
X-Gm-Message-State: AOJu0YzO5Og+fA1jK0z243NzY7Nn9sjHek/lXQX8a6LeRnfrlCb6jhfE
 9JQ05/On6d6EmwSY0Mc54jjBNrIjEbCAHyFOpJeRBEKo/e8=
X-Google-Smtp-Source: AGHT+IF9nTOTvtZdygw4LRTQqwecBir0/nNcBz/B7fiDx57kBV/dej++K0Kd2mlXUEie4H9DzZHo3w==
X-Received: by 2002:a50:fa81:0:b0:556:202d:c6a9 with SMTP id
 w1-20020a50fa81000000b00556202dc6a9mr1953880edr.7.1704125775927; 
 Mon, 01 Jan 2024 08:16:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-44-179.retail.telecomitalia.it. [82.48.44.179])
 by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm1897857ejc.105.2024.01.01.08.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 08:16:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] drm/panel: nt35510: move hardwired parameters to
 configuration
Date: Mon,  1 Jan 2024 17:15:50 +0100
Message-ID: <20240101161601.2232247-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
References: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch, preparatory for future developments, move the hardwired
parameters to configuration data to allow the addition of new
NT35510-based panels.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Re-write the patch [7/8] "drm/panel: nt35510: refactor panel initialization"
  in the same style as the original driver in order to maintain the same
  structure.

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 140 ++++++++++++++----
 1 file changed, 115 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index d6dceb858008..ce8969f48286 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -171,6 +171,10 @@ struct nt35510_config {
 	 * timing in the display controller.
 	 */
 	const struct drm_display_mode mode;
+	/**
+	 * @mode_flags: DSI operation mode related flags
+	 */
+	unsigned long mode_flags;
 	/**
 	 * @avdd: setting for AVDD ranging from 0x00 = 6.5V to 0x14 = 4.5V
 	 * in 0.1V steps the default is 0x05 which means 6.0V
@@ -273,6 +277,100 @@ struct nt35510_config {
 	 * same layout of bytes as @vgp.
 	 */
 	u8 vgn[NT35510_P1_VGN_LEN];
+	/**
+	 * @dopctr: setting optional control for display
+	 * ERR bits 0..1 in the first byte is the ERR pin output signal setting.
+	 * 0 = Disable, ERR pin output low
+	 * 1 = ERR pin output CRC error only
+	 * 2 = ERR pin output ECC error only
+	 * 3 = ERR pin output CRC and ECC error
+	 * The default is 0.
+	 * N565 bit 2 in the first byte is the 16-bit/pixel format selection.
+	 * 0 = R[4:0] + G[5:3] & G[2:0] + B[4:0]
+	 * 1 = G[2:0] + R[4:0] & B[4:0] + G[5:3]
+	 * The default is 0.
+	 * DIS_EoTP_HS bit 3 in the first byte is "DSI protocol violation" error
+	 * reporting.
+	 * 0 = reporting when error
+	 * 1 = not reporting when error
+	 * DSIM bit 4 in the first byte is the video mode data type enable
+	 * 0 = Video mode data type disable
+	 * 1 = Video mode data type enable
+	 * The default is 0.
+	 * DSIG bit 5 int the first byte is the generic r/w data type enable
+	 * 0 = Generic r/w disable
+	 * 1 = Generic r/w enable
+	 * The default is 0.
+	 * DSITE bit 6 in the first byte is TE line enable
+	 * 0 = TE line is disabled
+	 * 1 = TE line is enabled
+	 * The default is 0.
+	 * RAMKP bit 7 in the first byte is the frame memory keep/loss in
+	 * sleep-in mode
+	 * 0 = contents loss in sleep-in
+	 * 1 = contents keep in sleep-in
+	 * The default is 0.
+	 * CRL bit 1 in the second byte is the source driver data shift
+	 * direction selection. This bit is XOR operation with bit RSMX
+	 * of 3600h command.
+	 * 0 (RMSX = 0) = S1 -> S1440
+	 * 0 (RMSX = 1) = S1440 -> S1
+	 * 1 (RMSX = 0) = S1440 -> S1
+	 * 1 (RMSX = 1) = S1 -> S1440
+	 * The default is 0.
+	 * CTB bit 2 in the second byte is the vertical scanning direction
+	 * selection for gate control signals. This bit is XOR operation
+	 * with bit ML of 3600h command.
+	 * 0 (ML = 0) = Forward (top -> bottom)
+	 * 0 (ML = 1) = Reverse (bottom -> top)
+	 * 1 (ML = 0) = Reverse (bottom -> top)
+	 * 1 (ML = 1) = Forward (top -> bottom)
+	 * The default is 0.
+	 * CRGB bit 3 in the second byte is RGB-BGR order selection. This
+	 * bit is XOR operation with bit RGB of 3600h command.
+	 * 0 (RGB = 0) = RGB/Normal
+	 * 0 (RGB = 1) = BGR/RB swap
+	 * 1 (RGB = 0) = BGR/RB swap
+	 * 1 (RGB = 1) = RGB/Normal
+	 * The default is 0.
+	 * TE_PWR_SEL bit 4 in the second byte is the TE output voltage
+	 * level selection (only valid when DSTB_SEL = 0 or DSTB_SEL = 1,
+	 * VSEL = High and VDDI = 1.665~3.3V).
+	 * 0 = TE output voltage level is VDDI
+	 * 1 = TE output voltage level is VDDA
+	 * The default is 0.
+	 */
+	u8 dopctr[NT35510_P0_DOPCTR_LEN];
+	/**
+	 * @madctl: Memory data access control
+	 * RSMY bit 0 is flip vertical. Flips the display image top to down.
+	 * RSMX bit 1 is flip horizontal. Flips the display image left to right.
+	 * MH bit 2 is the horizontal refresh order.
+	 * RGB bit 3 is the RGB-BGR order.
+	 * 0 = RGB color sequence
+	 * 1 = BGR color sequence
+	 * ML bit 4 is the vertical refresh order.
+	 * MV bit 5 is the row/column exchange.
+	 * MX bit 6 is the column address order.
+	 * MY bit 7 is the row address order.
+	 */
+	u8 madctl;
+	/**
+	 * @sdhdtctr: source output data hold time
+	 * 0x00..0x3F = 0..31.5us in steps of 0.5us
+	 * The default is 0x05 = 2.5us.
+	 */
+	u8 sdhdtctr;
+	/**
+	 * @gseqctr: EQ control for gate signals
+	 * GFEQ_XX[3:0]: time setting of EQ step for falling edge in steps
+	 * of 0.5us.
+	 * The default is 0x07 = 3.5us
+	 * GREQ_XX[7:4]: time setting of EQ step for rising edge in steps
+	 * of 0.5us.
+	 * The default is 0x07 = 3.5us
+	 */
+	u8 gseqctr[NT35510_P0_GSEQCTR_LEN];
 	/**
 	 * @sdeqctr: Source driver control settings, first byte is
 	 * 0 for mode 1 and 1 for mode 2. Mode 1 uses two steps and
@@ -536,46 +634,28 @@ static int nt35510_setup_display(struct nt35510 *nt)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	const struct nt35510_config *conf = nt->conf;
-	u8 dopctr[NT35510_P0_DOPCTR_LEN];
-	u8 gseqctr[NT35510_P0_GSEQCTR_LEN];
 	u8 dpfrctr[NT35510_P0_DPFRCTR1_LEN];
-	/* FIXME: set up any rotation (assume none for now) */
-	u8 addr_mode = NT35510_ROTATE_0_SETTING;
-	u8 val;
 	int ret;
 
-	/* Enable TE, EoTP and RGB pixel format */
-	dopctr[0] = NT35510_DOPCTR_0_DSITE | NT35510_DOPCTR_0_EOTP |
-		NT35510_DOPCTR_0_N565;
-	dopctr[1] = NT35510_DOPCTR_1_CTB;
 	ret = nt35510_send_long(nt, dsi, NT35510_P0_DOPCTR,
 				NT35510_P0_DOPCTR_LEN,
-				dopctr);
+				conf->dopctr);
 	if (ret)
 		return ret;
 
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_ADDRESS_MODE, &addr_mode,
-				 sizeof(addr_mode));
+	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_ADDRESS_MODE, &conf->madctl,
+				 sizeof(conf->madctl));
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Source data hold time, default 0x05 = 2.5us
-	 * 0x00..0x3F = 0 .. 31.5us in steps of 0.5us
-	 * 0x0A = 5us
-	 */
-	val = 0x0A;
-	ret = mipi_dsi_dcs_write(dsi, NT35510_P0_SDHDTCTR, &val,
-				 sizeof(val));
+	ret = mipi_dsi_dcs_write(dsi, NT35510_P0_SDHDTCTR, &conf->sdhdtctr,
+				 sizeof(conf->sdhdtctr));
 	if (ret < 0)
 		return ret;
 
-	/* EQ control for gate signals, 0x00 = 0 us */
-	gseqctr[0] = 0x00;
-	gseqctr[1] = 0x00;
 	ret = nt35510_send_long(nt, dsi, NT35510_P0_GSEQCTR,
 				NT35510_P0_GSEQCTR_LEN,
-				gseqctr);
+				conf->gseqctr);
 	if (ret)
 		return ret;
 
@@ -896,7 +976,6 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 	 */
 	dsi->hs_rate = 349440000;
 	dsi->lp_rate = 9600000;
-	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	/*
 	 * Every new incarnation of this display must have a unique
@@ -908,6 +987,8 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 		return -ENODEV;
 	}
 
+	dsi->mode_flags = nt->conf->mode_flags;
+
 	nt->supplies[0].supply = "vdd"; /* 2.3-4.8 V */
 	nt->supplies[1].supply = "vddi"; /* 1.65-3.3V */
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(nt->supplies),
@@ -1030,6 +1111,7 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 		.vtotal = 800 + 2 + 0 + 5, /* VBP = 5 */
 		.flags = 0,
 	},
+	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS,
 	/* 0x09: AVDD = 5.6V */
 	.avdd = { 0x09, 0x09, 0x09 },
 	/* 0x34: PCK = Hsync/2, BTP = 2 x VDDB */
@@ -1050,6 +1132,14 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 	.vgp = { 0x00, 0xA3, 0x00 },
 	/* VGMP: 0x0A3 = 5.0375V, VGSP = 0V */
 	.vgn = { 0x00, 0xA3, 0x00 },
+	/* Enable TE, EoTP and RGB pixel format */
+	.dopctr = { NT35510_DOPCTR_0_DSITE | NT35510_DOPCTR_0_EOTP |
+		    NT35510_DOPCTR_0_N565, NT35510_DOPCTR_1_CTB },
+	.madctl = NT35510_ROTATE_180_SETTING,
+	/* 0x0A: SDT = 5 us */
+	.sdhdtctr = 0x0A,
+	/* EQ control for gate signals, 0x00 = 0 us */
+	.gseqctr = { 0x00, 0x00 },
 	/* SDEQCTR: source driver EQ mode 2, 2.5 us rise time on each step */
 	.sdeqctr = { 0x01, 0x05, 0x05, 0x05 },
 	/* SDVPCTR: Normal operation off color during v porch */
-- 
2.43.0

