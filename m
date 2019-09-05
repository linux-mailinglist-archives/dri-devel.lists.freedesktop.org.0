Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10AAA9CD4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 10:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382989C97;
	Thu,  5 Sep 2019 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2489C97
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 08:19:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2261AC84;
 Thu,  5 Sep 2019 08:19:45 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
 <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
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
Message-ID: <b3a103fc-dc91-9a4a-4e64-d654b8d0611a@suse.de>
Date: Thu, 5 Sep 2019 10:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0532886255=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0532886255==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q1ENK73XPPip2uhxflhgbQyXjzfpcsUdb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q1ENK73XPPip2uhxflhgbQyXjzfpcsUdb
Content-Type: multipart/mixed; boundary="4qAU21r6MYKaa0pPp7CrX6qPIm2yWfcKa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Ying
 <ying.huang@intel.com>, Sean Paul <sean@poorly.run>
Message-ID: <b3a103fc-dc91-9a4a-4e64-d654b8d0611a@suse.de>
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
 <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>
In-Reply-To: <CAKMK7uHYuYsDXFdPhhap=_gybbB3xF5W7os7gAWxxEiFjCQDhg@mail.gmail.com>

--4qAU21r6MYKaa0pPp7CrX6qPIm2yWfcKa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.09.19 um 09:56 schrieb Daniel Vetter:
> On Thu, Sep 5, 2019 at 9:01 AM Gerd Hoffmann <kraxel@redhat.com> wrote:=

>>
>>   Hi,
>>
>>> - imo we should fix this by using the io_mapping stuff, that avoids
>>> the overhead of repeated pat checks for map/unmap.
>>
>> Another idea:  IIRC ttm has a move_notify callback.  So we could simpl=
y
>> keep mappings active even when the refcount goes down to zero.  Then d=
o
>> the actual unmap either in the move_notify or in the destroy callback.=

>=20
> Yeah that should be a really clean solution, and only needs changes in
> the vram helpers. Which is nice, more common code!

But the console's BO is special wrt to mapping. Putting special code for
 console handling into vram helpers doesn't seem right. I think it's
preferable to keep the special cases located in fbdev emulation. Or even
better in DRM client code, so that other, future, internal clients
automatically do the right thing.

Best regards
Thomas

> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--4qAU21r6MYKaa0pPp7CrX6qPIm2yWfcKa--

--Q1ENK73XPPip2uhxflhgbQyXjzfpcsUdb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1wxR8ACgkQaA3BHVML
eiMelAgAq1I8UX7C92CkYqYeqDy9vkkxqYwMuwHmgyRiKf4uOXGUnglBiLiZLlJO
4Xooeunbcnz0EEguijXb9YSXwhfFk9wORSSHopFs1drfL5P4WTY+PswdfAsoccPX
ONANa9csdJiF0CMXD98dyH9hNIYLcSSfaL3pQs8NtSIBcDqGQTfoT4VWQkqj+tnJ
bZSZ1fHvWwYhQOBlsqogOca1do2fNX3eWAfZj4gWUHBAE1qXShswr+qnq87lCHB1
lPITfhbVcrsop4F5PjkaCZ4qth0U3146t23yIit+0OiHUIzCDx91TCLFkdO+cs2v
xjK9pFgKjpVWh7ixXfu/PP9IAIWKfg==
=fZBa
-----END PGP SIGNATURE-----

--Q1ENK73XPPip2uhxflhgbQyXjzfpcsUdb--

--===============0532886255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0532886255==--
