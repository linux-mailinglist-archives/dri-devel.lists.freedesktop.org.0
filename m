Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CC41D573
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 10:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049046E3EB;
	Thu, 30 Sep 2021 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAB06E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 08:31:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C49121F449E9
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Crystal Guo <crystal.guo@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: [PATCH v4 0/7] Add support to the mmsys driver to be a reset
 controller
Date: Thu, 30 Sep 2021 10:31:43 +0200
Message-Id: <20210930083150.3317003-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
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

Dear all,

The following patchset is a reimplementation of the patch sent by Jitao
Shi [1] some time ago. As suggested by Chun-Kuang Hu, this time the
reset is done using the reset API, where the mmsys driver is the reset
controller and the mtk_dsi driver is the reset consumer.

Note that the first patch is kind of unrelated change, it's just a
cleanup but is needed if you want to apply all the following patches
cleanly.

This patchset is important in order to have the DSI panel working on some
kukui MT8183 Chromebooks (i.e Lenovo IdeaPad Duet). Without it, you just
get a black screen.

Best regards,
  Enric

[1] https://lore.kernel.org/linux-arm-kernel/20210420132614.150242-4-jitao.shi@mediatek.com/


Changes in v4:
- Remove unnused variable as pointed by Hsin-Yi

Changes in v3:
- Based on top of the patch that converts mmsys to schema
- Fix typo in the commit description

Changes in v2:
- Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
- Added a new patch to describe the dsi reset optional property.

Enric Balletbo i Serra (7):
  arm64: dts: mediatek: Move reset controller constants into common
    location
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: display: mediatek: add dsi reset optional property
  arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
  arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0
  soc: mediatek: mmsys: Add reset controller support
  drm/mediatek: mtk_dsi: Reset the dsi0 hardware

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  4 ++
 .../display/mediatek/mediatek,dsi.txt         |  6 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  2 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  5 +-
 drivers/soc/mediatek/mtk-mmsys.c              | 68 +++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +-
 .../mt2712-resets.h                           |  0
 include/dt-bindings/reset/mt8173-resets.h     |  2 +
 .../mt8183-resets.h                           |  3 +
 .../mt8192-resets.h                           |  0
 12 files changed, 97 insertions(+), 6 deletions(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

-- 
2.30.2

