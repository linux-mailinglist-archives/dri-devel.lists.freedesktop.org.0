Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FA955964
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 21:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1810E0D6;
	Sat, 17 Aug 2024 19:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=howett.net header.i=@howett.net header.b="SC/dLLuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1D10E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 18:59:31 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-691bb56eb65so30427087b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=howett.net; s=google; t=1723921170; x=1724525970; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GOEb9DjC8C4gSnq0R9sZfb7HwCNzSDtTyyJEre0G9ys=;
 b=SC/dLLuq3hUgrzza4aDWO/s+I8AolZkDnUMvJTU4obYiVQzIspjvWcfUs3wZOdoeLg
 fWHAdWApp/nZqBZkV36wpoQOyPKyfMMw2/+/V/+0Bp+UfR5wCU3/7jRo6oufN6hTN9Wb
 x7jEm8wdi35qwsBvcXGYgR3Ch+VWcwuBAS2Pu2TBJPuyNGziWXQ9mLNcSJ0oWxC1Jes/
 yYsreLzIQXZIilebugeJVn6Fy5bMNrY1QT4ZAtFoDosCCpSMIAzXZqAOEd5aWWD9sKzi
 3w4lMHMAq6A9gYwBNerTMwwkPkrK0bkVcjb+Stv/fDw1Z3J+hkJW7D33HHQjQkgzad6d
 DJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723921170; x=1724525970;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOEb9DjC8C4gSnq0R9sZfb7HwCNzSDtTyyJEre0G9ys=;
 b=DIYp2KX7VTzZUvxHOqU12AJ+oblZ78ovXuL+W+srcu/wgZepw+4x9BGk2EUzs0KjQ4
 BtOzh2xvkyd9Et1uJdPxTz0ggIRpw193E6aRMccOsJ8XkayR/VGyfv09yqD6WMTuaqID
 pQz5Zbj436MZQC9nWHRMPGi0Lgw7fq/Joxz2u8AnDMwhVUINK+40k5P3QnE7DMfWovVT
 4rZ+FZPEOH0DyE3Ql7YQSnBm8wgAyCrA9iqFlkFBZE+XjoO0TJ7VroQT6WIRrn6ncqrb
 fsBfpvJSAxJhingSiGZmH9T21v+JD99p3wrRrKPF8TMckuRixHxYmG58diwEgDvxfQK+
 hk6w==
X-Gm-Message-State: AOJu0YzreSrWQbbNtkrBp/GfAkgye0xP8M53Uh95stdOVqM10VB6lXXk
 G3/aByrsFiKwXFrFl3GCWIwSzacCUOx5w47qaZfWOUO4GXgQB4Bj/HAyQzNKYQ==
X-Google-Smtp-Source: AGHT+IGvCA4SK5nWxPmS0rUPAyrPIHZQr5OiOhI6qqSuz0rFCaAb5EwzTE5YASkeqSTp/+Nz95ZK5w==
X-Received: by 2002:a05:690c:f09:b0:632:c442:2316 with SMTP id
 00721157ae682-6b1b75975f5mr80541077b3.3.1723921169847; 
 Sat, 17 Aug 2024 11:59:29 -0700 (PDT)
Received: from [127.0.0.1] ([2600:1702:5e30:4f11::6f8])
 by smtp.googlemail.com with ESMTPSA id
 00721157ae682-6af9ce76217sm10699037b3.92.2024.08.17.11.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 11:59:29 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
Date: Sat, 17 Aug 2024 13:59:26 -0500
Subject: [PATCH] drm: panel-backlight-quirks: Add Framework 13 glossy and
 2.8k panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240817-drm-add-additional-framework-laptop-displays-to-panel-backlight-quirks-v1-1-cfdd5dbbffc8@howett.net>
X-B4-Tracking: v=1; b=H4sIAA3zwGYC/x2OywrCMBBFf6Vk7UBfaPVXxMWYTNohaZNO4ovSf
 ze6OIsDB+7dVCJhSupSbUroyYnDUqQ5VEpPuIwEbIqrtm77emhOYGQGNOYH5xKjBys40yuIA48
 xhwiGU/T4SZADRFzIwx218zxOGdYHi0sw1L1uOnPszmRVGYtClt//I9fbvn8Bu/361pgAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 "Dustin L. Howett" <dustin@howett.net>
X-Mailer: b4 0.14.1
X-Mailman-Approved-At: Sat, 17 Aug 2024 19:28:20 +0000
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

This patch depends on
20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net

I have tested these panels on the Framework Laptop 13 AMD with firmware
revision 3.05 (latest at time of submission).

---
Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index c58344cdbb6e..348cf68729f9 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -24,6 +24,24 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.name = "NE135FBM-N41",
 		.min_brightness = 0,
 	},
+	/* 13 inch glossy panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x095f),
+		.ident.name = "NE135FBM-N41",
+		.quirk.overrides.pwm_min_brightness = true,
+		.quirk.pwm_min_brightness = 0,
+	},
+	/* 13 inch 2.8k panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0cb4),
+		.ident.name = "NE135A1M-NY1",
+		.quirk.overrides.pwm_min_brightness = true,
+		.quirk.pwm_min_brightness = 0,
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,

---
base-commit: da62c6801838309f5c64cd0520f7bd758edb7d4b
change-id: 20240817-drm-add-additional-framework-laptop-displays-to-panel-backlight-quirks-804c13d639ef

Best regards,
-- 
Dustin L. Howett <dustin@howett.net>

