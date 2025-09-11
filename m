Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28851B53709
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180F610E39C;
	Thu, 11 Sep 2025 15:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Tp0xnrD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4795010E39C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:12:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757603532; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B9IGFw7LplNPOkZEq5rg//uOHf2EjeiJHVJse7seMUTzZIMxYd1TVrOZN0zUbq5Xq33L+9q9+TqFilkErBnjfaa/NpughWfaUjECxVa+0PaEb+YDKAdGNrY++tuNVVIv/wj8tJU+KqRR3v9zzmvdP6gOS405s9ICJ1bawZoNf0E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757603532;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4E1gkCV3bUB24+jEbYd5O83SC/ksIpy9YseSb1Bd3iA=; 
 b=OYspCStGN7dInL2eQAJ59H16VwPLP5z4wWe5Nr6htKYI4pPJuPUYGIV4faEbAdxSfzVEwkFgj+ZF3SmcHreJc8qUT/uzUAHUdyXtnkWOokhqUalCV4rW9dIvNsZfNzhRjZLbbMNHmz9gEQaCCxIvVLYhrFc0Y2lAOG7iIOnvWyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603532; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4E1gkCV3bUB24+jEbYd5O83SC/ksIpy9YseSb1Bd3iA=;
 b=Tp0xnrD2zRi58CffU5G3TaTiLbJcAER4BZDZ/9WPboVLvTu6uzg9VYi/ZTt2X5qw
 PMD8pJ8vo2CnYFCkcKqSC4Ganw2/UNoxh4q3T1CUWsieDlvzRf8LKJqusv5Qlx+IBze
 ExFMJOuw5cTRX/uVEXriSe7jqmq8yEDKe+84VPaw=
Received: by mx.zohomail.com with SMTPS id 1757603530466436.8737694403886;
 Thu, 11 Sep 2025 08:12:10 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com,
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 00/12] MediaTek dt-bindings sanitization (MT8173)
Date: Thu, 11 Sep 2025 12:09:49 -0300
Message-ID: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This patch series continues the effort to address Device Tree validation
warnings for MediaTek platforms, with a focus on MT8173. It follows the
initial cleanup series by Angelo [0].

Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
eliminates several of the remaining warnings by improving or converting DT
bindings to YAML, adding missing properties, and updating device tree files
accordingly.

[0] https://www.spinics.net/lists/kernel/msg5780177.html

Changes in v2:
* Wrapped commit messages to 75 columns line wrap.
* Replaced "YAML" by "DT schema" in patches subject and content.
* mt8173-mdp: Fixed properties: compatible, clocks, iommus and
  mediatek,vpu.
* mt8173-vpu: Fixed line wrap. Dropped memory-region property description.
* mediatek,mmsys: Dropped patch as it's not a binding issue.
* mediatek,od: Rewrote commit log with details on DT schema users missing
  the related property. Rewrote mediatek,gce-client-reg property.
* mediatek,ufoe: Rewrote commit log with details on DT schema users missing
  the related property. Rewrote mediatek,gce-client-reg property.
* marvell,sd8897-bt: Moved to net/bluetooth/. Added missing ref to
  bluetooth-controller.yaml. Dropped example. Updated reference in another
  file. Minor fixes in properties.
* mediatek,mt8173-rt5650: Dropped unnecessary quotes and unused label.
* dlg,da9211: Dropped enable-gpios description. Rewrote generic example
  node names. Minor fixes in properties.
* melfas,mip4_ts: Dropped unnecessary quotes. Added "active high" to
  ce-gpios property description.
* mediatek,jpeg: Dropped patch as it doesn't apply.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Ariel D'Alessandro (12):
  dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
  dt-bindings: media: Convert MediaTek mt8173-vpu bindings to DT schema
  dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
  dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT
    schema
  dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
    property
  dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
    property
  arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
  dt-bindings: pinctrl: mt65xx: Allow gpio-line-names
  dt-bindings: regulator: Convert Dialog DA9211 Regulators to DT schema
  arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
  dt-bindings: soc: mediatek: pwrap: Add power-domains property
  dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema

 .../display/mediatek/mediatek,od.yaml         |  14 ++
 .../display/mediatek/mediatek,ufoe.yaml       |  15 ++
 .../input/touchscreen/melfas,mip4_ts.yaml     |  56 +++++
 .../input/touchscreen/melfas_mip4.txt         |  20 --
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 +++++++++++++++
 .../bindings/media/mediatek,mt8173-vpu.yaml   |  74 +++++++
 .../bindings/media/mediatek-mdp.txt           |  95 --------
 .../bindings/media/mediatek-vpu.txt           |  31 ---
 .../net/bluetooth/marvell,sd8897-bt.yaml      |  79 +++++++
 .../devicetree/bindings/net/btusb.txt         |   2 +-
 .../bindings/net/marvell-bt-8xxx.txt          |  83 -------
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 +
 .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
 .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  15 ++
 .../sound/mediatek,mt8173-rt5650.yaml         |  73 +++++++
 .../bindings/sound/mt8173-rt5650.txt          |  31 ---
 .../dts/rockchip/rk3288-veyron-fievel.dts     |   2 +-
 .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |   2 +-
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  33 ++-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  14 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  14 +-
 23 files changed, 633 insertions(+), 502 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

-- 
2.50.1

