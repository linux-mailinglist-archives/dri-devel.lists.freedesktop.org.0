Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73381FFCE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 14:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65010E0C0;
	Fri, 29 Dec 2023 13:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFAA10E0BD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 13:52:29 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-555e52fefdeso62140a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 05:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857948; x=1704462748;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvOVtGfr0/pzjQ+m6iJLaMRfy/Q5WgVQTgmUZQlV9hQ=;
 b=m8CXuA+AchqC23TMB2umUpYPFeog2IBugQ8pi/zLlIfeEmSzpRz9XfE8dQnXVplg4u
 ZLpI98HdQjsd2GKrjk0hEIw7caqhoEWAMptXL/geJ2VEpPmMGo+42Q2tGcK+3OdvL09a
 /Y0AH/gtH/bq3kRaoHjQtZM8Vhn5ShjmaQETI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857948; x=1704462748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvOVtGfr0/pzjQ+m6iJLaMRfy/Q5WgVQTgmUZQlV9hQ=;
 b=V8kyLVAw6vyGUmv64LYEDdtlQxGybra7+OScABdF4atLOWs2Sad+1Wg8Rb7WIROwRm
 BDKe8psJYD9/FY9Iv6CsSxzGgywRCCRyipkyi6VPnj1W4A3MptQa+fEGwuSCJBtOa20x
 Hx6Fp0dQoQw9zuXLdM6DFDu8xdH4djH0H4JrU8e8ch9HvLqGQQsNSP4gulqpSoQYMgcy
 4Rf5kKnH5jyhHAgu5YksZQi1pAPYbstfj+TQ9/mGS1sIzqqBwV2MNlnjgGjoUDkSpafQ
 yc2CyJDZyRHA3T2joPl+MZic2NA76Vyk49fBL6wqQsyo1kiHDU/YDszyCDg1VpzqnUGt
 5BYA==
X-Gm-Message-State: AOJu0YxR6boajqdylhk3SomYnVvOXXN2fpGfDIUvO0vVbVyn0STzeFw8
 88mP4lr1p6omEnxvSY0Kb6NiznaduoIU7w==
X-Google-Smtp-Source: AGHT+IHd0K/+BZMIIkC8xNeh/l4rvXut0ec2vAEhnbkaAiBxs368SUwnWPaVrVt4wPqDsk8HyqF0Cg==
X-Received: by 2002:a05:6402:4316:b0:554:a3e9:a66f with SMTP id
 m22-20020a056402431600b00554a3e9a66fmr6015807edc.82.1703857947958; 
 Fri, 29 Dec 2023 05:52:27 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:27 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] drm/panel: nt35510: refactor panel initialization
Date: Fri, 29 Dec 2023 14:51:22 +0100
Message-ID: <20231229135154.675946-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
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

The previous implementation did not make it easy to support new
NT35510-based panels with different initialization sequences.
This patch, preparatory for future developmentes, simplifies the
addition of new NT35510-based displays and also avoids the risk of
creating regressions on already managed panels.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 797 ++++--------------
 1 file changed, 165 insertions(+), 632 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index d6dceb858008..2a5a624fe447 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -36,126 +36,33 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-#define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
 #define MCS_CMD_READ_ID1	0xDA
 #define MCS_CMD_READ_ID2	0xDB
 #define MCS_CMD_READ_ID3	0xDC
 #define MCS_CMD_MTP_READ_SETTING 0xF8 /* Uncertain about name */
 #define MCS_CMD_MTP_READ_PARAM 0xFF /* Uncertain about name */
 
-/*
- * These manufacturer commands are available after we enable manufacturer
- * command set (MCS) for page 0.
- */
-#define NT35510_P0_DOPCTR 0xB1
-#define NT35510_P0_SDHDTCTR 0xB6
-#define NT35510_P0_GSEQCTR 0xB7
-#define NT35510_P0_SDEQCTR 0xB8
-#define NT35510_P0_SDVPCTR 0xBA
-#define NT35510_P0_DPFRCTR1 0xBD
-#define NT35510_P0_DPFRCTR2 0xBE
-#define NT35510_P0_DPFRCTR3 0xBF
-#define NT35510_P0_DPMCTR12 0xCC
-
-#define NT35510_P0_DOPCTR_LEN 2
-#define NT35510_P0_GSEQCTR_LEN 2
-#define NT35510_P0_SDEQCTR_LEN 4
-#define NT35510_P0_SDVPCTR_LEN 1
-#define NT35510_P0_DPFRCTR1_LEN 5
-#define NT35510_P0_DPFRCTR2_LEN 5
-#define NT35510_P0_DPFRCTR3_LEN 5
-#define NT35510_P0_DPMCTR12_LEN 3
-
-#define NT35510_DOPCTR_0_RAMKP BIT(7) /* Contents kept in sleep */
-#define NT35510_DOPCTR_0_DSITE BIT(6) /* Enable TE signal */
-#define NT35510_DOPCTR_0_DSIG BIT(5) /* Enable generic read/write */
-#define NT35510_DOPCTR_0_DSIM BIT(4) /* Enable video mode on DSI */
-#define NT35510_DOPCTR_0_EOTP BIT(3) /* Support EoTP */
-#define NT35510_DOPCTR_0_N565 BIT(2) /* RGB or BGR pixel format */
-#define NT35510_DOPCTR_1_TW_PWR_SEL BIT(4) /* TE power selector */
-#define NT35510_DOPCTR_1_CRGB BIT(3) /* RGB or BGR byte order */
-#define NT35510_DOPCTR_1_CTB BIT(2) /* Vertical scanning direction */
-#define NT35510_DOPCTR_1_CRL BIT(1) /* Source driver data shift */
-#define NT35510_P0_SDVPCTR_PRG BIT(2) /* 0 = normal operation, 1 = VGLO */
-#define NT35510_P0_SDVPCTR_AVDD 0 /* source driver output = AVDD */
-#define NT35510_P0_SDVPCTR_OFFCOL 1 /* source driver output = off color */
-#define NT35510_P0_SDVPCTR_AVSS 2 /* source driver output = AVSS */
-#define NT35510_P0_SDVPCTR_HI_Z 3 /* source driver output = High impedance */
+#define _INIT_DCS_CMD(...) { \
+	.type = INIT_DCS_CMD, \
+	.len = sizeof((u8[]){__VA_ARGS__}), \
+	.data = (u8[]){__VA_ARGS__} }
 
