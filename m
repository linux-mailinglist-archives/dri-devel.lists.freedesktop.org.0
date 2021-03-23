Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98198346781
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 19:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711906EA5D;
	Tue, 23 Mar 2021 18:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4BA6EA5D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:24:35 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bf3so24611074edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DUKPGqPelr6tSzZ7Q2lwzMEmrFjU0t9jqA2NIFQX6cY=;
 b=FsgHyLgwlMVV6JvPqSqqsM7mSoWNMFpLmihx1HNbNoCNwu0x+FPKBVzFgkn0y/Q35r
 PvjntJwcDF4owFD1CaJZ7eXAfA79aaVSHsBd2VhnUBt1RJXv0e6uxsw6yQ19RqFMoL3Z
 ThofH4DDOh0VkzsAfS2H9rIfLA4XxlEc0Z+I6/xAnkL0U9QaLinp1qOR4AiRWjxF6cCT
 7cpYpgpm60U5fI42q9hwFPbnQsH9FGSjgjR21IkGWfd4mcdWuUJ9wj8usCvNSkpJIO9g
 268sZdjtVwn7zOQszewiyIqHVrxPDg5ZFqLXKm9JLZz98cO7bZUC+E5ZT/YTZ/kmtaAH
 JMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DUKPGqPelr6tSzZ7Q2lwzMEmrFjU0t9jqA2NIFQX6cY=;
 b=mdWJKOa1vxHoU8b37ssJ7V7TH4dLJdPIFVenHhLIExjyMMcXgNLoANvlj13qW2RItu
 KyPxHOhZl0chfdacnDaI3yMMI9PGyHuJX6N3a97Hdo+k/ENol3inr4sjzxmi9xdyFTDz
 QZc7LlPjqmsd8uvVWxsDJkqxouRkjTKunnZ+m1gwDzm7C6KKufpRr1KgiqYgQioGskEV
 DbZZTNKQSQpku/8KBjkO2QEtCL3CJOFed8TNS6EcvXFupIEMUixX6ieLE0EdrvcaoZvf
 qdIT+kfVA0plg4sCGnQx03SdlFo+03OBfF3rG4H7BTpO8TjRQ37+VQHeKMwoN8JIBPIL
 labg==
X-Gm-Message-State: AOAM533Q1eTSQ3ErX8Zqd1wWhyjZr8+43xyfpGi6hLCf1jmn51vMJ+7a
 GLwe5/2kPafsCkJrUtpPEuI=
X-Google-Smtp-Source: ABdhPJxr1ce9LXBtbs6Bdy96FQGd0gI+bM7cWoJDp/A7uLBBqHisT3Tq2gLoth3moAG5vv67AWgF2Q==
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr5800890eds.339.1616523874028; 
 Tue, 23 Mar 2021 11:24:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id yk8sm11557291ejb.123.2021.03.23.11.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:24:30 -0700 (PDT)
Date: Tue, 23 Mar 2021 19:24:51 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186
 and later
Message-ID: <YFoyc5mdYe/5/Cjn@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-5-thierry.reding@gmail.com>
 <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
MIME-Version: 1.0
In-Reply-To: <454aea05-ee94-5789-2cab-513342cf7614@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1304973835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1304973835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b4npARoslvSwQEhi"
Content-Disposition: inline


--b4npARoslvSwQEhi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 08:57:42PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > @@ -920,15 +934,42 @@ static void tegra_cursor_atomic_update(struct drm=
_plane *plane,
> >  	value =3D tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
> >  	value &=3D ~CURSOR_DST_BLEND_MASK;
> >  	value &=3D ~CURSOR_SRC_BLEND_MASK;
> > -	value |=3D CURSOR_MODE_NORMAL;
> > +
> > +	if (dc->soc->has_nvdisplay)
> > +		value &=3D ~CURSOR_COMPOSITION_MODE_XOR;
> > +	else
> > +		value |=3D CURSOR_MODE_NORMAL;
> > +
> >  	value |=3D CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
> >  	value |=3D CURSOR_SRC_BLEND_K1_TIMES_SRC;
> >  	value |=3D CURSOR_ALPHA;
> >  	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
> > =20
> > +	/* nvdisplay relies on software for clipping */
> > +	if (dc->soc->has_nvdisplay) {
>=20
> But coordinates already should be clipped by
> drm_atomic_helper_check_plane_state().

Yes, and the driver goes on to use the clipped coordinates later on in
this function.

Thierry

--b4npARoslvSwQEhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaMnMACgkQ3SOs138+
s6G4lQ//WySL1iNIPfIelEBP0S0+fcEcfH7fnVfQC102GZB/J0oHiwyBYGVb/Z/h
mrwdqbP8mxTn5HB1L5JfglWTzGF36ultVNZl+ysW7JxAPRey1C9ngQ/KLrNSvt8p
mCi3Bn1qYIZRrXUsx6fPf8mN6CDLJmsi218aK6XdACG5KgLw6lMfShHnN1+zOJeD
5tFa/6A9BizX7+4F/5WsaIqpCcPVY2/aYwBY4ZF59KewPDuEJtGsYRb7vbjeICRe
oowflqGECdhkMH2z+0vXsLFpr7fQ3QRdmuMQWuj8vGAYWPVOBOUC3MYhQ9bZlzv1
jhHOvie+tmllCOc3oZwvmWUU6eEetTeL+gDFeIPji/L3PfPXs6zQuO0IHtk7h7p1
O6+Ddrp0LDj+L7YjIdy1SL2j0Vqk7ch4Lp6Qb0/TRGvk6EhOKYT9BsvkcHBLiaca
0dTyGgqp7kbp2Knb9LNoISCl7sPrPRL4gKyb28DeN1c6IxAGqXm1iKMMcNoxmp6Q
7FlypJbwNNs6xzLsrU+gRytICdOXmMKwOHoJ6BgrpsIlX2wa6yEFXPsLtEjGkLIc
W4O/Stv+S2B1CEdqrI01m8IfIWBERFzE31xbGE/bHBWWbB+6nP1MUx6+KSYlwKsc
xiIn7sX+62DxuKXX6kUJYLFQU6J/vzlKzZGkKrZErqmQh2v6D0g=
=CiKo
-----END PGP SIGNATURE-----

--b4npARoslvSwQEhi--

--===============1304973835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1304973835==--
