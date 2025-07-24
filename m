Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277DB106E8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D765F10E1EF;
	Thu, 24 Jul 2025 09:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mzFgserR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3093810E1EF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:49:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-553b584ac96so804571e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753350547; x=1753955347;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=;
 b=mzFgserRMU1ORmX87m7MVNwsrhhk1kxFjNx8ER2Mujj3gaAdgK7d0F8BE8IXpnhpOg
 woV+GZ010yHEl/ITRiJkfNqYg0+jJHZvh6bxdLfMI3II4jUxU5Q0XTKH/+nWO5vVWLx/
 SYGuCed/CNK9/ND+1wY4NqasXMTU1p4xdn57s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753350547; x=1753955347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9FQ9e+6QrSgFWR/zL+SarceeBtqf3W8b4WkgK0vUaU=;
 b=iVyU+MBhrvp6aB3dxrE/xHF96HZ8fpMHm3GywKkDrnQnRHRc9krCtb7qkRPm6zd6DF
 2AYgws4j/icajm3l6glzyichHBX2DlnnOA+aFM4MCOTmTBzRz6NiYC4+8HNKYK6Ys1Rf
 IHstOCWHu7DeFsEoCWWqQNJUaniI0vgbH+0L6f3GXrtxTqP7fjoTGAv6NxGo7U8bxywS
 MpkSpMSMMmji18aPSStpjSm/+UF2noIY5R0JdKfR7OC2qu4HA7uKcPys6OWhKTdgkG57
 J9o5A6ERJgdR8gw0BU/jyhIDslgqXUIhs3wfzp5y3SdHyzXl5idNixLvN0UmfCcTswYH
 P0fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaW83F/gXOB7wH7OcHXS2gGF5GJ6RYwbiHGznVVEoqmfxA3AbkMfrgwTB5GnqcKVPyTrPurfk5DxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGMaVW/+t9DehyrkgDIg1LNh+LIxtTG9K85pbB09K7yKP5zcjl
 NAyqAu/qiJoChWuf0j6yfjB0TDg6Nj4tsj48FqbD97qM3IXHUjaF3svlrW55pgyHtaJrP0fH34+
 dnl/nOAhWQ0ji4CmO5aWx3C3hfwmFNQ4fTAvB6tJa
X-Gm-Gg: ASbGncuq+vIDy0G2AWQsJlM24n4UgB8u6BETMZDy3OaorJztragUg1+sFlqUgiDQyta
 yDEbqKxQfNTY3+H+7dJhQC2NxTVZoRbkuvT8QWZ0B0W8W5+65TVbWBaTSrfkJ/5mI1Dr3yf6a7h
 ZGQwPcbHowaRVzW/A8QmoUF6NDLdtD/DLuIIkzH7CIx51bbmS/X1IMMjY2nSHB4SgSJhziVULPS
 cuQcy/nETaa6s0MyhH4sLSlTD0wgdupZaI=
X-Google-Smtp-Source: AGHT+IGzfXywNqkl7ab0cE9pUdYYCcgre/IBfX1N5nV04X+BJ3rA6VLZb3GDp2uT00oIYqG6uR1IPA8f6Im9wahsv0o=
X-Received: by 2002:a05:6512:3084:b0:558:f694:a65e with SMTP id
 2adb3069b0e04-55a513b2e09mr1933097e87.34.1753350547115; Thu, 24 Jul 2025
 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-29-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:48:56 +0800
X-Gm-Features: Ac12FXyvTWPQD4hmzcW0ijsxU85GUvKBlnETlBmcYtQk6_oa7dGsCrwzhdueCNE
Message-ID: <CAGXv+5FvqKNB5Ufx65p5QnueKgEYwNW20tahVPg-kG5N3t+WGQ@mail.gmail.com>
Subject: Re: [PATCH 28/38] arm64: dts: mediatek: mt8173: Fix pinctrl node
 names and cleanup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
 ck.hu@mediatek.com, houlong.wei@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 24, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> While at it, also cleanup all of the MTK_DRIVE_(x)mA by changing
