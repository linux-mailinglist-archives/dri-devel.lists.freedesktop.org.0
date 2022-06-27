Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159655B875
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AC210FD7B;
	Mon, 27 Jun 2022 08:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44DC8937C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:03:51 +0000 (UTC)
X-UUID: f958d2cb66d24262b335d1156f5a1ee3-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:befb510a-3b97-4a0c-adf2-0ea873a0ed58, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:b14ad71, CLOUDID:82b9212e-1756-4fa3-be7f-474a6e4be921,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: f958d2cb66d24262b335d1156f5a1ee3-20220627
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 209159734; Mon, 27 Jun 2022 16:03:43 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 27 Jun 2022 16:03:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 27 Jun 2022 16:03:43 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v12 00/10] drm/mediatek: Add MT8195 DisplayPort driver
Date: Mon, 27 Jun 2022 16:03:31 +0800
Message-ID: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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

Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/all/20220526102126.19756-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/all/20220622130824.29143-1-nancy.lin@mediatek.com/
  https://lore.kernel.org/all/20220620091930.27797-1-nancy.lin@mediatek.com/

Bo-Chen Chen (2):
  drm/mediatek: set monitor to DP_SET_POWER_D3 to avoid garbage
  drm/mediatek: fix no audio when resolution change

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

 .../display/mediatek/mediatek,dp.yaml         |  108 +
 drivers/gpu/drm/drm_edid.c                    |   73 +
 drivers/gpu/drm/mediatek/Kconfig              |   10 +
 drivers/gpu/drm/mediatek/Makefile             |    1 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3042 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  545 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    3 +
 drivers/video/hdmi.c                          |   82 +-
 include/drm/display/drm_dp.h                  |    2 +
 include/drm/drm_edid.h                        |   26 +-
 include/linux/hdmi.h                          |    7 +-
 12 files changed, 3879 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

-- 
2.18.0

