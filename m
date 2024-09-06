Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E878996FD8E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 23:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA1710EB0A;
	Fri,  6 Sep 2024 21:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kDeTYUdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8610EB0A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 21:54:15 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so2805701a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725659654; x=1726264454; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kIu7o7QRtldG6P8hb0w0E+74f5KkC3VFiYjYZNIRn9A=;
 b=kDeTYUdUEwRDXLjEESqETB9qf862Wk7L5LRoNrTStP5MmSlWuDE6B9dPznG7KXroF+
 ntHi01Jnx+6lNKh+EY2wp5BOdaNzO+3gq5vjDiWOSdITRRz4yCE0ar8ansotZWSG4hUi
 QAL2OWaUDv4uLexvGEo7UOgtmU7nBK2G69Rgd8TdC8n+YaNguZAc57slzK6bOrnuW4JG
 dsF0xn/SXSenc0TYMjrGOVHyhxA1FjpEa+Gfgmom2tt/8YZfw4tcUptfSnnpqAOEYE3c
 HojdDs0URAj/Nm7Dzxc+qZMM1Ax0jsAQMErSPHDtCnYAoIgTPcwiLpp9YIqQNlaJcchE
 jBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725659654; x=1726264454;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIu7o7QRtldG6P8hb0w0E+74f5KkC3VFiYjYZNIRn9A=;
 b=vJfqsFdmFtmZY8AE6XUHrzU0oYu3s3s5WUl9CBayIEzH8gWwzSv6rb4t0fYPxBqp4O
 0yoh4R+lmyGetqoT1aqPvYpWJLDyIu71Q2zdSyt86y81C2+0fQHA4hL1cvBx+Zog8CsZ
 jv6w0olxRUBgsUyvWh+yhjsUPBGiv+azkE71HsdnI9MZOwc2DdB4nGwqEyZCTV6cbNIL
 onvEZA4t1prJxWrR4/Kua+5sBK0RmnVaFMTb6c9bNQTWBdChxFfXsNQYd3KVOk8Rxb12
 p7ZPIVYSgnz/EZmayC81pjLH1SEO9Dmm8RXt1ymC5Y9Q2YbcTbZoE8rdH6G8vBM4bakP
 Wg8w==
X-Gm-Message-State: AOJu0Yyau4uBZd6cWgyL7thV4a38EyH41F2B8BFkCVYh0sMUrrAoa1VX
 f2UvjQnjhcTgRtuGon3QE8uK8OzFI7H898YAusAiqn94zQpKcaDqeE0BpL+rNU0=
X-Google-Smtp-Source: AGHT+IFZoMm5RN0no4Kh6/rn4sse0iQHbtACxu7LAPhsrCyVGYa81p56DZHMD4FPa3uUQIm6+8cK6A==
X-Received: by 2002:a05:6402:d06:b0:5c2:762d:5e79 with SMTP id
 4fb4d7f45d1cf-5c3e9631403mr358990a12.15.1725659653462; 
 Fri, 06 Sep 2024 14:54:13 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc528bdasm2833297a12.4.2024.09.06.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 14:54:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Sep 2024 23:54:11 +0200
Subject: [PATCH] drm/panel: nt35510: Make new commands optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-fix-nt35510-v1-1-1971f3af7dda@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAJ622YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwMz3bTMCt28EmNTU0MD3USL1GSzVBPzVANjMyWgjoKiVKA02LTo2Np
 aAJtmyYldAAAA
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
SETVCL, BT3CTR and SETVCMOFF registers unconditionally, and some
(not all!) Hydis display seem to be affected by ghosting after
the commit.

Make them all optional and only send these commands on the
Frida display for now.

Reported-by: Stefan Hansson <newbyte@postmarketos.org>
Fixes: 219a1f49094f ("drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Stefan: if this patch works and you have time you can try adding
the three flags one at a time to your device and we can see which
command is problematic.
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 45 +++++++++++++++++----------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index d3bfdfc9cff6..e07409dcbd1d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -38,6 +38,9 @@
 
 #define NT35510_CMD_CORRECT_GAMMA BIT(0)
 #define NT35510_CMD_CONTROL_DISPLAY BIT(1)
+#define NT35510_CMD_SETVCL BIT(2)
+#define NT35510_CMD_BT3CTR BIT(3)
+#define NT35510_CMD_SETVCMOFF BIT(4)
 
 #define MCS_CMD_MAUCCTR		0xF0 /* Manufacturer command enable */
 #define MCS_CMD_READ_ID1	0xDA
@@ -675,16 +678,23 @@ static int nt35510_setup_power(struct nt35510 *nt)
 				nt->conf->bt2ctr);
 	if (ret)
 		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
-				NT35510_P1_VCL_LEN,
-				nt->conf->vcl);
-	if (ret)
-		return ret;
-	ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
-				NT35510_P1_BT3CTR_LEN,
-				nt->conf->bt3ctr);
-	if (ret)
-		return ret;
+
+	if (nt->conf->cmds & NT35510_CMD_SETVCL) {
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
+					NT35510_P1_VCL_LEN,
+					nt->conf->vcl);
+		if (ret)
+			return ret;
+	}
+
+	if (nt->conf->cmds & NT35510_CMD_BT3CTR) {
+		ret = nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
+					NT35510_P1_BT3CTR_LEN,
+					nt->conf->bt3ctr);
+		if (ret)
+			return ret;
+	}
+
 	ret = nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
 				NT35510_P1_VGH_LEN,
 				nt->conf->vgh);
@@ -721,11 +731,13 @@ static int nt35510_setup_power(struct nt35510 *nt)
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
@@ -1319,7 +1331,8 @@ static const struct nt35510_config nt35510_frida_frd400b25025 = {
 	},
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			MIPI_DSI_MODE_LPM,
-	.cmds = NT35510_CMD_CONTROL_DISPLAY,
+	.cmds = NT35510_CMD_CONTROL_DISPLAY | NT35510_CMD_SETVCL |
+			NT35510_CMD_BT3CTR | NT35510_CMD_SETVCMOFF,
 	/* 0x03: AVDD = 6.2V */
 	.avdd = { 0x03, 0x03, 0x03 },
 	/* 0x46: PCK = 2 x Hsync, BTP = 2.5 x VDDB */

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240906-fix-nt35510-a8ec6e47e036

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

