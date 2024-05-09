Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87378C0BA4
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7058D10E287;
	Thu,  9 May 2024 06:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="2qQh6Ei4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357C810E287
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:43:51 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6f457853950so1173752b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715237030; x=1715841830; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qdNwDMuXrR6P9sQoTx7HaymUgCSP7NbO1d3jQaKTXrw=;
 b=2qQh6Ei4q6eJcs9jy5oxra9ugzamBAzjP4DTR/y6jpPyxYT2WqdbrDlmfluc9L1OOr
 zCRqLS8sXP/ACa1/Rl79I6b2THil4yql4CZVYpXtmvqBnmSJmzxfSMzqdVAPLrjs+jyD
 twTD6vnLA8Uitmx9kDW89uSw6NYB38KMoJwUCufR6RTPQX6k4cSApNiMqQyZTFfiV+5y
 ADkHr2RsldyUgngTvBcylu8vZwOmA/OhSpbPDYlFDNOgEq92XFniTNilusv2WBolbduA
 /Vi54SU7mfV6CTEX75jgA4bvoqlJ4uHExfkNfepOnw9AXdzY9lou0xzwBg02CxCJwssj
 5v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715237030; x=1715841830;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdNwDMuXrR6P9sQoTx7HaymUgCSP7NbO1d3jQaKTXrw=;
 b=PMG3qkio0rsCgr2b2bGHkt+cBy6ITp6FC283iRotUrlMAY5nxfP046RtVw+kErEuun
 wPr3LLlCyRePvNnCGW9eKbu02D3VR4d0G/kAjBpolfwSu2q4/VGEcAiGCTTFADefyfoJ
 RFEqpgTnmbN7IWmPAWbGYZqpuSBfUjiIEhBB9++CXKyM1/+pp57xcd12wjikKZKJDk/L
 AgwkCklszbOec6xNYrPlHhJaqOeIFj4iIFuLv463RO0pm4Cb87kCWyHqfYfrVth+jQsm
 5aCoGBSfK6D/Cn6ME17OjJu1LfakIJubyGq0AvAPIJ0qTWg7nsTfBkrx26LHoRIVrH9w
 P0ew==
X-Gm-Message-State: AOJu0YyxMHhB0j7JS7Eo/cyiWAHpGvjVe5NxRVJqh8KkdaXlrzOOUHYy
 lH9byjhXt8ezpm77+XaOWFG86oulEVwE1fjNmn2m2ts4FTHrKOtLnsEAelbIebg=
X-Google-Smtp-Source: AGHT+IFtEWfX91TqFZW9UFRmOuHgn5tfP7k3JfcAXizZ5z6i731Dyk1Sl8kjv7kTqNMiRG6Xt8qz4Q==
X-Received: by 2002:a05:6a20:4322:b0:1a9:d27c:3151 with SMTP id
 adf61e73a8af0-1afd14746a3mr3092502637.23.1715237030525; 
 Wed, 08 May 2024 23:43:50 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-634103f7237sm597394a12.71.2024.05.08.23.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 23:43:50 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/2] HID: i2c-hid: elan: Add ili2900 timing
Date: Thu,  9 May 2024 14:43:36 +0800
Message-Id: <20240509064336.9803-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>

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

