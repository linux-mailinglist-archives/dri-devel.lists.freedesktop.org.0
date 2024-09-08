Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6850970A33
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 23:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D051710E095;
	Sun,  8 Sep 2024 21:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hHWij1Nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3787610E095
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 21:50:38 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso82545966b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725832236; x=1726437036; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/UXw1p7Nz2AkaQJ6Cgr8oCeXkocCMVtcxcIbP+aLme0=;
 b=hHWij1Nj9/W+RB26j9yLni51O8c9/TzlWmYey30T1zzcIUQbyxZzqn9akeYA/RLIvg
 xsJMPR8FB0MinhGCxu32mx5Axn5x7+8lcAQCcmRGQMC328U0/WCvejtTOM20ljYTTW+G
 0gxEX9suBUZEmD3EuNONhEhs9OCc0HT2nHKWFnjbcIpRDjvyXGf5YnSJRsmmRAUCPAS8
 PkZW6SybNrMROvNPWt6hgvEOaOfIKdqQygB1jP4VpuLF4aQVVp86/VJ9h/4xQA2xSMeU
 5kd+jeAqIAQdL/mkrctsHRaO2RpPiOoZq7qSdNleXTKmdTpzBbeaXfgytkUG/SRf6gFt
 2W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725832236; x=1726437036;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/UXw1p7Nz2AkaQJ6Cgr8oCeXkocCMVtcxcIbP+aLme0=;
 b=jSBzEQg2TdKGlO3jpQDdAAXazPYOYHE0S+dbQf5s40rm0p6cocyGoZcefNV9PDdCsI
 lyR7YuxJ8h3l5j/iChC9qxoIMn4IyGuzt/vy0UGtoqbJcJjrGLFAT7MsJNr90xK+gh5k
 FoO5ugFzav+SJMHd78hB0H01TceGoQJ92wG2bMirvxiTgWDHotN3+FbojuHudo4NBv2W
 8RHZBCP+311N+oeY9MF3wEv7D8lEzsrkFsdKK8lXqzmi6UUVyKhvsl4zm8kIkVVUPaX8
 d6Me/9TVzgJRpo0SlPPsNurVZ327I72C+izXgyc8DUI2imSYJV9QxoC7e754roc2J40/
 X4Ew==
X-Gm-Message-State: AOJu0Yxv3bZJDq7SQ2BpNr6FZXL5AyTO6ce2pOv2MZe3VPKUMKX/FDoY
 kcDpPV0yWSqYdTu4K9dF5tXdOaQ1OLnwx79QiYIFBqcRLF7FQfO/Ji+ofxQlFlU=
X-Google-Smtp-Source: AGHT+IGUr2StjcC1PQjfAZirPM466YdoCJ96483uRZTk1Lih9Ai8Xcvhf/VOR55KPO1SDHYk/os9zA==
X-Received: by 2002:a17:907:980e:b0:a77:cca9:b212 with SMTP id
 a640c23a62f3a-a8d248a611amr326049966b.45.1725832235422; 
 Sun, 08 Sep 2024 14:50:35 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72e71sm250067266b.139.2024.09.08.14.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 14:50:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 08 Sep 2024 23:50:30 +0200
Subject: [PATCH v2] drm/panel: nt35510: Make new commands optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-fix-nt35510-v2-1-d4834b9cdb9b@linaro.org>
X-B4-Tracking: v=1; b=H4sIACUc3mYC/22MywrDIBREfyXcdS0+Em2y6n+ULCRekwtFiwZpC
 f57bdZlVmeGOQdkTIQZpu6AhIUyxdBAXjpYNhtWZOQag+Sy5yPXzNObhV0Ng+DM3nDR2BvkSkN
 7vBK2+bQ95sYb5T2mzykv4tf+9xTBWkYjvLLeOGfvTwo2xWtMK8y11i8ZkC1ZpwAAAA==
To: Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
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

The commit introducing the Frida display started to write the
SETVCMOFF registers unconditionally, and some (not all!) Hydis
display seem to be affected by ghosting after the commit.

Make SETVCMOFF optional and only send these commands on the
Frida display for now.

Reported-by: Stefan Hansson <newbyte@postmarketos.org>
Fixes: 219a1f49094f ("drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK")
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- After Stefan's testing conclude that we only need to make
  SETVCMOFF optional.
- Link to v1: https://lore.kernel.org/r/20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index d3bfdfc9cff6..a3460ed38cc4 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -38,6 +38,7 @@
 
 #define NT35510_CMD_CORRECT_GAMMA BIT(0)
 #define NT35510_CMD_CONTROL_DISPLAY BIT(1)
+#define NT35510_CMD_SETVCMOFF BIT(2)
 
 #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
 #define MCS_CMD_READ_ID1	0xDA
@@ -675,16 +676,19 @@ static int nt35510_setup_power(struct nt35510 *nt)
 				nt->conf->bt2ctr);
 	if (ret)
 		return ret;
+
 	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
 				NT35510_P1_VCL_LEN,
 				nt->conf->vcl);
 	if (ret)
 		return ret;
+
 	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
 				NT35510_P1_BT3CTR_LEN,
 				nt->conf->bt3ctr);
 	if (ret)
 		return ret;
+
 	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
 				NT35510_P1_VGH_LEN,
 				nt->conf->vgh);
@@ -721,11 +725,13 @@ static int nt35510_setup_power(struct nt35510 *nt)
 	if (ret)
 		return ret;
 
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
-				NT35510_P1_VCMOFF_LEN,
-				nt->conf->vcmoff);
-	if (ret)
-		return ret;
+	if (nt->conf->cmds & NT35510_CMD_SETVCMOFF) {
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCMOFF,
+					NT35510_P1_VCMOFF_LEN,
+					nt->conf->vcmoff);
+		if (ret)
+			return ret;
+	}
 
 	/* Typically 10 ms */
 	usleep_range(10000, 20000);
@@ -1319,7 +1325,7 @@ static const struct nt35510_config nt35510_frida_frd400b25025 = {
 	},
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			MIPI_DSI_MODE_LPM,
-	.cmds = NT35510_CMD_CONTROL_DISPLAY,
+	.cmds = NT35510_CMD_CONTROL_DISPLAY | NT35510_CMD_SETVCMOFF,
 	/* 0x03: AVDD = 6.2V */
 	.avdd = { 0x03, 0x03, 0x03 },
 	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240906-fix-nt35510-a8ec6e47e036

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

