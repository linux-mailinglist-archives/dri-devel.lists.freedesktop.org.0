Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6317710D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39DB6E9EB;
	Tue,  3 Mar 2020 08:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBFC6E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 19:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583177278; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/w7xN8JJOoqBkwjRFtmhdPO4ps8i2CpUSpPDW0yr48=;
 b=ZMoaIqvQbluaDkRWIfTLHOhukc1YfE8Xoybz2XPE9LtkkQ0wOuUmtDUDeTBYUWqWh5eKBc
 C9gPkHzyq+tu3AbaCh+RzGvtvPK19aYl0giwSqiFgtLMsnSNbO06WhmYqQPnfoJFEnVVTN
 HIb/5holaayaF/L64+uCeT5qyw8gjuI=
Date: Mon, 02 Mar 2020 16:27:33 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver
 and LCD controller
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1583177253.3.5@crapouillou.net>
In-Reply-To: <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, linux-gpio@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kernel@pyra-handheld.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, letux-kernel@openphoenux.org,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
> =

> A specialisation of the generic Synopsys HDMI driver is employed for =

> JZ4780
> HDMI support. This requires a new driver, plus device tree and =

> configuration
> modifications.
> =

> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 32 =

> ++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> =

> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi =

> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index f928329b034b..391d4e1efd35 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -433,4 +433,36 @@
> =

>  		status =3D "disabled";
>  	};
> +
> +	hdmi: hdmi@10180000 {
> +		compatible =3D "ingenic,jz4780-dw-hdmi";
> +		reg =3D <0x10180000 0x8000>;
> +		reg-io-width =3D <4>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +		clock-names =3D "isfr" , "iahb";
> +
> +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
> +		assigned-clock-rates =3D <27000000>;

I *think* this should go to the board file.

> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <3>;
> +
> +		/* ddc-i2c-bus =3D <&i2c4>; */
> +
> +		status =3D "disabled";
> +	};
> +
> +	lcd: lcd@13050000 {

The node name should be 'lcd-controller'.

> +		compatible =3D "ingenic,jz4740-lcd";

The JZ4780's LCD controller is much newer than the JZ4740 one, so even =

if it works with the "ingenic,jz4740-lcd" compatible string, you want =

it as a fallback.
So this should be: compatible =3D "ingenic,jz4780-lcd", =

"ingenic,jz4740-lcd".

That means the YAML should be updated too.

-Paul

> +		reg =3D <0x13050000 0x1800>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +		clock-names =3D "lcd", "lcd_pclk";
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <31>;
> +
> +		status =3D "disabled";
> +	};
>  };
> --
> 2.23.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
