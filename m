Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95B79A3769
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176AA10E8A8;
	Fri, 18 Oct 2024 07:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="fh7nacds";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="A5vezJ58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8706210E8A8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729237278; x=1760773278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7CJ/y+7WtdFv9s7kRyjk4o6RfcgvWIF9H/8Zc6HTNCs=;
 b=fh7nacdsgeuBp02E8WpP7S/kUoMHyU7wmuOs21w2ALqZqdEpCn2Tx24M
 mf23J4vRvDuRy23mrRe6LD5/q9GM8yVJj2pqgMDMR57uAkyrk2gCLuxH8
 adGHXFFeXiD51GwQtEkm1b/yIYThcneRNTs58K2oQERblTT61TUr2tBue
 Kb1UAZvsWUIlXxiZyt5JpNflzyJc/i+ZlCp1QrFAMDwmyd00kZOpiC04o
 58p7opVCqSyl3Ol3AbJu71Jffz1nKgQqeI+TsYRMvbvtaDED/k3hvZAYn
 BQwI6qaGSwpwzoxWVxHqrhl7+Xok1Ct6KEqhOPCG0Fr8VCxW3t9nfcCTZ A==;
X-CSE-ConnectionGUID: urIKLa/HRiqZcUgrcvqZFA==
X-CSE-MsgGUID: SY6XoutYT7iowEnEPbMmtw==
X-IronPort-AV: E=Sophos;i="6.11,213,1725314400"; d="scan'208";a="39535062"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 18 Oct 2024 09:41:16 +0200
X-CheckPoint: {6712111C-29-65F98A6A-FADAF7F3}
X-MAIL-CPID: 7642140A76B7BABC054D44A6F64FB81D_5
X-Control-Analysis: str=0001.0A682F28.6712111D.0022, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2878716806F; Fri, 18 Oct 2024 09:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729237272;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7CJ/y+7WtdFv9s7kRyjk4o6RfcgvWIF9H/8Zc6HTNCs=;
 b=A5vezJ58xi3an0iZ0JXp06Bb7Zf24EuNaLVpcSe8ZeP+aNsDX6mKou87N5xcKkxRu1UVyW
 aZt1oA5xZIpKoQpiESTCK9MbpNiHlzPgrY98l3ggLmLlwvfBDxaefkejnNT6m7rmCLpG/P
 zj6UE4fbcZpVinaqU2NCxJ91x1IX+qWxwrSz1+yCUHkeNDlxnTaXdXVWItO3FpXcY5Rtja
 O7OVuXZYC2baTELvSN9ysCaLDS32oQ9BAkHDr+207McKaCGOhLxujZMTvFg7k7LGgOxb0w
 HFDbRl+Gt/1cYp6YHKcdF/R4XtFADWeVWgc1UcwC020kw8xS9vxFq9N9h41Nsw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch, dmitry.baryshkov@linaro.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 1/5] arm64: dts: imx8mp-kontron-bl-osm-s: Add HDMI
 connector
Date: Fri, 18 Oct 2024 09:41:08 +0200
Message-ID: <864627577.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241018064813.2750016-2-victor.liu@nxp.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-2-victor.liu@nxp.com>
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

Am Freitag, 18. Oktober 2024, 08:48:09 CEST schrieb Liu Ying:
> Add a HDMI connector to connect with i.MX8MP HDMI TX output.
> This is a preparation for making the i.MX8MP LCDIF driver use
> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag.  With that flag, the DW HDMI bridge core driver would
> try to attach the next bridge which is the HDMI connector.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Looks similar to imx8mp-tqma8mpql-mba8mpxl.dts, so:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> index 0eb9e726a9b8..445bf5a46c6a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> @@ -23,6 +23,17 @@ extcon_usbc: usbc {
>  		id-gpios =3D <&gpio1 10 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_in: endpoint {
> +				remote-endpoint =3D <&hdmi_tx_out>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
> =20
> @@ -168,6 +179,14 @@ &hdmi_tx {
>  	pinctrl-0 =3D <&pinctrl_hdmi>;
>  	ddc-i2c-bus =3D <&i2c2>;
>  	status =3D "okay";
> +
> +	ports {
> +		port@1 {
> +			hdmi_tx_out: endpoint {
> +				remote-endpoint =3D <&hdmi_in>;
> +			};
> +		};
> +	};
>  };
> =20
>  &hdmi_tx_phy {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


