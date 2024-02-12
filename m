Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C54C851202
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 12:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341A10E2FF;
	Mon, 12 Feb 2024 11:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m1OuXjK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7751F10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 11:18:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2E09CE1152;
 Mon, 12 Feb 2024 11:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2547EC433F1;
 Mon, 12 Feb 2024 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707736706;
 bh=1lR4IsJGmLUexDJX/zjNYB7tgsa4JkZ3HcVTMHB2dNc=;
 h=From:To:Cc:Subject:Date:From;
 b=m1OuXjK8CZ+NAI6SOCsY1TaOBBI3XiORFTXfFMQ9vxA3c3yftkO8wpysTgFM97Q3q
 bJUqMUv9ebPvJdBSdzXnkFLHSJgYchoroVRa8XgogGgE8l064Eo3Ghdhf3jg5hwyJl
 4fqFxaCSroYO4hMXj0JJr2eCkQeJH2FsKa/XxCMLTF08OZi4sDZhk5d4EIO8VIn81v
 9kacs51BlOrxwHS56vkiZ6hTcegnAOltkl8drmJ0SKdBFZ0zjLBdIfO6cP9mvxB/gj
 zi1/nt8vcFiDJd/NTcmShtimOwOfvSTY+uyVdS4rcFPqrYrg+WxiRuF1nN9IH6umil
 1JgxnCfdxJT7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Flavio Suligoi <f.suligoi@asem.it>,
 Hans de Goede <hdegoede@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: ktd2801: fix LED dependency
Date: Mon, 12 Feb 2024 12:18:12 +0100
Message-Id: <20240212111819.936815-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

The new backlight driver unconditionally selects LEDS_EXPRESSWIRE, which
is in a different subsystem that may be disabled here:

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
  Selected by [y]:
  - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

Change the select to depends, to ensure the indirect dependency is
met as well even when LED support is disabled.

Fixes: 66c76c1cd984 ("backlight: Add Kinetic KTD2801 backlight support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/backlight/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 230bca07b09d..f83f9ef037fc 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -185,7 +185,7 @@ config BACKLIGHT_KTD253
 
 config BACKLIGHT_KTD2801
 	tristate "Backlight Driver for Kinetic KTD2801"
-	select LEDS_EXPRESSWIRE
+	depends on LEDS_EXPRESSWIRE
 	help
 	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
 	  GPIO-controlled backlight found in Samsung Galaxy Core Prime VE LTE.
-- 
2.39.2

