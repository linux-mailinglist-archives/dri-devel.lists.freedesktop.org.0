Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B6ABA1D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 16:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9786E2A3;
	Fri,  6 Sep 2019 14:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03D6E2A3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 14:01:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2363EB150;
 Fri,  6 Sep 2019 14:01:06 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] drm/vram: Add infrastructure for move_notify()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-3-tzimmermann@suse.de>
 <20190906092822.GD3958@phenom.ffwll.local>
 <5b033377-44a1-ebd1-7fad-322bede05eef@suse.de>
 <CAKMK7uH9V4Zcq0BhphnJhKDx_JfvQyNmqyQi8HnUgHg02bt+_A@mail.gmail.com>
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
Message-ID: <03eea1da-0252-0150-f107-253a9069eda9@suse.de>
Date: Fri, 6 Sep 2019 16:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH9V4Zcq0BhphnJhKDx_JfvQyNmqyQi8HnUgHg02bt+_A@mail.gmail.com>
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
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huang Ying <ying.huang@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1657726924=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1657726924==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="30J8qoeBxqDxIaSkoylSpsQmXhj8KjxbY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--30J8qoeBxqDxIaSkoylSpsQmXhj8KjxbY
Content-Type: multipart/mixed; boundary="8XEhJfI5qfqLF86IWuXKEvftenNCRnja3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Message-ID: <03eea1da-0252-0150-f107-253a9069eda9@suse.de>
Subject: Re: [PATCH v3 2/3] drm/vram: Add infrastructure for move_notify()
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-3-tzimmermann@suse.de>
 <20190906092822.GD3958@phenom.ffwll.local>
 <5b033377-44a1-ebd1-7fad-322bede05eef@suse.de>
 <CAKMK7uH9V4Zcq0BhphnJhKDx_JfvQyNmqyQi8HnUgHg02bt+_A@mail.gmail.com>
In-Reply-To: <CAKMK7uH9V4Zcq0BhphnJhKDx_JfvQyNmqyQi8HnUgHg02bt+_A@mail.gmail.com>

