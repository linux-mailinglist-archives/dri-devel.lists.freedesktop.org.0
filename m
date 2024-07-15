Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4D930ED3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 09:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924AD10E2AC;
	Mon, 15 Jul 2024 07:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wXH85gSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29B010E293
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:32:20 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3c9cc681ee4so2260660b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721028740; x=1721633540; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7tSdEjfL5WvW40eGzJQunfNw/Y4s8XxgreL5/ZRUVN8=;
 b=wXH85gSt7UOe76/KSUXD57Tw2+tP7p7JLqptEekmsuGvIAlLbTk3fhh2X6xpVVids7
 mvQtvyTLKtdnNk9vA7oHZ0ygKiQ7rbA4alMjhLGi0fHXOWCPHRaupx669c4WNV1K8IeF
 yM+efypbVu9K8DkWWPftP8FEeXJ89BLO0pJiKDG4zXG2K7QYo8qpg57gNZDXMnzKlKHC
 i79OBy84Wa+mCBGRLlPxyQNhKgJiBiy87O/8K/yNaq2Al6YVhRSKFvpisiMRiulyS7+D
 3Kb6fjS7tca89UfrRjz2Z+rd3qMixE4aye2R+QKKufTQuNmw+sp1DIxXskZ6SQRuojNL
 Ijeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721028740; x=1721633540;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tSdEjfL5WvW40eGzJQunfNw/Y4s8XxgreL5/ZRUVN8=;
 b=xDoJP42VvInrHrd4IC81gdCcBdVyhCg0l77V06vib4usRNoVHQqUZML7D547Yi0fUa
 uivi0eACaeYADPMS824iV7SeQNtRFQ9sdMaJyJHGfVQEdyNIx6+HvK0LnxXOLFLQgkcw
 J9HxRyVUofCDvnN877JLmgv7A+fUnpQW3GwS7//ePScTWm8rW8u5rwWyCzkyZnNKc5cl
 h0jdNaEu/7inOe3G03A+Fn3LWJFLCCtAPeQnDs2yOxsEuV3PD7kBUYwDWB4dbopi8/ov
 /GbTovjVfsevgdWuaT7kWwwYrHPsszjjfpmTeZz2W9MEPWHpE0D7gu4/b1JunEeUk0Ko
 3HMw==
X-Gm-Message-State: AOJu0Yz4TuvOORpyqnDXsSt5YK0lzbl3j0TqGpY8FlMLTGeoyKOXBWtY
 jmM984Xorl7XnYuWbiwz6eEdr5q0elFda3y7DimHUp7MuRYDqO8TLGTVEr5C4Ww=
X-Google-Smtp-Source: AGHT+IF5nVlSoSWF3wVdiB5RBQbm7n1CGUfwFKuZunS686w2E5L5f0Q7K6i3LlOFF3EUqu5eZmFamw==
X-Received: by 2002:a05:6808:2897:b0:3d9:dc70:10f7 with SMTP id
 5614622812f47-3d9dc7014e7mr14538611b6e.42.1721028740157; 
 Mon, 15 Jul 2024 00:32:20 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca75a6sm3654464b3a.164.2024.07.15.00.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 00:32:19 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, linus.walleij@linaro.org,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
Date: Mon, 15 Jul 2024 15:31:59 +0800
Message-Id: <20240715073159.25064-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240715073159.25064-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Elan-ekth6a12nay requires reset to pull down time greater than 10ms,
so the configuration post_power_delay_ms is 10, and the chipset
initial time is required to be greater than 300ms,
so the post_gpio_reset_on_delay_ms is set to 300.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Changes between V2 and V1:
-  1. No changes.
v1: https://lore.kernel.org/all/20240704085555.11204-3-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 091e37933225..3fcff6daa0d3 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -152,6 +152,13 @@ static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
 	.main_supply_name = "vcc33",
 };
 
+static const struct elan_i2c_hid_chip_data elan_ekth6a12nay_chip_data = {
+	.post_power_delay_ms = 10,
+	.post_gpio_reset_on_delay_ms = 300,
+	.hid_descriptor_address = 0x0001,
+	.main_supply_name = "vcc33",
+};
+
 static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data = {
 	.post_power_delay_ms = 1,
 	.post_gpio_reset_on_delay_ms = 200,
@@ -174,6 +181,7 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
 
 static const struct of_device_id elan_i2c_hid_of_match[] = {
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
+	{ .compatible = "elan,ekth6a12nay", .data = &elan_ekth6a12nay_chip_data },
 	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
 	{ .compatible = "ilitek,ili2901", .data = &ilitek_ili2901_chip_data },
 	{ }
-- 
2.17.1