-/*
- * These manufacturer commands are available after we enable manufacturer
- * command set (MCS) for page 1.
- */
-#define NT35510_P1_SETAVDD 0xB0
-#define NT35510_P1_SETAVEE 0xB1
-#define NT35510_P1_SETVCL 0xB2
-#define NT35510_P1_SETVGH 0xB3
-#define NT35510_P1_SETVRGH 0xB4
-#define NT35510_P1_SETVGL 0xB5
-#define NT35510_P1_BT1CTR 0xB6
-#define NT35510_P1_BT2CTR 0xB7
-#define NT35510_P1_BT3CTR 0xB8
-#define NT35510_P1_BT4CTR 0xB9 /* VGH boosting times/freq */
-#define NT35510_P1_BT5CTR 0xBA
-#define NT35510_P1_PFMCTR 0xBB
-#define NT35510_P1_SETVGP 0xBC
-#define NT35510_P1_SETVGN 0xBD
-#define NT35510_P1_SETVCMOFF 0xBE
-#define NT35510_P1_VGHCTR 0xBF /* VGH output ctrl */
-#define NT35510_P1_SET_GAMMA_RED_POS 0xD1
-#define NT35510_P1_SET_GAMMA_GREEN_POS 0xD2
-#define NT35510_P1_SET_GAMMA_BLUE_POS 0xD3
-#define NT35510_P1_SET_GAMMA_RED_NEG 0xD4
-#define NT35510_P1_SET_GAMMA_GREEN_NEG 0xD5
-#define NT35510_P1_SET_GAMMA_BLUE_NEG 0xD6
-
-/* AVDD and AVEE setting 3 bytes */
-#define NT35510_P1_AVDD_LEN 3
-#define NT35510_P1_AVEE_LEN 3
-#define NT35510_P1_VGH_LEN 3
-#define NT35510_P1_VGL_LEN 3
-#define NT35510_P1_VGP_LEN 3
-#define NT35510_P1_VGN_LEN 3
-/* BT1CTR thru BT5CTR setting 3 bytes */
-#define NT35510_P1_BT1CTR_LEN 3
-#define NT35510_P1_BT2CTR_LEN 3
-#define NT35510_P1_BT4CTR_LEN 3
-#define NT35510_P1_BT5CTR_LEN 3
-/* 52 gamma parameters times two per color: positive and negative */
-#define NT35510_P1_GAMMA_LEN 52
+#define _INIT_DELAY_CMD(...) { \
+	.type = DELAY_CMD,\
+	.len = sizeof((u8[]){__VA_ARGS__}), \
+	.data = (u8[]){__VA_ARGS__} }
+
+enum dsi_cmd_type {
+	INIT_DCS_CMD,
+	DELAY_CMD,
+};
+
+struct panel_init_cmd {
+	enum dsi_cmd_type type;
+	size_t len;
+	const u8 *data;
+};
 
