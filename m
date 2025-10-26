Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732EBC0AF47
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C9710E06D;
	Sun, 26 Oct 2025 17:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bX+/6uGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B3410E374
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 17:40:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59093250aabso4447434e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761500406; x=1762105206; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DqelzF++SRo5yLaNXUQGPgYYMPiGFZi9g01t7Yxskpc=;
 b=bX+/6uGAci0QxXtdFAEvlsfXRgk2vpkR4+biZfIQnu5mWIDiVyVzU+nPJ3fCU/eErO
 MID85UenLzb1qfhODDzc0uuJCF15Es0/YyO9RhnrFOV9lbjUNdackIX0ote6PMH+yN5q
 sGmkxk+rH/UpDhazdnWGQz9ficu9E7rVw5j8KGQACnoyQKJhSrcRYAuzxf8AJkr3eZ0F
 fiHEEPXvuHyQk51Nm42oTCZd6/UBcnA2ndKZ4x/4UmmgACYSXzcozDWc8iby8oMOFZW4
 hT+WhTNNlNoDrzG3jZxe2sbwoPRp7mdexa3MJLvtqn4MXbsLkm6VOEedVprSS5Y4+zqB
 O4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761500406; x=1762105206;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqelzF++SRo5yLaNXUQGPgYYMPiGFZi9g01t7Yxskpc=;
 b=Nt6p/RL+eOqrYPdOYAawP56FXaw2pHxY3y8dQMouqvYd2P7OL2fIJHSKXqusWqYG3V
 5SL5VAKe6B54SlXX+k0mw3kkZcwzX4Dq68Fa0BUfBqpUcRUt/XofAIDTdLhnJJ0DusbU
 4HCnAFAXwIa2EJNNniTr2+bvrYbzJl2pjg3gi2nFUDUU4w6ZX47bXn4fn7AWMJpfWsuG
 ItENDeBdYQOQNALWZjZEV2+rZn4SSrdtHtrZwEJilPqj+9lXPIO8g5BLPSddNlPlmgXH
 xX4L/QyfX+abYwQWmu681DLCNVjSVtVjbLNiTbuFZAVqjws032uTlsoK3LFTjb9CKSmo
 g8qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVojcsXv1qhJCxR5SCQ35dFChZ7vkd5yHkP7/sBAaLey1zo//inNmNj+PKgVpWP922y7F3SmRDw8Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxajLDSsOnD0JuI+4KxbaRcjqh30y6kAaFk32u9jBF2znxlv1kM
 RZ8lsSSFHRsuxO2vuv7TSkjAG2MrznDF7yYChyTJyoo8K01TTmnvyBCz6Dz1UDvBo4o=
X-Gm-Gg: ASbGncuB/r3jdN4SHc4dzolboHsNqQL26+c+ZyN7CCNOzZofBY/kz52hOaZSVIPFg5T
 vCNbyAbmvlu9Bv+wHrCW8ZmUo7M/4xy86dR2fjar/fXbanogqAYZue9+XizHKQFKzmvig19Hn7z
 Bh2rRZU/YZ+Om0BtJjUiRSCnQ7U2JZSe/8P/vQat5DTzFk73+Ye1RZ1S0LGy8t0OQNis2mcqKPT
 86zrWZcPmVRePn9UaCFbt3E1q/zaRsrorSWysnTRQB4MIxkjGkjuqDssiSgc3KctZ5QZjGChd8Q
 LKMj5s/g5JV9Y53XA9d+VE7mb0FU9c8rXSRJ1sSIkkkUKzrZq9czjKxrkXylA9cw6iSr5rMwUsU
 JqSiVCYhDvxSXxeix7vWKjHAT9pRAovAsJpBV6GNk9hr1l6f4msrapadDPxzPQsZkb1h5MMf0Cu
 JjrAR5tga35NoHRFqHZK3VqFdycgeHIRo9Xa6N9O68I71Y
X-Google-Smtp-Source: AGHT+IEMhWnR4EQWyNaDnu2tIAdXlAiRd0g3riTQZUyWbx/MeRWkSvSchp9xQYNIdZqK3kyP28DnTA==
X-Received: by 2002:a05:6512:4012:b0:592:f31d:da18 with SMTP id
 2adb3069b0e04-592f31ddc4cmr5017094e87.14.1761500406536; 
 Sun, 26 Oct 2025 10:40:06 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm1713620e87.20.2025.10.26.10.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 10:40:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Oct 2025 18:40:03 +0100
Subject: [PATCH v2 4/4] drm: panel: s6e63m0: Move DSI commands to
 enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-fix-mcde-drm-regression-v2-4-8d799e488cf9@linaro.org>
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
In-Reply-To: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

Due to semantic changes in the bridge core, panels cannot send
any DSI commands in the prepare/unprepare callbacks: there is
no guarantee that the DSI transmitter is available at this
point.

This will affect also SPI-based S6E63M0 displays, but that
should be fine.

Tested on the Samsung Golden (GT-I8190).

Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 31 +++++++++++----------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index ea241c89593b..7e000f30b124 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -508,32 +508,30 @@ static int s6e63m0_disable(struct drm_panel *panel)
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(120);
 
+	s6e63m0_clear_error(ctx);
+
 	return 0;
 }
 
 static int s6e63m0_unprepare(struct drm_panel *panel)
 {
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
-	int ret;
 
-	s6e63m0_clear_error(ctx);
+	return s6e63m0_power_off(ctx);
+}
 
-	ret = s6e63m0_power_off(ctx);
-	if (ret < 0)
-		return ret;
+static int s6e63m0_prepare(struct drm_panel *panel)
+{
+	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 
-	return 0;
+	return s6e63m0_power_on(ctx);
 }
 
-static int s6e63m0_prepare(struct drm_panel *panel)
+static int s6e63m0_enable(struct drm_panel *panel)
 {
 	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
 	int ret;
 
-	ret = s6e63m0_power_on(ctx);
-	if (ret < 0)
-		return ret;
-
 	/* Magic to unlock level 2 control of the display */
 	s6e63m0_dcs_write_seq_static(ctx, MCS_LEVEL_2_KEY, 0x5a, 0x5a);
 	/* Magic to unlock MTP reading */
@@ -547,15 +545,10 @@ static int s6e63m0_prepare(struct drm_panel *panel)
 
 	ret = s6e63m0_clear_error(ctx);
 
-	if (ret < 0)
+	if (ret < 0) {
 		s6e63m0_unprepare(panel);
-
-	return ret;
-}
-
-static int s6e63m0_enable(struct drm_panel *panel)
-{
-	struct s6e63m0 *ctx = panel_to_s6e63m0(panel);
+		return ret;
+	}
 
 	s6e63m0_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(120);

-- 
2.51.0

