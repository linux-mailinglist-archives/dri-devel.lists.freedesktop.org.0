Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402AC530E5E
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9988A10E584;
	Mon, 23 May 2022 10:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F5610E5C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:50:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f2so20788273wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QY0NXpXxssyXYxW2Q3exiUP/wgu4S8DoemCxMIQfBTE=;
 b=5Yi5yOPTuzEy+RvEjRNlahryNYfO2WYTFkKUlksAlpvowXpuODxy/xc56sWtr/0hvS
 Po5ahQ2I4pOuMsQM2VCv5eD8eql//fD0PmLYvHIX1ve7MK2mkHMOvEg0UqJMcML5MvfN
 8eVXFZRQRMXRqqnQEppkvQcV4d0E19p4oGL8ejRXA0d61aXYLta76nRAMTMSmgvVMTpY
 E8WgS3SnIpaEfmJJ9F0WEiQpY9p06AHmZ/0RIn0JxgNj4BpRO14v4hZA7afKXcEQqIWn
 JL0ArR+Umw6fkDiv/K5aaYoPt4jWue6AEM60Pe0p7/fs4c4W2Et79phGhSgC4FxG+rxO
 C3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QY0NXpXxssyXYxW2Q3exiUP/wgu4S8DoemCxMIQfBTE=;
 b=DUxZMyYmVmPwEeE+BaMk1nNQMknE9NwH4XSFQgngj0YSkNQxRla/tclAR5c7LIIbNu
 fQx3DOcdIm5HrBsjcWKsQwafmnM+Nwgt2bVe/gT+DAVcFNeejEac+7lo2iv1ikPPUZUP
 LsAEFpUtgJJCnXvEnbNuDiU9j5vL1bLKFb0LGsoWqSe/g8EJwmss+2ijiXw5flBjQvY2
 L3ULibZB+VnTtwv0sZhcPBuFaxmQ9nmt2X5UU5WEbTFK4lBoi9u1J8ICTMyVWytc+oGH
 hMrOSxughsE9etJOsZlLoWJw5nXXll6e/vJSgwWYvRS5Z8cXDVhGaPBniB//ud3YTOwi
 Tb7g==
X-Gm-Message-State: AOAM530shIIHDJt3xtnrqUuoYpHCcpzfcyaDXfpqNQbDrzlCYWXED+dK
 foeoinbME5+q9jiOzYCiYrRcDw==
X-Google-Smtp-Source: ABdhPJzP/rJVFU2ynMlYTbXcRO1djmEXdQvtCzYih6wtEb6rjUH0mAOryfUtrfJaXAEevgV8DIPr9A==
X-Received: by 2002:adf:f1cc:0:b0:20d:b04:1281 with SMTP id
 z12-20020adff1cc000000b0020d0b041281mr18026498wro.160.1653303006054; 
 Mon, 23 May 2022 03:50:06 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:05 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v10 00/21] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 23 May 2022 12:47:33 +0200
Message-Id: <20220523104758.29531-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

this series is built around the DisplayPort driver. The dpi/dpintf
driver and the added helper functions are required for the DisplayPort
driver to work.

This v10 still has some un-answered comments and TODOs for v11.

This has been tested sucessfully on a 5.18-next based "vendor branch".

There's a missing dependency in the mediatek clock framework to allow a
mux clock to change it's parent automatically on rate change.
Without this change, the dpi driver won't properly set the clocks on
mode change and thus nothing will be displayed on screen.

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

Things that are in my todolist for v11:
- retrieve CK/DE support from panel driver instead of hardcoding it into
  the dpi driver
- refcount the dp driver "enabled" status for "future proofing"
- review the drm_dp_helpers for features/functions that have been
  re-implemented in the mediatek dp drivers

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

Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20220419094143.9561-2-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20220512053128.31415-1-nancy.lin@mediatek.com/


Guillaume Ranquet (15):
  drm/edid: Convert cea_sad helper struct to kernelDoc
  drm/edid: Add cea_sad helpers for freq/length
  drm/mediatek: dpi: move dpi limits to SoC config
  drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
  drm/mediatek: dpi: implement a swap_input toggle in SoC config
  drm/mediatek: dpi: move dimension mask to SoC config
  drm/mediatek: dpi: move hvsize_mask to SoC config
  drm/mediatek: dpi: move swap_shift to SoC config
  drm/mediatek: dpi: move the yuv422_en_bit to SoC config
  drm/mediatek: dpi: move the csc_enable bit to SoC config
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: dpi: Only enable dpi after the bridge is enabled
  drm/meditek: dpi: Add matrix_sel helper
  drm/mediatek: Add mt8195 External DisplayPort support
  drm/mediatek: DP audio support for mt8195

Jitao Shi (1):
  drm/mediatek: add hpd debounce

Markus Schneider-Pargmann (5):
  dt-bindings: mediatek,dpi: Add DPINTF compatible
  dt-bindings: mediatek,dp: Add Display Port binding
  video/hdmi: Add audio_infoframe packing for DP
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 Embedded DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   99 +
 .../display/mediatek/mediatek,dpi.yaml        |   13 +-
 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    8 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3419 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  570 +++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  272 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    3 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  200 +
 drivers/video/hdmi.c                          |   82 +-
 include/drm/dp/drm_dp_helper.h                |    2 +
 include/drm/drm_edid.h                        |   26 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    4 +-
 22 files changed, 4765 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.35.1

