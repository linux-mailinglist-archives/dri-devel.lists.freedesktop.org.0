Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733BD8A9A4F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEBE113C4C;
	Thu, 18 Apr 2024 12:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="TaGcTdE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B269113C48
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:48:37 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e2b1cd446fso6686695ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713444516; x=1714049316; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0M78v9nKtcu9aDQjEM1qTGU4tk87ySL7DtZXrv0/mjY=;
 b=TaGcTdE89tD7MyUKK9JtVGHe9ffJYEbt3Dd+tG/fSvY83nxkS+ea37pMcP29CA9m1s
 iFs6dRHAOUd3J6WCRbxwyRPx9lWQYpA9xNJVbIcHIWwMgWhKDc6bDmqVtexaVOfMlgch
 aDMW2SGl4ziESckfGxll/nDv0UGb4SP7ocdtJIaHfbs0QSHUFPGv/ZgINIJL27aDMeqd
 VZj+3Bek8WBWQeyaXxvBtfsc1yQ7VRbmBPTH8FZSPrthm54UHT8RXTSt325r6QCo8ZU+
 79SpUpKKsdGa1FJ2I/nUErBPpT4Yag959mRWUo6RCsvEK/XEA4BKcWcB9Pn2luGkbwP7
 5C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713444516; x=1714049316;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0M78v9nKtcu9aDQjEM1qTGU4tk87ySL7DtZXrv0/mjY=;
 b=O4zu4nG+FP37+CDTcQf1wG6+iHUECewesp3Tz1f8p/nEPZ4V03q5/MDlArLBdN8f+W
 HSi/CP0x+S11g0r1rSM1ZJ9BM8nlnrbXtiLWxHMhmA1hse/Ph9ZkGPxatIeNDGjjxhii
 I7uGqS2cs58rM5pClfSW1e01ig+xOWqUei+spjRFunKv/RbuZaetDAJdllqC3FOmxgfv
 aW70SNibNQrTAKJuNBfm4EGuJwkGmO1ZAKdFFi1TgeieIs4Z17Vak2nMijB+DyXafi4a
 6SLuyvS8JyXa5x2QUmQS9lcKPhbNo/X+s73/dxBkDPAJWXdLN9j126EMW6ocjElSJKN+
 YTJA==
X-Gm-Message-State: AOJu0YwPOH67f1uT/G2eQaU421fAQfuf7L55zlhWEbi6LdKFkOYdFjyn
 RJUSKzNq/ghzNkBPOeui4s84L65uxCZSlDGCUWKJDVH24j1MsH/TdEijma4+G3o=
X-Google-Smtp-Source: AGHT+IGNj2qyqpmKhYF5SNexUkkbj2Eqj5W+/wzjibv+mQrOYEFftw0xcyN8tor6A7xrYppfL8hXHg==
X-Received: by 2002:a17:902:9a0b:b0:1e2:ac38:2674 with SMTP id
 v11-20020a1709029a0b00b001e2ac382674mr2553527plp.46.1713444516478; 
 Thu, 18 Apr 2024 05:48:36 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 ju24-20020a170903429800b001e3d8c237a2sm1423509plb.260.2024.04.18.05.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 05:48:36 -0700 (PDT)
From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/2] HID: i2c-hid: elan: Add ili2900 timing
Date: Thu, 18 Apr 2024 20:48:15 +0800
Message-Id: <20240418124815.31897-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

ILI2900 requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 100ms,
so the post_gpio_reset_on_delay_ms is set to 100.

Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 5b91fb106cfc..3073620b2dec 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -137,10 +137,18 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
 	.main_supply_name = "vcc33",
 };
 
+static const struct elan_i2c_hid_chip_data ilitek_ili2900_chip_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_on_delay_ms = 100,
+	.hid_descriptor_address = 0x0001,
+	.main_supply_name = NULL,
+};
+
 static const struct of_device_id elan_i2c_hid_of_match[] = {
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
 	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
 	{ .compatible = "ilitek,ili2901", .data = &ilitek_ili2901_chip_data },
+	{ .compatible = "ilitek,ili2900", .data = &ilitek_ili2900_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, elan_i2c_hid_of_match);
-- 
2.17.1

