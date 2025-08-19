Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2519B2BF8D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689710E59B;
	Tue, 19 Aug 2025 10:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ds8mIUsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D459910E592
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CD505C5E54;
 Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF08C4CEF1;
 Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755601144;
 bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=Ds8mIUsCQgGlE0xRvlVe6y6bgAdwSbA7Zno8tIxEpv50dUGNL5DE+V/7PsXPnCih3
 FnMJY8Q6bsZ7H/j5mNqMLtWgELkoslnXhQIvlZOyzJ9pWez8R6KG4h4TKQcazzsyXI
 EbDubeXebPPEca2HZk5D1pbQaCiUVU2xmK4AAeO8aNxO4xiDyfXNdEpw7g3PBqj711
 Q2dxfUIq70GD2oV2E3744NsWcJphF6/qC+y0xpp5Rloc7Lf7rEkjbBhSpw8YC1JHes
 3G4pPvazugxRY14+wOR6bbgR7Boa2Dxc0PPi8fKfcQ/4jUb0IaY0TVVIx0TR+qMwdR
 zE1oAOpo2lppw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DE59FCA0EE6;
 Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 0/4] backlight: add new max25014 backlight driver
Date: Tue, 19 Aug 2025 12:58:58 +0200
Message-Id: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJYpGgC/0XMTQrDIBCG4auEWdeiQ8xPV71HyULsJBESp2iQl
 ODda9NFd/MOH88BkYKjCLfqgEDJRce+BF4qsLPxEwn3LA0oUcsGG7GavVyqFjXKVveKlBk1lPk
 r0Oj2k3oMpWcXNw7vU07q+/0hLeo/kpSQQlJnLfXF6+g+sWW/BV6Wq+UVhpzzB8licAOlAAAA
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 "Maud Spierings maudspierings"@gocontroll.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755601142; l=1984;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
 b=tg5vLaPXsGCQxjf7wI8AaH2Njrai8idSmUxnlS+4gXs03tlqp5zKmNQ244mZ5Q/rRknUynI+6
 VBoeyS3B4V8BW7W09dDMRELXD/LJyG0isydsmFlzv4EHKl325Mc8Pl9
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Maxim MAX25014 is an automotive grade backlight driver IC. Its
datasheet can be found at [1].

With its integrated boost controller, it can power 4 channels (led
strings) and has a number of different modes using pwm and or i2c.
Currently implemented is only i2c control.

link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX25014.pdf [1]

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v2:
- Remove leftover unused property from the bindings example
- Complete the bindings example with all properties
- Remove some double info from the maxim,iset property
- Remove platform_data header, fold its data into the max25014 struct
- Don't force defines to be unsigned
- Remove stray struct max25014 declaration
- Remove chipname and device from the max25014 struct
- Inline the max25014_backlight_register() and strings_mask() functions
- Remove CONFIG_OF ifdef
- Link to v1: https://lore.kernel.org/r/20250725-max25014-v1-0-0e8cce92078e@gocontroll.com

---
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 bindings
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    |  79 +++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 395 +++++++++++++++++++++
 7 files changed, 527 insertions(+), 1 deletion(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


