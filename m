Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86921AF6A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 08:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059366EB6E;
	Fri, 10 Jul 2020 06:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2BA6EB6E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 06:28:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF4C0AC5E;
 Fri, 10 Jul 2020 06:28:24 +0000 (UTC)
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20200709193016.291267-1-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
Date: Fri, 10 Jul 2020 08:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709193016.291267-1-sam@ravnborg.org>
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
Cc: sparclinux@vger.kernel.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============1313423341=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1313423341==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PH8cRnOCkTaFLVPbHBLV0oa1JCyvUrVDc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PH8cRnOCkTaFLVPbHBLV0oa1JCyvUrVDc
Content-Type: multipart/mixed; boundary="RsJANgEUq0jelz8BFBgDCcTyPyCYJh2Sf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Message-ID: <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
References: <20200709193016.291267-1-sam@ravnborg.org>
In-Reply-To: <20200709193016.291267-1-sam@ravnborg.org>

--RsJANgEUq0jelz8BFBgDCcTyPyCYJh2Sf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> Mark reported that sparc64 would panic while booting using qemu.
> Mark bisected this to a patch that introduced generic fbdev emulation t=
o
> the bochs DRM driver.
> Mark pointed out that a similar bug was fixed before where
> the sys helpers was replaced by cfb helpers.
>=20
> The culprint here is that the framebuffer reside in IO memory which
> requires SPARC ASI_PHYS (physical) loads and stores.
>=20
> The current bohcs DRM driver uses a shadow buffer.
> So all copying to the framebuffer happens in
> drm_fb_helper_dirty_blit_real().
>=20
> The fix is to replace the memcpy with memcpy_toio() from io.h.
>=20
> memcpy_toio() uses writeb() where the original fbdev code
> used sbus_memcpy_toio(). The latter uses sbus_writeb().
>=20
> The difference between writeb() and sbus_memcpy_toio() is
> that writeb() writes bytes in little-endian, where sbus_writeb() writes=

> bytes in big-endian. As endian does not matter for byte writes they are=

> the same. So we can safely use memcpy_toio() here.
>=20
> For many architectures memcpy_toio() is a simple memcpy().
> One sideeffect that is unknow is if this has any impact on other
> architectures.
> So far the analysis tells that this change is OK for other arch's.
> but testing would be good.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org

So this actually is a problem in practice. Do you know how userspace
handles this?

For this patch

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

but I'd like to have someone with more architecture expertise ack this
as well.

Best regards
Thomas

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index 5609e164805f..4d05b0ab1592 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct dr=
m_fb_helper *fb_helper,
>  	unsigned int y;
> =20
>  	for (y =3D clip->y1; y < clip->y2; y++) {
> -		memcpy(dst, src, len);
> +		memcpy_toio(dst, src, len);
>  		src +=3D fb->pitches[0];
>  		dst +=3D fb->pitches[0];
>  	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RsJANgEUq0jelz8BFBgDCcTyPyCYJh2Sf--

--PH8cRnOCkTaFLVPbHBLV0oa1JCyvUrVDc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ICocUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOWQQf9G3fcmhGdnaUUOgIOz0YLGOwKo8LO
bsUzak9Uee+FXwO7fgVZBOXf827nRUpnEAMeB2YpSD/qy1lpEYZ/zrJS+tV0wc1A
RUUVvBFAOtOC32PCzUPzEoRlpjGk2FBlr6UQMqPfXaQFwRIeWeo+ICcMB+WoKbm/
GH2X82kTqwEg775iFxBfA0kSWF7wcI7PZswaFRUEBoVx0zhVBEmUWs6/kfW5Orsk
2z2NqKP65BuJoAJ+EfFpEuAFDYPop30ip/ukHAJtradlljJjtQwFjg9cbkkrUG6O
zr7H6lT/1iCbCtWRADed/bjrCAoLe/YSqACG1xc05splErGT6ASQAbe41w==
=iAQZ
-----END PGP SIGNATURE-----

--PH8cRnOCkTaFLVPbHBLV0oa1JCyvUrVDc--

--===============1313423341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1313423341==--
