Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5901AF08B5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 04:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352410E30A;
	Wed,  2 Jul 2025 02:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="aZa8P6c6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5F10E30A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 02:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751424742; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mrA3avk9M/kuiMlSOraXS90FYqh0uN7Iwu6NapwxmSegHecv5+P4PUbEMsTeOrRusu1BagsOFD6Ft+rQJAETUjm/3BCg8x38Sngb2r3jtdxoEcJL4BbtE2vO27ELCchZgt24AWoBljLbYjwRQGS9hY2Q39s0IRn7CXVGNH+D2x8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751424742;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8djG8WqbgQUjheVgZ2REIAEuyGK2m7kH11olGFqdbSU=; 
 b=HViJtwRdnwVaWMUd+/Rho9adtqSpBKBmwx4P9X5KnlMUBJvMR2rZQoDGBEQOzXNV5kjq8kaHF1LskRhdXTJ2EO0Rj0UVXg4PWI8xLebK1G2O1st7snNv4/NBnODZbaF+IdT1oPV1nzNzKg5i8wIe/SGlCMkU7v+TAY1FhCkVz80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751424742; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=8djG8WqbgQUjheVgZ2REIAEuyGK2m7kH11olGFqdbSU=;
 b=aZa8P6c6JFbALioZzkB15M/OExk2j5KPthXbGCX9mnmtMnvLkWJNSrpIkXQoksMn
 VrA0lPoiyXlg1YxBxyo5ALCKSqfpaTCOS/XeYEX3YMaWdJL2uqyq8/CXFgU6e1ih5K5
 Zehy4xmgE8dWIEvBV/b+rRdid/cpmoXXrz74mXGeiDqXD/P5Xm6Cvnc0LcKr6CCT8ro
 eDIjS9pHFy5YYrm6IzVL8pamvuqO55GB1IRDTJq0eikQYut6tjGH/nVeEHi6NyZonoN
 q4sqIiLCTSMQzFAHkP1qterjuJrSDLais/B9aj8urMv9zLAF26BLxWs9aqTWICdbJvE
 /l3ltWEUYg==
Received: by mx.zohomail.com with SMTPS id 1751424740371995.4237846805278;
 Tue, 1 Jul 2025 19:52:20 -0700 (PDT)
Message-ID: <4bc1c1fd9aa1e97a04d964fc5601155ade52cd2d.camel@icenowy.me>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,  Icenowy Zheng
 <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Date: Wed, 02 Jul 2025 10:52:10 +0800
In-Reply-To: <20250701201124.812882-6-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

=E5=9C=A8 2025-07-01=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 22:11 +0200=EF=BC=
=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> The DE mixer clock is currently set to run at 150 MHz, while the
> Allwinner BSP configures it at 300 MHz and other platforms typically
> run at 297 MHz.
>=20
> 150 MHz appears to be enough given the restricted graphics
> capabilities
> of the SoC (with a work area of only 1024x1024). However it typically
> causes the DE clock to be parented to the periph0 pll instead of the
> video PLL.
>=20
> While this should generally not be a concern, it appears (based on
> experimentation) that both the DE and TCON clocks need to be parented
> to the same PLL for these units to work. While we cannot represent
> this
> constraint in the clock driver, it appears that the TCON clock will
> often get parented to the video pll (typically running at 297 MHz for

Ah I think pixel clocks are arbitary and nothing could be predicted
about it...

> the CSI units needs), for instance when driving displays with a 33
> MHz
> pixel clock (33 being a natural divider of 297).
>=20
> Running the DE clock at 297 MHz will typically result in parenting to
> the video pll instead of the periph0 pll, thus making the display
> output functional.
>=20
> This is all a bit fragile but it solves the issue with displays
> running
> at 33 Mhz and brings V3s to use the same frequency as other
> platforms,
> making support more unified.
>=20
> Also align and sort the fields of the v3s mixer config while at it.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 8b41d33baa30..35fdc2451060 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -670,12 +670,12 @@ static const struct sun8i_mixer_cfg
> sun8i_r40_mixer1_cfg =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.vi_num =3D 2,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ui_num =3D 1,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.scaler_mask =3D 0x3,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.scanline_yuv =3D 2048,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ccsc =3D CCSC_MIXER0_LAYOUT,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.mod_rate =3D 150000000,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ccsc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D CCSC_MIXER0_LAYOUT,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.mod_rate=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=3D 297000000,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.scaler_mask=C2=A0=C2=A0=C2=A0=
=C2=A0=3D 0x3,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.scanline_yuv=C2=A0=C2=A0=C2=
=A0=3D 2048,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ui_num=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.vi_num=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D 2,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg =3D {

