Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3115278B54
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 16:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2285C6ED03;
	Fri, 25 Sep 2020 14:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C78D6ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:55:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25CEAAD72;
 Fri, 25 Sep 2020 14:55:08 +0000 (UTC)
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
Date: Fri, 25 Sep 2020 16:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200629084044.GL3278063@phenom.ffwll.local>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1614320173=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1614320173==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kDiacfcIijuUKBfdAjXiQACCPbrTm8b40"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kDiacfcIijuUKBfdAjXiQACCPbrTm8b40
Content-Type: multipart/mixed; boundary="A9L1xDk6jW0FmwNvLqlHLTtWsUSTjbRcL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 kraxel@redhat.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 sam@ravnborg.org, emil.l.velikov@gmail.com, noralf@tronnes.org,
 geert+renesas@glider.be, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
In-Reply-To: <20200629084044.GL3278063@phenom.ffwll.local>

--A9L1xDk6jW0FmwNvLqlHLTtWsUSTjbRcL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.06.20 um 10:40 schrieb Daniel Vetter:
> On Thu, Jun 25, 2020 at 02:00:03PM +0200, Thomas Zimmermann wrote:
>> The memcpy's destination buffer might have a different pitch than the
>> source. Support different pitches as function argument.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> But I do have questions ... why did we allocate a source drm_framebuffe=
r
> with mismatching pitch? That sounds backwards, especially for simplekms=
=2E

There's userspace that allocates framebuffers in tiles of 64x64 pixels.
I think I've seen this with Gnome. So if you have a 800x600 display
mode, the allocated framebuffer has a scanline pitch of 832 pixels and
the final 32 pixels are ignored.

In regular drivers, we can handle this with the VGA offset register [1]
or some equivalent. That's obviously not an option with simplekms, so
the different pitch is required.

Best regards
Thomas

[1]
https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga/cr=
tcreg.htm#13

>=20
> Would be good to add the reasons why we need this to the commit message=
,
> I'm sure I'll discover it later on eventually.
> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>>  drivers/gpu/drm/tiny/cirrus.c          | 2 +-
>>  include/drm/drm_format_helper.h        | 2 +-
>>  4 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm=
_format_helper.c
>> index c043ca364c86..8d5a683afea7 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
>>  /**
>>   * drm_fb_memcpy_dstclip - Copy clip buffer
>>   * @dst: Destination buffer (iomem)
>> + * @dst_pitch: Number of bytes between two consecutive scanlines with=
in dst
>>   * @vaddr: Source buffer
>>   * @fb: DRM framebuffer
>>   * @clip: Clip rectangle area to copy
>> @@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
>>   * This function applies clipping on dst, i.e. the destination is a
>>   * full (iomem) framebuffer but only the clip rect content is copied =
over.
>>   */
>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>> -			   struct drm_framebuffer *fb,
>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch,=

>> +			   void *vaddr, struct drm_framebuffer *fb,
>>  			   struct drm_rect *clip)
>>  {
>>  	unsigned int cpp =3D fb->format->cpp[0];
>> -	unsigned int offset =3D clip_offset(clip, fb->pitches[0], cpp);
>> +	unsigned int offset =3D clip_offset(clip, dst_pitch, cpp);
>>  	size_t len =3D (clip->x2 - clip->x1) * cpp;
>>  	unsigned int y, lines =3D clip->y2 - clip->y1;
>> =20
>> @@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *=
vaddr,
>>  	for (y =3D 0; y < lines; y++) {
>>  		memcpy_toio(dst, vaddr, len);
>>  		vaddr +=3D fb->pitches[0];
>> -		dst +=3D fb->pitches[0];
>> +		dst +=3D dst_pitch;
>>  	}
>>  }
>>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index f16bd278ab7e..7d4f3a62d885 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -1586,7 +1586,7 @@ mgag200_handle_damage(struct mga_device *mdev, s=
truct drm_framebuffer *fb,
>>  	if (drm_WARN_ON(dev, !vmap))
>>  		return; /* BUG: SHMEM BO should always be vmapped */
>> =20
>> -	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
>> +	drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, clip);
>> =20
>>  	drm_gem_shmem_vunmap(fb->obj[0], vmap);
>> =20
>> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirr=
us.c
>> index 744a8e337e41..2dd9e5e31e3d 100644
>> --- a/drivers/gpu/drm/tiny/cirrus.c
>> +++ b/drivers/gpu/drm/tiny/cirrus.c
>> @@ -327,7 +327,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuf=
fer *fb,
>>  		goto out_dev_exit;
>> =20
>>  	if (cirrus->cpp =3D=3D fb->format->cpp[0])
>> -		drm_fb_memcpy_dstclip(cirrus->vram,
>> +		drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
>>  				      vmap, fb, rect);
>> =20
>>  	else if (fb->format->cpp[0] =3D=3D 4 && cirrus->cpp =3D=3D 2)
>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_=
helper.h
>> index 5f9e37032468..2b5036a5fbe7 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -11,7 +11,7 @@ struct drm_rect;
>> =20
>>  void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb=
,
>>  		   struct drm_rect *clip);
>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch,=
 void *vaddr,
>>  			   struct drm_framebuffer *fb,
>>  			   struct drm_rect *clip);
>>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>> --=20
>> 2.27.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--A9L1xDk6jW0FmwNvLqlHLTtWsUSTjbRcL--

--kDiacfcIijuUKBfdAjXiQACCPbrTm8b40
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9uBMgUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiONuQgAieR3dDSUQF97TGQNMssWjDaI1AZT
11Hu89gGwhTwPBHTCoMpBq3eSQArZ1FhGI9J86WuY944B6D7gXlPBqQPUczVEYTH
Eb2m8mtcHD59AiXUWxX+ASvzO7a8dy0HI6o9tqz0kPMsl1vO2IAq5uqazX/Hn3pQ
rKSGGTLM1E5uIkcDx00Lw4b3GkEhJK+sBsO8P14D79408RzogFWhPP57EshbsrHB
ubPaLSP9xqx9oqZ+SGtgyt3sSMzGevqNMepwgFQg8tdy067VMT7bUlAz8TkEgu42
72kmU09Wekja+SWr/pvcfw54oXJ0Y9pB0jz8CsDFG3tGoM6SHE4Gsv41Bg==
=uukp
-----END PGP SIGNATURE-----

--kDiacfcIijuUKBfdAjXiQACCPbrTm8b40--

--===============1614320173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1614320173==--
