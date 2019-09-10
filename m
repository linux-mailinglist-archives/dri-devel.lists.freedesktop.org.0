Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A9AEC51
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E5D6E0D0;
	Tue, 10 Sep 2019 13:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C786C6E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:51:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3ECECAF90;
 Tue, 10 Sep 2019 13:51:45 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
 <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
 <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <52be9b77-51aa-62b6-8de7-cfb1165c1470@suse.de>
Date: Tue, 10 Sep 2019 15:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0361607657=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0361607657==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5EfGaZM5lDUOLFvHmCvBsfAbV2iGuxP4x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5EfGaZM5lDUOLFvHmCvBsfAbV2iGuxP4x
Content-Type: multipart/mixed; boundary="NKeHs7c7KwSpHgFgTkUh5XnbVYzK7RIrs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@redhat.com, rong.a.chen@intel.com,
 feng.tang@intel.com, ying.huang@intel.com, dri-devel@lists.freedesktop.org
Message-ID: <52be9b77-51aa-62b6-8de7-cfb1165c1470@suse.de>
Subject: Re: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
References: <20190909140633.31260-1-tzimmermann@suse.de>
 <20190909140633.31260-2-tzimmermann@suse.de>
 <20190910115205.tc3oy2dtypwfrf22@sirius.home.kraxel.org>
 <52e8e124-f8e6-d2e6-0102-472b9fa70317@suse.de>
 <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>
In-Reply-To: <1223403a-17a5-638b-49ce-5dba23fe23d5@tronnes.org>

--NKeHs7c7KwSpHgFgTkUh5XnbVYzK7RIrs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.09.19 um 15:34 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 10.09.2019 14.48, skrev Thomas Zimmermann:
>> Hi
>>
>> Am 10.09.19 um 13:52 schrieb Gerd Hoffmann:
>>> On Mon, Sep 09, 2019 at 04:06:32PM +0200, Thomas Zimmermann wrote:
>>>> Before updating the display from the console's shadow buffer, the di=
rty
>>>> worker now waits for vblank. This allows several screen updates to p=
ile
>>>> up and acts as a rate limiter.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  drivers/gpu/drm/drm_fb_helper.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_f=
b_helper.c
>>>> index a7ba5b4902d6..017e2f6bd1b9 100644
>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>> @@ -402,8 +402,20 @@ static void drm_fb_helper_dirty_work(struct wor=
k_struct *work)
>>>>  						    dirty_work);
>>>>  	struct drm_clip_rect *clip =3D &helper->dirty_clip;
>>>>  	struct drm_clip_rect clip_copy;
>>>> +	struct drm_crtc *crtc;
>>>>  	unsigned long flags;
>>>>  	void *vaddr;
>>>> +	int ret;
>>>> +
>>>> +	/* rate-limit update frequency */
>>>> +	mutex_lock(&helper->lock);
>>>> +	crtc =3D helper->client.modesets[0].crtc;
>>>> +	ret =3D drm_crtc_vblank_get(crtc);
>>>> +	if (!ret) {
>>>> +		drm_crtc_wait_one_vblank(crtc);
>>>> +		drm_crtc_vblank_put(crtc);
>>>> +	}
>>>> +	mutex_unlock(&helper->lock);
>>>
>>> Hmm, not sure it is the best plan to sleep for a while in the worker,=

>>> especially while holding the lock.
>>>
>>> What does the lock protect against here?  Accessing
>>
>> This lock is hold by the fbdev code during mode-setting operations (bu=
t
>> not drawing operations). So *crtc might be gone if we don't hold it he=
re.
>>
>>> helper->client.modesets?  If so then you can unlock before going to
>>> sleep in drm_crtc_wait_one_vblank() I think.
>>
>> I looked, but I cannot find any code that protects crtc while vblank i=
s
>> active. I'd rather not change the current code until someone can clari=
fy.
>>
>=20
> The client->modesets array and the crtc struct member are invariant ove=
r
> the lifetime of client (drm_client_modeset_create()). No need to take a=

> lock for access. See drm_client_modeset_release() for the things that
> _can_ change and needs protection (protected by client->modeset_mutex).=


Thanks for the reply. So we don't need the lock? But why does
drm_fb_helper_ioctl() take it? ioctl exclusiveness?

> I don't see a problem with sleeping in the worker though, but I might
> miss out on something. AFAICS changes will just pile up in >dirty_clip
> and the worker will be scheduled for a new run to happen when it's done=

> with the current update.

Yes, that's the intention of the patch. We hope to reduce the number of
memcpys by handling several of them at once.

Best regards
Thomas

>=20
> Noralf.
>=20
>> Best regards
>> Thomas
>>
>>>
>>> cheers,
>>>   Gerd
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--NKeHs7c7KwSpHgFgTkUh5XnbVYzK7RIrs--

--5EfGaZM5lDUOLFvHmCvBsfAbV2iGuxP4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl13qmwACgkQaA3BHVML
eiO/nAgAsMU9r4Da2Yn3IF/Tn1fyKI182BIaaBtGrN3ybgzOtCOTk496tTNehAii
WvPp5WaqOBSBsrI5W/00FVFcx+P/bYiIFTS8YtYIX4IMc0AEyCV71ULM7vdLsexQ
SfYES+SjTiKyFizBTSv/kP5wYhPOfOeLYB57nmxcHRJwhG8eEe5mhLjby74BHHbm
N8+N6iN2DlWXqlihaM30mNqLJeFjAmoeCaoyRUSUSsOKzzV/lJCtr/8+gOkCXEPk
wIQrbWGcV6Z5QwtWUs80IlIWp74HCRJLr5FFO2JuxKG9MEFobs7A4ZxZnxvOJHV7
wD6bjye3QJyl3mUOtJ6fysYNrzowHA==
=XDIb
-----END PGP SIGNATURE-----

--5EfGaZM5lDUOLFvHmCvBsfAbV2iGuxP4x--

--===============0361607657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0361607657==--
