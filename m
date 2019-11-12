Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E001F9313
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821BD6EB4C;
	Tue, 12 Nov 2019 14:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07136EB4C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:51:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 28B9CB175;
 Tue, 12 Nov 2019 14:51:14 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
 <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
 <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com>
 <6da6c49a-572a-343a-ddb1-103ca7080ccd@suse.de>
 <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <052a2dd7-9a18-bf0b-7b7f-3396cc5c0dcf@suse.de>
Date: Tue, 12 Nov 2019 15:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0913992498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0913992498==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7ms9Y1BP9yystKN85YGsM8yjCQZmYeq8i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7ms9Y1BP9yystKN85YGsM8yjCQZmYeq8i
Content-Type: multipart/mixed; boundary="9I7o42pKcUDMNMaEdlSAPFhS39fFeLRAW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Message-ID: <052a2dd7-9a18-bf0b-7b7f-3396cc5c0dcf@suse.de>
Subject: Re: [PATCH 1/4] drm/udl: Replace fbdev code with generic emulation
References: <20191108123333.25274-1-tzimmermann@suse.de>
 <20191108123333.25274-2-tzimmermann@suse.de>
 <e8b90928-fdae-36e0-f116-8b49159c4aad@tronnes.org>
 <1704c1d6-ec08-211b-0677-6c22f96ca7aa@suse.de>
 <CAKMK7uF7M60NcPTGicQVJ=09pqf4ua4kWaCmdCcDaC13AgTFQw@mail.gmail.com>
 <6da6c49a-572a-343a-ddb1-103ca7080ccd@suse.de>
 <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>
In-Reply-To: <CAKMK7uHiXtg=FCpqv7ekpopd=2Hofrs7oR3qPNsf8e_E_Wv08w@mail.gmail.com>

--9I7o42pKcUDMNMaEdlSAPFhS39fFeLRAW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.11.19 um 15:31 schrieb Daniel Vetter:
> On Tue, Nov 12, 2019 at 3:03 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 12.11.19 um 14:40 schrieb Daniel Vetter:
>>> On Tue, Nov 12, 2019 at 12:55 PM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>>>>
>>>> Hi
>>>>
>>>> Am 08.11.19 um 16:37 schrieb Noralf Tr=C3=B8nnes:
>>>>>
>>>>>
>>>>> Den 08.11.2019 13.33, skrev Thomas Zimmermann:
>>>>>> The udl driver can use the generic fbdev implementation. Convert i=
t.
>>>>>>
>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> ---
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/u=
dl_drv.c
>>>>>> index 563cc5809e56..55c0f9dfee29 100644
>>>>>> --- a/drivers/gpu/drm/udl/udl_drv.c
>>>>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>>>>>
>>>>>> @@ -47,6 +48,8 @@ static struct drm_driver driver =3D {
>>>>>>      .driver_features =3D DRIVER_MODESET | DRIVER_GEM,
>>>>>>      .release =3D udl_driver_release,
>>>>>>
>>>>>> +    .lastclose =3D drm_fb_helper_lastclose,
>>>>>> +
>>>>>
>>>>> No need to set this, it's already wired up:
>>>>>
>>>>> drm_lastclose -> drm_client_dev_restore -> drm_fbdev_client_restore=
 ->
>>>>> drm_fb_helper_lastclose
>>>>>
>>>>>>      /* gem hooks */
>>>>>>      .gem_create_object =3D udl_driver_gem_create_object,
>>>>>>
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/ud=
l_fb.c
>>>>>> index f8153b726343..afe74f892a2b 100644
>>>>>> --- a/drivers/gpu/drm/udl/udl_fb.c
>>>>>> +++ b/drivers/gpu/drm/udl/udl_fb.c
>>>>>> @@ -20,19 +20,9 @@
>>>>>>
>>>>>>  #include "udl_drv.h"
>>>>>>
>>>>>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay i=
n jiffies */
>>>>>> -
>>>>>> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_=
defio mmap support */
>>>>>>  static int fb_bpp =3D 16;
>>>>>>
>>>>>>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);=

