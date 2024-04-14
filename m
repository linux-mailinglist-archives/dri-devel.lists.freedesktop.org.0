Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78678A43D1
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16351120CF;
	Sun, 14 Apr 2024 16:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ejL/xz4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ACF1120CF
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:36:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 03E7FCE0990;
 Sun, 14 Apr 2024 16:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBC0C072AA;
 Sun, 14 Apr 2024 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112584;
 bh=eNzOnZBoAvIfDYaYJCy+HYEyB3DpVs0pSukxdyTWkd0=;
 h=From:Subject:Date:To:Cc:From;
 b=ejL/xz4EMRQtIL8NFPoxCI7BA2WCz28U7xgpVypZZWpdJosTannIu+kkHbUgXlF1g
 XqUeOUUoyo2tBk188MJQ+ZD286korvAtpco7R0AqF+srxompcOH2o3bYxsARNS6+22
 RseGS5xk2EGB7dtHc+Xj1wdAcEymmLQKJ1hMPu+7fW1JYkuyu1D7EQzN5ZKj+XElcw
 WWy6zTNVcY6/fbR1xB7KfJjMt2I2uNzA3SQ5RIjYGVUWm8SWgMYhxdcLt1s+r9Vw6O
 A+VTqjum48dW4AS6DwV/smfJ7vZ+tY/j5sHdGeQqL4pXwWRs/u4dZ/bo9AXsBcBOze
 PLTo4g2+VwrzA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 00/18] backlight: Constify lcd_ops
Date: Sun, 14 Apr 2024 18:35:58 +0200
Message-Id: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4FHGYC/x3MTQqAIBBA4avErBswk/6uEi1KRxuKDI0IpLsnL
 b/FewkiBaYIQ5Eg0M2R/ZFRlQXodT4cIZtskEIqoSqFNxvyuMx629mtF+7aoD8jyrYxnap7a5c
 Ocn0Gsvz853F63w82aO77aQAAAA==
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295; i=krzk@kernel.org;
 h=from:subject:message-id; bh=eNzOnZBoAvIfDYaYJCy+HYEyB3DpVs0pSukxdyTWkd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAXysXFQnYyvdqcs/X5FakY9Fo/FHxiGQeytV
 tdgafVxAeSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF8gAKCRDBN2bmhouD
 1+6rD/9zrg4QyHTGfati6i4s8LnmC6E8hhyOIATO04pH9rEDIPq7D9+7QUXi1gCd8nsDda+rGGc
 lrjLvf++q6aPw/5rfGmp7sRunrZAkttgq8TQnqGRBnsxZL9pi3GBfbuPxFXsdbTq3DmPUdS0Kwb
 IixWqSiF/PI9K3KXRmadIw4DQnZ/z6z8JBr0n2KJmrlf6cPHCEP8s6h2vHC0I635LJ8j1eXC2wF
 UTt19KZsqIV/J7/Lv0EtVygFY2UWHfHUs6crKGUt7Q6HKcsJeol6XWix5ecLTaM4DKkyARJ80Ed
 Ci+mO1BdAlczTrKKMpx8k26i0S9/oXsaqKhId2eCzKvOdOKytvhTq46mV0rOxGERh4cv69LJm7r
 ph5flgoJf/BX7/blXsoMhYX2JiIYYt4SNrfEuBVj25G+DygfCs/Dsc598z26dXnuBywCU/p99eQ
 MYGszfHkvKZUeri7xCiNHnNPnJ4Wn68mLl97KD+AWqc3pGJiClfVzoh/D3Xd8gaHfqX2MUK2EGZ
 eCJaeaujMjxs+w4MqfFK8sbQ0KrWnNWjYvdnku55wherHqChzpSxnNXiJmx0pHKCTcqHB8MgeXJ
 6FlQJOQLB0BJC13I1l5/2uZxryjSeZn5sJBV+3UJDR8Q3oSdbfFP1EpYtpEKbJHCil9AME85b3e
 3ZOQeRpuPIdNFOQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Hi,

Dependencies
============
All further patches depend on the first patch.  Therefore everything
could go via backlight tree (please ack) or via cross-tree pulls. Or
whatever maintainer choose, just coordinate this with backlight.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (18):
      backlight: Constify lcd_ops
      backlight: ams369fg06: Constify lcd_ops
      backlight: corgi_lcd: Constify lcd_ops
      backlight: hx8357: Constify lcd_ops
      backlight: ili922x: Constify lcd_ops
      backlight: ili9320: Constify lcd_ops
      backlight: jornada720_lcd: Constify lcd_ops
      backlight: l4f00242t03: Constify lcd_ops
      backlight: lms283gf05: Constify lcd_ops
      backlight: lms501kf03: Constify lcd_ops
      backlight: ltv350qv: Constify lcd_ops
      backlight: otm3225a: Constify lcd_ops
      backlight: platform_lcd: Constify lcd_ops
      backlight: tdo24m: Constify lcd_ops
      HID: picoLCD: Constify lcd_ops
      fbdev: clps711x: Constify lcd_ops
      fbdev: imx: Constify lcd_ops
      fbdev: omap: lcd_ams_delta: Constify lcd_ops

 drivers/hid/hid-picolcd_lcd.c            | 2 +-
 drivers/video/backlight/ams369fg06.c     | 2 +-
 drivers/video/backlight/corgi_lcd.c      | 2 +-
 drivers/video/backlight/hx8357.c         | 2 +-
 drivers/video/backlight/ili922x.c        | 2 +-
 drivers/video/backlight/ili9320.c        | 2 +-
 drivers/video/backlight/jornada720_lcd.c | 2 +-
 drivers/video/backlight/l4f00242t03.c    | 2 +-
 drivers/video/backlight/lcd.c            | 4 ++--
 drivers/video/backlight/lms283gf05.c     | 2 +-
 drivers/video/backlight/lms501kf03.c     | 2 +-
 drivers/video/backlight/ltv350qv.c       | 2 +-
 drivers/video/backlight/otm3225a.c       | 2 +-
 drivers/video/backlight/platform_lcd.c   | 2 +-
 drivers/video/backlight/tdo24m.c         | 2 +-
 drivers/video/fbdev/clps711x-fb.c        | 2 +-
 drivers/video/fbdev/imxfb.c              | 2 +-
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 include/linux/lcd.h                      | 6 +++---
 19 files changed, 22 insertions(+), 22 deletions(-)
---
base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
change-id: 20240414-video-backlight-lcd-ops-276d8439ffb8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

