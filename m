Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5561C559D3D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4910710E2B0;
	Fri, 24 Jun 2022 15:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AE610E2B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:25:52 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6BC620004;
 Fri, 24 Jun 2022 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656084351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwfYYK6u4o1n1w5hRcNpr/fPCrxiwGeW9LBOk78CwUs=;
 b=E6TwoOgH6oLBbjUwlSVzTMsSRhHDDVLrF/MjPopPkLKySl49VFm+v2kPmjHWeqq82IlfnL
 AxbyoR2+TXqCX6PouDbdC0lgiSKvU3J08/ZEJh45JwnTeX1oUsM7GGkY7/2OtGuu8gliUV
 ZT+wf32O0OepL3SxAuI+s6ewPRy9m31YRgOELQgV+/qeyRPhgLhO1OsO5vqDI0LIQFroyM
 4RIuFTzxWHyuiXHv9wusq2J9IhiDOFkPHi8O8Zdemu2GLd7Uy8LMUlInrzQUcF8OcGf/XH
 dmB3N6lGF9ue/AFQdxiLQpd7GX+8w0jX1gnNjuelQSzv8TbkzuHqcgO4m68t2Q==
Date: Fri, 24 Jun 2022 17:25:50 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] drm/logicvc: add missing of_node_put() in
 logicvc_layers_init()
Message-ID: <YrXXfhu5oPrBMPfu@aptenodytes>
References: <20220614112112.1537319-1-yangyingliang@huawei.com>
 <YrXMAvuHJgls+wNM@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0EhK0iGba7yvNVPN"
Content-Disposition: inline
In-Reply-To: <YrXMAvuHJgls+wNM@aptenodytes>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--0EhK0iGba7yvNVPN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 24 Jun 22, 16:36, Paul Kocialkowski wrote:
> Hi Yang,
>=20
> On Tue 14 Jun 22, 19:21, Yang Yingliang wrote:
> > The of_node_put() need be called in error path in logicvc_layers_init().
> >=20
> > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controll=
er")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>=20
> Thanks for the fix!
>=20
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Adapted this after Julia's patch: Only the put on layers_node is required
on error condition.

Pushed to drm-misc-next, thanks!

Paul

> > ---
> >  drivers/gpu/drm/logicvc/logicvc_layer.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/=
logicvc/logicvc_layer.c
> > index bae1c7f99569..00a37563a6dc 100644
> > --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> > +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> > @@ -610,8 +610,11 @@ int logicvc_layers_init(struct logicvc_drm *logicv=
c)
> >  		}
> > =20
> >  		ret =3D logicvc_layer_init(logicvc, layer_node, index);
> > -		if (ret)
> > +		if (ret) {
> > +			of_node_put(layer_node);
> > +			of_node_put(layers_node);
> >  			goto error;
> > +		}
> > =20
> >  		of_node_put(layer_node);
> >  	}
> > --=20
> > 2.25.1
> >=20
>=20
> --=20
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0EhK0iGba7yvNVPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1134ACgkQ3cLmz3+f
v9HaKAf/fhFufCnpCSb1llOwW0dmC67J6rIH6AUXDIvY2dmdmHDRccI3+A2TR52Z
LBtHpJr/6b0a4CLhLehpipLZ6xpVcC+jq5NcJyLV93q5S7HRzcfXL/Z5Xjd/Huhe
GTZj80cvOwNUUK0tHaNohEgCLZnSsWGkuMiaEa3sb3GfSx+2ubLCTs/WSEgMPUMo
uIW0UoTiw896SLmdvZV7TDufT2tQ0N1X1kyV/wFAjMJ2eiNJTN7j2+VXfeoHhTjf
Ksqo1tswJ1jO+Dkfue2d+7TpzFUJpKv/IYzekrHp6gDfyHOC1oNd7kEwGjoNyl/b
AVjoFDMv+4zvUzdsBArzQHF4WPHhDQ==
=yqMU
-----END PGP SIGNATURE-----

--0EhK0iGba7yvNVPN--
