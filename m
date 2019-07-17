Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549B6B486
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 04:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AF36E1C0;
	Wed, 17 Jul 2019 02:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A7A6E1C0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 02:30:31 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so21791220qto.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 19:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YA8lAAAs8QKJaZT6FgrXTDQyRFELqwwXAnvE6DYcrwo=;
 b=OJ+mVJRKYFXLOSq1ruNZeJpyEpQpmqE4O2uvUuWAyCKKAL8Z6mrTh7zLrpsfyFV1cB
 BqvYlp+UMJHjkdrMfbLMeeV0Q9xF9pc0z0GBOc5jrQUZR04FulWDvrEHAO0NJPDTC/jZ
 v1kjQwTPFxSucijRUL0/sRFVK/h2oINPc6fQ0ss9FMinPryMWPaZJiEnhKA93WxTsW/p
 agEhZHkihit22hRuVpFgdySooEixu5tBA3pIUNOzKFfpb7GdydJ9RkZrtH4fu8AIAL2l
 gYtBHx//zTZaPDqezk+bqn08rXZUzAKSrnWt77xjvva6MD+OC28T2F6EELH3W0lOpklZ
 QtXQ==
X-Gm-Message-State: APjAAAXqgSkgQKcMX6kM//5IEmQxLfnePcB18OhphrJ/LFXRcAw5inl8
 HdY73FElxCGY2D/cdHVSYSS6BZdkS54=
X-Google-Smtp-Source: APXvYqxx50eEWuRi6UIQAIJ2BOEUS8tFyRQsai0lR4punJyDFOH1UVjLXqxBvxYFGT6YNKkSRT1MBw==
X-Received: by 2002:a0c:8a76:: with SMTP id 51mr26976107qvu.210.1563330630560; 
 Tue, 16 Jul 2019 19:30:30 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id b202sm10257728qkg.83.2019.07.16.19.30.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 19:30:29 -0700 (PDT)
Date: Tue, 16 Jul 2019 23:30:24 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 4/5] drm/vkms: Compute CRC without change input data
Message-ID: <20190717023024.svpgfbzgund2awfw@smtp.gmail.com>
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <ea7e3a0daa4ee502d8ec67a010120d53f88fa06b.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <20190711082105.GI15868@phenom.ffwll.local>
 <20190712031449.3pmeimkcde2hrxxh@smtp.gmail.com>
 <20190716083715.GT15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190716083715.GT15868@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YA8lAAAs8QKJaZT6FgrXTDQyRFELqwwXAnvE6DYcrwo=;
 b=jUqM3qYMZZMW9/ukdmhyypFlzErDXK17HLvVFp30vzHZdthvv+iO0s9lyIV/rGVPqr
 JBM0uE5gctX59YzlfaoaOCLumfIyAEOUemNySjDWg1k0Q+ciyd/Uar+SuWXLLZWACU23
 agMYZ59E7FL/gYr7PynzaiVjKQfGs8OO9PmVOOFsNXMCPspk9518riVDU+icSptb+gAt
 jmhw/TrMfvKtydIt85yWi5vp3jJKjq61iXH56JcSSYGbNPF4KK6/RxoiihadMJ0TYPY1
 M0dYmJrF3c3ZXkW8nyrczl/w10EIh8Bh2djARwzspOpQVzTJoBQuxvTUyRkXAg7uOiLj
 gYxg==
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
Content-Type: multipart/mixed; boundary="===============2005163010=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2005163010==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qp4bmywubblpnone"
Content-Disposition: inline


--qp4bmywubblpnone
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/16, Daniel Vetter wrote:
> On Fri, Jul 12, 2019 at 12:14:49AM -0300, Rodrigo Siqueira wrote:
> > On 07/11, Daniel Vetter wrote:
> > > On Tue, Jun 25, 2019 at 10:38:31PM -0300, Rodrigo Siqueira wrote:
> > > > The compute_crc() function is responsible for calculating the
> > > > framebuffer CRC value; due to the XRGB format, this function has to
> > > > ignore the alpha channel during the CRC computation. Therefore,
> > > > compute_crc() set zero to the alpha channel directly in the input
> > > > framebuffer, which is not a problem since this function receives a =
copy
> > > > of the original buffer. However, if we want to use this function in=
 a
> > > > context without a buffer copy, it will change the initial value. Th=
is
> > > > patch makes compute_crc() calculate the CRC value without modifying=
 the
> > > > input framebuffer.
> > >=20
> > > Uh why? For writeback we're writing the output too, so we can write
> > > whatever we want to into the alpha channel. For writeback we should n=
ever
> > > accept a pixel format where alpha actually matters, that doesn't make
> > > sense. You can't see through a real screen either, they are all opaqu=
e :-)
> > > -Daniel
> >=20
> > Hmmm,
> >=20
> > I see your point and I agree, but even though we can write whatever we
> > want in the output, don=E2=80=99t you think that is weird to change the
> > framebuffer value in the compute_crc() function?
>=20
> Not sure what you mean here ... ? From a quick look the memset only sets
> our temporary buffer, so we're not changing the input framebuffer here.
> And we have to somehow get rid of the X bits, since there's no alpha
> value. For CRC computation, all we need is some value which is the same
> for every frame (so that the CRC stays constant for the same visible
> output). For writeback we could write whatever we want (which includes
> whatever is there already). But there's no guarantee and definitely no
> expectation that the X bits survive. Writing 0 is imo the most reasonable
> thing to do. I'm not even sure whether modern gpus can still do channel
> masking (i.e. only write out specific channels, instead of the entire
> color). That was a "feature" of bitop blitters of the 80s/90s :-)
> -Daniel

