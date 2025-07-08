Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DCAFCBE0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3E10E0D4;
	Tue,  8 Jul 2025 13:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="FbvK9d2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9AF10E0D4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=e4FqGDUimOCscH/wLtPWPgK8iymMseRgYDBBFn49m3I=; b=FbvK9d2cYqRTA6f+OB/PfGUYz0
 hbNtRpmG82rIexs05ZhcQXbLTIbYBSjCqpCsqdXEhIlb5zaEGTRNuZBR7XMtiirgn7jigWMSfc20R
 LrachD5VSFe0fsC+dYmSd5vspRuiQff0xlTf7efBSxZbbbWPVVQnv/OKFzv7zDu2kjabjI66nTh5s
 D5QhdhPGFvIOzmwJr5Ati1dMJR044Af5Ecj3dsxHITFoIbyyW09fMHuK1QPFxV9exOwFAH+olh/BQ
 YPgz6gm3caJXSmSqe85T5FPMvfsdUXQoWefEdsqXeeofbwM06BDh85MuOTSBUcxVM6g4Ym3e2DnxO
 l7Azzg8w==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZ8KH-00046A-4E; Tue, 08 Jul 2025 15:25:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andyshrk@163.com, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 tzimmermann@suse.de, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 neil.armstrong@linaro.org, krzk+dt@kernel.org,
 nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 00/13] Support DSI output on rk3576 and roc-rk3576-pc board
Date: Tue, 08 Jul 2025 15:25:36 +0200
Message-ID: <4979799.uZKlY2gecq@diego>
In-Reply-To: <175198090646.436895.4175521744544423549.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <175198090646.436895.4175521744544423549.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Dienstag, 8. Juli 2025, 15:23:32 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Rob Herring (Arm):
>=20
> On Mon, 07 Jul 2025 18:48:53 +0200, Heiko Stuebner wrote:
> > This enables all the necesary bits and bindings to get display output
> > on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.
> >=20
> > A bit of cleanup of the ili9881c, because the driver was still trying
> > to send dcs commands when the underlying DSI driver might have already
> > switched to video-mode, which caused me quite a bit of headache until
> > I realized this being the culprit for my garbled display output :-) .
> >=20
> > Only the last patch has a dependency on Nicolas' pwm series [0]
> > everything else, is directly usable.
> >=20
> >=20
> > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@=
collabora.com/
> >=20
> > Guochun Huang (1):
> >   drm/rockchip: dsi2: add support rk3576
> >=20
> > Heiko Stuebner (12):
> >   drm/panel: ilitek-ili9881c: turn off power-supply when init fails
> >   drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to
> >     (un-)prepare
> >   drm/panel: ilitek-ili9881c: convert (un-)prepare to
> >     mipi_dsi_multi_context
> >   dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar
> >     Electronic
> >   dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
> >   drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
> >   dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
> >   dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2
> >     controller schema
> >   arm64: dts: rockchip: add mipi-dcphy to rk3576
> >   arm64: dts: rockchip: add the dsi controller to rk3576
> >   arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
> >   arm64: dts: rockchip: add dm-m10r800-v3s overlay for roc-rk3576-pc
> >=20
> >  .../display/panel/ilitek,ili9881c.yaml        |   1 +
> >  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   |   1 +
> >  .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   5 +
> >  .../rk3576-roc-pc-dm-m10r800-v3s.dtso         | 134 ++++++++
> >  .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts |  16 +
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  50 +++
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 301 ++++++++++++++----
> >  .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |  21 ++
> >  10 files changed, 475 insertions(+), 57 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r8=
00-v3s.dtso
> >=20
> > --
> > 2.47.2
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/v6.16-rc1-17-g63289206e26f (best guess, 8/9 blobs matched)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250707164906.1445288-1-heiko@sntech.de:
>=20
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximu=
m of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximu=
m of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the =
maximum of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-=
pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum=
 of 13
> 	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.=
yaml#
> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: syscon@26034000 (rockchip=
,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
> 	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: syscon@26034000 (ro=
ckchip,rk3576-dcphy-grf): clocks: False schema does not allow [[20, 492]]
> 	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: syscon@26034000 (rockch=
ip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
> 	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: syscon@26034000 (rockchi=
p,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 492]]
> 	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#

that stems from the depdency on the pwm-series of only the last patch in
this series - see cover-letter above.


Heiko


