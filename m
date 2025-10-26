Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88DC0AF50
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6510E384;
	Sun, 26 Oct 2025 17:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HMjNGQ26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BA210E308
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 17:40:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-592f5fe03dcso4460333e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761500403; x=1762105203; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bG8BAJFd5BsVJd8V7IYpkli5RAnLkjoeEXc6a3rd5yo=;
 b=HMjNGQ26D1R6lQWXMJoGYj8TgXrObicdT1477Y0uyoCBWl8JcYm+3SXZLauQacID2M
 0waiEgr4Geuc0M868JACpAoa+OJQplfLHh+lC/WwtuXqdYPNfba+UoOSK0ZagWaBMHLw
 77V1hlKfYHj+Li4wErVzs75hgOceG9AVT9uV3l3gUcrJWfdAe1hivB/A2t8UpKkmbm+T
 9Lq4JkXIg0quqvKiQwqRP7kj1chQfAI2P9yei4VK4jQBf3CUNWU/Ly3aKU9vYj3JDN7e
 B9yMiEuVBSKeQLx0CMCk0PZzMDMgTt7h3oIilVR5ht6hC390EUgFOlyaQ7n5xSg4vute
 gCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761500403; x=1762105203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bG8BAJFd5BsVJd8V7IYpkli5RAnLkjoeEXc6a3rd5yo=;
 b=CSsZlrK/A85K+Nqq63zzNG4+UQo/KocUt2/PZRl5OqWqVq+Hh42QbDTVkDCa/789ar
 rSrTYCVt4YKSzplTzWq9Y9aFoQpExd9mWBqHZ8ddfOr1aCmh1GM/7TvJtCQHkbrjNNYR
 /TmdA2riXeytw8Q9gmsnUnv7GCdpDw0m3YHd3QaDeT+qy1H0+57QwB0k1wYHJ5/sLjeC
 2rOYgYGezMq6kmzEBQ1QMnc+OuuHH1KHRxgcj6K9g3r86qi2JIPiRv/Jm5D4+hI+PpfP
 StiEolKQOO2LUVajm6Ck1BpfgQ3xoAI74YlHyYoncbr9FI9mO6FQmzY/0ZkdLlZaKmDD
 10kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUakR8poFD5mjPFPO/rZ4k5EaMVUdZNrMggK2Nvdb2L+1RF9hQ43oeJ8B7qegTcTzf4TudHP+8yXhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZYIWvODDVTzZ8hOGsQy5dbDu2iXYvT7h+5oilqxX2LP9t6OXo
 /h92zHZ1+8zn6qobX8w3//WMnBfyHD5oxAQm7tCbOFLMseBZbquMOANvrf5tphBgwZo=
X-Gm-Gg: ASbGncvry2WZPxMLjdN5+eZJPwN1ZroG41Jro24rH7kUmYZY0YqoSg4Y/zO2S0oDGqD
 KNEyvFfaXOd6mSj3TzTmgawghzoRn41tX+3spAIOPV3Uy4KQh8bc+b/4CcCKktkBin3s0KlLNb2
 OvFJjkRTZTBAKryEFOlexRlyKP6+EzGBNrJykOqDlhSXZgpFTSvAolUsKtiHRbVAilYinNY/9rp
 c13uqvqwjF3pu9TGkH8kgH/llk9Q9WqpTzl7Ori37HsgcJ6D/JamtPxI9+Kqp0W6KsKfmmSHC+x
 rseaDeeXr7CbDQRGQ1HRWcGomDxlIssUA2uA4JzNzxWJQMJO02c2LWdAxnriQJJrmNleOtrmv+X
 295a/EYKHvuTfzMExrJBzdWFz3JchyxPxiyl5tgXkfCKfxIhhWRnIHD1NMT3SWVm8nkMrOuVhGq
 KH/CkxFOF6FcY6zpB12geZ1+ykrGhsPFUFhFCoON6/Ltxp
X-Google-Smtp-Source: AGHT+IF5ScvgPG6Xmh2PGjDs0S8SApajTEpHs/Y7pvpUBdKjOWAolz+HstNQ9xHfb54GD6jHb6KYzw==
X-Received: by 2002:a05:6512:b08:b0:591:ec11:7f93 with SMTP id
 2adb3069b0e04-592fc9fe50dmr2515794e87.23.1761500402939; 
 Sun, 26 Oct 2025 10:40:02 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm1713620e87.20.2025.10.26.10.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 10:40:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Oct 2025 18:40:00 +0100
Subject: [PATCH v2 1/4] drm: panel: nt355510: Move DSI commands to
 enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-fix-mcde-drm-regression-v2-1-8d799e488cf9@linaro.org>
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

Tested on the Samsung Skomer (GT-S7710) and Kyle (SGH-I407).

Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 31 +++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 3189d89c7ca0..e1c50a3d7dad 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -862,7 +862,6 @@ static const struct backlight_ops nt35510_bl_ops = {
  */
 static int nt35510_power_on(struct nt35510 *nt)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(nt->supplies), nt->supplies);
@@ -884,6 +883,14 @@ static int nt35510_power_on(struct nt35510 *nt)
 		usleep_range(120000, 140000);
 	}
 
+	return 0;
+}
+
+static int nt35510_init(struct nt35510 *nt)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
+	int ret;
+
 	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_PARAM,
 				ARRAY_SIZE(nt35510_mauc_mtp_read_param),
 				nt35510_mauc_mtp_read_param);
@@ -971,6 +978,13 @@ static int nt35510_power_off(struct nt35510 *nt)
 }
 
 static int nt35510_unprepare(struct drm_panel *panel)
+{
+	struct nt35510 *nt = panel_to_nt35510(panel);
+
+	return nt35510_power_off(nt);
+}
+
+static int nt35510_disable(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
@@ -993,20 +1007,23 @@ static int nt35510_unprepare(struct drm_panel *panel)
 	/* Wait 4 frames, how much is that 5ms in the vendor driver */
 	usleep_range(5000, 10000);
 
-	ret = nt35510_power_off(nt);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
 static int nt35510_prepare(struct drm_panel *panel)
+{
+	struct nt35510 *nt = panel_to_nt35510(panel);
+
+	return nt35510_power_on(nt);
+}
+
+static int nt35510_enable(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
-	ret = nt35510_power_on(nt);
+	ret = nt35510_init(nt);
 	if (ret)
 		return ret;
 
@@ -1078,6 +1095,8 @@ static int nt35510_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs nt35510_drm_funcs = {
 	.unprepare = nt35510_unprepare,
 	.prepare = nt35510_prepare,
+	.disable = nt35510_disable,
+	.enable = nt35510_enable,
 	.get_modes = nt35510_get_modes,
 };
 

-- 
2.51.0

