Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1C7F606D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 14:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620A10E747;
	Thu, 23 Nov 2023 13:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8070F10E747
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 13:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A84E3B82C7E;
 Thu, 23 Nov 2023 13:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39466C433C8;
 Thu, 23 Nov 2023 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700746681;
 bh=Kbejb0pedrawxY+pi+DDjvZjKDSamA1YE5y/xYy428I=;
 h=From:To:Cc:Subject:Date:From;
 b=UMAztWdfrWZb+e0C/ri4ppoNy2OFRDYeBO2/klDT6OSA68JTnvdYMOGPwHiOlbKII
 jfRew+TsZO9d1yfQcIA8PzXJbCrv2wn/kqG1GrZKDmQP2QhN+Lb9VO50CqIiIrD3Lg
 eqQWxCEOkX1FrL/OTu8q+YB9Oqwd72zg7VVuGRz2Nv/05vSY343Sh/FtJJf+6Z4Q1N
 3R9Q72CXgM6+HzPcywTBMtlFPVG8PC6MyjKHwRcubfAcX4v/XoMd4K57ExZU9NkYyV
 T7cexV+whxMegO8gqovedEzEPEi0kt+P9/n7f3dcbkiEgi5yh/185+/2Mgq+3hZd+G
 J2gf0uf60LdrA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH 0/4] drm/mediatek: support DSI output on MT8195
Date: Thu, 23 Nov 2023 14:37:45 +0100
Message-Id: <20231123133749.2030661-1-mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for a DSI output on VDOSYS0. Luckily, there is a new
feature to support dynamic selections of the output (connector).
Use it to add support for a DSI output.

Apart from that, this is pretty straghtforward by just adding new
compatibles and add the correct DSI nodes to the SoC dtsi.

This was tested with a Toshiba TC358775 DSI-to-LVDS bridge and
three different panels. Please note, that the driver for this
bridge doesn't work well and needs a more or less complete rework,
which will be posted on a separate series.

Michael Walle (4):
  dt-bindings: display: mediatek: dsi: add compatible for MediaTek
    MT8195
  dt-bindings: phy: add compatible for Mediatek MT8195
  arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY nodes
  drm/mediatek: support the DSI0 output on the MT8195 VDOSYS0

 .../display/mediatek/mediatek,dsi.yaml        |  4 ++
 .../bindings/phy/mediatek,dsi-phy.yaml        |  1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 48 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  8 +++-
 4 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.39.2