-/**
- * struct nt35510_config - the display-specific NT35510 configuration
- *
- * Some of the settings provide an array of bytes, A, B C which mean:
- * A = normal / idle off mode
- * B = idle on mode
- * C = partial / idle off mode
- *
- * Gamma correction arrays are 10bit numbers, two consecutive bytes
- * makes out one point on the gamma correction curve. The points are
- * not linearly placed along the X axis, we get points 0, 1, 3, 5
- * 7, 11, 15, 23, 31, 47, 63, 95, 127, 128, 160, 192, 208, 224, 232,
- * 240, 244, 248, 250, 252, 254, 255. The voltages tuples form
- * V0, V1, V3 ... V255, with 0x0000 being the lowest voltage and
- * 0x03FF being the highest voltage.
- *
- * Each value must be strictly higher than the previous value forming
- * a rising curve like this:
- *
- * ^
- * |                                        V255
- * |                                 V254
- * |                         ....
- * |                    V5
- * |           V3
- * |     V1
- * | V0
- * +------------------------------------------->
- *
- * The details about all settings can be found in the NT35510 Application
- * Note.
- */
 struct nt35510_config {
 	/**
 	 * @width_mm: physical panel width [mm]
@@ -172,177 +79,90 @@ struct nt35510_config {
 	 */
 	const struct drm_display_mode mode;
 	/**
-	 * @avdd: setting for AVDD ranging from 0x00 = 6.5V to 0x14 = 4.5V
-	 * in 0.1V steps the default is 0x05 which means 6.0V
-	 */
-	u8 avdd[NT35510_P1_AVDD_LEN];
-	/**
-	 * @bt1ctr: setting for boost power control for the AVDD step-up
-	 * circuit (1)
-	 * bits 0..2 in the lower nibble controls PCK, the booster clock
-	 * frequency for the step-up circuit:
-	 * 0 = Hsync/32
-	 * 1 = Hsync/16
-	 * 2 = Hsync/8
-	 * 3 = Hsync/4
-	 * 4 = Hsync/2
-	 * 5 = Hsync
-	 * 6 = Hsync x 2
-	 * 7 = Hsync x 4
-	 * bits 4..6 in the upper nibble controls BTP, the boosting
-	 * amplification for the step-up circuit:
-	 * 0 = Disable
-	 * 1 = 1.5 x VDDB
-	 * 2 = 1.66 x VDDB
-	 * 3 = 2 x VDDB
-	 * 4 = 2.5 x VDDB
-	 * 5 = 3 x VDDB
-	 * The defaults are 4 and 4 yielding 0x44
-	 */
-	u8 bt1ctr[NT35510_P1_BT1CTR_LEN];
-	/**
-	 * @avee: setting for AVEE ranging from 0x00 = -6.5V to 0x14 = -4.5V
-	 * in 0.1V steps the default is 0x05 which means -6.0V
-	 */
-	u8 avee[NT35510_P1_AVEE_LEN];
-	/**
-	 * @bt2ctr: setting for boost power control for the AVEE step-up
-	 * circuit (2)
-	 * bits 0..2 in the lower nibble controls NCK, the booster clock
-	 * frequency, the values are the same as for PCK in @bt1ctr.
-	 * bits 4..5 in the upper nibble controls BTN, the boosting
-	 * amplification for the step-up circuit.
-	 * 0 = Disable
-	 * 1 = -1.5 x VDDB
-	 * 2 = -2 x VDDB
-	 * 3 = -2.5 x VDDB
-	 * 4 = -3 x VDDB
-	 * The defaults are 4 and 3 yielding 0x34
-	 */
-	u8 bt2ctr[NT35510_P1_BT2CTR_LEN];
-	/**
-	 * @vgh: setting for VGH ranging from 0x00 = 7.0V to 0x0B = 18.0V
-	 * in 1V steps, the default is 0x08 which means 15V
-	 */
-	u8 vgh[NT35510_P1_VGH_LEN];
-	/**
-	 * @bt4ctr: setting for boost power control for the VGH step-up
-	 * circuit (4)
-	 * bits 0..2 in the lower nibble controls HCK, the booster clock
-	 * frequency, the values are the same as for PCK in @bt1ctr.
-	 * bits 4..5 in the upper nibble controls BTH, the boosting
-	 * amplification for the step-up circuit.
-	 * 0 = AVDD + VDDB
-	 * 1 = AVDD - AVEE
-	 * 2 = AVDD - AVEE + VDDB
-	 * 3 = AVDD x 2 - AVEE
-	 * The defaults are 4 and 3 yielding 0x34
-	 */
-	u8 bt4ctr[NT35510_P1_BT4CTR_LEN];
-	/**
-	 * @vgl: setting for VGL ranging from 0x00 = -2V to 0x0f = -15V in
-	 * 1V steps, the default is 0x08 which means -10V
-	 */
-	u8 vgl[NT35510_P1_VGL_LEN];
-	/**
-	 * @bt5ctr: setting for boost power control for the VGL step-up
-	 * circuit (5)
-	 * bits 0..2 in the lower nibble controls LCK, the booster clock
-	 * frequency, the values are the same as for PCK in @bt1ctr.
-	 * bits 4..5 in the upper nibble controls BTL, the boosting
-	 * amplification for the step-up circuit.
-	 * 0 = AVEE + VCL
-	 * 1 = AVEE - AVDD
-	 * 2 = AVEE + VCL - AVDD
-	 * 3 = AVEE x 2 - AVDD
-	 * The defaults are 3 and 2 yielding 0x32
-	 */
-	u8 bt5ctr[NT35510_P1_BT5CTR_LEN];
-	/**
-	 * @vgp: setting for VGP, the positive gamma divider voltages
-	 * VGMP the high voltage and VGSP the low voltage.
-	 * The first byte contains bit 8 of VGMP and VGSP in bits 4 and 0
-	 * The second byte contains bit 0..7 of VGMP
-	 * The third byte contains bit 0..7 of VGSP
-	 * VGMP 0x00 = 3.0V .. 0x108 = 6.3V in steps of 12.5mV
-	 * VGSP 0x00 = 0V .. 0x111 = 3.7V in steps of 12.5mV
-	 */
-	u8 vgp[NT35510_P1_VGP_LEN];
-	/**
-	 * @vgn: setting for VGN, the negative gamma divider voltages,
-	 * same layout of bytes as @vgp.
-	 */
-	u8 vgn[NT35510_P1_VGN_LEN];
-	/**
-	 * @sdeqctr: Source driver control settings, first byte is
-	 * 0 for mode 1 and 1 for mode 2. Mode 1 uses two steps and
-	 * mode 2 uses three steps meaning EQS3 is not used in mode
-	 * 1. Mode 2 is default. The last three parameters are EQS1, EQS2
-	 * and EQS3, setting the rise time for each equalizer step:
-	 * 0x00 = 0.0 us to 0x0f = 7.5 us in steps of 0.5us. The default
-	 * is 0x07 = 3.5 us.
-	 */
-	u8 sdeqctr[NT35510_P0_SDEQCTR_LEN];
-	/**
-	 * @sdvpctr: power/voltage behaviour during vertical porch time
-	 */
-	u8 sdvpctr;
-	/**
-	 * @t1: the number of pixel clocks on one scanline, range
-	 * 0x100 (258 ticks) .. 0x3FF (1024 ticks) so the value + 1
-	 * clock ticks.
-	 */
-	u16 t1;
-	/**
-	 * @vbp: vertical back porch toward the PANEL note: not toward
-	 * the DSI host; these are separate interfaces, in from DSI host
-	 * and out to the panel.
-	 */
-	u8 vbp;
-	/**
-	 * @vfp: vertical front porch toward the PANEL.
-	 */
-	u8 vfp;
+	* @lanes: number of active data lanes
+	*/
+	unsigned int lanes;
 	/**
-	 * @psel: pixel clock divisor: 0 = 1, 1 = 2, 2 = 4, 3 = 8.
+	 * @format: pixel format for video mode
 	 */
-	u8 psel;
+	enum mipi_dsi_pixel_format format;
 	/**
-	 * @dpmctr12: Display timing control 12
-	 * Byte 1 bit 4 selects LVGL voltage level: 0 = VGLX, 1 = VGL_REG
-	 * Byte 1 bit 1 selects gate signal mode: 0 = non-overlap, 1 = overlap
-	 * Byte 1 bit 0 selects output signal control R/L swap, 0 = normal
-	 * 1 = swap all O->E, L->R
-	 * Byte 2 is CLW delay clock for CK O/E and CKB O/E signals:
-	 * 0x00 = 0us .. 0xFF = 12.75us in 0.05us steps
-	 * Byte 3 is FTI_H0 delay time for STP O/E signals:
-	 * 0x00 = 0us .. 0xFF = 12.75us in 0.05us steps
+	 * @mode_flags: DSI operation mode related flags
 	 */
-	u8 dpmctr12[NT35510_P0_DPMCTR12_LEN];
+	unsigned long mode_flags;
 	/**
-	 * @gamma_corr_pos_r: Red gamma correction parameters, positive
+	 * @hs_rate: maximum lane frequency for high speed mode in hertz, this should
+	 * be set to the real limits of the hardware, zero is only accepted for
+	 * legacy drivers
 	 */
-	u8 gamma_corr_pos_r[NT35510_P1_GAMMA_LEN];
+	unsigned long hs_rate;
 	/**
-	 * @gamma_corr_pos_g: Green gamma correction parameters, positive
+	 * @lp_rate: maximum lane frequency for low power mode in hertz, this should
+	 * be set to the real limits of the hardware, zero is only accepted for
+	 * legacy drivers
 	 */
-	u8 gamma_corr_pos_g[NT35510_P1_GAMMA_LEN];
+	unsigned long lp_rate;
 	/**
-	 * @gamma_corr_pos_b: Blue gamma correction parameters, positive
+	 * @init_cmds: initialization command list
 	 */
-	u8 gamma_corr_pos_b[NT35510_P1_GAMMA_LEN];
-	/**
-	 * @gamma_corr_neg_r: Red gamma correction parameters, negative
-	 */
-	u8 gamma_corr_neg_r[NT35510_P1_GAMMA_LEN];
-	/**
-	 * @gamma_corr_neg_g: Green gamma correction parameters, negative
-	 */
-	u8 gamma_corr_neg_g[NT35510_P1_GAMMA_LEN];
-	/**
-	 * @gamma_corr_neg_b: Blue gamma correction parameters, negative
-	 */
-	u8 gamma_corr_neg_b[NT35510_P1_GAMMA_LEN];
+	const struct panel_init_cmd *init_cmds;
+};
+
+static const struct panel_init_cmd hydis_hva40wv1_init_cmds[] = {
+	_INIT_DCS_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x01),
+	_INIT_DCS_CMD(0xB0, 0x09, 0x09, 0x09),
+	_INIT_DCS_CMD(0xB6, 0x34, 0x34, 0x34),
+	_INIT_DCS_CMD(0xB1, 0x09, 0x09, 0x09),
+	_INIT_DCS_CMD(0xB7, 0x24, 0x24, 0x24),
+	_INIT_DCS_CMD(0xB3, 0x05, 0x05, 0x05),
+	_INIT_DCS_CMD(0xB9, 0x24, 0x24, 0x24),
+	_INIT_DCS_CMD(0xBF, 0x01),
+	_INIT_DCS_CMD(0xB5, 0x0B, 0x0B, 0x0B),
+	_INIT_DCS_CMD(0xBA, 0x24, 0x24, 0x24),
+	_INIT_DCS_CMD(0xBC, 0x00, 0xA3, 0x00),
+	_INIT_DCS_CMD(0xBD, 0x00, 0xA3, 0x00),
+	_INIT_DELAY_CMD(0x0A),
+	_INIT_DCS_CMD(0xD1, 0x00, 0x01, 0x00, 0x43, 0x00, 0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01),
+	_INIT_DCS_CMD(0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, 0x83, 0x02, 0x78, 0x02, 0x9E),
+	_INIT_DCS_CMD(0x02, 0xDD, 0x03, 0x00, 0x03, 0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03),
+	_INIT_DCS_CMD(0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE),
+	_INIT_DCS_CMD(0xD2, 0x00, 0x01, 0x00, 0x43, 0x00, 0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01),
+	_INIT_DCS_CMD(0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, 0x83, 0x02, 0x78, 0x02, 0x9E),
+	_INIT_DCS_CMD(0x02, 0xDD, 0x03, 0x00, 0x03, 0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03),
+	_INIT_DCS_CMD(0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE),
+	_INIT_DCS_CMD(0xD3, 0x00, 0x01, 0x00, 0x43, 0x00, 0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01),
+	_INIT_DCS_CMD(0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, 0x83, 0x02, 0x78, 0x02, 0x9E),
+	_INIT_DCS_CMD(0x02, 0xDD, 0x03, 0x00, 0x03, 0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03),
+	_INIT_DCS_CMD(0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE),
+	_INIT_DCS_CMD(0xD4, 0x00, 0x01, 0x00, 0x43, 0x00, 0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01),
+	_INIT_DCS_CMD(0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, 0x43, 0x02, 0x50, 0x02, 0x9E),
+	_INIT_DCS_CMD(0x02, 0xDD, 0x03, 0x00, 0x03, 0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03),
+	_INIT_DCS_CMD(0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE),
+	_INIT_DCS_CMD(0xD5, 0x00, 0x01, 0x00, 0x43, 0x00, 0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01),
+	_INIT_DCS_CMD(0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, 0x43, 0x02, 0x50, 0x02, 0x9E),
+	_INIT_DCS_CMD(0x02, 0xDD, 0x03, 0x00, 0x03, 0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03),
+	_INIT_DCS_CMD(0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE),
+	_INIT_DCS_CMD(0xD6, 0x00, 0x01, 0x00, 0x43, 0x00, 0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01),
+	_INIT_DCS_CMD(0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, 0x43, 0x02, 0x50, 0x02, 0x9E),
+	_INIT_DCS_CMD(0x02, 0xDD, 0x03, 0x00, 0x03, 0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03),
+	_INIT_DCS_CMD(0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE),
+	_INIT_DCS_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x00),
+	_INIT_DCS_CMD(0xB1, 0x4C, 0x04),
+	_INIT_DCS_CMD(0x36, 0x02),
+	_INIT_DCS_CMD(0xB6, 0x0A),
+	_INIT_DCS_CMD(0xB7, 0x00, 0x00),
+	_INIT_DCS_CMD(0xB8, 0x01, 0x05, 0x05, 0x05),
+	_INIT_DCS_CMD(0xBA, 0x01),
+	_INIT_DCS_CMD(0xBD, 0x01, 0x84, 0x07, 0x32, 0x00),
+	_INIT_DCS_CMD(0xBE, 0x01, 0x84, 0x07, 0x31, 0x00),
+	_INIT_DCS_CMD(0xBF, 0x01, 0x84, 0x07, 0x31, 0x00),
+	_INIT_DCS_CMD(0x35, 0x00),
+	_INIT_DCS_CMD(0xCC, 0x03, 0x00, 0x00),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(0x78),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DELAY_CMD(0x0A),
+	{},
 };
 
 /**
@@ -379,18 +199,11 @@ static const u8 nt35510_mauc_mtp_read_param[] = { 0xAA, 0x55, 0x25, 0x01 };
 static const u8 nt35510_mauc_mtp_read_setting[] = { 0x01, 0x02, 0x00, 0x20,
 						    0x33, 0x13, 0x00, 0x40,
 						    0x00, 0x00, 0x23, 0x02 };
-static const u8 nt35510_mauc_select_page_0[] = { 0x55, 0xAA, 0x52, 0x08, 0x00 };
-static const u8 nt35510_mauc_select_page_1[] = { 0x55, 0xAA, 0x52, 0x08, 0x01 };
-static const u8 nt35510_vgh_on[] = { 0x01 };
-
 static inline struct nt35510 *panel_to_nt35510(struct drm_panel *panel)
 {
 	return container_of(panel, struct nt35510, panel);
 }
 
-#define NT35510_ROTATE_0_SETTING	0x02
-#define NT35510_ROTATE_180_SETTING	0x00
-
 static int nt35510_send_long(struct nt35510 *nt, struct mipi_dsi_device *dsi,
 			     u8 cmd, u8 cmdlen, const u8 *seq)
 {
@@ -457,195 +270,6 @@ static int nt35510_read_id(struct nt35510 *nt)
 	return 0;
 }
 
-/**
- * nt35510_setup_power() - set up power config in page 1
- * @nt: the display instance to set up
- */
-static int nt35510_setup_power(struct nt35510 *nt)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	int ret;
-
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETAVDD,
-				NT35510_P1_AVDD_LEN,
-				nt->conf->avdd);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT1CTR,
-				NT35510_P1_BT1CTR_LEN,
-				nt->conf->bt1ctr);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETAVEE,
-				NT35510_P1_AVEE_LEN,
-				nt->conf->avee);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT2CTR,
-				NT35510_P1_BT2CTR_LEN,
-				nt->conf->bt2ctr);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
-				NT35510_P1_VGH_LEN,
-				nt->conf->vgh);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT4CTR,
-				NT35510_P1_BT4CTR_LEN,
-				nt->conf->bt4ctr);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_VGHCTR,
-				ARRAY_SIZE(nt35510_vgh_on),
-				nt35510_vgh_on);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGL,
-				NT35510_P1_VGL_LEN,
-				nt->conf->vgl);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT5CTR,
-				NT35510_P1_BT5CTR_LEN,
-				nt->conf->bt5ctr);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGP,
-				NT35510_P1_VGP_LEN,
-				nt->conf->vgp);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGN,
-				NT35510_P1_VGN_LEN,
-				nt->conf->vgn);
-	if (ret)
-		return ret;
-
-	/* Typically 10 ms */
-	usleep_range(10000, 20000);
-
-	return 0;
-}
-
-/**
- * nt35510_setup_display() - set up display config in page 0
- * @nt: the display instance to set up
- */
-static int nt35510_setup_display(struct nt35510 *nt)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	const struct nt35510_config *conf = nt->conf;
-	u8 dopctr[NT35510_P0_DOPCTR_LEN];
-	u8 gseqctr[NT35510_P0_GSEQCTR_LEN];
-	u8 dpfrctr[NT35510_P0_DPFRCTR1_LEN];
-	/* FIXME: set up any rotation (assume none for now) */
-	u8 addr_mode = NT35510_ROTATE_0_SETTING;
-	u8 val;
-	int ret;
-
-	/* Enable TE, EoTP and RGB pixel format */
-	dopctr[0] = NT35510_DOPCTR_0_DSITE | NT35510_DOPCTR_0_EOTP |
-		NT35510_DOPCTR_0_N565;
-	dopctr[1] = NT35510_DOPCTR_1_CTB;
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_DOPCTR,
-				NT35510_P0_DOPCTR_LEN,
-				dopctr);
-	if (ret)
-		return ret;
-
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_ADDRESS_MODE, &addr_mode,
-				 sizeof(addr_mode));
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * Source data hold time, default 0x05 = 2.5us
-	 * 0x00..0x3F = 0 .. 31.5us in steps of 0.5us
-	 * 0x0A = 5us
-	 */
-	val = 0x0A;
-	ret = mipi_dsi_dcs_write(dsi, NT35510_P0_SDHDTCTR, &val,
-				 sizeof(val));
-	if (ret < 0)
-		return ret;
-
-	/* EQ control for gate signals, 0x00 = 0 us */
-	gseqctr[0] = 0x00;
-	gseqctr[1] = 0x00;
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_GSEQCTR,
-				NT35510_P0_GSEQCTR_LEN,
-				gseqctr);
-	if (ret)
-		return ret;
-
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_SDEQCTR,
-				NT35510_P0_SDEQCTR_LEN,
-				conf->sdeqctr);
-	if (ret)
-		return ret;
-
-	ret = mipi_dsi_dcs_write(dsi, NT35510_P0_SDVPCTR,
-				 &conf->sdvpctr, 1);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * Display timing control for active and idle off mode:
-	 * the first byte contains
-	 * the two high bits of T1A and second byte the low 8 bits, and
-	 * the valid range is 0x100 (257) to 0x3ff (1023) representing
-	 * 258..1024 (+1) pixel clock ticks for one scanline. At 20MHz pixel
-	 * clock this covers the range of 12.90us .. 51.20us in steps of
-	 * 0.05us, the default is 0x184 (388) representing 389 ticks.
-	 * The third byte is VBPDA, vertical back porch display active
-	 * and the fourth VFPDA, vertical front porch display active,
-	 * both given in number of scanlines in the range 0x02..0xff
-	 * for 2..255 scanlines. The fifth byte is 2 bits selecting
-	 * PSEL for active and idle off mode, how much the 20MHz clock
-	 * is divided by 0..3.  This needs to be adjusted to get the right
-	 * frame rate.
-	 */
-	dpfrctr[0] = (conf->t1 >> 8) & 0xFF;
-	dpfrctr[1] = conf->t1 & 0xFF;
-	/* Vertical back porch */
-	dpfrctr[2] = conf->vbp;
-	/* Vertical front porch */
-	dpfrctr[3] = conf->vfp;
-	dpfrctr[4] = conf->psel;
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_DPFRCTR1,
-				NT35510_P0_DPFRCTR1_LEN,
-				dpfrctr);
-	if (ret)
-		return ret;
-	/* For idle and partial idle off mode we decrease front porch by one */
-	dpfrctr[3]--;
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_DPFRCTR2,
-				NT35510_P0_DPFRCTR2_LEN,
-				dpfrctr);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_DPFRCTR3,
-				NT35510_P0_DPFRCTR3_LEN,
-				dpfrctr);
-	if (ret)
-		return ret;
-
-	/* Enable TE on vblank */
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret)
-		return ret;
-
-	/* Turn on the pads? */
-	ret = nt35510_send_long(nt, dsi, NT35510_P0_DPMCTR12,
-				NT35510_P0_DPMCTR12_LEN,
-				conf->dpmctr12);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int nt35510_set_brightness(struct backlight_device *bl)
 {
 	struct nt35510 *nt = bl_get_data(bl);
@@ -672,7 +296,6 @@ static const struct backlight_ops nt35510_bl_ops = {
  */
 static int nt35510_power_on(struct nt35510 *nt)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(nt->supplies), nt->supplies);
@@ -694,73 +317,6 @@ static int nt35510_power_on(struct nt35510 *nt)
 		usleep_range(120000, 140000);
 	}
 
