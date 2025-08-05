Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF30B1AF30
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED96B10E251;
	Tue,  5 Aug 2025 07:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="HAJR91iB";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="glCnyA+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1E110E251
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1754377833; x=1785913833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EeUMDc2WntfI8A+x14TyU5FunBo17nAG01EM1yXferM=;
 b=HAJR91iBbT63tIwUg1IEeINpaQt3TLkEv41wn6oNryp8rEOwrN1t2xEi
 xDg1je1JPD18RbZjF3h0VimXtyo5eqxembw7/oNX4GTpPyGLoEgutd8xc
 XbTakK8VsaDqdvehM8qZJ5mv0I83uiguYs8d5T4HoiiujK1OpNcAWZPTZ
 USoiIeKH0/Qujl089g+ylzHRfs0/bWxIWU8SnNs5AdspGQFldRfMPriPV
 Ru2G8ILbZbuqJGLchX/k0dmwoQ01wD4wwMR6Dnw9jlQB147jcb82jH/U2
 3gksY5T7Jc511gVOWDMgKb+2Y6Squ4VhKJb6D2kVW3UbbZM3cgrQlp4l1 Q==;
X-CSE-ConnectionGUID: 8OggMXCVRb67Yq9VaFkfPg==
X-CSE-MsgGUID: 8IVFNqAAS7ej/ExTuYvMvg==
X-IronPort-AV: E=Sophos;i="6.17,265,1747692000"; d="scan'208";a="45583489"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 05 Aug 2025 09:10:30 +0200
X-CheckPoint: {6891AE67-1-D4215818-E44699D1}
X-MAIL-CPID: 2D3DFB7860E93CFACCD9674F0CED3F89_0
X-Control-Analysis: str=0001.0A00210F.6891ADD9.008C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BCE91726E2; Tue,  5 Aug 2025 09:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1754377826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeUMDc2WntfI8A+x14TyU5FunBo17nAG01EM1yXferM=;
 b=glCnyA+fmdYQNcL4hjR8TMji7ODikkmnhi0R1O5XQKeNugloKyyvHZQ83XwJsYjuB6+8Ae
 1udmhwtm9IlRZMmkW5O1u4TvP2X52nDpukEcApOm7q1jggNxlhFiQhYMnuxkCUJjAVr7Vn
 tfIQBcOQ7fdpjlqABQzQMMWOql2v0VjnXLsJ2ofukHDzU+/Pw5YpmRrN/NdoFKg1UVpgJB
 yKrDxvf9s14PS8vHOXhKatmVvMjbNox2QiHoGEdtuIblD/2y4CEOtq7+KQPObM2JexudQy
 Ov1xWntFqW8YSfXdMs5lUCO5+PAVsG9gunueaE/fPDP386+Ov+rHz04r9B8CsQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
Date: Tue, 05 Aug 2025 09:10:25 +0200
Message-ID: <1932645.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250804104722.601440-7-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-7-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Montag, 4. August 2025, 12:47:22 CEST schrieb Shengjiu Wang:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
>=20
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-

Please separate commits for SoC and board files. Thanks

Best regards,
Alexander

>  2 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index c0cc5611048e..cc9351a5bd65 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -442,6 +442,10 @@ &flexcan2 {
>  	status =3D "disabled";/* can2 pin conflict with pdm */
>  };
> =20
> +&hdmi_pai {
> +	status =3D "okay";
> +};
> +
>  &hdmi_pvi {
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 841d155685ee..00d8474bd1b1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> =20
>  			hdmi_pvi: display-bridge@32fc4000 {
>  				compatible =3D "fsl,imx8mp-hdmi-pvi";
> -				reg =3D <0x32fc4000 0x1000>;
> +				reg =3D <0x32fc4000 0x800>;
>  				interrupt-parent =3D <&irqsteer_hdmi>;
>  				interrupts =3D <12>;
>  				power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
>  				};
>  			};
> =20
> +			hdmi_pai: audio-bridge@32fc4800 {
> +				compatible =3D "fsl,imx8mp-hdmi-pai";
> +				reg =3D <0x32fc4800 0x800>;
> +				interrupt-parent =3D <&irqsteer_hdmi>;
> +				interrupts =3D <14>;
> +				clocks =3D <&clk IMX8MP_CLK_HDMI_APB>;
> +				clock-names =3D "apb";
> +				power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +				status =3D "disabled";
> +
> +				port {
> +
> +					pai_to_hdmi_tx: endpoint {
> +						remote-endpoint =3D <&hdmi_tx_from_pai>;
> +					};
> +				};
> +			};
> +
>  			lcdif3: display-controller@32fc6000 {
>  				compatible =3D "fsl,imx8mp-lcdif";
>  				reg =3D <0x32fc6000 0x1000>;
> @@ -2143,6 +2161,14 @@ port@1 {
>  						reg =3D <1>;
>  						/* Point endpoint to the HDMI connector */
>  					};
> +
> +					port@2 {
> +						reg =3D <2>;
> +
> +						hdmi_tx_from_pai: endpoint {
> +							remote-endpoint =3D <&pai_to_hdmi_tx>;
> +						};
> +					};
>  				};
>  			};
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


