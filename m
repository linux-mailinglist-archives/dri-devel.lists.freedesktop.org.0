Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A7366AB16
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 12:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04F510E068;
	Sat, 14 Jan 2023 11:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B875B10E222
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 01:00:28 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id f8so5490506ilj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y810J3KzQfR2aqbuK0dns8pKusrycDvek8iL+9qUASA=;
 b=XdgXKSRUDI7mA+iyCDrtRy1/vl9XhHBZcOwScEEwXnohGQWTnqsKP6oHamJuH3R9k7
 YfcQnT/MK1pQZNuBXhtsFmtQU/HclLUclxD0AwjyYgjIUza0MRF2bpeLf3kQKz9nF5Fd
 X7huRhWt09LLYqY7auT1qkZL8ZQGB6OUU9fzzVYjVASnqJ9DAZL848Q+5m4GT7xjVMdk
 WYe5pmBGjiWyIT22nkorbSQSfXI8BwHB1rsmEmE9/e0NYhO65tB+FQukZgMQcVUMhdD8
 UdU+KUhOkbVXZigpLMqFHVI0TV7sDiFYpjRDEpU1mKa/HWE7u6B/U2u/bbG9QdqYq8Os
 C8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y810J3KzQfR2aqbuK0dns8pKusrycDvek8iL+9qUASA=;
 b=Blvo3ko8PnKfZL9OgMI3uHanwvBau0OluMlN8mzNyZCj2VWfA79ndT4jxpJfdwcP9O
 yqH9jXk85FgP5tUp3c8wv9EXh/ot/x8ZR4mtnd4k0vraXhKzgKcy4qGyCyZPly//OjSB
 s0uJgyx1AsIgBaLN2ASYeAv1Vsi9cgA/+BKPBLVnjQkmbqdGaERCx3TjYe/RBbKDN4ML
 wuhRrkbW7W1MSUiT4AeoeHTzvh/NMdOS6aAnM8VAv7KeP8Uq0zxY/LaKm8cd3+LYcOsj
 Ic4+Tm4mFgBsblfXHhyTroa/WHkI5NJQzrl6c5ER5Lo1ZmhxTdWp452hxSdJ/uQkm2OR
 fiGw==
X-Gm-Message-State: AFqh2koqHwajqh7oHMDmH9iSdAEK2cKItRwI0CFjtvHWtyuxd14X1i0J
 +xZqk5PHa6Fk6xhFSawkcj4=
X-Google-Smtp-Source: AMrXdXvdzvyNPEcBo2dTCNko0YyA2FCz6UAntyW9K4phHNIHYi4IcFDz5u10dwOD953XHU5GsW4sZQ==
X-Received: by 2002:a92:cc08:0:b0:30d:92c4:8d6 with SMTP id
 s8-20020a92cc08000000b0030d92c408d6mr7895533ilp.10.1673658028036; 
 Fri, 13 Jan 2023 17:00:28 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6463])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a92d30d000000b0030c63d62106sm6436094ila.61.2023.01.13.17.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 17:00:27 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/2] drm/panel: sofef00: Use 16-bit panel brightness
Date: Fri, 13 Jan 2023 20:00:06 -0500
Message-Id: <20230114010006.50471-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114010006.50471-1-mailingradian@gmail.com>
References: <20230114010006.50471-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Jan 2023 11:05:05 +0000
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
Cc: Caleb Connolly <caleb@connolly.tech>,
 Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These panels communicate brightness in big endian. This is not a quirk
of the panels themselves, but rather, a part of the MIPI standard. Use
the new mipi_dsi_dcs_set_display_brightness_wide() function that
properly handles 16-bit brightness instead of doing special processing
of the brightness values.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 1a0d24595faa..014fe350bc59 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -10,7 +10,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/swab.h>
 #include <linux/backlight.h>
 
 #include <video/mipi_display.h>
@@ -221,13 +220,9 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	int err;
-	u16 brightness;
+	u16 brightness = (u16)backlight_get_brightness(bl);
 
-	brightness = (u16)backlight_get_brightness(bl);
-	// This panel needs the high and low bytes swapped for the brightness value
-	brightness = __swab16(brightness);
-
-	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 	if (err < 0)
 		return err;
 
-- 
2.39.0

