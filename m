Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D812B54
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 12:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE4F89951;
	Fri,  3 May 2019 10:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C6289951
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 10:15:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A323AEB8;
 Fri,  3 May 2019 10:14:58 +0000 (UTC)
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
 <20190430092327.GA13757@ravnborg.org>
 <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
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
Message-ID: <a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
Date: Fri, 3 May 2019 12:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>
Content-Type: multipart/mixed; boundary="===============1340691829=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1340691829==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vinSYn3Ek3VhSjo8J1G9S0Y4NUtZueyta"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vinSYn3Ek3VhSjo8J1G9S0Y4NUtZueyta
Content-Type: multipart/mixed; boundary="FnMk8yDTXVw7b8dZMfI9KgILEZkJNQ4wY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>
Message-ID: <a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
 <20190430092327.GA13757@ravnborg.org>
 <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
In-Reply-To: <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>

--FnMk8yDTXVw7b8dZMfI9KgILEZkJNQ4wY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Christian,

would you review the whole patch set? Daniel mentioned that he'd prefer
to leave the review to memory-mgmt developers.

Best regards
Thomas

Am 30.04.19 um 11:35 schrieb Koenig, Christian:
> Am 30.04.19 um 11:23 schrieb Sam Ravnborg:
>> [CAUTION: External Email]
>>
>> Hi Thomas.
>>
>>>>> +
>>>>> +/**
>>>>> + * Returns the container of type &struct drm_gem_vram_object
>>>>> + * for field bo.
>>>>> + * @bo:           the VRAM buffer object
>>>>> + * Returns:       The containing GEM VRAM object
>>>>> + */
>>>>> +static inline struct drm_gem_vram_object* drm_gem_vram_of_bo(
>>>>> +  struct ttm_buffer_object *bo)
>>>>> +{
>>>>> +  return container_of(bo, struct drm_gem_vram_object, bo);
>>>>> +}
>>>> Indent funny. USe same indent as used in other parts of file for
>>>> function arguments.
>>> If I put the argument next to the function's name, it will exceed the=

>>> 80-character limit. From the coding-style document, I could not see w=
hat
>>> to do in this case. One solution would move the return type to a
>>> separate line before the function name. I've not seen that anywhere i=
n
>>> the source code, so moving the argument onto a separate line and
>>> indenting by one tab appears to be the next best solution. Please let=
 me
>>> know if there's if there's a preferred style for cases like this one.=

>> Readability has IMO higher priority than some limit of 80 chars.
>> And it hurts readability (at least my OCD) when style changes
>> as you do with indent here. So my personal preference is to fix
>> indent and accect longer lines.
>=20
> In this case the an often used convention (which is also kind of=20
> readable) is to add a newline after the return values, but before the=20
> function name. E.g. something like this:
>=20
> static inline struct drm_gem_vram_object*
> drm_gem_vram_of_bo(struct ttm_buffer_object *bo)
>=20
> Regards,
> Christian.
>=20
>>
>> But you ask for a preferred style - which I do not think we have in th=
is
>> case. So it boils down to what you prefer.
>>
>> Enough bikeshedding, thanks for the quick response.
>>
>>          Sam
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--FnMk8yDTXVw7b8dZMfI9KgILEZkJNQ4wY--

--vinSYn3Ek3VhSjo8J1G9S0Y4NUtZueyta
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzMFJ0ACgkQaA3BHVML
eiODzwf+MSQUU/Kb78xC7KULkP8K0t/v2EDctG4y3L95WeQV5Eatc3bLqVkDYSt+
j9UYMT0XrYCsqUWJmJBOwTG3S2/v+tPKNMmcpKLyR3nm7aSyIBF8MWFm/EMeEMmZ
LCTp9h7tpchF3zmSPdfvBgZdE7gG4sWLlw7r2zMYYx5c+TK6/yb28mIqG/Im/PQD
dHgVpBsc3lJYk3ISc3UTE0Ek9CwP4yePqmP1ybF9i+ZkDRYctrltqWtGn+p7DONk
LVEUElBN32Va31pPmQ7rHmmi2JgpfcyHwy0I972n1ByqECvIn22v1sdvMSyHJrnz
YbTw0DSE/uqQlmi7z/upykVqFWyaQA==
=O1HM
-----END PGP SIGNATURE-----

--vinSYn3Ek3VhSjo8J1G9S0Y4NUtZueyta--

--===============1340691829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1340691829==--
