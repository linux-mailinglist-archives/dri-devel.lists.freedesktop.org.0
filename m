Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDDEA4DE1B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 13:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF2610E318;
	Tue,  4 Mar 2025 12:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="U7pImbBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04E10E318
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLskld3j/+jGE72aUEs0X5g8/a3WioUWDpwH6b83L3Y=; b=U7pImbBWMCBcZdY6HtiTtG9Qiv
 hZXAmQxGGxL/wpSqvoAJwLfkxmNxFLX+PcRZEIGYFMb+ZXPB3I81woBaKSNTKEflxFq7DmnkjjfBE
 iveMv0iQMn8SOl5LgaPTzBfaFt/dd5iewtIhxh1x+3GYQpkxHP0csVelI+awuONwDwW5ckcRx8+PW
 MYejp09LT3p4Z4uhEow8TMa4M3rJ7Q+YldTLPjm0PgvrP/oRrf43ofpBPsilCrKc7Ik/N5ZRC5PeT
 hMWDTE06C+kXl13B6KjhFNw/2a29T+HXHXzMOsEgIgz9jYAGg999K3n6unNhqJJ3g/qfEJuupm6Mg
 YwAhTPZg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tpRX9-00037w-P6; Tue, 04 Mar 2025 13:38:03 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/2] drm/rockchip: lvds: Hide scary error messages on
 probe deferral
Date: Tue, 04 Mar 2025 13:38:02 +0100
Message-ID: <9817880.CDJkKcVGEf@diego>
In-Reply-To: <0e54f70a-0b07-4ead-96fb-add2bbdaf787@cherry.de>
References: <20250301173547.710245-1-heiko@sntech.de>
 <20250301173547.710245-3-heiko@sntech.de>
 <0e54f70a-0b07-4ead-96fb-add2bbdaf787@cherry.de>
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

Am Dienstag, 4. M=C3=A4rz 2025, 12:46:59 MEZ schrieb Quentin Schulz:
> > @@ -465,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_devi=
ce *pdev,
> >  =20
> >   	lvds->pins->p =3D devm_pinctrl_get(lvds->dev);
> >   	if (IS_ERR(lvds->pins->p)) {
> > -		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
> > +		dev_err(lvds->dev, "no pinctrl handle\n");
> >   		devm_kfree(lvds->dev, lvds->pins);
> >   		lvds->pins =3D NULL;
> >   	} else {
> >   		lvds->pins->default_state =3D
> >   			pinctrl_lookup_state(lvds->pins->p, "lcdc");
> >   		if (IS_ERR(lvds->pins->default_state)) {
> > -			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
> > +			dev_err(lvds->dev, "no default pinctrl state\n");
> >   			devm_kfree(lvds->dev, lvds->pins);
> >   			lvds->pins =3D NULL;
>=20
> Should those be dev_err if they are not breaking anything? After all,=20
> the device will actually probe? Maybe dev_warn would be more appropriate?
>=20
> Maybe a separate patch since we had DRM_DEV_ERROR already, so switching=20
> to dev_err in one and then lowering the log level in a second would make=
=20
> "more" sense?

I did debate a bit whether to ignore here and go directly to dev_warn,
but opted for DRM_DEV_ERROR -> dev_err -> dev_warn, to keep the commit
description intact. Otherwise people looking at this patch alone might ask
if this part was forgotten, when the commit message indicates "all".

So expect an additional patch in v3 :-) .


> > @@ -593,7 +589,7 @@ static int rockchip_lvds_bind(struct device *dev, s=
truct device *master,
> >   		lvds->format =3D rockchip_lvds_name_to_format(name);
> >  =20
> >   	if (lvds->format < 0) {
> > -		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
> > +		dev_err(dev, "invalid data-mapping format [%s]\n", name);
> >   		ret =3D lvds->format;
>=20
> nipitck:
>=20
> ret =3D dev_err_probe(dev, lvds->format, "invalid data-mapping format=20
> [%s]\n", name);

you're right of course

=2E..

> >   	ret =3D component_add(&pdev->dev, &rockchip_lvds_component_ops);
> >   	if (ret < 0)
> > -		DRM_DEV_ERROR(dev, "failed to add component\n");
> > +		return dev_err_probe(dev, ret, "failed to add component\n");
> >  =20
>=20
> Should this rather be drm_error? I believe this is related to the=20
> Rockchip DRM main device?

I would group this more to general device error.
Component_add happens way before the component master binds anything.

drm_err is supposed to also point to the main drm_device as its parameter,
which does not even exist at this point.


Heiko


