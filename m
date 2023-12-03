Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD61802596
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 17:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4B810E29A;
	Sun,  3 Dec 2023 16:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D710E29A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 16:43:05 +0000 (UTC)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r9pYU-0004oL-79; Sun, 03 Dec 2023 17:42:54 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v2 2/5] ARM: dts: rockchip: Add power-controller for RK3128
Date: Sun, 03 Dec 2023 17:42:52 +0100
Message-ID: <9588573.jRhZ6ZUK3Y@diego>
In-Reply-To: <4dec2316-f840-44ab-a07a-3d7f0e5e6d8f@gmail.com>
References: <20231202125144.66052-1-knaerzche@gmail.com>
 <4891026.6YUMPnJmAY@diego>
 <4dec2316-f840-44ab-a07a-3d7f0e5e6d8f@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

Am Sonntag, 3. Dezember 2023, 17:05:47 CET schrieb Alex Bee:
> Am 02.12.23 um 18:46 schrieb Heiko St=FCbner:
> > Am Samstag, 2. Dezember 2023, 17:36:15 CET schrieb Alex Bee:
> >> Am 02.12.23 um 16:51 schrieb Heiko St=FCbner:
> >>> Am Samstag, 2. Dezember 2023, 13:51:41 CET schrieb Alex Bee:
> >>>> Add power controller and qos nodes for RK3128 in order to use
> >>>> them as powerdomains.
> >>> does the power-domain controller work with the incomplete set of
> >>> pm-domains too?
> >> Yes, it does - the missing domains can request idle only and can't be
> >> powered on/off - if no one requests idle they are just up all the time.
> >>
> >>> What I have in mind is
> >>> - adding the power-controller node with the existing set of power-dom=
ains
> >>> - the gpu pm-domain is in there
> >>> - adding the gpu parts
> >> My main concern about adding them later was the change of the ABI after
> >> they've been exposed in the SoC DT. If that's not an issue - sure: I c=
an
> >> add them in a separate series.
> > An ABI change would be _changing_ the domain-ids in the rk3128-power.h
> > I think :-) .
> Well, an addition is still a change.
> > Right now the existing domain ids in the header are already exposed to =
the
> > world, so someone could already use them, but not the new ones.
>=20
> I'm fully aware that nothing would ever hard fail anywhere if the new=20
> domain ids get added later.
>=20
> Nevertheless we start using here an ABI which is known to be incomplete.=
=20
> For no reason, as the patches (which I am now asked to remove from this=20
> series) for completion are already there (here).
>=20
> Anyway, if you prefer it this way: I'm pleased to do so.

I was more thinking of accelerating the gpu-part of the series, as that
really is just waiting for the power-domain node that already has driver
support and domain-ids present.

It looks like you're feeling more strongly about that though, so I'll
definitly not pressure you ;-) .

But I guess the split into IDs and driver change should still be
done, especially as the dt-binding-header likely will want an Ack
from the DT maintainers.

And the power-domain change will go through the new pmdomain
subsystem.


Heiko


