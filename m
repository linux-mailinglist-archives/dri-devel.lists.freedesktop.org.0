Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E9B43848A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F5D6E82D;
	Sat, 23 Oct 2021 17:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04EE6E2A3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 11:14:17 +0000 (UTC)
X-UUID: 3f46e4ee1b6e4078b89e71402ecbb35e-20211023
X-UUID: 3f46e4ee1b6e4078b89e71402ecbb35e-20211023
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1529089297; Sat, 23 Oct 2021 19:14:13 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:14:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:12 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 00/13] MediaTek MT8192 APU
Date: Sat, 23 Oct 2021 19:13:56 +0800
Message-ID: <20211023111409.30463-1-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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

Add Support for MediaTek MT8192 APU.

The MediaTek AI Processing Unit (APU) is a proprietary hardware
in the SoC to support AI functions.
The patches support the MT8192 APU running on internal microprocess.
Software packages contins power control, tinysys controller and middleware.

This series is based on drivers implemented in
MT8192 apu power domain[1] and IOMMU[2] patches.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=568927
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=551641
The device tree depends on [3][4][5] which haven't yet been accepted.
[3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655
[4] https://patchwork.kernel.org/patch/12134935
[5] https://patchwork.kernel.org/patch/12140237


Flora Fu (12):
  dt-bindings: soc: mediatek: apusys: add mt8192 apu iommu bindings
  dt-bindings: soc: mediatek: apusys: Add new document for APU power
  dt-bindings: soc: mediatek: apusys: Add new document for APU tinysys
  iommu/mediatek: Add APU iommu support
  soc: mediatek: Add command for APU SMC call
  soc: mediatek: apu: Add apu core driver
  soc: mediatek: apu: Add apu power driver
  soc: mediatek: apu: Add apusys rv driver
  soc: mediatek: apu: Add middleware driver
  arm64: dts: mt8192: Add apu power nodes
  arm64: dts: mt8192: Add apu tinysys
  arm64: dts: mt8192: Add regulator for APU

Yong Wu (1):
  arm64: dts: mt8192: Add APU-IOMMU nodes

 .../bindings/iommu/mediatek,iommu.yaml        |   2 +
 .../soc/mediatek/mediatek,apu-pwr.yaml        |  88 ++
 .../soc/mediatek/mediatek,apu-rv.yaml         | 140 +++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |   5 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 107 ++
 drivers/iommu/mtk_iommu.c                     |  57 ++
 drivers/soc/mediatek/Kconfig                  |  18 +
 drivers/soc/mediatek/apusys/Makefile          |  22 +
 drivers/soc/mediatek/apusys/apu-config.h      | 100 ++
 drivers/soc/mediatek/apusys/apu-core.c        |  97 ++
 drivers/soc/mediatek/apusys/apu-core.h        |  18 +
 drivers/soc/mediatek/apusys/apu-device.h      |  39 +
 drivers/soc/mediatek/apusys/apu-ipi.c         | 486 +++++++++
 drivers/soc/mediatek/apusys/apu-mbox.c        |  83 ++
 drivers/soc/mediatek/apusys/apu-mbox.h        |  27 +
 drivers/soc/mediatek/apusys/apu-pwr-dbg.c     | 167 ++++
 drivers/soc/mediatek/apusys/apu-pwr-ipi.c     | 377 +++++++
 drivers/soc/mediatek/apusys/apu-pwr.c         | 599 +++++++++++
 drivers/soc/mediatek/apusys/apu-pwr.h         | 260 +++++
 drivers/soc/mediatek/apusys/apu-rproc.c       | 806 +++++++++++++++
 drivers/soc/mediatek/apusys/apu-sw-logger.c   | 429 ++++++++
 drivers/soc/mediatek/apusys/apu.h             | 256 +++++
 drivers/soc/mediatek/apusys/mdw-cmd.c         | 618 ++++++++++++
 drivers/soc/mediatek/apusys/mdw-drv.c         | 211 ++++
 drivers/soc/mediatek/apusys/mdw-ioctl.c       | 331 ++++++
 drivers/soc/mediatek/apusys/mdw-ioctl.h       | 256 +++++
 drivers/soc/mediatek/apusys/mdw-mem.c         | 938 ++++++++++++++++++
 drivers/soc/mediatek/apusys/mdw-mem.h         |  23 +
 drivers/soc/mediatek/apusys/mdw-rv-cmd.c      | 158 +++
 drivers/soc/mediatek/apusys/mdw-rv-dev.c      | 386 +++++++
 drivers/soc/mediatek/apusys/mdw-rv-msg.h      |  90 ++
 drivers/soc/mediatek/apusys/mdw-rv.c          | 131 +++
 drivers/soc/mediatek/apusys/mdw-rv.h          |  98 ++
 drivers/soc/mediatek/apusys/mdw-sysfs.c       | 200 ++++
 drivers/soc/mediatek/apusys/mdw.h             | 208 ++++
 drivers/soc/mediatek/apusys/mt81xx-plat.c     | 320 ++++++
 include/dt-bindings/memory/mt8192-larb-port.h |   4 +
 include/linux/soc/mediatek/mtk_sip_svc.h      |   2 +
 38 files changed, 8157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml
 create mode 100644 drivers/soc/mediatek/apusys/apu-config.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-device.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-dbg.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-rproc.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-sw-logger.c
 create mode 100644 drivers/soc/mediatek/apusys/apu.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-cmd.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-drv.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-ioctl.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-ioctl.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-mem.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-mem.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-cmd.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-dev.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-msg.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-sysfs.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw.h
 create mode 100644 drivers/soc/mediatek/apusys/mt81xx-plat.c

-- 
2.18.0