Ahhh, now I can see that my mindset was in the 90s :)

Thanks
=20
> >=20
> > Thanks
> > =20
> > > >=20
> > > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_composer.c | 31 +++++++++++++++++-------=
----
> > > >  1 file changed, 19 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm=
/vkms/vkms_composer.c
> > > > index 51a270514219..8126aa0f968f 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > @@ -6,33 +6,40 @@
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_gem_framebuffer_helper.h>
> > > > =20
> > > > +static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > > > +				 const struct vkms_composer *composer)
> > > > +{
> > > > +	int src_offset =3D composer->offset + (y * composer->pitch)
> > > > +					  + (x * composer->cpp);
> > > > +
> > > > +	return *(u32 *)&buffer[src_offset];
> > > > +}
> > > > +
> > > >  /**
> > > >   * compute_crc - Compute CRC value on output frame
> > > >   *
> > > > - * @vaddr_out: address to final framebuffer
> > > > + * @vaddr: address to final framebuffer
> > > >   * @composer: framebuffer's metadata
> > > >   *
> > > >   * returns CRC value computed using crc32 on the visible portion of
> > > >   * the final framebuffer at vaddr_out
> > > >   */
> > > > -static uint32_t compute_crc(void *vaddr_out, struct vkms_composer =
*composer)
> > > > +static uint32_t compute_crc(const u8 *vaddr,
> > > > +			    const struct vkms_composer *composer)
> > > >  {
> > > > -	int i, j, src_offset;
> > > > +	int x, y;
> > > >  	int x_src =3D composer->src.x1 >> 16;
> > > >  	int y_src =3D composer->src.y1 >> 16;
> > > >  	int h_src =3D drm_rect_height(&composer->src) >> 16;
> > > >  	int w_src =3D drm_rect_width(&composer->src) >> 16;
> > > > -	u32 crc =3D 0;
> > > > +	u32 crc =3D 0, pixel =3D 0;
> > > > =20
> > > > -	for (i =3D y_src; i < y_src + h_src; ++i) {
> > > > -		for (j =3D x_src; j < x_src + w_src; ++j) {
> > > > -			src_offset =3D composer->offset
> > > > -				     + (i * composer->pitch)
> > > > -				     + (j * composer->cpp);
> > > > +	for (y =3D y_src; y < y_src + h_src; ++y) {
> > > > +		for (x =3D x_src; x < x_src + w_src; ++x) {
> > > >  			/* XRGB format ignores Alpha channel */
> > > > -			memset(vaddr_out + src_offset + 24, 0,  8);
> > > > -			crc =3D crc32_le(crc, vaddr_out + src_offset,
> > > > -				       sizeof(u32));
> > > > +			pixel =3D get_pixel_from_buffer(x, y, vaddr, composer);
> > > > +			bitmap_clear((void *)&pixel, 0, 8);
> > > > +			crc =3D crc32_le(crc, (void *)&pixel, sizeof(u32));
> > > >  		}
> > > >  	}
> > > > =20
> > > > --=20
> > > > 2.21.0
> > >=20
> > > --=20
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >=20
> > --=20
> > Rodrigo Siqueira
> > https://siqueira.tech
>=20
>=20
>=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Rodrigo Siqueira
https://siqueira.tech

--qp4bmywubblpnone
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0uiEAACgkQWJzP/com
vP8X0xAAxp4KZSRHIF9p/L79o4+j8/J2PBMeibgeeQsw2NFfff6rbip2bM4sfccv
mjdtxPGJHMUWr/vdeRvokp9kg9QWE/ZOxmX+u07c+/x+qxPhB1/p3uogpNpRvsZ+
SF2xG8riCOmTuKetflJUh7chAm/RDPM/TaajZfUGIIwY9gQm1/C0WyumBp85izpU
Nk1dk6Dj/xplD8d+19P7uKgUDc+d3P4ogRbUQKW5NqvgrXyXxa4Zzv1W40BKwsIS
jx5xQAqrcQUCkOdPRJyzVMLKBe0kagIEhXMHfSlyn+Nlp47AXYUjMlUV4TuY5980
HsWPGAs98tNpCM+jj1bWxym5F0LnKxyxMqHg62gGQLOWQBVdhWLmYtdCf7bI8A0I
95stQVF6CqWxNzcYJ6ffw6ZFNXKVba6uzrPIAWVwYTvX/JmULM9JzZVMG33vbeYH
Yd8grYgJLvRU8k5pc1g5LjXC0+9im1Jr10mmywgUhipErbMxXOfhMuIe2/2lsx5v
zkMk/UTlVZQrXxJOw4NUXeb0wDXelrTR3/5cSDT0uMWjSU84AFQLvd5767YxqD+h
odiOohM4xAEkB7478GVvwsyjUMf9Tn1QGeWX/m2lsZgv2qYmT5zgVkG1H7jzSEO7
mRzB0k/z3o9M40wzDebVg5TRcyNOdn3+8xKFumWmvmNXuGYMOAU=
=ajCg
-----END PGP SIGNATURE-----

--qp4bmywubblpnone--

--===============2005163010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2005163010==--
