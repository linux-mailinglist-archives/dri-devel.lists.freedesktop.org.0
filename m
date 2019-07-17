Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042066B452
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 04:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EF66E1FB;
	Wed, 17 Jul 2019 02:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CCD6E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 02:07:42 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d79so16221513qke.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 19:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IP2uVEPbIAzpGypWmMwZYQMjWgXBZrIwHeY5kTSzUnI=;
 b=loYyERrMBJgAwwyYSqIJaUG6J9aYWMiLKNX9R4oVtbHLNgI7so5dJuKq+HDCeP8bAa
 A4oxXFcXNikILJRnbeEE9Dkgf8nv964f7yotQ3uK5hGCql30m/O0PDkFgHK91Z1jpLKg
 XecwevEVgUvjLl9NQiuI0AvofxOdD6H1apPfoWGkKy6P3JoJi5C9V91KU3xCm0LrXK3+
 vjqDaJ3yAc8PDbdQoZ2rNf8d8s+ShSCgJAh+NvegzezIBwBvWS6vq2taoiKu3lizloSf
 cRzImcHG2sOjnlB/CCCFNsEKC/k5ytgSWuBjEtwps2nlKfQhuOgDk5fcgAPmkXdzAyhe
 JCYA==
X-Gm-Message-State: APjAAAU+4Rw+uJw/fnV1NKlmslgNT3ePGeaB5iCH4lW39h6SBEEdttb/
 hJgtkwG3QyZ/OBsJXYo9X/s=
X-Google-Smtp-Source: APXvYqwfs67gIsEgSMn9ao9dkNWeVyQRe9zLOKH4bwrfNlAqh1g5Zvyh7UcvSZEZS0E5T/kEtWoJyw==
X-Received: by 2002:a05:620a:142e:: with SMTP id
 k14mr24078298qkj.336.1563329261678; 
 Tue, 16 Jul 2019 19:07:41 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id z18sm10659315qka.12.2019.07.16.19.07.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 19:07:41 -0700 (PDT)
Date: Tue, 16 Jul 2019 23:07:37 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] drm/vkms: Add support for vkms work without vblank
Message-ID: <20190717020737.z2mu64s3lfyt7pl7@smtp.gmail.com>
References: <20190710015514.42anrmx3r2ijaomz@smtp.gmail.com>
 <20190710164036.GZ15868@phenom.ffwll.local>
 <20190712025718.wdlafaujpxhpupj7@smtp.gmail.com>
 <20190716090345.GX15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190716090345.GX15868@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IP2uVEPbIAzpGypWmMwZYQMjWgXBZrIwHeY5kTSzUnI=;
 b=QduOLZsrNp0z6hne15BBhmgcbZc0yNFvihobCtsn7/Tlf9116Wd1UfbQP3H1pGpbUv
 /2gml2kbhUt5y2KOplxKzcXdUGs2MJA7/cykVzJBm5oaYeHrNtFh3fbom6OxYu892o7z
 GokTxnEUcwZuwdpmR8dssn4IBq+bIheL97qADs4G1UUvCnq7yasCRdvRSU5DHk1MP1W8
 nWysr2BRTlJnb9wzAb+U1FkBGltEahmJVCaiBZqLfyfDvu+cmEIQx1H4H1m0o5TvU1LB
 WN6O6d9AbTiFhjxc+61dg4Unl/XA/xu1s7kcKBnRFpLt76LuGlLNdsX0Tetzg8TM/mwi
 /BuQ==
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
Content-Type: multipart/mixed; boundary="===============0032845902=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0032845902==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wy4ejomefpiiq7cz"
Content-Disposition: inline


--wy4ejomefpiiq7cz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/16, Daniel Vetter wrote:
> On Thu, Jul 11, 2019 at 11:57:18PM -0300, Rodrigo Siqueira wrote:
> > On 07/10, Daniel Vetter wrote:
> > > On Tue, Jul 09, 2019 at 10:55:14PM -0300, Rodrigo Siqueira wrote:
> > > > Currently, vkms only work with enabled VBlank. This patch adds anot=
her
> > > > operation model that allows vkms to work without VBlank support. In=
 this
