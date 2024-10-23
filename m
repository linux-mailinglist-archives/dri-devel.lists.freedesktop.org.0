Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868339AD176
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A2110E836;
	Wed, 23 Oct 2024 16:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tFeqDfUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D674410E236
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d462c91a9so5068373f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702235; x=1730307035;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ovlO1rlLKJUJX1wYferF0T6vJ4RQ8e45dURb9n1UcwI=;
 b=tFeqDfUSfgl6Fp1b74pcW+7wNZTkXAhdG7SFoNfLnuT5SUZFS88NsoK7iLbDtYi1D5
 U/ly9Eklcc8sZUTriYPPjufzPawlFCgzlhRkc297IH2lH+yQt6L5datjtlS25N2Jslpm
 HHIBGkDwXqNBUbp83QHeYwQSNs/iZelg4+mVY8qL3aeSPM+AMMH2WijUWdHgS9fOLDH6
 5WqmEG1qojXoX0sZeWhyyl9uLoEnrv+JwBMW6J11duBf3lON2UqreVqHwCjhqYXub7H7
 QIXBZN1hV3SHPkVmwxWFJz4tgiKL4TJ9zXDfsHM8EICB5LIiA/De/7hWeQWS+hfR6e78
 sNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702235; x=1730307035;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovlO1rlLKJUJX1wYferF0T6vJ4RQ8e45dURb9n1UcwI=;
 b=WyciFGh0GZ7afL8C2M9N1jxXd5jAOTP0liK8dDssWgA5jb84nP/vaDBtrC6o09I3Ip
 7Nd+D/CcB3mh6DG4c0+KYdW8xbe+MeAmDGzS7qQv8r4kWnkchtvPH9zaXL9oRhHPYVc8
 pX8KCgxiY0tQnOsmha5XRyiW67l1q0V9VSohbeYVy4KuyMdyMIEccj1pfhZZrVMf1tyz
 BtvShGCjFU21l35vd98yRky3LPBB826PD11mEPGbqu511E1/NGIeiGEYowwKMYS1+2qD
 6mQIi3Yz2FFQ+rL9Y6thJ6k/QZ2Fbpr675l/fBX68BTThrWfz0bHcn83Oko0ciEGM1/4
 ahoQ==
X-Gm-Message-State: AOJu0Yyc3jTIg9JTJrSKrFpHSjqzSHxklAVocE/9uhBGPva0TWu7+1TR
 ZjyNh2Mw8uWf5aQWn832EcooB7+hPmZMEsUGSvZ4sxyp95aaXE43PE2hqZhcyxo=
X-Google-Smtp-Source: AGHT+IH4otId80GG9o3ZDhc8LO1QdOrljEks8PDmdlJx1ZkOlo5e4sfIOSj9pzTreVPAVgwLCJZ89w==
X-Received: by 2002:a5d:63cd:0:b0:37e:d2ba:6f11 with SMTP id
 ffacd0b85a97d-37efcf8cbe3mr2193817f8f.47.1729702235063; 
 Wed, 23 Oct 2024 09:50:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:21 +0100
Subject: [PATCH 24/37] drm/vc4: hvs: Add in support for 2712 D-step.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-24-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

THe registers have been moved around, and a couple of minor changes
made, so adapt for this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h  |   6 ++
 drivers/gpu/drm/vc4/vc4_hvs.c  | 154 +++++++++++++++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_kms.c  |   3 +-
 drivers/gpu/drm/vc4/vc4_regs.h | 117 +++++++++++++++++++++++++++----
 4 files changed, 234 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e3983a44e35e..4a078ffd9f82 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -681,6 +681,12 @@ struct vc4_crtc_state {
 		writel(val, hvs->regs + (offset));					\
 	} while (0)
 
