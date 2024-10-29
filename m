Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE919B460B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C70B10E0FA;
	Tue, 29 Oct 2024 09:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UtUT0Mu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5634910E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:54:18 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so51894215ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730195658; x=1730800458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zRN2Q2s1tXUlBpPwz2Gezq5YzOvyUe388g/hG6wINCo=;
 b=UtUT0Mu12C2opO7YaJy8/JZG2MR5IG2paS1/IWkbJF9GoOCjDDdxwYQFpCYCE7UwJH
 ii1+Wllx1eO84eYEXsjyi9BvKbFBU3s9SzpIrvTk5cBiSG/fbsp/cPef0f8cMPg5Lwvm
 a+OKWzzy6Ms2SYmjXe941qRL0u/H6ujIqK3bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730195658; x=1730800458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRN2Q2s1tXUlBpPwz2Gezq5YzOvyUe388g/hG6wINCo=;
 b=RExI2d++o89GPBYNBnzfnsEj9O8qNWIa1h6cZs9fUcd5FPtGS5Pf25dU+PysbP5Ine
 wcPmz69CvqzIJHjndVfCAg/NuLs+YfNWpZh666Ps4i+WQF7sBS6nfkSJQt6laRp4V4r3
 lGh0UFw/BuNivdldlySHUErIWZ3ZwNj+3GaGv9s4OcAYkI+yliLAa1NmNNgqv2QEi3xz
 gqcNfi4kFof57Vb52S2+FzO6E/tnF2QU8gxr2FvdBKdDhhdjwpgyFzUeRwUmcFW9gZX0
 cBlSt1/Um6gRJnefk9/3uta+UeR8KTAD5UyIBIBSoFWmHkyUNubejaSxBOK4cUwF5oKu
 nEPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzorlEMagrXvn55BP9W37ZP5eIi0oMGe3gZvoWZHO5cIfoPvMPpTPjMU3qHB8zsMVBHNlJx8KU1HI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzS3/ve1E7Huh2SCbZ3kCRLSpaNM/mEO8YRlRChT8K0ym7gcbG
 UGcp0nmkNfmXwR79wsyOL3Zq+Lb+WeAVEpc/Twc6mka85jE3C3EuX6ri1c7XKA==
X-Google-Smtp-Source: AGHT+IGJKLBeHml2mgw0fqam5oO7OYmdphXyqZ72BkhYs4KBfI3AcNJBCtRzWfdnOR4KM6obA5v1sA==
X-Received: by 2002:a17:903:2289:b0:20b:7ec0:ee21 with SMTP id
 d9443c01a7336-210c68cf5a9mr165968125ad.19.1730195657831; 
 Tue, 29 Oct 2024 02:54:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1fef:f494:7cba:476])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02efb1sm62901235ad.221.2024.10.29.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 02:54:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Date: Tue, 29 Oct 2024 17:54:10 +0800
Message-ID: <20241029095411.657616-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT6505 bridge chip has a active low reset line. Since it is a
"reset" and not an "enable" line, the GPIO should be asserted to
put it in reset and deasserted to bring it out of reset during
the power on sequence.

The polarity was inverted when the driver was first introduced, likely
because the device family that was targeted had an inverting level
shifter on the reset line.

The MT8186 Corsola devices already have the IT6505 in their device tree,
but the whole display pipeline is actually disabled and won't be enabled
until some remaining issues are sorted out. The other known user is
the MT8183 Kukui / Jacuzzi family; their device trees currently do not
have the IT6505 included.

Fix the polarity in the driver while there are no actual users.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7502a5f81557..df7ecdf0f422 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2618,9 +2618,9 @@ static int it6505_poweron(struct it6505 *it6505)
 	/* time interval between OVDD and SYSRSTN at least be 10ms */
 	if (pdata->gpiod_reset) {
 		usleep_range(10000, 20000);
-		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
-		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
+		usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
 		usleep_range(25000, 35000);
 	}
 
@@ -2651,7 +2651,7 @@ static int it6505_poweroff(struct it6505 *it6505)
 	disable_irq_nosync(it6505->irq);
 
 	if (pdata->gpiod_reset)
-		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
+		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
 
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
@@ -3205,7 +3205,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
 		return PTR_ERR(pdata->ovdd);
 	}
 
-	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(pdata->gpiod_reset)) {
 		dev_err(dev, "gpiod_reset gpio not found");
 		return PTR_ERR(pdata->gpiod_reset);
-- 
2.47.0.163.g1226f6d8fa-goog