> > > > scenario, vblank signaling is faked by calling drm_send_vblank_even=
t()
> > > > in vkms_crtc_atomic_flush(); this approach works due to the
> > > > drm_vblank_get() =3D=3D 0 checking.
> > > >=20
> > > > Changes since V2:
> > > >  - Rebase
> > > >=20
> > > > Changes since V1:
> > > >   Daniel Vetter:
> > > >   - Change module parameter name from disablevblank to virtual_hw
> > > >   - Improve parameter description
> > > >   - Improve commit message
> > > >=20
> > > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_crtc.c | 10 ++++++++++
> > > >  drivers/gpu/drm/vkms/vkms_drv.c  | 13 +++++++++++--
> > > >  drivers/gpu/drm/vkms/vkms_drv.h  |  2 ++
> > > >  3 files changed, 23 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkm=
s/vkms_crtc.c
> > > > index 49a8ec2cb1c1..a0c75b8c4335 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -207,12 +207,22 @@ static int vkms_crtc_atomic_check(struct drm_=
crtc *crtc,
> > > >  static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >  				    struct drm_crtc_state *old_state)
> > > >  {
> > > > +	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> > > > +
> > > > +	if (vkms_out->disable_vblank)
> > > > +		return;
> > > > +
> > > >  	drm_crtc_vblank_on(crtc);
> > > >  }
> > > > =20
> > > >  static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> > > >  				     struct drm_crtc_state *old_state)
> > > >  {
> > > > +	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> > > > +
> > > > +	if (vkms_out->disable_vblank)
> > > > +		return;
> > > > +
> > > >  	drm_crtc_vblank_off(crtc);
> > > >  }
> > > > =20
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms=
/vkms_drv.c
> > > > index 152d7de24a76..542a002ef9d5 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > @@ -34,6 +34,11 @@ bool enable_writeback;
> > > >  module_param_named(enable_writeback, enable_writeback, bool, 0444);
> > > >  MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback conne=
ctor");
> > > > =20
> > > > +bool virtual_hw;
> > >=20
> > > Can be static, you only use this in vkms_drv.c.
> > >=20
> > > > +module_param_named(virtual_hw, virtual_hw, bool, 0444);
> > > > +MODULE_PARM_DESC(virtual_hw,
> > > > +		 "Enable virtual hardware mode (disables vblanks and immediately=
 completes flips)");
