Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F60AFCBCA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BB610E037;
	Tue,  8 Jul 2025 13:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cpIUSsJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0310210E037
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 13:23:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8F6943578;
 Tue,  8 Jul 2025 13:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441BEC4CEED;
 Tue,  8 Jul 2025 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751981014;
 bh=/1iFN9Ws/aEeuST/Nfzh/QqtvoeQni33+rb0JMvW6b0=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=cpIUSsJc926Rqyxocwd9lOms7TgwgZMOkrmp/AILO1nw8CLCpJJIOzZAEcvb8c1EI
 M/nzsm19kBajLlzM5aVK/JXJAXG0VBkVn751qqlmpvKoZ3XK1UwNlfXnMzMrAc094D
 NGBJL7zSwmQ9qrdoY0up1H/91xVmLzh1RAVE3Hc+KcefD++h2XWUj644Eav37D+zim
 PH1PaGJvikusjpB8YbKAZ/M6MgKN/FmsSMLuzfUkNz7de8y0k5VPb81MPexZSLEq3s
 Sa/UDPHar4p2YF2xV3f5yQmETgc2LWzQMiw7l4QaQb/TJn0Ert14Ba0AhlublyFTaF
 ugsCqQ5LZvkLw==
Date: Tue, 08 Jul 2025 08:23:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, andy.yan@rock-chips.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andyshrk@163.com, hjc@rock-chips.com, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 tzimmermann@suse.de, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 neil.armstrong@linaro.org, krzk+dt@kernel.org, 
 nicolas.frattaroli@collabora.com
To: Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
Message-Id: <175198090646.436895.4175521744544423549.robh@kernel.org>
Subject: Re: [PATCH 00/13] Support DSI output on rk3576 and roc-rk3576-pc board
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


On Mon, 07 Jul 2025 18:48:53 +0200, Heiko Stuebner wrote:
> This enables all the necesary bits and bindings to get display output
> on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.
> 
> A bit of cleanup of the ili9881c, because the driver was still trying
> to send dcs commands when the underlying DSI driver might have already
> switched to video-mode, which caused me quite a bit of headache until
> I realized this being the culprit for my garbled display output :-) .
> 
> Only the last patch has a dependency on Nicolas' pwm series [0]
> everything else, is directly usable.
> 
> 
> [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com/
> 
> Guochun Huang (1):
>   drm/rockchip: dsi2: add support rk3576
> 
> Heiko Stuebner (12):
>   drm/panel: ilitek-ili9881c: turn off power-supply when init fails
>   drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to
>     (un-)prepare
>   drm/panel: ilitek-ili9881c: convert (un-)prepare to
>     mipi_dsi_multi_context
>   dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar
>     Electronic
>   dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
>   drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
>   dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
>   dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2
>     controller schema
>   arm64: dts: rockchip: add mipi-dcphy to rk3576
>   arm64: dts: rockchip: add the dsi controller to rk3576
>   arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
>   arm64: dts: rockchip: add dm-m10r800-v3s overlay for roc-rk3576-pc
> 
>  .../display/panel/ilitek,ili9881c.yaml        |   1 +
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |   1 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   5 +
>  .../rk3576-roc-pc-dm-m10r800-v3s.dtso         | 134 ++++++++
>  .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts |  16 +
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  50 +++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 301 ++++++++++++++----
>  .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  21 ++
>  10 files changed, 475 insertions(+), 57 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso
> 
> --
> 2.47.2
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1-17-g63289206e26f (best guess, 8/9 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250707164906.1445288-1-heiko@sntech.de:

arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[20, 492]]
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: syscon@26034000 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#





