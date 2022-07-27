Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C07581F2D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 06:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8991123B3;
	Wed, 27 Jul 2022 04:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB82DC1211
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 04:50:45 +0000 (UTC)
X-UUID: b23a79603f974761b7caccc9fa03d83d-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:e8f8bb89-6236-4169-9d56-9ddc88c1b20d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:380ffc15-4d40-4085-b6be-c498a879f53d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: b23a79603f974761b7caccc9fa03d83d-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 800680731; Wed, 27 Jul 2022 12:50:39 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 12:50:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 27 Jul 2022 12:50:38 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v15 00/11] drm/mediatek: Add MT8195 DisplayPort driver
Date: Wed, 27 Jul 2022 12:50:24 +0800
Message-ID: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is separated from v10 which is including dp driver, phy driver
and dpintf driver. This series is only contained the DisplayPort driver.

This series can be tested using 5.19-rc2 kernel and I test it in MT8195
Tomato Chromebook. Modetest these modes:

for eDP:
  #0 2256x1504 60.00 2256 2304 2336 2536 1504 1507 1513 1549 235690 flags: phsync, nvsync; type: preferred, driver
  #1 2256x1504 48.00 2256 2304 2336 2536 1504 1507 1513 1549 188550 flags: phsync, nvsync; type: driver

for DP:
  #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: preferred, driver
  #1 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
  #2 1920x1080 50.00 1920 2448 2492 2640 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: driver
  #3 1680x1050 59.95 1680 1784 1960 2240 1050 1053 1059 1089 146250 flags: nhsync, pvsync; type: driver
  #4 1600x900 60.00 1600 1624 1704 1800 900 901 904 1000 108000 flags: phsync, pvsync; type: driver
  #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync, pvsync; type: driver
  #6 1280x800 59.81 1280 1352 1480 1680 800 803 809 831 83500 flags: nhsync, pvsync; type: driver
  #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
  #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #10 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
  #11 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: phsync, pvsync; type: driver
  #12 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync, nvsync; type: driver
  #13 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags: nhsync, nvsync; type: driver
  #14 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags: nhsync, nvsync; type: driver
  #15 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags: nhsync, nvsync; type: driver
  #16 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync, nvsync; type: driver

Changes from v14 for dp driver:
dt-binding:
  - Add more description for difference of edp and dp.
  - Add description that why we don't need clock property.
common part:
  - Fix reviewers' comments.
dp drivers:
  - Expand drivers to one function of irq handle.
  - Fix reviewers' comments.
  - Remove some redundant check.
  - Remove limitation of 60fps.
  - Add one patch for adding retry.
  - Add unregister flow of audio platform.

Changes from v13 for dp driver:
dt-binding:
  - Move data-lanes to port.
dp drivers:
  - Reporting for data-lanes using port.
  - Remove unnecessary drivers.
  - Refine mtk_dp_aux_transfer().
  - Refine mtk_dp_hpd_isr_handler().
  - Remove fec related drivers.

Changes from v12 for dp driver:
dt-binding:
  - Fix build error.
embedded dp drivers:
  - Revise Kconfig to let this driver independent.
  - Drop some unused/redundant drivers.
  - Move some features to patches of external dp and audio.
  - Refine format error control flow.
  - Add error control of write register functions.
  - Use mtk sip common definitions.

Changes from v11 for dp driver:
dt-binding:
  - Use data-lanes to determine the max supported lane numbers.
  - Add mhz to max-linkrate to show the units.
embedded dp drivers:
  - Modify Makefile.
  - Drop some unused/redundant drivers.
  - Move some features to patches of external dp and audio.
  - Modify break condition of training loop to control cr/eq fail.
  - Replace some function/definition with ones of common drm drivers.
  - Remove dp_lock mutex because it's only locked in power_on/off.
  - Add drm_dp_aux_(un)register in mtk_dp_bridge_(de)attach.

Changes from v10 for dp driver:
- Drop return value for write registers to make code more clear.
- Refine training state.
- Add property for dt-binding.
- Add new bug fix patches for audio and suspend.
- Rebase to v5.19-rc1.

Changes from v9:
- The DP-Phy is back to being a child device of the DP driver (as in v8)
- hot plug detection has been added back to Embedded Display Port... as
  after discussing with mediatek experts, this is needed eventhough the
  Embedded Display port is not un-pluggable
- rebased on linux-next
- simplified/split train_handler function, as suggested by Rex
- added comments on the sleep/delays present in the code
- removed previous patch introducing retries when receiving AUX_DEFER as
  this is already handled in the dp_aux framework
- added max-lane and max-linkrate device tree u8 properties instead of
  hardcoded #defines

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
v5  - https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
v6  - https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
v7  - https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
v8  - https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/
v9  - https://lore.kernel.org/all/20220327223927.20848-1-granquet@baylibre.com/
v10 - https://lore.kernel.org/all/20220523104758.29531-1-granquet@baylibre.com/
v11 - https://lore.kernel.org/r/20220610105522.13449-1-rex-bc.chen@mediatek.com
v12 - https://lore.kernel.org/all/20220627080341.5087-1-rex-bc.chen@mediatek.com/
v13 - https://lore.kernel.org/all/20220701062808.18596-1-rex-bc.chen@mediatek.com/
v14 - https://lore.kernel.org/all/20220712111223.13080-1-rex-bc.chen@mediatek.com/

Bo-Chen Chen (3):
  drm/mediatek: Add retry to prevent misjudgment for sink devices
  drm/mediatek: set monitor to DP_SET_POWER_D3 to avoid garbage
  drm/mediatek: Use cached audio config when changing resolution

Guillaume Ranquet (4):
  drm/edid: Convert cea_sad helper struct to kernelDoc
  drm/edid: Add cea_sad helpers for freq/length
  drm/mediatek: Add MT8195 External DisplayPort support
  drm/mediatek: DP audio support for MT8195

Jitao Shi (1):
  drm/mediatek: add hpd debounce

Markus Schneider-Pargmann (3):
  dt-bindings: mediatek,dp: Add Display Port binding
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: Add MT8195 Embedded DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |  117 +
 drivers/gpu/drm/drm_edid.c                    |   63 +
 drivers/gpu/drm/mediatek/Kconfig              |    9 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2854 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  545 ++++
 drivers/video/hdmi.c                          |   82 +-
 include/drm/display/drm_dp.h                  |    2 +
 include/drm/drm_edid.h                        |   26 +-
 include/linux/hdmi.h                          |    7 +-
 10 files changed, 3684 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

-- 
2.18.0