--8XEhJfI5qfqLF86IWuXKEvftenNCRnja3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.09.19 um 15:05 schrieb Daniel Vetter:
> On Fri, Sep 6, 2019 at 12:24 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 06.09.19 um 11:28 schrieb Daniel Vetter:
>>> On Fri, Sep 06, 2019 at 10:52:13AM +0200, Thomas Zimmermann wrote:
>>>> This patch prepares VRAM helpers for lazy unmapping of buffer object=
s.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  drivers/gpu/drm/drm_vram_mm_helper.c | 12 ++++++++++++
>>>>  include/drm/drm_vram_mm_helper.h     |  4 ++++
>>>>  2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_vram_mm_helper.c b/drivers/gpu/drm/=
drm_vram_mm_helper.c
>>>> index c911781d6728..31984690d5f3 100644
>>>> --- a/drivers/gpu/drm/drm_vram_mm_helper.c
>>>> +++ b/drivers/gpu/drm/drm_vram_mm_helper.c
>>>> @@ -98,6 +98,17 @@ static int bo_driver_verify_access(struct ttm_buf=
fer_object *bo,
>>>>      return vmm->funcs->verify_access(bo, filp);
>>>>  }
>>>>
>>>> +static void bo_driver_move_notify(struct ttm_buffer_object *bo,
>>>> +                              bool evict,
>>>> +                              struct ttm_mem_reg *new_mem)
>>>> +{
>>>> +    struct drm_vram_mm *vmm =3D drm_vram_mm_of_bdev(bo->bdev);
>>>> +
>>>> +    if (!vmm->funcs || !vmm->funcs->move_notify)
>>>> +            return;
>>>> +    vmm->funcs->move_notify(bo, evict, new_mem);
>>>> +}
>>>> +
>>>>  static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
>>>>                                  struct ttm_mem_reg *mem)
>>>>  {
>>>> @@ -140,6 +151,7 @@ static struct ttm_bo_driver bo_driver =3D {
>>>>      .eviction_valuable =3D ttm_bo_eviction_valuable,
>>>>      .evict_flags =3D bo_driver_evict_flags,
>>>>      .verify_access =3D bo_driver_verify_access,
>>>> +    .move_notify =3D bo_driver_move_notify,
>>>>      .io_mem_reserve =3D bo_driver_io_mem_reserve,
>>>>      .io_mem_free =3D bo_driver_io_mem_free,
>>>>  };
>>>> diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram=
_mm_helper.h
>>>> index 2aacfb1ccfae..7fb8700f45fe 100644
>>>> --- a/include/drm/drm_vram_mm_helper.h
>>>> +++ b/include/drm/drm_vram_mm_helper.h
>>>> @@ -15,6 +15,8 @@ struct drm_device;
>>>>      &ttm_bo_driver.evict_flags
>>>>   * @verify_access:  Provides an implementation for \
>>>>      struct &ttm_bo_driver.verify_access
>>>> + * @move_notify:    Provides an implementation for
>>>> + *                  struct &ttm_bo_driver.move_notify
>>>>   *
>>>>   * These callback function integrate VRAM MM with TTM buffer object=
s. New
>>>>   * functions can be added if necessary.
>>>> @@ -23,6 +25,8 @@ struct drm_vram_mm_funcs {
>>>>      void (*evict_flags)(struct ttm_buffer_object *bo,
>>>>                          struct ttm_placement *placement);
>>>>      int (*verify_access)(struct ttm_buffer_object *bo, struct file =
*filp);
>>>> +    void (*move_notify)(struct ttm_buffer_object *bo, bool evict,
>>>> +                        struct ttm_mem_reg *new_mem);
>>>
>>> Is this indirection really worth it? We have a grand total of 1 drive=
r
>>> which isn't using gem (vmwgfx), and I don't think that one will ever
>>> switch over to vram helpers.
>>>
>>> I'd fold that all in. Helpers don't need to be flexible enough to sup=
port
>>> every possible use-case (that's just the job of the core), they can b=
e
>>> opinionated to get cleaner code for most cases.
>>>
>>
>> The original idea was to make this as flexible as possible; probably
>> more flexible than necessary. I wouldn't mind merging everything into
>> one file, but please not in this patch set, can we keep it for now and=
 I
>> send you a cleanup next?
>=20
> Oh sure, I just wondered about why this flexibility exists and
> realized there's not really a user for it. And pondering this more I
> didn't come up with a use-case where it might reasonably be needed,
> and you don't want to roll your own complete, and couldn't come up
> with anything. Aside from the locking question on patch 1 I think this
> looks like a really tidy solution for the fbdev mapping issue, happy
> to ack once we've figured out the locking thing.

Great. There's a v4 of the patch set that should resolve the locking
problem.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> For this case here if you fold this in you can unexport 3 EXPORT_SYMB=
OLs
>>> (4 with this patch here), which I think is a neat simplification of t=
he
>>> complexity exposed to driver writers. Just put the necessary declarat=
ions
>>> into a drm_vram_helper_internal.h so that drivers don't get at it by
>>> accident (like the other drm*internal.h helpers we have).
>>> -Daniel
>>>
>>>>  };
>>>>
>>>>  /**
>>>> --
>>>> 2.23.0
>>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>> HRB 21284 (AG N=C3=BCrnberg)
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--8XEhJfI5qfqLF86IWuXKEvftenNCRnja3--

--30J8qoeBxqDxIaSkoylSpsQmXhj8KjxbY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1yZpwACgkQaA3BHVML
eiNN+gf8CA2FXQWue/0O1vbp/VjRx886TmwEY9bUKHTVQJ3BybYsh1o6sHr1LXKy
753oCIRM1N0cKHgPwwakjm553p+vizFDiwUSOo0SZ4mDenvZ2c17+JmDNLj+gNvv
JdXWW28nb5vm3j7JsoUcPvIaEHf7/9eyVjei4eWM5XGte1EPBSNqDdIVfPl52o3j
Waa8E9L46CY7ergsTFn69TXCduUrTD3D0uvkkRpvCuuCAzQ9hOuU+oBoQ0mu2OjA
vyOM90bFJF8LhYesmS6lZZ33AT3WrZyl9LBABfs21d3FWaAWJ2hoY3Miv9TqY4wD
k0lnxe96wwopTgJRMoInRD2pGcn+kQ==
=5Mzq
-----END PGP SIGNATURE-----

--30J8qoeBxqDxIaSkoylSpsQmXhj8KjxbY--

--===============1657726924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1657726924==--
