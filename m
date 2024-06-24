Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08805915262
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477E310E04A;
	Mon, 24 Jun 2024 15:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CSvoSxhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4762D10E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:30:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3620ee2cdf7so2886222f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719243052; x=1719847852; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Wh7xrbjfwGsyfIEZVLHT3Izn0pKIYJ7wtYXXb68AeA=;
 b=CSvoSxhOuSPHy+yhnsvwoDHcym6QGmEEGLEkNpM8bmukMEBCMeuZfTdZWy1lzmryv0
 o375VE4BE9GItxcTCMhXp6RdydR3OCr47SIdGOWtEv2C78ybuNuGtfAZZZfu8TnKt6rd
 ePe7Mq6+jrMOlQA1HV7C/KBs/FC4OwGw/Tt5wbFODAXBDpBN8G1PqxbHn2kPTJocVM3C
 o5UGKiWtHr48PhldlB1xspQYOJaWUnLafb9UAU6UWzFvvIqc/3x+eJFaLnVV4vpVqQ0V
 KRgOFcjcN5UKwy4cIdYQbiK51Y0ntoAJoImtN3L0NQTTuj0miQw1j4mlmvqdhLAHdoiI
 xOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719243052; x=1719847852;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Wh7xrbjfwGsyfIEZVLHT3Izn0pKIYJ7wtYXXb68AeA=;
 b=A3BKXkRAj2xVBOrCGm+JIi15G4YJ1oO/nONh1+d780nVJ6J4mVvQxFDrP05gMJdIDS
 tJILy56e39yrX96qRTsIQuz0ylTwkTok2AJ33oLUxZ+hVk6D67GFoDgMkNGcjeHPvqrj
 BpO5/QMwtjFQufq29oV1h7W+h6Jqthh760c7yftvSRxFT4pMl1BLqCzPnwLRuBF1V165
 jLsPFm0voF6L44kBBr3A4X+6H5Mw0GZS3bCFXWpP+FWEDU8wGzVv9HRDgWHezlULKBOJ
 ihDYSdtb71iBkmd0Bh4SFlMAk+O3jNsf3yS3J00Nc9nHTHC4NtyYwMWPda46U/oYEST5
 a0HA==
X-Gm-Message-State: AOJu0YxLoIHtf3oRlN+X2Wkg0YDGnQXo8Q4UBfZUrw+xUwr3qT5J60ue
 RAnOgigq80K5hFfvKAkmiucjIidsVInkMjNRKsue9VsBS7xsKdNg
X-Google-Smtp-Source: AGHT+IHupmj7SCP4Ewzmje7FjrNNDa0FXZUj53f7H62eDvPdjfYU4zbcbpHiI4rU495sq99AOfQkuQ==
X-Received: by 2002:adf:fe83:0:b0:363:341:1cf2 with SMTP id
 ffacd0b85a97d-366e7a1bf24mr3680117f8f.22.1719243051993; 
 Mon, 24 Jun 2024 08:30:51 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at.
 [84.115.213.103]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f65bcsm10300418f8f.13.2024.06.24.08.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:30:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 17:30:50 +0200
Subject: [PATCH] backlight: lm3509_bl: Fix early returns in
 for_each_child_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-lm3509_bl_scoped-v1-1-ceba9df38f23@gmail.com>
X-B4-Tracking: v=1; b=H4sIACmReWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMT3ZxcY1MDy/iknPji5PyC1BRdc1NLC+M0cwOjxNQUJaC2gqLUtMw
 KsJHRsbW1AMX6te1iAAAA
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Julia Lawall <julia.lawall@inria.fr>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719243050; l=1581;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Jkeimj0HklVuSImq8IB7VcmxLmbEpZozN1KItY60wHY=;
 b=dLuEs9T9Fo7tpWo0a2PCCOune3MeuOXpQnuPNcFgGP/8HLubrH5V+/hb65u77OmE18D/kkEUv
 dvDLEsZbEFgDtOpUEjJpH8cSXjKhih53IfobyhxwhHWOKeHvu0f7wWc
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

The for_each_child_of_node() macro automatically decrements the child
refcount at the end of every iteration. On early exits, of_node_put()
must be used to manually decrement the refcount and avoid memory leaks.

The scoped version of the macro accounts for such early breaks, fixing
the early exits without the need for explicit calls to of_node_put().

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202406172314.2vVgelaS-lkp@intel.com/
Fixes: b72755f5b577 ("backlight: Add new lm3509 backlight driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/video/backlight/lm3509_bl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3509_bl.c b/drivers/video/backlight/lm3509_bl.c
index c93cdedff5ad..7a36f5c08640 100644
--- a/drivers/video/backlight/lm3509_bl.c
+++ b/drivers/video/backlight/lm3509_bl.c
@@ -157,10 +157,9 @@ static int lm3509_parse_led_sources(struct device_node *node,
 static int lm3509_parse_dt_node(struct device *dev,
 				struct lm3509_bl_led_data *led_data)
 {
-	struct device_node *child;
 	int seen_led_sources = 0;
 
-	for_each_child_of_node(dev->of_node, child) {
+	for_each_child_of_node_scoped(dev->of_node, child) {
 		struct lm3509_bl_led_data *ld;
 		int ret;
 		u32 reg;

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-lm3509_bl_scoped-75983f702aed

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