> > > > +
> > > >  static const struct file_operations vkms_driver_fops =3D {
> > > >  	.owner		=3D THIS_MODULE,
> > > >  	.open		=3D drm_open,
> > > > @@ -154,9 +159,13 @@ static int __init vkms_init(void)
> > > >  	if (ret)
> > > >  		goto out_unregister;
> > > > =20
> > > > -	vkms_device->drm.irq_enabled =3D true;
> > > > +	vkms_device->output.disable_vblank =3D virtual_hw;
> > > > +	vkms_device->drm.irq_enabled =3D !virtual_hw;
> > > > +
> > > > +	if (virtual_hw)
> > > > +		DRM_INFO("Virtual hardware mode enabled");
> > > > =20
> > > > -	ret =3D drm_vblank_init(&vkms_device->drm, 1);
> > > > +	ret =3D (virtual_hw) ? 0 : drm_vblank_init(&vkms_device->drm, 1);
> > > >  	if (ret) {
> > > >  		DRM_ERROR("Failed to vblank\n");
> > > >  		goto out_fini;
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms=
/vkms_drv.h
> > > > index 9ff2cd4ebf81..256e5e65c947 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > @@ -21,6 +21,7 @@
> > > > =20
> > > >  extern bool enable_cursor;
> > > >  extern bool enable_writeback;
> > > > +extern bool virtual_hw;
> > > > =20
> > > >  struct vkms_composer {
> > > >  	struct drm_framebuffer fb;
> > > > @@ -69,6 +70,7 @@ struct vkms_output {
> > > >  	struct drm_connector connector;
> > > >  	struct drm_writeback_connector wb_connector;
> > > >  	struct hrtimer vblank_hrtimer;
> > > > +	bool disable_vblank;
> > > >  	ktime_t period_ns;
> > > >  	struct drm_pending_vblank_event *event;
> > > >  	/* ordered wq for composer_work */
> > >=20
> > > I'm kinda wondering how this works at all ... does writeback/crc still
> > > work if you set virtual mode? Writeback since this seems based on the
> > > writeback series ...
> >=20
> > Hi,
> >=20
> > I tested this patch with kms_flip with the "drm/drm_vblank: Change
> > EINVAL by the correct errno" patch [1]. However, you=E2=80=99re right a=
bout the
> > writeback/crc tests, they does not pass because this patch disables
> > vblank which in turn does not invoke "vkms_vblank_simulate()".
> >=20
> > In this sense, I=E2=80=99m a little bit confused about how should I han=
dle this
> > issue. If I correctly understood, without vblank support we have to
> > trigger vkms_composer_worker() when the userspace invoke
> > drmModePageFlip(), am I right?  If so, an approach could add page_flip()
> > callback to vkms and invoke vkms_composer_worker(); however, the
> > documentation says that page_flip is a legacy entry point. Do you have a
> > suggestion?
>=20
> We need this in atomic, for everyone. So instead of launching a vblank and
> letting the vblank simulation kick off the crc/writeback work,
> atomic_flush needs to also kick of the crc/vblank work. And make sure that
> we feed the same vblank frame count values to the generated vblank even as
> to the crc work (or maybe those are hardcoded to 0 for vblank-less, not
> sure).
> -Daniel

Just for checking if I correctly understood... the idea is reworking
vkms_vblank_simulate() a little bit in order to decouple the kick of
crc/writeback to atomic_flush(). Right?
=20
> >=20
> > 1. https://patchwork.freedesktop.org/patch/314399/?series=3D50697&rev=
=3D7
> >=20
> > Thanks
> > =20
> > > btw if you send out patches that need other patches, point at that ot=
her
> > > series in the cover letter or patch. Gets confusing fast otherwise.
> > > -Daniel
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

--wy4ejomefpiiq7cz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0ugugACgkQWJzP/com
vP/+aA/9EP5Fdxa15qHv0znCbXQ1doJyn/FqSXV5T4w3fTgRZM8+GIEvS6xHEN1J
sswU8lpuPzAmoFnwXhNY503JENCAMVp50sr1OQIJPwGja1jLAYqpGedKUKLrXMwm
QTX7EjaQWNysRy4oy22XFTga2ozCAMWOhlGOjLyij+3nzZ4kWJKajpvMoy5NeL3U
SiFlEFQ34uEv5/rKqGyMZRQOojdW1T2ityHdzscJf0eGC+FS5AQtBHev9O6tTPQd
QTiQXPL4SE7a79dEuDSWCp2F/F2Lfy0p+8f2Q0kbJrfxNhTouifhRVJAZZQTXfcJ
JWjBKjXUpkCuy2LGdxZmpt3dTLtawys4KtyJCRL3HU/dWJ1pEUDpIrvNzUdTFdHt
6qlB1dn6aoUp8XhNt3s6BTV99/021KxZR+lLhL6+tWxIg4/pdn+SpZnCkxC2eloP
VjuH+DCgWc5wtZAFOaCq+7qeebqYmfIjIDzeeim6TLoAaNx4zz75Zjpz4zDifxtK
46eSygog5AHoqKtYWN31wJQOWeDZtwf1I2/Kio2VgJEdICKGv9I/7aRgab+2pvj1
3FWalEoKnaDm8kRVHJVw8/NZrL6ui0rwMjm/VUBgRjGOvBXxarVbtGXQjDuwEdrN
hnqtY3ynwYQsyIbc+7IVwrSwNiWKQJsM31TlBP5mzUBWmwitCpk=
=Rsi1
-----END PGP SIGNATURE-----

--wy4ejomefpiiq7cz--

--===============0032845902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0032845902==--