-	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_PARAM,
-				ARRAY_SIZE(nt35510_mauc_mtp_read_param),
-				nt35510_mauc_mtp_read_param);
-	if (ret)
-		return ret;
-
-	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_SETTING,
-				ARRAY_SIZE(nt35510_mauc_mtp_read_setting),
-				nt35510_mauc_mtp_read_setting);
-	if (ret)
-		return ret;
-
-	nt35510_read_id(nt);
-
-	/* Set up stuff in  manufacturer control, page 1 */
-	ret = nt35510_send_long(nt, dsi, MCS_CMD_MAUCCTR,
-				ARRAY_SIZE(nt35510_mauc_select_page_1),
-				nt35510_mauc_select_page_1);
-	if (ret)
-		return ret;
-
-	ret = nt35510_setup_power(nt);
-	if (ret)
-		return ret;
-
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_POS,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_pos_r);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_POS,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_pos_g);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_POS,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_pos_b);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_RED_NEG,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_neg_r);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_GREEN_NEG,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_neg_g);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SET_GAMMA_BLUE_NEG,
-				NT35510_P1_GAMMA_LEN,
-				nt->conf->gamma_corr_neg_b);
-	if (ret)
-		return ret;
-
-	/* Set up stuff in  manufacturer control, page 0 */
-	ret = nt35510_send_long(nt, dsi, MCS_CMD_MAUCCTR,
-				ARRAY_SIZE(nt35510_mauc_select_page_0),
-				nt35510_mauc_select_page_0);
-	if (ret)
-		return ret;
-
-	ret = nt35510_setup_display(nt);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -808,6 +364,44 @@ static int nt35510_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int nt35510_init(struct nt35510 *nt)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
+	const struct panel_init_cmd *cmds = nt->conf->init_cmds;
+	int i, ret;
+
+	if (!cmds) {
+		dev_warn(nt->dev, "empty initialization command list\n");
+		return 0;
+	}
+
+	for (i = 0; cmds[i].len != 0; i++) {
+		const struct panel_init_cmd *cmd = &cmds[i];
+
+		switch (cmd->type) {
+		case DELAY_CMD:
+			msleep(cmd->data[0]);
+			ret = 0;
+			break;
+		case INIT_DCS_CMD:
+			ret = nt35510_send_long(nt, dsi, cmd->data[0],
+						cmd->len - 1,
+						cmd->len <= 1 ? NULL :
+						&cmd->data[1]);
+			break;
+		default:
+			ret = -EINVAL;
+		}
+
+		if (ret < 0) {
+			dev_err(nt->dev, "failed to write command %u\n", i);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int nt35510_prepare(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
@@ -818,24 +412,21 @@ static int nt35510_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	/* Exit sleep mode */
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to exit sleep mode (%d)\n", ret);
+	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_PARAM,
+				ARRAY_SIZE(nt35510_mauc_mtp_read_param),
+				nt35510_mauc_mtp_read_param);
+	if (ret)
 		return ret;
-	}
-	/* Up to 120 ms */
-	usleep_range(120000, 150000);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to turn display on (%d)\n", ret);
+	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_SETTING,
+				ARRAY_SIZE(nt35510_mauc_mtp_read_setting),
+				nt35510_mauc_mtp_read_setting);
+	if (ret)
 		return ret;
