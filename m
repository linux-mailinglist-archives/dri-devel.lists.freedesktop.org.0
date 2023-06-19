Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE6735BC7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBB510E059;
	Mon, 19 Jun 2023 16:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169D10E056
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:00:01 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687190399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4A28831+pVH/W/Z+3qcDtegWORQEs23NaQLZPsicn+s=;
 b=b1cUllmJxMf4q392YQ4oDiTae6Fty/KLFCWmBmwljg/SW9hsYzXmZus86XSQZKD6p/hdqh
 mOllkOjbIvul2uq80PHLd6FPQ6SKDEiGPHuTbevSDKI2qQcFFy+XMjIgbcwAuKpMx0HrOd
 +89q1c54q4tGjI4+5F34DBxZPxR7cuwS2xj4PeFbWYVi+moGrXxa22+tv2DvOHwdOSdd58
 nHMm74Pu+M4GnmU+a5uFoFBUrOEVBqT7jPWzH5aJIybCL/ikfaRfe7S5jMfawoIA/PWqUL
 KlSEiBliH4T8AISDB8V7HTVMavQ7a9PgZcCwKitc3W7tqkGs8/eNd/6+stYeWQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B904D1BF206;
 Mon, 19 Jun 2023 15:59:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/panel: sitronix-st7789v: Support ET028013DMA panel
Date: Mon, 19 Jun 2023 17:59:52 +0200
Message-Id: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The aim of this series is to add support for the EDT ET028013DMA
panel. This panel features a Sitronix ST7789V2 LCD controller, which is
already supported mainline (or very close to the ST7789V for which
Maxime added support years ago).

The EDT panel is slightly different on the geometry and appears not to
support refresh rates higher than 30fps (above, glitches are visible,
despite the incoming signals being rather clean). While I was working on
this panel, I found quite inconvenient to not be able to read anything
back as it is a great tool for debugging purposes. So the last patch
actually adds a read helper and uses it to perform a sanity check at
probe time by verifying the Sitronix controller IDs.

This series applies on top of Sebastian's series which was also bringing
a number of good improvements to this driver. As Sebastian started and
contributed his work before me, I think his series is close to be merged
so I adapted my changes on top of it.

Link: https://lore.kernel.org/dri-devel/20230422205012.2464933-1-sre@kernel.org/

Thanks,
Miquèl

Changes in v3:
* Following the exchanges with Maxime, existing devices will not stop
  probing if the IDs are wrong, just because old description might
  actually miss the Rx bus width DT parameter.
* Collected tags.

Changes in v2:
* Rebased on top of Sebastian's series and adapted all my changes to the
  existing infrastructure he has already added.
* Collected tags.
* Prevented the ID check to fail if there is no MISO line.
* Used dev_err_probe() when relevant.
* Sorted the IDs in the tables.
* Renamed the panel mode.
* Fixed typos.

Miquel Raynal (6):
  dt-bindings: display: st7789v: Add the edt,et028013dma panel
    compatible
  dt-bindings: display: st7789v: bound the number of Rx data lines
  drm/panel: sitronix-st7789v: Use 9 bits per spi word by default
  drm/panel: sitronix-st7789v: Clarify a definition
  drm/panel: sitronix-st7789v: Add EDT ET028013DMA panel support
  drm/panel: sitronix-st7789v: Check display ID

 .../display/panel/sitronix,st7789v.yaml       |   5 +
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 116 +++++++++++++++++-
 2 files changed, 118 insertions(+), 3 deletions(-)

-- 
2.34.1

