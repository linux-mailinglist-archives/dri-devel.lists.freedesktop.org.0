Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B62B96F9F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 19:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0846810E1FF;
	Tue, 23 Sep 2025 17:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VLBmJrui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0F10E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 17:14:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-62fc686dc41so3930528a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758647666; x=1759252466; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NXqXBnmiXImIakMVKpGGeYlSvR6C1NJ+HVUMvwnxdDk=;
 b=VLBmJruiCQwcvyrrhwSf3Fk2HKJ/SI6ihFKmmPk1ldcLJe+LIOrl/w2Y+0wtXr+wik
 zg4/Gv5ehZZz9MkXxCgGu9eKc/JQbp5sA++ZnYwhVMftYUHkqCHAC7b/zh6dT4LSv9hb
 QFKmbn18YrY1GW7kh/o6dF94LbQxBR63nKI/gH3eXjsSClWL8DkOw4F9VI9dfgD4r5a2
 WkBWC5R1TENolRPKr6Ea9vTymeCYV93RAet1wPZ7EI9B6sBwMVWPOU6oBflVbXKWfwLk
 7/1AH0V4FvOmntMBFOWwfozeC8t5l6MnPXV2GZcCrm02aaUqGrdZS0wf40jbk3+qajvG
 DcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758647666; x=1759252466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NXqXBnmiXImIakMVKpGGeYlSvR6C1NJ+HVUMvwnxdDk=;
 b=UeHuXCacYcumf+NYYp8eT2+1xA5Ujk7zFRTXUUwmVO+bNko6+SDreiuiZ/sYi+dHHZ
 HPUwDIZ/pk03X5gURj+UJdX1JKEM0RVFpM3bACDFER+y+VECZSjkFORa6WxAgkOu9laH
 LK/n8J4Jf7lOeEA1HYO6+1ayzWtDEELvqN9sa7YtD5wyxq1BUI+0vmYafGEIDgUyJa4C
 SvWnVY1Etp+o29J9b2Lwy2y7DoJlbEsT+PcwPuXmHy8jJJk0SxRytdTy2qIwDCuEdXr+
 yj+qBDhMwnf102itoQUIOwbwOz21YshLwvvzz6DpIhi75jiqDHzvWGzoXMqb7umvCsOb
 1X6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV22vw2ce7b7rLM4rO9uMojXbfnoMIf22lWcgRJunGzPPrU+xUx8PzEPLmWXawb+yftBAxYiE2T1W0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOLC04Du3478N2BFrZgMzZR/DRq7o4ogKqu84RYHvdRcSVwIC7
 wRJONbJOKcMuNZYbc5/tdiW7a9v61Rqulrt6064KeCcb5EeGttCdQWLo
X-Gm-Gg: ASbGncscSLmMjJV4QZZvAvpM0jSf3pcAS8LZT0qIias6/37HrlSQ4xsGIOEjH7Ykcyb
 U8iu6h53jom0VyELs/cBbo0LEPFF5EhmYs0xQGLBvzScOmw+mfXvPs+jFvhn0ROwCcid+wRLniw
 4C5abwwGao235mLgSbQwzYX0tiSp8iqsINLPvxrDD6oDM6ODbZjZnw4P5bkIoIHqBYj/s+iYsU9
 xcSUtIBR/yboUEaYBO6IXV1TIccd331sksCTw8+CiwWuKZg6xhe3/xp1ITl0JXiE5fwUfga349t
 tJ7qRn5gajEOVeR8toYI+1UFPAr/3+ayvtdp5HwdHYYxju5sHeVL3mZjBRgihVFWHQ5eup+EXUb
 83FAE+vqJKbMH7Qw=
X-Google-Smtp-Source: AGHT+IGSyRbCpjt3M6fPL9Ny0dbed0xWG6GvMzBnFnctl3j3KrQXRZZdJVYOgLoC0uHRbRnhxPV+ww==
X-Received: by 2002:a17:906:ef04:b0:b2a:7f08:23cd with SMTP id
 a640c23a62f3a-b302b5190e7mr331780266b.50.1758647665932; 
 Tue, 23 Sep 2025 10:14:25 -0700 (PDT)
Received: from hsukr3.. ([141.70.88.200]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2636394d79sm1043812466b.38.2025.09.23.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 10:14:25 -0700 (PDT)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Sukrut Heroorkar <hsukrut3@gmail.com>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH v2] fbdev/radeon: Remove stale product link in
 Kconfig/FB_RADEON
Date: Tue, 23 Sep 2025 19:14:04 +0200
Message-ID: <20250923171409.25927-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The product page referenced in the FB_RADEON is no longer valid.
Remove it to avoid pointing to an invalid link.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
Changes since v1:
- Dropped the link entirely as suggested
(See: https://lore.kernel.org/all/CADnq5_NHu5=esJZrgy_S80jF68ZapRRYX4_L70DwDDSN3VXitQ@mail.gmail.com/)

 drivers/video/fbdev/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c21484d15f0c..27639b2590d8 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -948,9 +948,6 @@ config FB_RADEON
 	  a framebuffer device.  There are both PCI and AGP versions.  You
 	  don't need to choose this to run the Radeon in plain VGA mode.
 
-	  There is a product page at
-	  https://products.amd.com/en-us/GraphicCardResult.aspx
-
 config FB_RADEON_I2C
 	bool "DDC/I2C for ATI Radeon support"
 	depends on FB_RADEON
-- 
2.43.0