> that to just the (x) number.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 138 +++++++++---------
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 ++++----
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 ++--
>  4 files changed, 128 insertions(+), 132 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> index dfc5c2f0ddef..1004eb8ea52c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> @@ -5,6 +5,14 @@
>
>  #include "mt8173-elm.dtsi"
>
> +&hdmi_mux_pins {
> +       pins-mux {
> +               pinmux =3D <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
> +               bias-pull-up;
> +               output-high;
> +       };
> +};
> +

Should probably mention that a duplicate path reference was fixed.

>  &i2c0 {
>         clock-frequency =3D <200000>;
>  };
> @@ -67,26 +75,16 @@ trackpad2: trackpad@2c {
>         };
>  };
>
> -&mmc1 {
> -       wp-gpios =3D <&pio 42 GPIO_ACTIVE_HIGH>;
> -};
> -
> -&pio {
> -       hdmi_mux_pins: hdmi_mux_pins {
> -               pins2 {
> -                       pinmux =3D <MT8173_PIN_98_URTS1__FUNC_GPIO98>;
> -                       bias-pull-up;
> -                       output-high;
> -               };
> +&mmc1_pins_default {
> +       pins-wp {
> +               pinmux =3D <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
> +               input-enable;
> +               bias-pull-up;
>         };
> +};
>
> -       mmc1_pins_default: mmc1default {
> -               pins_wp {
> -                       pinmux =3D <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
> -                       input-enable;
> -                       bias-pull-up;
> -               };
> -       };
> +&mmc1 {
> +       wp-gpios =3D <&pio 42 GPIO_ACTIVE_HIGH>;
>  };
>
>  &touchscreen {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8173-elm.dtsi
> index 0d995b342d46..9ec930058b92 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

[...]

> -       bt_wake_pins: bt_wake_pins {
> -               pins1 {
> +       bt_wake_pins: bt-pins {

Nit: I think the original name is better, because IIRC this is
using the RX pin as a GPIO interrupt to wake the system from suspend.

> +               pins-wake {
>                         pinmux =3D <MT8173_PIN_119_KPROW0__FUNC_GPIO119>;
>                         bias-pull-up;
>                 };
>         };
>

[...]

>
> -               pins_ds {
> +               pins-ds {
>                         pinmux =3D <MT8173_PIN_67_MSDC0_DSL__FUNC_MSDC0_D=
SL>;
>                         drive-strength =3D <MTK_DRIVE_10mA>;

Missed one here.

>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };

[...]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boo=
t/dts/mediatek/mt8173-evb.dts
> index 9fffed0ef4bf..51118a4149d8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts

[...]

> @@ -245,20 +245,29 @@ pins_cmd_dat {
>                         bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> -               pins_clk {
> +               pins-clk {
>                         pinmux =3D <MT8173_PIN_65_MSDC0_CLK__FUNC_MSDC0_C=
LK>;
>                         drive-strength =3D <2>;
>                         bias-pull-down =3D <MTK_PUPD_SET_R1R0_01>;
>                 };
>
> -               pins_rst {
> +               pins-rst {
>                         pinmux =3D <MT8173_PIN_68_MSDC0_RST___FUNC_MSDC0_=
RSTB>;
>                         bias-pull-up;
>                 };
>         };
>
> -       mmc1_pins_uhs: mmc1 {
> -               pins_cmd_dat {
> +       spi_pins_a: spi0-pins {
> +               pins-bus {
> +                       pinmux =3D <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>=
,
> +                               <MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
> +                               <MT8173_PIN_71_SPI_MO__FUNC_SPI_MO_0_>,
> +                               <MT8173_PIN_72_SPI_CS__FUNC_SPI_CS_0_>;
> +               };
> +       };
> +
> +       mmc1_pins_uhs: mmc1-uhs-pins {

Wrong order?

> +               pins-cmd-dat {
>                         pinmux =3D <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_=
DAT0>,
>                                  <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DA=
T1>,
>                                  <MT8173_PIN_75_MSDC1_DAT2__FUNC_MSDC1_DA=
T2>,

[...]

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