+#define HVS_READ6(offset) \
+	HVS_READ(hvs->vc4->gen == VC4_GEN_6_C ? SCALER6_ ## offset : SCALER6D_ ## offset)
+
+#define HVS_WRITE6(offset, val) \
+	HVS_WRITE(hvs->vc4->gen == VC4_GEN_6_C ? SCALER6_ ## offset : SCALER6D_ ## offset, val)
+
 #define VC4_REG32(reg) { .name = #reg, .offset = reg }
 
 struct vc4_exec_info {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b698f7070510..e4717ccd0730 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -141,6 +141,66 @@ static const struct debugfs_reg32 vc6_hvs_regs[] = {
 	VC4_REG32(SCALER6_BAD_AXI),
 };
 
+static const struct debugfs_reg32 vc6_d_hvs_regs[] = {
+	VC4_REG32(SCALER6D_VERSION),
+	VC4_REG32(SCALER6D_CXM_SIZE),
+	VC4_REG32(SCALER6D_LBM_SIZE),
+	VC4_REG32(SCALER6D_UBM_SIZE),
+	VC4_REG32(SCALER6D_COBA_SIZE),
+	VC4_REG32(SCALER6D_COB_SIZE),
+	VC4_REG32(SCALER6D_CONTROL),
+	VC4_REG32(SCALER6D_FETCHER_STATUS),
+	VC4_REG32(SCALER6D_FETCH_STATUS),
+	VC4_REG32(SCALER6D_HANDLE_ERROR),
+	VC4_REG32(SCALER6D_DISP0_CTRL0),
+	VC4_REG32(SCALER6D_DISP0_CTRL1),
+	VC4_REG32(SCALER6D_DISP0_BGND0),
+	VC4_REG32(SCALER6D_DISP0_BGND1),
+	VC4_REG32(SCALER6D_DISP0_LPTRS),
+	VC4_REG32(SCALER6D_DISP0_COB),
+	VC4_REG32(SCALER6D_DISP0_STATUS),
+	VC4_REG32(SCALER6D_DISP0_DL),
+	VC4_REG32(SCALER6D_DISP0_RUN),
+	VC4_REG32(SCALER6D_DISP1_CTRL0),
+	VC4_REG32(SCALER6D_DISP1_CTRL1),
+	VC4_REG32(SCALER6D_DISP1_BGND0),
+	VC4_REG32(SCALER6D_DISP1_BGND1),
+	VC4_REG32(SCALER6D_DISP1_LPTRS),
+	VC4_REG32(SCALER6D_DISP1_COB),
+	VC4_REG32(SCALER6D_DISP1_STATUS),
+	VC4_REG32(SCALER6D_DISP1_DL),
+	VC4_REG32(SCALER6D_DISP1_RUN),
+	VC4_REG32(SCALER6D_DISP2_CTRL0),
+	VC4_REG32(SCALER6D_DISP2_CTRL1),
+	VC4_REG32(SCALER6D_DISP2_BGND0),
+	VC4_REG32(SCALER6D_DISP2_BGND1),
+	VC4_REG32(SCALER6D_DISP2_LPTRS),
+	VC4_REG32(SCALER6D_DISP2_COB),
+	VC4_REG32(SCALER6D_DISP2_STATUS),
+	VC4_REG32(SCALER6D_DISP2_DL),
+	VC4_REG32(SCALER6D_DISP2_RUN),
+	VC4_REG32(SCALER6D_EOLN),
+	VC4_REG32(SCALER6D_DL_STATUS),
+	VC4_REG32(SCALER6D_QOS0),
+	VC4_REG32(SCALER6D_PROF0),
+	VC4_REG32(SCALER6D_QOS1),
+	VC4_REG32(SCALER6D_PROF1),
+	VC4_REG32(SCALER6D_QOS2),
+	VC4_REG32(SCALER6D_PROF2),
+	VC4_REG32(SCALER6D_PRI_MAP0),
+	VC4_REG32(SCALER6D_PRI_MAP1),
+	VC4_REG32(SCALER6D_HISTCTRL),
+	VC4_REG32(SCALER6D_HISTBIN0),
+	VC4_REG32(SCALER6D_HISTBIN1),
+	VC4_REG32(SCALER6D_HISTBIN2),
+	VC4_REG32(SCALER6D_HISTBIN3),
+	VC4_REG32(SCALER6D_HISTBIN4),
+	VC4_REG32(SCALER6D_HISTBIN5),
+	VC4_REG32(SCALER6D_HISTBIN6),
+	VC4_REG32(SCALER6D_HISTBIN7),
+	VC4_REG32(SCALER6D_HVS_ID),
+};
+
 void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 {
 	struct drm_device *drm = &hvs->vc4->base;
@@ -419,6 +479,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 
 	switch (vc4->gen) {
 	case VC4_GEN_6_C:
+	case VC4_GEN_6_D:
 		field = VC4_GET_FIELD(HVS_READ(SCALER6_DISPX_STATUS(fifo)),
 				      SCALER6_DISPX_STATUS_FRCNT);
 		break;
@@ -525,6 +586,7 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 		}
 
 	case VC4_GEN_6_C:
+	case VC4_GEN_6_D:
 		switch (output) {
 		case 0:
 			return 0;
@@ -1132,6 +1194,7 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4,
 		break;
 
 	case VC4_GEN_6_C:
+	case VC4_GEN_6_D:
 		dlist_start = HVS_BOOTLOADER_DLIST_END;
 
 		/*
@@ -1177,6 +1240,7 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4,
 		break;
 
 	case VC4_GEN_6_C:
+	case VC4_GEN_6_D:
 		/*
 		 * If we are running a test, it means that we can't
 		 * access a register. Use a plausible size then.
@@ -1317,6 +1381,17 @@ static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 #define CFC1_N_MA_CSC_COEFF_C23(x)	(0xa03c + ((x) * 0x3000))
 #define CFC1_N_MA_CSC_COEFF_C24(x)	(0xa040 + ((x) * 0x3000))
 
+#define SCALER_PI_CMP_CSC_RED0(x)		(0x200 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_RED1(x)		(0x204 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_RED_CLAMP(x)		(0x208 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_CFG(x)		(0x20c + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_GREEN0(x)		(0x210 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_GREEN1(x)		(0x214 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_GREEN_CLAMP(x)	(0x218 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_BLUE0(x)		(0x220 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_BLUE1(x)		(0x224 + ((x) * 0x40))
+#define SCALER_PI_CMP_CSC_BLUE_CLAMP(x)		(0x228 + ((x) * 0x40))
+
 /* 4 S2.22 multiplication factors, and 1 S9.15 addititive element for each of 3
  * output components
  */
@@ -1384,31 +1459,46 @@ static int vc6_hvs_hw_init(struct vc4_hvs *hvs)
 		  VC4_SET_FIELD(15, SCALER6_CONTROL_MAX_REQS));
 
 	/* Set HVS arbiter priority to max */
-	HVS_WRITE(SCALER6_PRI_MAP0, 0xffffffff);
-	HVS_WRITE(SCALER6_PRI_MAP1, 0xffffffff);
-
-	for (i = 0; i < 6; i++) {
-		coeffs = &csc_coeffs[i / 3][i % 3];
-
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C00(i), coeffs->csc[0][0]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C01(i), coeffs->csc[0][1]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C02(i), coeffs->csc[0][2]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C03(i), coeffs->csc[0][3]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C04(i), coeffs->csc[0][4]);
-
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C10(i), coeffs->csc[1][0]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C11(i), coeffs->csc[1][1]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C12(i), coeffs->csc[1][2]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C13(i), coeffs->csc[1][3]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C14(i), coeffs->csc[1][4]);
-
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C20(i), coeffs->csc[2][0]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C21(i), coeffs->csc[2][1]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C22(i), coeffs->csc[2][2]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C23(i), coeffs->csc[2][3]);
-		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C24(i), coeffs->csc[2][4]);
-
-		HVS_WRITE(CFC1_N_NL_CSC_CTRL(i), BIT(15));
+	HVS_WRITE(SCALER6(PRI_MAP0), 0xffffffff);
+	HVS_WRITE(SCALER6(PRI_MAP1), 0xffffffff);
+
+	if (hvs->vc4->gen == VC4_GEN_6_C) {
+		for (i = 0; i < 6; i++) {
+			coeffs = &csc_coeffs[i / 3][i % 3];
+
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C00(i), coeffs->csc[0][0]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C01(i), coeffs->csc[0][1]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C02(i), coeffs->csc[0][2]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C03(i), coeffs->csc[0][3]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C04(i), coeffs->csc[0][4]);
+
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C10(i), coeffs->csc[1][0]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C11(i), coeffs->csc[1][1]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C12(i), coeffs->csc[1][2]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C13(i), coeffs->csc[1][3]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C14(i), coeffs->csc[1][4]);
+
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C20(i), coeffs->csc[2][0]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C21(i), coeffs->csc[2][1]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C22(i), coeffs->csc[2][2]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C23(i), coeffs->csc[2][3]);
+			HVS_WRITE(CFC1_N_MA_CSC_COEFF_C24(i), coeffs->csc[2][4]);
+
+			HVS_WRITE(CFC1_N_NL_CSC_CTRL(i), BIT(15));
+		}
+	} else {
+		for (i = 0; i < 8; i++) {
+			HVS_WRITE(SCALER_PI_CMP_CSC_RED0(i), 0x1f002566);
+			HVS_WRITE(SCALER_PI_CMP_CSC_RED1(i), 0x3994);
+			HVS_WRITE(SCALER_PI_CMP_CSC_RED_CLAMP(i), 0xfff00000);
+			HVS_WRITE(SCALER_PI_CMP_CSC_CFG(i), 0x1);
+			HVS_WRITE(SCALER_PI_CMP_CSC_GREEN0(i), 0x18002566);
+			HVS_WRITE(SCALER_PI_CMP_CSC_GREEN1(i), 0xf927eee2);
+			HVS_WRITE(SCALER_PI_CMP_CSC_GREEN_CLAMP(i), 0xfff00000);
+			HVS_WRITE(SCALER_PI_CMP_CSC_BLUE0(i), 0x18002566);
+			HVS_WRITE(SCALER_PI_CMP_CSC_BLUE1(i), 0x43d80000);
+			HVS_WRITE(SCALER_PI_CMP_CSC_BLUE_CLAMP(i), 0xfff00000);
+		}
 	}
 
 	return 0;
