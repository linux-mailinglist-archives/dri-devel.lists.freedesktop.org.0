Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A921F66D1EB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9A010E503;
	Mon, 16 Jan 2023 22:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944A410E505
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 22:49:47 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id q130so1205418iod.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omKF2YX7pGIZQKEcRL/MvPMHB5a+dIUWO4cJUKQU+u0=;
 b=CZ/0UTase2xAs8lxHI9UeqC/wdKvzNYmpbiDBVrjqyYZGIKUGnIUNlcy3Cwp+wmDeR
 d3c6Pb98pr5Y/PoyKbSFMnaVb1YvbkpejVW6ZEyWUR648sqhTe5Y9lca6Qy8qA1wFTUO
 0d2hmxgAwMij76ziFQpzZomOFM0vUZtIBM6fuaKo1TEuXX7r5yd/8Tr5IrpR6xpJxYF9
 GegZ+ZW1ybWZP2QuyhV7THjLgR8U3isBjeWRdx8ArOk6hPq7TLgc4YNxrttoTeRYqlQ0
 KxYahUCJMpiI69XCFQwKHfjWo8DkCy+Zhf2TOr/W4are0BoAi4XuyBfpAfyk0pI6Tsl/
 SFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omKF2YX7pGIZQKEcRL/MvPMHB5a+dIUWO4cJUKQU+u0=;
 b=6r9BAjs149xBHXCPcUJ0dJJoPXRboQnncKBFg1GEf5AhH6aEkDZ6jwiN4CnjgLiYGE
 Jzd1mYOGccv4NwoL7eN8M06rAHSYhWEA4Fl/LSZ+fJkYl2HeE+SSzEP6u/FOhzmbGpSd
 3w3BeEi6guA9477Eu0iMSg1yjvjRM+Aqpzq2olRQf0lJY6on6mbzmHH5r8Zqe1ugd8nm
 mGrLddRTREey0ulxiXFf5d0AeSmBPGhwlILZQ7GYs4hqie4j7MEhaRGNmDPgPfWezWjl
 8Maw6YAT0ZoL1VGWFjtKKQfgqgi1tRh6tWwrXdySlYxzoWYFhI3h9qONZwS8Tk9JvFHM
 G+wQ==
X-Gm-Message-State: AFqh2kpPQiDbkKIKqlac31N0Ql+w413LxvifwHu+AMOdNDnH7/ETsPFt
 ahVW32FfKNdxOmW4CuiKlEM=
X-Google-Smtp-Source: AMrXdXtPw+6hWBhNdeiLKTPCVjXcBFoNQ6gjAqaly6x0ETeYM27eNPMHuRAACMVCQo+sFcLbWTGtRg==
X-Received: by 2002:a05:6602:378a:b0:6e0:10d3:9631 with SMTP id
 be10-20020a056602378a00b006e010d39631mr695736iob.16.1673909386891; 
 Mon, 16 Jan 2023 14:49:46 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6be])
 by smtp.gmail.com with ESMTPSA id
 z25-20020a056638215900b003a3dd1c7be7sm1791841jaj.128.2023.01.16.14.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:49:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 2/3] drm/panel: sofef00: Use 16-bit brightness function
Date: Mon, 16 Jan 2023 17:49:08 -0500
Message-Id: <20230116224909.23884-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116224909.23884-1-mailingradian@gmail.com>
References: <20230116224909.23884-1-mailingradian@gmail.com>
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
 Caleb Connolly <caleb@connolly.tech>, Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These panels communicate brightness in big endian. This is not a quirk
of the panels themselves, but rather, a part of the MIPI standard. Use
the new mipi_dsi_dcs_set_display_brightness_large() function that
properly handles 16-bit brightness instead of doing special processing
of the brightness values.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Tested-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 9db49a028930..1ebb79e3103c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -10,7 +10,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/swab.h>
 #include <linux/backlight.h>
 
 #include <video/mipi_display.h>
@@ -213,13 +212,9 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
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

