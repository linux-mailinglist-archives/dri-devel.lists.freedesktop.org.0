Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E841EA03
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 11:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD286E50C;
	Fri,  1 Oct 2021 09:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342786E50C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 09:44:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so10781863wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOCEBYgA2BFbjVbZmrsKq39teKLQmhzle1apcWlBCeg=;
 b=j7YKtKFJBDMXB/JSpf6jkk04WJ5xzl7awydIXyLynMimmu9NQ0FNfT6kN4RwB4v9Fu
 GFLy0Q1v/RM45Bc55hjtAOZ4sNA6gasXtuVKs//rGlDZPVj95UXP1jJxgOHW/omXe374
 RUHVuT03MJRdL5/ddvZxGNOq5DIHsfSqRS/5ucFwk2Ry+1+l3eAQPwtZWRe3VEf7rMk8
 lqy/0UIMkLvscqzs5NItVOnxEJaTrWPA5n6F2QsVD4PiTBTA7xpOKc0Vo1sGN5YUdgWX
 53/HrZS9gVLEJVchyqq5QlS4t5cJDbSpE1g3eYQ+gGxrmk1v3M+bChrd2aePTB8E/IpJ
 objQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wOCEBYgA2BFbjVbZmrsKq39teKLQmhzle1apcWlBCeg=;
 b=Y3nEHL7ClEsBIhtGiirHlvDp8mNCZ7m6CSMPHk08dZWLT2BK55CUQbv0uHjikrjMZV
 cb69nYiWFJ8BGH6C43UqazuqGT4vBCkXlsfxafeNFiPT3xs3OQwPtUU4AUo3w1nTpF5g
 LmerUaS7t87laCCLBiqA3b5vIgE3wjGbq5G4I0ra9+IsXRwCqAGbZZ1gOYcWy0Hmqtr2
 2t07YWuq3IkzuVjASovdKNBn6KuveDjtS8IkGT0otU7M5E2kBK1YTVYzowgWnddcSICY
 pp08F5K+jHO93jW36VcBZs+Qhvb52u5CK57SUpFeMB1rkANQS6kYrhKCCp8iFwTi39nt
 dKHQ==
X-Gm-Message-State: AOAM533CCVBQjEydTH6xX9gh1Q0nMIwT6gHSwxg2LOPTQID7Iui046Qt
 VqGhg1EUFoX936ly45Z0LuCW+6nJ52qCiA==
X-Google-Smtp-Source: ABdhPJzAcGyZKaas6qyfVwP2a6Q5GkAf1ZgvXWJu4LUm9+Wtp4Rl1afD6JnjL6M3T4eGURnPeQ2DRw==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr3449866wme.137.1633081491477; 
 Fri, 01 Oct 2021 02:44:51 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l21sm7181620wme.39.2021.10.01.02.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 02:44:51 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 0/6] drm/mediatek: Add mt8195 DisplayPort driver
Date: Fri,  1 Oct 2021 11:44:37 +0200
Message-Id: <20211001094443.2770169-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
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

Hi everyone,

this series is built around the DisplayPort driver. The dpi/dpintf driver and
the added helper functions are required for the DisplayPort driver to work.

For v3 I fixed/removed obsolete TODOs in the driver code and fixed one feedback
comment regarding a 'DRM_' prefix for the CEA_SAD defines.

The series is still based on v5.15-rc1 but also applies cleanly on linux-next
at the moment. There still is a functional dependency on many different patches
pulled in through the main two dependencies, vdosys0 and vdosys1, but I still
don't have a stable and clean base with these.

Note: This patch series is currently tested on v5.10 and I am still working on
testing it on v5.15.

Dependencies:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/

Thanks in advance for any feedback and comments.

Best,
Markus


Markus Schneider-Pargmann (6):
  dt-bindings: mediatek,dpintf: Add DP_INTF binding
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpintf.yaml     |   78 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2825 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  535 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  248 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  218 ++
 drivers/video/hdmi.c                          |   83 +-
 include/drm/drm_dp_helper.h                   |    2 +
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    2 +
 21 files changed, 4147 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.33.0