-	}
-	/* Some 10 ms */
-	usleep_range(10000, 20000);
 
-	return 0;
+	nt35510_read_id(nt);
+
+	return nt35510_init(nt);
 }
 
 static int nt35510_get_modes(struct drm_panel *panel,
@@ -878,25 +469,6 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 	nt = devm_kzalloc(dev, sizeof(struct nt35510), GFP_KERNEL);
 	if (!nt)
 		return -ENOMEM;
-	mipi_dsi_set_drvdata(dsi, nt);
-	nt->dev = dev;
-
-	dsi->lanes = 2;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	/*
-	 * Datasheet suggests max HS rate for NT35510 is 250 MHz
-	 * (period time 4ns, see figure 7.6.4 page 365) and max LP rate is
-	 * 20 MHz (period time 50ns, see figure 7.6.6. page 366).
-	 * However these frequencies appear in source code for the Hydis
-	 * HVA40WV1 panel and setting up the LP frequency makes the panel
-	 * not work.
-	 *
-	 * TODO: if other panels prove to be closer to the datasheet,
-	 * maybe make this a per-panel config in struct nt35510_config?
-	 */
-	dsi->hs_rate = 349440000;
-	dsi->lp_rate = 9600000;
-	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	/*
 	 * Every new incarnation of this display must have a unique
@@ -908,6 +480,15 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 		return -ENODEV;
 	}
 
+	mipi_dsi_set_drvdata(dsi, nt);
+	nt->dev = dev;
+
+	dsi->lanes = nt->conf->lanes;
+	dsi->format = nt->conf->format;
+	dsi->hs_rate = nt->conf->hs_rate;
+	dsi->lp_rate = nt->conf->lp_rate;
+	dsi->mode_flags = nt->conf->mode_flags;
+
 	nt->supplies[0].supply = "vdd"; /* 2.3-4.8 V */
 	nt->supplies[1].supply = "vddi"; /* 1.65-3.3V */
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(nt->supplies),
@@ -980,27 +561,6 @@ static void nt35510_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&nt->panel);
 }
 
