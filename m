Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F49C707C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 14:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5250910E6ED;
	Wed, 13 Nov 2024 13:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="T1pDKRCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39B10E36F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 09:00:31 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-71e52582cf8so5311619b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1731488431; x=1732093231; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Fvap02PjhZeDB/6aMVoZItVlwplGYl4WKDWPSr0Pzg=;
 b=T1pDKRCYE6EU5GOB78zNQxUBCgKxVqWBA4Hx0vQjxgtLArJr92Gfk9ee0J9xOjSLGM
 FYjmi7PTKPNjIqe9memzYlegMKOemBhwWg3tpp91Dp1ERyx14ieeQdfkgxNwT+ohRcWv
 N4xUR1dEe0ATVgGAyZRoXK2HINfTj3dYV3OOzp1E/r9WL+yjTnzIXdz1MydIZrNJkJCF
 Y6VuFr2yvbOy1uBEH5fC+smhyrpsvsP0xptLb9oiZ/aAdDiHWSZIzjce2ZATTgN1rV6i
 Qef6tLZ5oDnKbY5XMu3Bb3sYqN3x3diIJpZZ3/w2yi56v/nziFNYau29OM/+X0GkGJwl
 ciMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731488431; x=1732093231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Fvap02PjhZeDB/6aMVoZItVlwplGYl4WKDWPSr0Pzg=;
 b=IGeIs6bv9ylEnwcDZ1ijzGTRthqOB7oe/bOmCOeFynjgK/yaX29pmJPR44LgT+CEH0
 ie3sNLeW3tS7ahO1ZMrzLigc6Q0fTWR7RNgjMLTQzUycEveLDNMEo+xhH77IMY8anKyY
 BjMHRBpUoL6aFddTE9p5iKQPNCOBBTKB7GaXEWtE4ZfF8zwrL4X8YyeunrMXix8SEpDS
 XItP9Xob6MGzomUuVuATsg5O+2fOE7qIZ6ZM/RFeylQALuDJD288bWrhcSYlqdxKb0FC
 0azz5wOiRuZAp0+8QINaEPDoYaX4BmsvU5przL+6t8qM+OfwundQ5bBI8OpT0KLY7K07
 AGlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWheTdBh4yET9VSw6Ml5ug5Aq5gotJ4o+I3St5j5USiUx97Fnwpg8KoLYhTp10RJ5X0bX25VVlPHrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpnisfrr8SZ7zkXySrYWpj3yecJ2sIGA/jkg83025qSG7TljY6
 gK4Tk9qof8He/TXftHfIHw3omWBe6KvfGdjEStKtZQZDwIhQLrsT2P4GLHirmXE=
X-Google-Smtp-Source: AGHT+IEKq5+fRsVy6UZozj3I1QwgDyM+oocitFdcrf6q6LPoOuN017PUnrLbnwFeBeH1HJrMRxUKvQ==
X-Received: by 2002:a05:6a00:3988:b0:71e:ed6:1cab with SMTP id
 d2e1a72fcca58-724133b25e5mr23901143b3a.26.1731488431163; 
 Wed, 13 Nov 2024 01:00:31 -0800 (PST)
Received: from DGP100339560-10.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407991bc8sm12787200b3a.96.2024.11.13.01.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 01:00:30 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dianders@google.com, Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add KDB KD116N2130B12
Date: Wed, 13 Nov 2024 17:00:22 +0800
Message-Id: <20241113090022.332586-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Nov 2024 13:23:55 +0000
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

Add support for the KDB KD116N2130B12, pleace the EDID here for
subsequent reference.
00 ff ff ff ff ff ff 00 2c 82 07 17 00 00 00 00
1c 21 01 04 95 1a 0e 78 0a 63 25 99 5b 5d 96 26
18 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 87 1b 56 88 50 00 0e 30 28 20
55 00 00 90 10 00 00 18 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 4b 44 31 31 36 4e 32 31 33 30 42 31 32 00 17

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 012dfbcb9475..5355acd52f0b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1978,6 +1978,12 @@ static const struct panel_delay delay_200_500_e50_po2e200 = {
 	.powered_on_to_enable = 200,
 };
 
+static const struct panel_delay delay_200_150_e50 = {
+	.hpd_absent = 200,
+	.unprepare = 150,
+	.enable = 50,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -2134,6 +2140,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1118, &delay_200_500_e50, "KD116N29-30NK-A005"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1707, &delay_200_150_e50, "KD116N2130B12"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
-- 
2.25.1

