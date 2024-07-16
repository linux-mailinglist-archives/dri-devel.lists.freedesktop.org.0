Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAAB9321D1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2D10E5C9;
	Tue, 16 Jul 2024 08:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="VeJ7eq5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4203410E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:29:14 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-70b09cb7776so3621901b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721118554; x=1721723354; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F4VscS3YS8kYjDJ/yOGc674uy9N5r6MdDESLHfUey0s=;
 b=VeJ7eq5rIErYb3Fsnjp6FA5EFpTeVoKab+gLjgookGG88CWrn93/18GPW0DvJoAHng
 wkSQ9nOlGSD3SgWOD55Lig+tXzDAt0JDYKxvnhXknFd8Ol677SjwUWSHkjp3yifavnMo
 m6sEAayAQ2RlPikF3KnGsvnMLeXHZFFgvkhW9ohbdJG1jmsDQ78XWfUfpFJXG5KoMYnr
 0JZl1zXu3ScN+SkH82edUjzmvKEnTiaWMrGTfvPNuLYicyXXNnlkJ7HDHpTHzo00DjR/
 4mpUoCxonGnW6njZQZUKAH/9WGXbMJI7tFK8Y/91C90RKHCjlBWUdBS9IBFbE/81cNy8
 OoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721118554; x=1721723354;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F4VscS3YS8kYjDJ/yOGc674uy9N5r6MdDESLHfUey0s=;
 b=e70it2zb/t8ZMXVGb/ek0Afr0EN5YrKufji5Yb2sYavHl18BhquKGbm39wx/19HueQ
 PNdn/XrcmSmriBzz3qGN3n24jqqW2Xm0sTJKb/GN0OIZRVwGRwe1Siby1+ce+EKmzZ1X
 aeFUMy1hPnTGM4sbROMifI4iSoni/iAvmW7HTwnBipMbzlkqOib2u8iliqEp7gus8LF7
 MmfJal59CifxYrb1ogAc4CAdApDmgSgzJELEBgiNKohVJ88EEJKBgo78rTE0TapJBokB
 2sr1krBCrcbEww/72O1fQYLCN7Pbn3X1NVD1Id3QVf20QOm2AQsxMMq5Fuf2aUNlXL4r
 JhZA==
X-Gm-Message-State: AOJu0YyTpDNIK76sgZ/ktEuidPs0NamGy37ZI/gnWoEupVOeDecZdCNn
 EkYdCQK1KWrjjxf0/CBHPM4QLfkqyAl0fEawyql/jHX6lihvhnucoZ1yBa/NfVU=
X-Google-Smtp-Source: AGHT+IFH6uGCvMKeaGDMTFjXeKuRtBVJAm84izd2QqVH5X35wOUvL96rbDdtUAUyInj3udsao+qpmA==
X-Received: by 2002:a05:6a00:9a7:b0:705:a450:a993 with SMTP id
 d2e1a72fcca58-70c1fbda81fmr1838471b3a.17.1721118553689; 
 Tue, 16 Jul 2024 01:29:13 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7e110sm5714347b3a.121.2024.07.16.01.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 01:29:13 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 bentiss@kernel.org, linus.walleij@linaro.org, dianders@chromium.org,
 hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
Date: Tue, 16 Jul 2024 16:28:51 +0800
Message-Id: <20240716082851.18173-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V3 and V2:
-  2. No changes.
v2: https://lore.kernel.org/all/20240715073159.25064-3-lvzhaoxiong@huaqin.corp-partner.google.com/

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

