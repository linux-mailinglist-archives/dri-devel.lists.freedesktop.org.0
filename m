Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE085664D8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 05:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459E36E2AF;
	Fri, 12 Jul 2019 03:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902946E2AF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:14:55 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a27so5415435qkk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 20:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fqowWkQWDIteBtwEKrdiEv26Xf58Ktw1YcMr9HD38hc=;
 b=MkCCFDIHLnPiq0TpbZ8nELiJ/f5pGnjZMxbP9M/HSFXPq/r9KHRnM7xuwAjxizd6vo
 uK05At79/IXd9S/b/QRdleMZQscxqorLXu+EdZpEHLAXhCc5UHR+3jRTbfN9hU+zStcG
 pGgi9XvrhIedv8wGzyTcRBaUDkQFrcNb3Q1942dCz8t4KCkpXJdKWRPDb3kHFOSDElM4
 0N7DUovXXdVB5YIqAu8GROK+s4seKiGdx+Up3RVfNXzbt7F9d722e+cZCPTiQNO5gnuJ
 H5VpJX/kEREqxizEz1F8+mpJZmFQD4YLsKXuHdAwBSWeX7xI2NhvITvNTHzOUCChH/1b
 9hbA==
X-Gm-Message-State: APjAAAXloO+IFHGXDtQp9kbla5uxFHx//IUAULFplIVdC/yBcVNulKwI
 0wqqKxiaEOtYXAH9jMfNU+U=
X-Google-Smtp-Source: APXvYqxMHYF82JKIlXbB93A96rz547nb8nWEiIbN14p+Pz9F+KDlBu2aOcXwexavUW+Xt9VWIqfoNA==
X-Received: by 2002:a37:9185:: with SMTP id t127mr4497870qkd.482.1562901294628; 
 Thu, 11 Jul 2019 20:14:54 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id t2sm3964071qth.33.2019.07.11.20.14.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 20:14:53 -0700 (PDT)
Date: Fri, 12 Jul 2019 00:14:49 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Message-ID: <20190712031449.3pmeimkcde2hrxxh@smtp.gmail.com>
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <20190711082105.GI15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190711082105.GI15868@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fqowWkQWDIteBtwEKrdiEv26Xf58Ktw1YcMr9HD38hc=;
 b=E5i89Yz/S7p8RYcIgbxKAuw0Lu/eHuwtmFAG/skNG8Hrf9AUsrWMxu9EDOzraY6Rtr
 ZEQWnDYOaSLZNeTAOCBtK2Zp5XMJcZU/UsPJFWsCZ5/jzyIzthR2z6ZH3uLT208LnpD4
 pH9ESenYlnzb42m4/XJpuXv9sUfviULqhHZQ46EeJewJ7+EqXF8c13kR3WR579fYaEQm
 DsCYVQXEbqTtN4LY0OTOyPEQiBx5hwozxM6R51F//Y5p9xbWckgHWYq4Zi3/OV0TyiIk
 81tmr7XBvRHq1Xq87uE+oX4wYvWl9ml4j30nMsgJh5+AY9ygWQgeP1HIhadbfN/mhSRV
 5y8Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1604514865=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1604514865==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wp7bxmzbrpx433z"
Content-Disposition: inline


--6wp7bxmzbrpx433z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/11, Daniel Vetter wrote:
> On Tue, Jun 25, 2019 at 10:38:31PM -0300, Rodrigo Siqueira wrote:
> > The compute_crc() function is responsible for calculating the
> > framebuffer CRC value; due to the XRGB format, this function has to
> > ignore the alpha channel during the CRC computation. Therefore,
> > compute_crc() set zero to the alpha channel directly in the input
> > framebuffer, which is not a problem since this function receives a copy
> > of the original buffer. However, if we want to use this function in a
> > context without a buffer copy, it will change the initial value. This
> > patch makes compute_crc() calculate the CRC value without modifying the
> > input framebuffer.
>=20
> Uh why? For writeback we're writing the output too, so we can write
> whatever we want to into the alpha channel. For writeback we should never
> accept a pixel format where alpha actually matters, that doesn't make
> sense. You can't see through a real screen either, they are all opaque :-)
> -Daniel

Hmmm,

I see your point and I agree, but even though we can write whatever we
want in the output, don=E2=80=99t you think that is weird to change the
framebuffer value in the compute_crc() function?