>>>>>
>>>>> Maybe fb_bpp can be dropped too?
>>>>
>>>> Sure, makes sense.
>>>>
>>>> The driver exposes a preferred color depth of 24 bpp, which we may w=
ant
>>>> to change to 16 then. The internal framebuffer is only 16 bpp anyway=
=2E
>>>
>>> Just something that crossed my mind: Should we ensure that the
>>> preferred format of the primary plane (should be the first in the
>>> format array) matches up with the preferred bpp setting? Maybe even
>>> enforce that for drivers with an explicit primary plane (i.e. atomic
>>> drivers). I think tiny drivers get this right already.
>>
>> IMHO that makes if the userspace can handle it. The preferred bpp coul=
d
>> also be retrieved from the formats array automatically. What about HW
>> with multiple CRTCs with different format defaults (sounds weird, I kn=
ow)?
>=20
> Ime I haven't seen such a case yet. What I have seen is that the most
> preferred format might be some fancy compressed format, which not all
> formats support. But which you can't render into without mesa anyway,
> so really doesn't matter for preferred bpp.
>=20
>> WRT udl: For v3 of this patchset I've set the preferred color depth to=

>> 32 bpp; although the internal FB is always at 16 bpp. Because when I
>> tested with a dual-screen setup (radeon + udl) X11 didn't support the =
16
>> bpp output on the second screen (the one driven by udl). Only setting
>> both screen to 32 bpp worked out of the box. And the preferred 24 bpp
>> are not even supported by udl.
>=20
> Uh, if we can only set preferred bpp to make X happy, and X can only
> support one preferred bpp, then everyone needs to set 32bit. Which
> defeats the point (and we'd need to hardcode it to 32bpp). Is this
> really the case?

I guess it would have worked if both screens preferred 16 bpp.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> It's possible to set it on the command line:
>>>>>
>>>>> video=3D<xres>x<yres>-<bpp>
>>>>>
>>>>> I haven't tried it so I can't say for certain that it actually work=
s>
>>>>> Ref: Documentation/fb/modedb.rst and drm_fb_helper_single_fb_probe(=
)
>>>>>
>>>>>> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP=
);
>>>>>> -
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/u=
dl/udl_modeset.c
>>>>>> index bc1ab6060dc6..1517d5e881b8 100644
>>>>>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>>>>>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>>>>>
>>>>>> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *de=
v)
>>>>>>
>>>>>>  static const struct drm_mode_config_funcs udl_mode_funcs =3D {
>>>>>>      .fb_create =3D udl_fb_user_fb_create,
>>>>>> -    .output_poll_changed =3D NULL,
>>>>>> +    .output_poll_changed =3D drm_fb_helper_output_poll_changed,
>>>>>
>>>>> No need to set this, it's already wired up:
>>>>>
>>>>> drm_kms_helper_hotplug_event -> drm_client_dev_hotplug ->
>>>>> drm_fbdev_client_hotplug -> drm_fb_helper_hotplug_event
>>>>>
>>>>> Noralf.
>>>>>
>>>>>>  };
>>>>>>
>>>>>>  int udl_modeset_init(struct drm_device *dev)
>>>>>>
>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9I7o42pKcUDMNMaEdlSAPFhS39fFeLRAW--

--7ms9Y1BP9yystKN85YGsM8yjCQZmYeq8i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3Kxt0ACgkQaA3BHVML
eiNC5Af9EEf64Ukf3hOmjCYdG/NcuYMMAnCKMpU3jlyJbHhuGShUysG8YaFenEk5
Vj2IzEpmqr2ZUkyuKSxmc8gFXjZxcHK1Bw36cbltkxziU5FGQtDv+ymH0TkilOti
77xx4ENzJpbomJhurSS4a2YCaGeGRDdQSdwyPb+mXp6lV/23XgAg+hzL4amD4LyT
QWKFwzbpirzgykqAtuv8o20OVfM04A3I4zA565EKALqkolQcJgLxL4SGLlVCJWEH
uUrqADaW/qk5jVpwiOtMKZgPll1J0v2xMmzYcTgo5z4YrifTVqF8O9+FsT1hCL4o
0X/GeikklPyG2r+TTfVDhyvI4cLLmw==
=0M+L
-----END PGP SIGNATURE-----

--7ms9Y1BP9yystKN85YGsM8yjCQZmYeq8i--

--===============0913992498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0913992498==--