> >>> And a second series with
> >>> - patch1 from here
> >>> - a dts patch adding the additional pm-domains to rk3128.dtsi
> >>> - I guess patch1 also should be split into a patch adding the binding=
=2Dids
> >>>     and a separate patch for the code addition.
> >> Yeah, I noticed this also :)
> >>
> >> Regards,
> >>
> >> Alex
> >>
> >>>
> >>> Heiko
> >>>
> >>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> >>>> ---
> >>>>    arch/arm/boot/dts/rockchip/rk3128.dtsi | 101 ++++++++++++++++++++=
+++++
> >>>>    1 file changed, 101 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/=
dts/rockchip/rk3128.dtsi
> >>>> index 4e8b38604ecd..b72905db04f7 100644
> >>>> --- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
> >>>> +++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
> >>>> @@ -8,6 +8,7 @@
> >>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>    #include <dt-bindings/interrupt-controller/irq.h>
> >>>>    #include <dt-bindings/pinctrl/rockchip.h>
> >>>> +#include <dt-bindings/power/rk3128-power.h>
> >>>>   =20
> >>>>    / {
> >>>>    	compatible =3D "rockchip,rk3128";
> >>>> @@ -133,6 +134,106 @@ smp-sram@0 {
> >>>>    	pmu: syscon@100a0000 {
> >>>>    		compatible =3D "rockchip,rk3128-pmu", "syscon", "simple-mfd";
> >>>>    		reg =3D <0x100a0000 0x1000>;
> >>>> +
> >>>> +		power: power-controller {
> >>>> +			compatible =3D "rockchip,rk3128-power-controller";
> >>>> +			#power-domain-cells =3D <1>;
> >>>> +			#address-cells =3D <1>;
> >>>> +			#size-cells =3D <0>;
> >>>> +
> >>>> +			power-domain@RK3128_PD_VIO {
> >>>> +				reg =3D <RK3128_PD_VIO>;
> >>>> +				clocks =3D <&cru ACLK_CIF>,
> >>>> +					 <&cru HCLK_CIF>,
> >>>> +					 <&cru DCLK_EBC>,
> >>>> +					 <&cru HCLK_EBC>,
> >>>> +					 <&cru ACLK_IEP>,
> >>>> +					 <&cru HCLK_IEP>,
> >>>> +					 <&cru ACLK_LCDC0>,
> >>>> +					 <&cru HCLK_LCDC0>,
> >>>> +					 <&cru PCLK_MIPI>,
> >>>> +					 <&cru ACLK_RGA>,
> >>>> +					 <&cru HCLK_RGA>,
> >>>> +					 <&cru ACLK_VIO0>,
> >>>> +					 <&cru ACLK_VIO1>,
> >>>> +					 <&cru HCLK_VIO>,
> >>>> +					 <&cru HCLK_VIO_H2P>,
> >>>> +					 <&cru DCLK_VOP>,
> >>>> +					 <&cru SCLK_VOP>;
> >>>> +				pm_qos =3D <&qos_ebc>,
> >>>> +					 <&qos_iep>,
> >>>> +					 <&qos_lcdc>,
> >>>> +					 <&qos_rga>,
> >>>> +					 <&qos_vip>;
> >>>> +				#power-domain-cells =3D <0>;
> >>>> +			};
> >>>> +
> >>>> +			power-domain@RK3128_PD_VIDEO {
> >>>> +				reg =3D <RK3128_PD_VIDEO>;
> >>>> +				clocks =3D <&cru ACLK_VDPU>,
> >>>> +					 <&cru HCLK_VDPU>,
> >>>> +					 <&cru ACLK_VEPU>,
> >>>> +					 <&cru HCLK_VEPU>,
> >>>> +					 <&cru SCLK_HEVC_CORE>;
> >>>> +				pm_qos =3D <&qos_vpu>;
> >>>> +				#power-domain-cells =3D <0>;
> >>>> +			};
> >>>> +
> >>>> +			power-domain@RK3128_PD_GPU {
> >>>> +				reg =3D <RK3128_PD_GPU>;
> >>>> +				clocks =3D <&cru ACLK_GPU>;
> >>>> +				pm_qos =3D <&qos_gpu>;
> >>>> +				#power-domain-cells =3D <0>;
> >>>> +			};
> >>>> +
> >>>> +			power-domain@RK3128_PD_CRYPTO {
> >>>> +				reg =3D <RK3128_PD_CRYPTO>;
> >>>> +				clocks =3D <&cru HCLK_CRYPTO>,
> >>>> +					 <&cru SCLK_CRYPTO>;
> >>>> +				pm_qos =3D <&qos_crypto>;
> >>>> +				#power-domain-cells =3D <0>;
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> +
> >>>> +	qos_crypto: qos@10128080 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x10128080 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_gpu: qos@1012d000 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012d000 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_vpu: qos@1012e000 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012e000 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_rga: qos@1012f000 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012f000 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_ebc: qos@1012f080 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012f080 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_iep: qos@1012f100 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012f100 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_lcdc: qos@1012f180 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012f180 0x20>;
> >>>> +	};
> >>>> +
> >>>> +	qos_vip: qos@1012f200 {
> >>>> +		compatible =3D "rockchip,rk3128-qos", "syscon";
> >>>> +		reg =3D <0x1012f200 0x20>;
> >>>>    	};
> >>>>   =20
> >>>>    	gic: interrupt-controller@10139000 {
> >>>>
> >>>
> >>>
> >
> >
> >
>=20