-/*
- * These gamma correction values are 10bit tuples, so only bits 0 and 1 is
- * ever used in the first byte. They form a positive and negative gamma
- * correction curve for each color, values must be strictly higher for each
- * step on the curve. As can be seen these default curves goes from 0x0001
- * to 0x03FE.
- */
-#define NT35510_GAMMA_POS_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
-		0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01, \
-		0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, \
-		0x83, 0x02, 0x78, 0x02, 0x9E, 0x02, 0xDD, 0x03, 0x00, 0x03, \
-		0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03, \
-		0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE
-
-#define NT35510_GAMMA_NEG_DEFAULT 0x00, 0x01, 0x00, 0x43, 0x00, \
-		0x6B, 0x00, 0x87, 0x00, 0xA3, 0x00, 0xCE, 0x00, 0xF1, 0x01, \
-		0x27, 0x01, 0x53, 0x01, 0x98, 0x01, 0xCE, 0x02, 0x22, 0x02, \
-		0x43, 0x02, 0x50, 0x02, 0x9E, 0x02, 0xDD, 0x03, 0x00, 0x03, \
-		0x2E, 0x03, 0x54, 0x03, 0x7F, 0x03, 0x95, 0x03, 0xB3, 0x03, \
-		0xC2, 0x03, 0xE1, 0x03, 0xF1, 0x03, 0xFE
-
 /*
  * The Hydis HVA40WV1 panel
  */
