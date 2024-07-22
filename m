Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC324938A11
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0D610E3A9;
	Mon, 22 Jul 2024 07:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="mhS4WAZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDA510E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:32:04 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7037a208ff5so2308943a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721633523; x=1722238323; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XtmPe8ZJK5pZD4LlL68HmeLqmeSQWeM4tCQK5wpvSgs=;
 b=mhS4WAZfA8lbLRyCPXMkIINA7/Q7RVpKaSjqLsIb9dGmwUBSl5m99bueHcKoFP5RRH
 Yq8wScZqAXK1mycZpvyqITwz7mH+V+aBB62oOrETJ7vmvJhN5bNt37ErvJAXqGT+N/iU
 TIY4iS2WwUGO6heBGV26qc2s1gaGx6BCHothU3anYsNJC4krXUu5NdgGmg9VuJ/6FqcW
 UqU9JIKuWcD608H0MYzSDnuRZWdP4U0Nsiads7ZLICUJZ/I1OAArKOQWGXcNMoZWfHPA
 uDklRoQ/B6lhpbwLlm71A1icy5acqvfWzGZcAF327GlWZknkxuLV57UOuWk2o1a0yyle
 1BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721633523; x=1722238323;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtmPe8ZJK5pZD4LlL68HmeLqmeSQWeM4tCQK5wpvSgs=;
 b=nH3S/oy4DZ/wrihPSmcn9RexcJk5SY8E4D0bO7YC6Ww4S+Sdd1Hb4YD1C7tcIen2uR
 xU0e2gq3Y+YfLOHvdXzFK6G2H7xX4CCPkMwT7kK6+OKPPfCJYc48iLD+A70qF0XFrb0y
 vRMmynYfIIuEfsvAUNA4H2Gl+IVECjR6tQXJdrONl+eoQ6cDWKKYFFS/lNgmjpjdgNQB
 fIlNwCGz6xgLlId2nqwMOZLa2Xs+uho7CP8KZi5QAdIw0mp8HXCM4Ndra853/g3O9Yd2
 KyTZWG1bBTh1f4ZFyK1Rj9Kwgh0iWM7R2Qjz1wOyKXk/QRv4R+8mclj2PN8n8hq6rOdw
 eDtQ==
X-Gm-Message-State: AOJu0YzKDbMRd2O3VKVgsQcRNkHRbhBi7K8uIFLePtCAHIuOPPVcpPna
 5KcJOLo/3IpHFE5m2tLBeCOX0QRfCGtCbZRwtGCpmQwYIJp97pizbvj6pQloYHE=
X-Google-Smtp-Source: AGHT+IEg4NSILA1YLMa11VPFL+p8V/3CB487/N4g+VcGFw1eoRMCp9wAkwWbl2NChxxU8jftD+UVVg==
X-Received: by 2002:a05:6830:2807:b0:703:6003:11f4 with SMTP id
 46e09a7af769-708fdb2292dmr10515146a34.14.1721633523650; 
 Mon, 22 Jul 2024 00:32:03 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-79f0e6c9461sm4081162a12.61.2024.07.22.00.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 00:32:02 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 2/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
Date: Mon, 22 Jul 2024 15:31:36 +0800
Message-Id: <20240722073136.8123-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240722073136.8123-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
Changes between V4 and V3:
-  1. No changes.
v3: https://lore.kernel.org/all/20240716082851.18173-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. No changes.
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