Thanks
=20
> >=20
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 31 +++++++++++++++++-----------
> >  1 file changed, 19 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkm=
s/vkms_composer.c
> > index 51a270514219..8126aa0f968f 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -6,33 +6,40 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> > =20
> > +static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > +				 const struct vkms_composer *composer)
> > +{
> > +	int src_offset =3D composer->offset + (y * composer->pitch)
> > +					  + (x * composer->cpp);
> > +
> > +	return *(u32 *)&buffer[src_offset];
> > +}
> > +
> >  /**
> >   * compute_crc - Compute CRC value on output frame
> >   *
> > - * @vaddr_out: address to final framebuffer
> > + * @vaddr: address to final framebuffer
> >   * @composer: framebuffer's metadata
> >   *
> >   * returns CRC value computed using crc32 on the visible portion of
> >   * the final framebuffer at vaddr_out
> >   */
> > -static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *com=
poser)
> > +static uint32_t compute_crc(const u8 *vaddr,
> > +			    const struct vkms_composer *composer)
> >  {
> > -	int i, j, src_offset;
> > +	int x, y;
> >  	int x_src =3D composer->src.x1 >> 16;
> >  	int y_src =3D composer->src.y1 >> 16;
> >  	int h_src =3D drm_rect_height(&composer->src) >> 16;
> >  	int w_src =3D drm_rect_width(&composer->src) >> 16;
> > -	u32 crc =3D 0;
> > +	u32 crc =3D 0, pixel =3D 0;
> > =20
> > -	for (i =3D y_src; i < y_src + h_src; ++i) {
> > -		for (j =3D x_src; j < x_src + w_src; ++j) {
> > -			src_offset =3D composer->offset
> > -				     + (i * composer->pitch)
> > -				     + (j * composer->cpp);
> > +	for (y =3D y_src; y < y_src + h_src; ++y) {
> > +		for (x =3D x_src; x < x_src + w_src; ++x) {
> >  			/* XRGB format ignores Alpha channel */
> > -			memset(vaddr_out + src_offset + 24, 0,  8);
> > -			crc =3D crc32_le(crc, vaddr_out + src_offset,
> > -				       sizeof(u32));
> > +			pixel =3D get_pixel_from_buffer(x, y, vaddr, composer);
> > +			bitmap_clear((void *)&pixel, 0, 8);
> > +			crc =3D crc32_le(crc, (void *)&pixel, sizeof(u32));
> >  		}
> >  	}
> > =20
> > --=20
> > 2.21.0
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Rodrigo Siqueira
https://siqueira.tech

--6wp7bxmzbrpx433z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0n+ykACgkQWJzP/com
vP8jdA//Tv7ShkinLXNtiF8dK7UlkjVi2KNRKIbfk81SrvbLs/gCraJiW3MhGK54
V7Gcx6r33ahPA35p7K3sbm7q+jAGfVUSapQsT7GMG8D6anM0qhhp4h/k5/vsLtT4
7FTZVu0rL1E76XoyseoZXsnSHHfp0h2enSBKYt7aHMSYY2zhDQRtfWtBbCpN3MML
cfOOyoA7OlIyiz9n2vOKnI23rXPULDMN77Rp+f8s6UzwaOjDKnEPyxBFKfgU9kBy
VV8vbXiX26ENQ5j0Xz+QWWNL3S7gAqKQnPlMYBk1PXn8YdI7yoUrOhV6lZUSx5QV
xuLpewuIs+R3LR4YQvsKIL/I2WTiuTvz4I+6MK/QLJ5JxSEFhw1sllVvhZXXGoad
qSVV5gocR3g2Lz60rPzMWZ3PBy/BwZWfutxuSAV4hxozKWx0UR2R21hmuqbgoVS3
f6B5lExMqhA8CxTK+Zk1+mekztr5VxYBmnciuvshhGrfx4f2XS7Tt1awm0JrQwFv
chRARfSDVhqxkJvW72kDb+tG3Cy5mtJYmmUA4MPGEUefoIaNx4dypPRpJ8yjZRtq
A8JJ2j1zt2Fv0IVCxOSESAfniLN+U0EAkpBFxH1OmIFbU2WUuItRNTkVSSQ7zQ0Q
upcoD7Uc3QdC31ORWgnyoovloumbRCJRbA94HI1UoQbQg9KyiMw=
=Rdzr
-----END PGP SIGNATURE-----

--6wp7bxmzbrpx433z--

--===============1604514865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1604514865==--
