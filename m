Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E28A237F7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 00:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B7910E9F8;
	Thu, 30 Jan 2025 23:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AZa+QhU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DCB10E9F8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 23:38:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 85632A4258D;
 Thu, 30 Jan 2025 23:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A0BC4CED2;
 Thu, 30 Jan 2025 23:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738280286;
 bh=HjJYBTW0IoZ0H/z1rvQ5WqWeGTuLb26yUom1+Nax96I=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=AZa+QhU6He2ZKIaqTsDg3KAsdcQ09dTlw80gm1uBOcOb0JS4w82cGz1mPvDmuZawG
 dbhO1Mhwu1huDDQVR6lTqSJMIAF1DX4zHKDyq2/fH0dUEysxOtxJEyhT82Elw7N0Rs
 qHoSplFspUrolqBVHylHL+K/pHFiSZ9/2gAcuDsRpNvqhjN4TRup1ro2gjMnh0UfC5
 gqDcaByhH+5Hhn6QE+RiF3+uf53hCjfqK+cY+FgvJ/zDbZYK+Y9669S1Bz8H4CSIWp
 CQGjyLbWJyRkk1satxl1oQEiaPPaKsh4K4LOWw9XjD4tAbeJZ/oYKe8xXDEjTh2qjx
 gmuqLy2DdmsUg==
Date: Thu, 30 Jan 2025 17:38:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, kernel@collabora.com, 
 Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
References: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
Message-Id: <173828013321.1872542.6559997266281744152.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add Mali GPU support for Mediatek MT8370 SoC
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


On Thu, 30 Jan 2025 13:30:58 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the ARM Mali G57 MC2 GPU (Valhall-JM,
> dual core), integrated in the Mediatek MT8370 SoC, to the panfrost driver
> and to the mt8370.dtsi include file.
> 
> I've testing this patchset on a Mediatek Genio 510 EVK board,
> with a kernel based on linux-next (tag: next-20250113) plus [1] patchset.
> 
> The panfrost driver probed with the following messages:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>   80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> [1] https://lore.kernel.org/linux-mediatek/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com/
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Changes in v2:
> - Rework "drm/panfrost: Add support for Mali on the MT8370 SoC" to avoid
>   data structure duplication, as requested by Krzysztof Kozlowski
> - Reword commit messages to use imperative mood and make new compatible
>   need more explicit
> - Link to v1: https://lore.kernel.org/r/20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com
> 
> ---
> Louis-Alexis Eyraud (3):
>       dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
>       drm/panfrost: Add support for Mali on the MT8370 SoC
>       arm64: dts: mediatek: mt8370: Enable gpu support
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi                    | 9 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c                     | 1 +
>  3 files changed, 14 insertions(+), 1 deletion(-)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d
> prerequisite-change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9:v2
> prerequisite-patch-id: af53ae39240467340ac4c9cdbc8fdd949c5457a2
> prerequisite-patch-id: ca07485956f81c1a40029b48d2b4bcf00d74fc13
> prerequisite-patch-id: c34d9870b2c61d87ad8a6facba13d8970682e679
> prerequisite-patch-id: 48784acdcdd8b886fdec9f21c9cb88abb327e2e1
> 
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com:

arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#





