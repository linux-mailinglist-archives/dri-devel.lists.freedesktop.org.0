Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BB6DF338
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DA010E784;
	Wed, 12 Apr 2023 11:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D6210E0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:27:47 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E9F0166031FD;
 Wed, 12 Apr 2023 12:27:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298865;
 bh=32UdFXijYBib4vR9joUGUAiEkWAou0hF5vRoluMMzmk=;
 h=From:To:Cc:Subject:Date:From;
 b=BiBaGeFnyTrcIxvJX6jmx3uPgTyhmYXutJUmtZYAcc439FhGgMtJWa0u9UEl5UIda
 GDZIZCJF1kGnqsFs21NB3AwPeD216mgM8jcj28XYHnggRV2M/t4GEnZLSzczsMnoZx
 QnxEalzaxf1jPZsAnbf+4WuTj5hpQBYgWqqR261FIlruszRUWgOgcT2oe80m/INuM6
 7p9hjVjRvZiEGXq/4Odxo0hA0mWvxreaoKJe4Hz8HJ/MUOPntGD1+87uq/l/IbcO7c
 RItxu5syCydks3mijaUHvoh2SHNIoAyIvigQqLKZyejdfy2vwokLhMXHeyOyJkqHqp
 ui0QOYiDsGRZg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 00/27] MediaTek Helio X10 - Mailbox, Display, MMC/SD/SDIO
Date: Wed, 12 Apr 2023 13:27:12 +0200
Message-Id: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In this series I'm adding support for the DDC (display) block found
in the MediaTek Helio X10, the MT6331 PMIC and its peripherals, and
eMMC, MicroSD slot and SDIO.
Support for the PMIC (...regulators!) is essential to get all of the
mtk-sd hardware to work, especially the eMMC where vol switching is
happening (3.3 -> 1.8V for DDR -> UHS timing switch!).

As for the GCE mailbox, MMSYS and IOMMU... these were included in
the previous series but couldn't make it due to the bindings not
being reviewed in time (btw, thanks Matthias for reducing my backlog
by partially picking the applicable commits in the previous one, that
was highly appreciated!), so they're making yet another appearance in
this series.

Regarding the display blocks, they're tested on the Sony Xperia M5
with its internal panel (on DSI0) but the panel node is not included
in this series because I have to cleanup the timings a bit before
upstreaming it.

...and regarding everything else, it's all, again, tested on that
same Xperia M5 smartphone :-)


* Important note: *

Devicetree commits of this series all depend on the dt-bindings
commits of this same series.
This series also depends on [1] for PMIC functionality, as all of the
(older only?) MediaTek smartphone platforms have two PMICs, a main
one and a companion one - in this specific case, it's MT6331+MT6332.

[1]: https://lore.kernel.org/all/20230324094205.33266-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (27):
  dt-bindings: pwm: Add compatible for MediaTek MT6795
  dt-bindings: phy: mediatek,dsi-phy: Add compatible for MT6795 Helio
    X10
  dt-bindings: display: mediatek: dpi: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: aal: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: ovl: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: rdma: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: wdma: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: color: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: gamma: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: merge: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: split: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: ufoe: Add compatible for MediaTek
    MT6795
  dt-bindings: display: mediatek: od: Add compatible for MediaTek MT6795
  dt-bindings: mailbox: mediatek,gce-mailbox: Add support for MT6795
  arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
  arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
  arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
  arm64: dts: mediatek: mt6795: Add support for display blocks and
    DPI/DSI
  arm64: dts: mediatek: mt6795: Add tertiary PWM node
  arm64: dts: mediatek: mt6795: Add PMIC Wrapper node
  arm64: dts: mediatek: mt6795: Copyright header additions
  arm64: dts: mediatek: Add MT6331 PMIC devicetree
  arm64: dts: mediatek: mt6795-xperia-m5: Add MT6331 Combo PMIC
  arm64: dts: mediatek: mt6795-xperia-m5: Add eMMC, MicroSD slot, SDIO
  arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
  arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,color.yaml      |   1 +
 .../display/mediatek/mediatek,dpi.yaml        |  23 +-
 .../display/mediatek/mediatek,dsi.yaml        |  19 +-
 .../display/mediatek/mediatek,gamma.yaml      |   4 +
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 .../display/mediatek/mediatek,od.yaml         |   3 +
 .../display/mediatek/mediatek,ovl.yaml        |   4 +
 .../display/mediatek/mediatek,rdma.yaml       |   4 +
 .../display/mediatek/mediatek,split.yaml      |   3 +
 .../display/mediatek/mediatek,ufoe.yaml       |   3 +
 .../display/mediatek/mediatek,wdma.yaml       |   3 +
 .../mailbox/mediatek,gce-mailbox.yaml         |  20 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   4 +
 .../bindings/pwm/mediatek,pwm-disp.yaml       |   4 +-
 arch/arm64/boot/dts/mediatek/mt6331.dtsi      | 284 ++++++++++++++
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 121 ++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 365 ++++++++++++++++++
 include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 ++++++
 19 files changed, 968 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6331.dtsi
 create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h

-- 
2.40.0