@@ -1479,26 +1569,27 @@ static int vc4_hvs_cob_init(struct vc4_hvs *hvs)
 		break;
 
 	case VC4_GEN_6_C:
+	case VC4_GEN_6_D:
 		#define VC6_COB_LINE_WIDTH	3840
 		#define VC6_COB_NUM_LINES	4
 		reg = 0;
 		top = 3840;
 
-		HVS_WRITE(SCALER6_DISP2_COB,
+		HVS_WRITE(SCALER6_DISPX_COB(2),
 			  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
 			  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
 
 		base = top + 16;
 		top += VC6_COB_LINE_WIDTH * VC6_COB_NUM_LINES;
 
-		HVS_WRITE(SCALER6_DISP1_COB,
+		HVS_WRITE(SCALER6_DISPX_COB(1),
 			  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
 			  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
 
 		base = top + 16;
 		top += VC6_COB_LINE_WIDTH * VC6_COB_NUM_LINES;
 
-		HVS_WRITE(SCALER6_DISP0_COB,
+		HVS_WRITE(SCALER6_DISPX_COB(0),
 			  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
 			  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
 		break;
@@ -1529,13 +1620,16 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 
 	hvs->regset.base = hvs->regs;
 
-	if (vc4->gen >= VC4_GEN_6_C) {
+	if (vc4->gen == VC4_GEN_6_C) {
 		hvs->regset.regs = vc6_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc6_hvs_regs);
 
 		if (VC4_GET_FIELD(HVS_READ(SCALER6_VERSION), SCALER6_VERSION) ==
-						SCALER6_VERSION_D0)
+						SCALER6_VERSION_D0) {
 			vc4->gen = VC4_GEN_6_D;
+			hvs->regset.regs = vc6_d_hvs_regs;
+			hvs->regset.nregs = ARRAY_SIZE(vc6_d_hvs_regs);
+		}
 	} else {
 		hvs->regset.regs = vc4_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 28346729c2dd..ce1154c463ef 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -328,7 +328,7 @@ static void vc6_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	struct drm_crtc *crtc;
 	unsigned int i;
 
-	WARN_ON_ONCE(vc4->gen != VC4_GEN_6_C);
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_6_C && vc4->gen != VC4_GEN_6_D);
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
@@ -448,6 +448,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		break;
 
 	case VC4_GEN_6_C:
+	case VC4_GEN_6_D:
 		vc6_hvs_pv_muxing_commit(vc4, state);
 		break;
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index df44a4a4009f..0efe340f99d4 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -19,6 +19,20 @@
 
 #define VC4_GET_FIELD(word, field) FIELD_GET(field##_MASK, word)
 
+#define VC6_SET_FIELD(value, field)					\
+	({								\
+		WARN_ON(!FIELD_FIT(hvs->vc4->gen == VC4_GEN_6_C ?	\
+				    SCALER6_ ## field ## _MASK :	\
+				    SCALER6D_ ## field ## _MASK, value));\
+		FIELD_PREP(hvs->vc4->gen == VC4_GEN_6_C ?		\
+				    SCALER6_ ## field ## _MASK :	\
+				    SCALER6D_ ## field ## _MASK, value);	\
+	 })
+
+#define VC6_GET_FIELD(word, field) FIELD_GET(hvs->vc4->gen == VC4_GEN_6_C ?	\
+					     SCALER6_ ## field ## _MASK :	\
+					     SCALER6D_ ## field ## _MASK, word)
+
 #define V3D_IDENT0   0x00000
 # define V3D_EXPECTED_IDENT0 \
 	((2 << 24) | \
@@ -548,8 +562,9 @@
 #define SCALER6_HANDLE_ERROR			0x0000002c
 
 #define SCALER6_DISP0_CTRL0			0x00000030
-#define SCALER6_DISPX_CTRL0(x)						\
-	(SCALER6_DISP0_CTRL0 + ((x) * (SCALER6_DISP1_CTRL0 - SCALER6_DISP0_CTRL0)))
+#define SCALER6_DISPX_CTRL0(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_CTRL0 + ((x) * (SCALER6_DISP1_CTRL0 - SCALER6_DISP0_CTRL0))) : \
+	(SCALER6D_DISP0_CTRL0 + ((x) * (SCALER6D_DISP1_CTRL0 - SCALER6D_DISP0_CTRL0))))
 # define SCALER6_DISPX_CTRL0_ENB		BIT(31)
 # define SCALER6_DISPX_CTRL0_RESET		BIT(30)
 # define SCALER6_DISPX_CTRL0_FWIDTH_MASK	VC4_MASK(28, 16)
@@ -558,30 +573,34 @@
 # define SCALER6_DISPX_CTRL0_LINES_MASK		VC4_MASK(12, 0)
 
 #define SCALER6_DISP0_CTRL1			0x00000034
-#define SCALER6_DISPX_CTRL1(x)						\
-	(SCALER6_DISP0_CTRL1 + ((x) * (SCALER6_DISP1_CTRL1 - SCALER6_DISP0_CTRL1)))
+#define SCALER6_DISPX_CTRL1(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_CTRL1 + ((x) * (SCALER6_DISP1_CTRL1 - SCALER6_DISP0_CTRL1))) : \
+	(SCALER6D_DISP0_CTRL1 + ((x) * (SCALER6D_DISP1_CTRL1 - SCALER6D_DISP0_CTRL1))))
 # define SCALER6_DISPX_CTRL1_BGENB		BIT(8)
 # define SCALER6_DISPX_CTRL1_INTLACE		BIT(0)
 
 #define SCALER6_DISP0_BGND			0x00000038
-#define SCALER6_DISPX_BGND(x)						\
-	(SCALER6_DISP0_BGND + ((x) * (SCALER6_DISP1_BGND - SCALER6_DISP0_BGND)))
+#define SCALER6_DISPX_BGND(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_BGND + ((x) * (SCALER6_DISP1_BGND - SCALER6_DISP0_BGND))) : \
+	(SCALER6D_DISP0_BGND + ((x) * (SCALER6D_DISP1_BGND - SCALER6D_DISP0_BGND))))
 
 #define SCALER6_DISP0_LPTRS			0x0000003c
-#define SCALER6_DISPX_LPTRS(x)						\
-	(SCALER6_DISP0_LPTRS + ((x) * (SCALER6_DISP1_LPTRS - SCALER6_DISP0_LPTRS)))
+#define SCALER6_DISPX_LPTRS(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_LPTRS + ((x) * (SCALER6_DISP1_LPTRS - SCALER6_DISP0_LPTRS))) : \
+	(SCALER6D_DISP0_LPTRS + ((x) * (SCALER6D_DISP1_LPTRS - SCALER6D_DISP0_LPTRS))))
 # define SCALER6_DISPX_LPTRS_HEADE_MASK		VC4_MASK(11, 0)
 
 #define SCALER6_DISP0_COB			0x00000040
-#define SCALER6_DISPX_COB(x)						\
-	(SCALER6_DISP0_COB + ((x) * (SCALER6_DISP1_COB - SCALER6_DISP0_COB)))
+#define SCALER6_DISPX_COB(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_COB + ((x) * (SCALER6_DISP1_COB - SCALER6_DISP0_COB))) : \
+	(SCALER6D_DISP0_COB + ((x) * (SCALER6D_DISP1_COB - SCALER6D_DISP0_COB))))
 # define SCALER6_DISPX_COB_TOP_MASK		VC4_MASK(31, 16)
 # define SCALER6_DISPX_COB_BASE_MASK		VC4_MASK(15, 0)
 
 #define SCALER6_DISP0_STATUS			0x00000044
-
-#define SCALER6_DISPX_STATUS(x)						\
-	(SCALER6_DISP0_STATUS + ((x) * (SCALER6_DISP1_STATUS - SCALER6_DISP0_STATUS)))
+#define SCALER6_DISPX_STATUS(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_STATUS + ((x) * (SCALER6_DISP1_STATUS - SCALER6_DISP0_STATUS))) : \
+	(SCALER6D_DISP0_STATUS + ((x) * (SCALER6D_DISP1_STATUS - SCALER6D_DISP0_STATUS))))
 # define SCALER6_DISPX_STATUS_EMPTY		BIT(22)
 # define SCALER6_DISPX_STATUS_FRCNT_MASK	VC4_MASK(21, 16)
 # define SCALER6_DISPX_STATUS_OFIELD		BIT(15)
@@ -594,8 +613,9 @@
 
 #define SCALER6_DISP0_DL			0x00000048
 
-#define SCALER6_DISPX_DL(x)						\
-	(SCALER6_DISP0_DL + ((x) * (SCALER6_DISP1_DL - SCALER6_DISP0_DL)))
+#define SCALER6_DISPX_DL(x)		((hvs->vc4->gen == VC4_GEN_6_C) ? \
+	(SCALER6_DISP0_DL + ((x) * (SCALER6_DISP1_DL - SCALER6_DISP0_DL))) : \
+	(SCALER6D_DISP0_DL + ((x) * (SCALER6D_DISP1_DL - SCALER6D_DISP0_DL))))
 # define SCALER6_DISPX_DL_LACT_MASK		VC4_MASK(11, 0)
 
 #define SCALER6_DISP0_RUN			0x0000004c
@@ -653,6 +673,73 @@
 #define SCALER6_BAD_UPM				0x0000022c
 #define SCALER6_BAD_AXI				0x00000230
 
+#define SCALER6D_VERSION			0x00000000
+#define SCALER6D_CXM_SIZE			0x00000004
+#define SCALER6D_LBM_SIZE			0x00000008
+#define SCALER6D_UBM_SIZE			0x0000000c
+#define SCALER6D_COBA_SIZE			0x00000010
+#define SCALER6D_COB_SIZE			0x00000014
+#define SCALER6D_CONTROL			0x00000020
+#define SCALER6D_FETCHER_STATUS			0x00000024
+#define SCALER6D_FETCH_STATUS			0x00000028
+#define SCALER6D_HANDLE_ERROR			0x0000002c
+#define SCALER6D_EOLN				0x00000030
+#define SCALER6D_DL_STATUS			0x00000034
+#define SCALER6D_PRI_MAP0			0x00000038
+#define SCALER6D_PRI_MAP1			0x0000003c
+#define SCALER6D_HISTCTRL			0x000000d0
+#define SCALER6D_HISTBIN0			0x000000d4
+#define SCALER6D_HISTBIN1			0x000000d8
+#define SCALER6D_HISTBIN2			0x000000dc
+#define SCALER6D_HISTBIN3			0x000000e0
+#define SCALER6D_HISTBIN4			0x000000e4
+#define SCALER6D_HISTBIN5			0x000000e8
+#define SCALER6D_HISTBIN6			0x000000ec
+#define SCALER6D_HISTBIN7			0x000000f0
+#define SCALER6D_HVS_ID				0x000000fc
+
+#define SCALER6D_DISP0_CTRL0			0x00000100
+#define SCALER6D_DISP0_CTRL1			0x00000104
+#define SCALER6D_DISP0_BGND			0x00000108
+#define SCALER6D_DISP0_LPTRS			0x00000110
+#define SCALER6D_DISP0_COB			0x00000114
+#define SCALER6D_DISP0_STATUS			0x00000118
+#define SCALER6D_DISP0_CTRL0			0x00000100
+#define SCALER6D_DISP0_CTRL1			0x00000104
+#define SCALER6D_DISP0_BGND0			0x00000108
+#define SCALER6D_DISP0_BGND1			0x0000010c
+#define SCALER6D_DISP0_LPTRS			0x00000110
+#define SCALER6D_DISP0_COB			0x00000114
+#define SCALER6D_DISP0_STATUS			0x00000118
+#define SCALER6D_DISP0_DL			0x0000011c
+#define SCALER6D_DISP0_RUN			0x00000120
+#define SCALER6D_QOS0				0x00000124
+#define SCALER6D_PROF0				0x00000128
+#define SCALER6D_DISP1_CTRL0			0x00000140
+#define SCALER6D_DISP1_CTRL1			0x00000144
+#define SCALER6D_DISP1_BGND0			0x00000148
+#define SCALER6D_DISP1_BGND1			0x0000014c
+#define SCALER6D_DISP1_LPTRS			0x00000150
+#define SCALER6D_DISP1_COB			0x00000154
+#define SCALER6D_DISP1_STATUS			0x00000158
+#define SCALER6D_DISP1_DL			0x0000015c
+#define SCALER6D_DISP1_RUN			0x00000160
+#define SCALER6D_QOS1				0x00000164
+#define SCALER6D_PROF1				0x00000168
+#define SCALER6D_DISP2_CTRL0			0x00000180
+#define SCALER6D_DISP2_CTRL1			0x00000184
+#define SCALER6D_DISP2_BGND0			0x00000188
+#define SCALER6D_DISP2_BGND1			0x0000018c
+#define SCALER6D_DISP2_LPTRS			0x00000190
+#define SCALER6D_DISP2_COB			0x00000194
+#define SCALER6D_DISP2_STATUS			0x00000198
+#define SCALER6D_DISP2_DL			0x0000019c
+#define SCALER6D_DISP2_RUN			0x000001a0
+#define SCALER6D_QOS2				0x000001a4
+#define SCALER6D_PROF2				0x000001a8
+
+#define SCALER6(x) ((hvs->vc4->gen == VC4_GEN_6_C) ? SCALER6_ ## x : SCALER6D_ ## x)
+
 # define VC4_HDMI_SW_RESET_FORMAT_DETECT	BIT(1)
 # define VC4_HDMI_SW_RESET_HDMI			BIT(0)
 

-- 
2.34.1

