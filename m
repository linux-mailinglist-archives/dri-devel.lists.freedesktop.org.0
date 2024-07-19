Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF69376FC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 13:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C792B10EBCF;
	Fri, 19 Jul 2024 11:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="h8mtVvga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862610EBCF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 11:06:30 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1fd66cddd07so3500135ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721387190; x=1721991990;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CvBFlpbYXm8DRw134Gwy2tFTrnf08dD4R+UNnPp1igc=;
 b=h8mtVvgaGYYlr3PW1VMPwq0vPgrz/dwgGxme4ZH9eLpmt07beSG0lSREm4vWKY1weK
 ZYJXhcgmoQA8cg864ZN9eg1juxWk4z2S/vSpBdman4qakq4NK1i9bjkROuFMswpgCtcE
 Q/8zxGc8/hIR6/zXnawHIcN8MP6lwc6aTmoGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721387190; x=1721991990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvBFlpbYXm8DRw134Gwy2tFTrnf08dD4R+UNnPp1igc=;
 b=IKY33On7DZHGdL+dynVrJQlvsNQzfkmaHGn3jo+/UmSs5ZqAEzHGGvKf/e2hIdpJZ9
 wE09iZQiyQ+B+pPbEkqpDKLxl8OGRxjAAv/oecIDsMvd9lVoPxfuBMURi4T54aeSvhtW
 vgX2cqfjulYWV3Mab1fO6UHQqen9f/fWQwJaYMJWQUUpln5z1Bpfewksw3BI+iB7Wlei
 PRzaVE5qF7CDi2J/GFlRD0Ejj++09Y5gFWO+4ukJ8eoXsJ8108OmCsvRwooT+iukQJNU
 4h88XPBKT+CAOn9FAkBVjmXkKcoRrmNA3j08mpvEzik9P3MCLJ515/Xc/mQFLQemiFrp
 bR8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS9NwiccHI1kb4PiX6HQv5b2adO7of9ywcKX4XWovlNbflUvlDdr63NNBcaKAoQEIBhV4W4qndKHNX7Lo5B6/bXiJ4+daYhZ4uRh8rpf0t
X-Gm-Message-State: AOJu0YznIK6o3a2VoWVYbVqyC8CQhyxJMHAFIh6NQWaRvJqYcGGZwA48
 pneQsxMmNCZ6QIAafCAbi4boxqe8gPiLYoyaLcw3phWTCYjQd4nQFe82yFiYKA==
X-Google-Smtp-Source: AGHT+IFk5azqwBo31OImo8c8UJI5EX9rWaEosQnZRF79smxG3gHpMq/Sp6tvKC9bRIB55rbQcwEegg==
X-Received: by 2002:a17:902:ebc6:b0:1fb:247b:aa2a with SMTP id
 d9443c01a7336-1fc4e7049c6mr65879635ad.59.1721387190107; 
 Fri, 19 Jul 2024 04:06:30 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:28a4:97a8:4541:cf90])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f3181ffsm2136795ad.155.2024.07.19.04.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 04:06:29 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Kuro Chung <kuro.chung@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] drm/bridge: it6505: Disable IRQ when powered off
Date: Fri, 19 Jul 2024 19:05:36 +0800
Message-ID: <20240719110623.1850021-1-treapking@chromium.org>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
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

When the bridge is powered off, disable the IRQ until the next power on
to workaround an interrupt storm on some badly-designed hardware.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1e1c06fdf206..87b8545fccc0 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -460,6 +460,8 @@ struct it6505 {
 	bool enable_drv_hold;
 
 	const struct drm_edid *cached_edid;
+
+	int irq;
 };
 
 struct it6505_step_train_para {
@@ -2624,6 +2626,8 @@ static int it6505_poweron(struct it6505 *it6505)
 	it6505_init(it6505);
 	it6505_lane_off(it6505);
 
+	enable_irq(it6505->irq);
+
 	return 0;
 }
 
@@ -2640,6 +2644,8 @@ static int it6505_poweroff(struct it6505 *it6505)
 		return 0;
 	}
 
+	disable_irq_nosync(it6505->irq);
+
 	if (pdata->gpiod_reset)
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
 
@@ -3389,7 +3395,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	struct it6505 *it6505;
 	struct device *dev = &client->dev;
 	struct extcon_dev *extcon;
-	int err, intp_irq;
+	int err;
 
 	it6505 = devm_kzalloc(&client->dev, sizeof(*it6505), GFP_KERNEL);
 	if (!it6505)
@@ -3430,17 +3436,18 @@ static int it6505_i2c_probe(struct i2c_client *client)
 
 	it6505_parse_dt(it6505);
 
-	intp_irq = client->irq;
+	it6505->irq = client->irq;
 
-	if (!intp_irq) {
+	if (!it6505->irq) {
 		dev_err(dev, "Failed to get INTP IRQ");
 		err = -ENODEV;
 		return err;
 	}
 
-	err = devm_request_threaded_irq(&client->dev, intp_irq, NULL,
+	err = devm_request_threaded_irq(&client->dev, it6505->irq, NULL,
 					it6505_int_threaded_handler,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					"it6505-intp", it6505);
 	if (err) {
 		dev_err(dev, "Failed to request INTP threaded IRQ: %d", err);
-- 
2.45.2.1089.g2a221341d9-goog

