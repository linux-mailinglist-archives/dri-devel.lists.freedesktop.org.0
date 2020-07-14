Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5121E875
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 08:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723366E8D0;
	Tue, 14 Jul 2020 06:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C8A6E8D0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 06:42:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6365AB63C;
 Tue, 14 Jul 2020 06:42:05 +0000 (UTC)
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
Date: Tue, 14 Jul 2020 08:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713162159.GR3278063@phenom.ffwll.local>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============0617706950=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0617706950==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CORC0zEjPuqDegBvc23qgRAjUGFqa0i64"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CORC0zEjPuqDegBvc23qgRAjUGFqa0i64
Content-Type: multipart/mixed; boundary="PvCoiGMpu0NDX4cWnm9N0YKgT4JN6IfUn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 "David S. Miller" <davem@davemloft.net>
Message-ID: <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local>
In-Reply-To: <20200713162159.GR3278063@phenom.ffwll.local>

--PvCoiGMpu0NDX4cWnm9N0YKgT4JN6IfUn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.07.20 um 18:21 schrieb Daniel Vetter:
> On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
>>> Mark reported that sparc64 would panic while booting using qemu.
>>> Mark bisected this to a patch that introduced generic fbdev emulation=
 to
>>> the bochs DRM driver.
>>> Mark pointed out that a similar bug was fixed before where
>>> the sys helpers was replaced by cfb helpers.
>>>
>>> The culprint here is that the framebuffer reside in IO memory which
>>> requires SPARC ASI_PHYS (physical) loads and stores.
>>>
>>> The current bohcs DRM driver uses a shadow buffer.
>>> So all copying to the framebuffer happens in
>>> drm_fb_helper_dirty_blit_real().
>>>
>>> The fix is to replace the memcpy with memcpy_toio() from io.h.
>>>
>>> memcpy_toio() uses writeb() where the original fbdev code
>>> used sbus_memcpy_toio(). The latter uses sbus_writeb().
>>>
>>> The difference between writeb() and sbus_memcpy_toio() is
>>> that writeb() writes bytes in little-endian, where sbus_writeb() writ=
es
>>> bytes in big-endian. As endian does not matter for byte writes they a=
re
>>> the same. So we can safely use memcpy_toio() here.
>>>
>>> For many architectures memcpy_toio() is a simple memcpy().
>>> One sideeffect that is unknow is if this has any impact on other
>>> architectures.
>>> So far the analysis tells that this change is OK for other arch's.
>>> but testing would be good.
>>>
>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>> Cc: sparclinux@vger.kernel.org
>>
>> So this actually is a problem in practice. Do you know how userspace
>> handles this?
>>
>> For this patch
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> but I'd like to have someone with more architecture expertise ack this=

>> as well.
>>
>> Best regards
>> Thomas
>>
>>> ---
>>>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb=
_helper.c
>>> index 5609e164805f..4d05b0ab1592 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct =
drm_fb_helper *fb_helper,
>>>  	unsigned int y;
>>> =20
>>>  	for (y =3D clip->y1; y < clip->y2; y++) {
>>> -		memcpy(dst, src, len);
>>> +		memcpy_toio(dst, src, len);
>=20
> I don't think we can do this unconditionally, there's fbdev-helper driv=
ers
> using shmem helpers, and for shmem memcpy_toio is wrong. We need a swit=
ch
> to fix this properly I think.

I once has a patch set for this problem, but it didn't make it. [1]

Buffers can move between I/O and system memory, so a simple flag would
not work. I'd propose this

bool drm_gem_is_iomem(struct drm_gem_object *obj)
{
	if (obj->funcs && obj->funcs->is_iomem)
		return obj->funcs->is_iomem(obj);
	return false;
}

Most GEM implmentations wouldn't bother, but VRAM helpers could set the
is_iomem function and return the current state. Fbdev helpers can then
pick the correct memcpy_*() function.

Best regards
Thomas

[1]
https://lore.kernel.org/dri-devel/20191106093121.21762-1-tzimmermann@suse=
=2Ede/

>=20
> What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
> version, for which we don't have any drivers really. But I do think we
> need to differentiate between memcpy and memcpy_tio. That's what this
> entire annoying _cfb_ vs _sys_ business is all about, and also what gem=

> vram helpers have to deal with.
> -Daniel
>=20
>>>  		src +=3D fb->pitches[0];
>>>  		dst +=3D fb->pitches[0];
>>>  	}
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PvCoiGMpu0NDX4cWnm9N0YKgT4JN6IfUn--

--CORC0zEjPuqDegBvc23qgRAjUGFqa0i64
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8NU7oUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOc+wf7BJOgG3gY2XMYu1hbJWOnud4U5Z2S
3RaT6+k2YBaR21zgGGL7oj1ZFeN78huk23dYVk04CjWsKTJaYO1HC9ZWlWgc1xn0
yr7adW012jeiXrCrrrYY9efcJoytRTc93NIzsVsUmfCz9efcrJj9Lrn7QOYq0xH/
wL8PzNL1ACOCzPL2T1j8xJ/G9ckYER0swEbaDW9knSTxkU+VOn67cS08GQdLBMXV
FJ6Ouy3P8drFLJwgrPn8RgYZy60//TQwovB0KFq4Dk9/b1LpRGeQylbueEMiUd0R
N/CVU+TMSlL284tT0S6Ww5ikM0E3Nim4Zov0rivzdr/Slwo9G3V5xahGHw==
=ci3/
-----END PGP SIGNATURE-----

--CORC0zEjPuqDegBvc23qgRAjUGFqa0i64--

--===============0617706950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0617706950==--
