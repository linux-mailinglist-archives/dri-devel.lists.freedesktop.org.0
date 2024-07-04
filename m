Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED2927243
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F7410EA46;
	Thu,  4 Jul 2024 08:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Jdo/KTLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956F510EA49
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:56:17 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7611b6a617cso160383a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720083377; x=1720688177; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0ToLUUEZ2Win4F6MM5JYbPtX/w+pNIaPEVcPy4RNxHU=;
 b=Jdo/KTLHQKuBiDzm+yWWz78oavGAEsDvPqdSlIXKu2RMl7WG6vqupui9cNiBEXCtFW
 0mJIKfbTyLb4mJ3pl3icEojvN6/hiJFD8Qj9VscogfsF5o3mYTJouvQj0pjunA0JCTDd
 K2rOnRO3Gkks1JOQa6LFsf93geWzzNEilz5fdaoQXer7LqWDGQrfF0Y2J8evULGbtN9a
 9S4skyQGa0oi87jgzzfV45+xwGV4aGKGQSJUIwIdBQlfw3L5/Et3jXrRCJ2h51K4WoN5
 QtRiim62MLY34X5TRjOPwoVnG4/77u44johm3pnrBzsC3I8YNfdLI0mc+bWBIqoZJhhv
 T5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720083377; x=1720688177;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ToLUUEZ2Win4F6MM5JYbPtX/w+pNIaPEVcPy4RNxHU=;
 b=EaYSS9r4a0RI/A6UqJ65UvTXs9J7i0/azpnGa4h+F1HjvzbUa6m7nvyjYBSbeuK3re
 SUd4BRJ3lRowPZUhDlNovtWyYT/lU3bUBM769MhmMnVbFH57PE+uBni58JKdnxr5pXuh
 MXYIzCX8bigy+ctlPQ3PTH0WcmM1x6LjXlEsXIHK+I+cqM8ehVxayyPY5RE2PcLbEaeU
 O4YUynaKpy1YHhl+fCp8YJwuEmGQTM0tXa79x21o59TKaU0r+i88l5RTMVcYA9vy4ac9
 fx1j+XxDITUd4CDqJyWfn50damhUsP84zLbEmG1C/O75B9stDZ60oIk2ORt7NYN1Bdfq
 L0sQ==
X-Gm-Message-State: AOJu0Yy/fI+8jShLxZRzRsfG2K4KAzCpNL/SCGknMWDiXDMq6PBEAjsI
 E28xjvQ2RcL/19melEICt68eLhhqY4xQMOyo0KhcUUQqrx1KazzCRUziQ57TQy4=
X-Google-Smtp-Source: AGHT+IHk4DZ5r6UUa4v9JNFYiBDBi9gqaoVpmIGPorkP0IW579Pjng8UBJRLOYyiPXcSuoF4cwKLaw==
X-Received: by 2002:a05:6a20:9146:b0:1bd:291a:4c80 with SMTP id
 adf61e73a8af0-1c0cc742e71mr913122637.17.1720083377082; 
 Thu, 04 Jul 2024 01:56:17 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c99a97282csm962572a91.20.2024.07.04.01.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 01:56:16 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
Date: Thu,  4 Jul 2024 16:55:55 +0800
Message-Id: <20240704085555.11204-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
---
 drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 5b91fb106cfc..ea91028bb971 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -117,6 +117,13 @@ static const struct elan_i2c_hid_chip_data elan_ekth6915_chip_data = {
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
@@ -139,6 +146,7 @@ static const struct elan_i2c_hid_chip_data ilitek_ili2901_chip_data = {
 
 static const struct of_device_id elan_i2c_hid_of_match[] = {
 	{ .compatible = "elan,ekth6915", .data = &elan_ekth6915_chip_data },
+	{ .compatible = "elan,ekth6a12nay", .data = &elan_ekth6a12nay_chip_data },
 	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_chip_data },
 	{ .compatible = "ilitek,ili2901", .data = &ilitek_ili2901_chip_data },
 	{ }
-- 
2.17.1