@@ -1030,47 +590,20 @@ static const struct nt35510_config nt35510_hydis_hva40wv1 = {
 		.vtotal = 800 + 2 + 0 + 5, /* VBP = 5 */
 		.flags = 0,
 	},
-	/* 0x09: AVDD = 5.6V */
-	.avdd = { 0x09, 0x09, 0x09 },
-	/* 0x34: PCK = Hsync/2, BTP = 2 x VDDB */
-	.bt1ctr = { 0x34, 0x34, 0x34 },
-	/* 0x09: AVEE = -5.6V */
-	.avee = { 0x09, 0x09, 0x09 },
-	/* 0x24: NCK = Hsync/2, BTN =  -2 x VDDB */
-	.bt2ctr = { 0x24, 0x24, 0x24 },
-	/* 0x05 = 12V */
-	.vgh = { 0x05, 0x05, 0x05 },
-	/* 0x24: NCKA = Hsync/2, VGH = 2 x AVDD - AVEE */
-	.bt4ctr = { 0x24, 0x24, 0x24 },
-	/* 0x0B = -13V */
-	.vgl = { 0x0B, 0x0B, 0x0B },
-	/* 0x24: LCKA = Hsync, VGL = AVDD + VCL - AVDD */
-	.bt5ctr = { 0x24, 0x24, 0x24 },
-	/* VGMP: 0x0A3 = 5.0375V, VGSP = 0V */
-	.vgp = { 0x00, 0xA3, 0x00 },
-	/* VGMP: 0x0A3 = 5.0375V, VGSP = 0V */
-	.vgn = { 0x00, 0xA3, 0x00 },
-	/* SDEQCTR: source driver EQ mode 2, 2.5 us rise time on each step */
-	.sdeqctr = { 0x01, 0x05, 0x05, 0x05 },
-	/* SDVPCTR: Normal operation off color during v porch */
-	.sdvpctr = 0x01,
-	/* T1: number of pixel clocks on one scanline: 0x184 = 389 clocks */
-	.t1 = 0x0184,
-	/* VBP: vertical back porch toward the panel */
-	.vbp = 7,
-	/* VFP: vertical front porch toward the panel */
-	.vfp = 50,
-	/* PSEL: divide pixel clock 20MHz with 1 (no clock downscaling) */
-	.psel = 0,
-	/* DPTMCTR12: 0x03: LVGL = VGLX, overlap mode, swap R->L O->E */
-	.dpmctr12 = { 0x03, 0x00, 0x00, },
-	/* Default gamma correction values */
-	.gamma_corr_pos_r = { NT35510_GAMMA_POS_DEFAULT },
-	.gamma_corr_pos_g = { NT35510_GAMMA_POS_DEFAULT },
-	.gamma_corr_pos_b = { NT35510_GAMMA_POS_DEFAULT },
-	.gamma_corr_neg_r = { NT35510_GAMMA_NEG_DEFAULT },
-	.gamma_corr_neg_g = { NT35510_GAMMA_NEG_DEFAULT },
-	.gamma_corr_neg_b = { NT35510_GAMMA_NEG_DEFAULT },
+	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	/*
+	 * Datasheet suggests max HS rate for NT35510 is 250 MHz
+	 * (period time 4ns, see figure 7.6.4 page 365) and max LP rate is
+	 * 20 MHz (period time 50ns, see figure 7.6.6. page 366).
+	 * However these frequencies appear in source code for the Hydis
+	 * HVA40WV1 panel and setting up the LP frequency makes the panel
+	 * not work.
+	 */
+	.hs_rate = 349440000,
+	.lp_rate = 9600000,
+	.init_cmds = hydis_hva40wv1_init_cmds,
 };
 
 static const struct of_device_id nt35510_of_match[] = {
-- 
2.43.0

