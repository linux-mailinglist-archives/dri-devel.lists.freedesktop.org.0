Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489AF733609
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E488210E659;
	Fri, 16 Jun 2023 16:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24BC10E655
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:33:01 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686933179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rNKYvNwhbFXZTMrZMR6PZ0ZSwbpD9eFmPanu+do8Pb4=;
 b=B8qYY6MHX8qaYJcBep7+WOTOcB8z7ocWd6R2QHy1KSr9Igb2FyB5uaqGA92aWP2tZKw+V7
 zhq+PYuciXlo6EsrWapcKIpJo9vhj3PT/XlXnTl9v+nkFttTlRVz8iFzXTgCBz55KjQtHm
 Nd4C7/dBMzv+IfGMBbE9R4pVcJuKejmtSwzXEOrCAUQ24B/KH7cL3DEjT0YTwv5TcTtRg4
 dd6BPogbEw/Wb3KGPCSNUsnymHHOOZkuwNGNxfwtANGMRStVQIszoAmVOGm37+CaA8v17Z
 Ngqk7kxmxNP1vGhDKqfgK/v17zyPbJuMUnBfj09ar5jILGRfo83qwdP5WkwwwA==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDCA3C0005;
 Fri, 16 Jun 2023 16:32:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/panel: sitronix-st7789v: Support ET028013DMA panel
Date: Fri, 16 Jun 2023 18:32:49 +0200
Message-Id: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
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

