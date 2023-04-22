Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA96EBB3A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C6710E181;
	Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8810E181
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7714060FDE;
 Sat, 22 Apr 2023 20:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE25C433EF;
 Sat, 22 Apr 2023 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196627;
 bh=bc966mPuHp6GXalMrFKC71SEtTQR845SWL1piWdHfRM=;
 h=From:To:Cc:Subject:Date:From;
 b=ukQ3ghS2bhWNPG+kTcJ4OQsFpLEBnGAsvMfE9Wv/HiOOCo3cDlLBxp4NxJLUFZfBD
 +ABayrKwFI4DaNErTFD2p49gvSGYkLQGFEFQI3L0XclQ5ZsegMTOdsDGXF1KnqmMp8
 m/6A7IpyvoSBSOSwTBHYVz/kdL8iD6EUwBWvFrCwa0H2bIY12wKsfOyUWVgztVry3A
 BJhn/ElsydXFG/j9/vttsVVcPvwgdlVZic407vipfF/ZgL26NYQ05vyNvsHNElaALb
 Gl/ayClkk4cRwdvgRigGnQPUQgLU9dxnyLMH/z+jD7goCxgVV/H8WgY4MXBoHz0pVZ
 HLAof4xenMt0g==
Received: by mercury (Postfix, from userid 1000)
 id 0939F1066CBD; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 00/13] Add Inanbo T28CP45TN89 panel support
Date: Sat, 22 Apr 2023 22:49:59 +0200
Message-Id: <20230422205012.2464933-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This adds panel support for Inanbo T28CP45TN89, which I found inside of a
handheld thermal camera. The panel is based on the st7789v controller. All
information is based on reverse engineering.

Changes since PATCHv1:
 * https://lore.kernel.org/all/20230317232355.1554980-1-sre@kernel.org/
 * Apply DT binding changes requested by Krzysztof Kozlowski and his Ack
 * I changed the driver patches to avoid code duplication and splitted
   the code a bit more

-- Sebastian

Sebastian Reichel (13):
  dt-bindings: vendor-prefixes: add Inanbo
  dt-bindings: display: st7789v: add Inanbo T28CP45TN89
  drm/panel: sitronix-st7789v: add SPI ID table
  drm/panel: sitronix-st7789v: remove unused constants
  drm/panel: sitronix-st7789v: make reset GPIO optional
  drm/panel: sitronix-st7789v: simplify st7789v_spi_write
  drm/panel: sitronix-st7789v: improve error handling
  drm/panel: sitronix-st7789v: avoid hardcoding mode info
  drm/panel: sitronix-st7789v: avoid hardcoding panel size
  drm/panel: sitronix-st7789v: add media bus format
  drm/panel: sitronix-st7789v: avoid hardcoding invert mode
  drm/panel: sitronix-st7789v: avoid hardcoding polarity info
  drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support

 .../display/panel/sitronix,st7789v.yaml       |   5 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 148 ++++++++++++++----
 3 files changed, 120 insertions(+), 35 deletions(-)

-- 
2.39.2

