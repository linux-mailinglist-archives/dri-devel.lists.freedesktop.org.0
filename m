Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDA21EC0B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 11:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E47A6E890;
	Tue, 14 Jul 2020 09:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1C6E890
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 09:03:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9445ABF4;
 Tue, 14 Jul 2020 09:03:08 +0000 (UTC)
Subject: Re: [PATCH 0/7] drm/mgag200: Inline prepare/commit helpers
To: lyude@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com
References: <20200707082411.6583-1-tzimmermann@suse.de>
 <db709fc4e8b038871b93897bfaa715dd4acea388.camel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8011f6af-195b-1735-4c4a-913ec3b56f9a@suse.de>
Date: Tue, 14 Jul 2020 11:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db709fc4e8b038871b93897bfaa715dd4acea388.camel@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0976278834=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0976278834==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ur49NPAuYwpUa7v9zAVsoxDaJg9cGQsCs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ur49NPAuYwpUa7v9zAVsoxDaJg9cGQsCs
Content-Type: multipart/mixed; boundary="WdSf5LKR01Tmin8jAAPP4dwVpG77q30J4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lyude@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <8011f6af-195b-1735-4c4a-913ec3b56f9a@suse.de>
Subject: Re: [PATCH 0/7] drm/mgag200: Inline prepare/commit helpers
References: <20200707082411.6583-1-tzimmermann@suse.de>
 <db709fc4e8b038871b93897bfaa715dd4acea388.camel@redhat.com>
In-Reply-To: <db709fc4e8b038871b93897bfaa715dd4acea388.camel@redhat.com>

--WdSf5LKR01Tmin8jAAPP4dwVpG77q30J4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.07.20 um 18:40 schrieb Lyude Paul:
> For context - I already reviewed this once, it just missed the dri-deve=
l list by
> accident
>=20
> For the whole series:
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>

I pushed the patches into drm-misc-next and also added a comment in the
commit message on the busy-waiting thing you asked about.

Best regards
Thomas

>=20
> On Tue, 2020-07-07 at 10:24 +0200, Thomas Zimmermann wrote:
>> Mgag200's modesetting still utilizes the prepare and commit functions
>> that were part of the non-atomic interface. This patchset integrates
>> them into the simple-display's enable function.
>>
>> Patch 1 disables CRTC write protection once when initializing the
>> registers. Before, CRTC registers were temporarily write-protected for=

>> no apparent reason.
>>
>> The screen is toggled on and off multiple times while setting a mode.
>> Patch 3 removes any intermediate screen on/off changes.
>>
>> In patch 4, DPMS functionality is reduced to on an off. The DPMS helpe=
r
>> function implemements on, off, suspend and standby. In atomic modesett=
ing,
>> only on and off is required.
>>
>> Tested on G200SE HW with Xorg, Weston and fbdev.
>>
>> Thomas Zimmermann (7):
>>   drm/mgag200: Don't write-protect CRTC 0-7 while in mga_crtc_prepare(=
)
>>   drm/mgag200: Move PLL setup out of mode-setting function
>>   drm/mgag200: Don't set or clear <scroff> field during modeset
>>   drm/mgag200: Split DPMS function into helpers
>>   drm/mgag200: Set/clear <syncrst> field in display enable/disable
>>     helpers
>>   drm/mgag200: Rename G200WB prepare/commit function
>>   drm/mgag200: Inline mga_crtc_{prepare,commit}() into enable function=

>>
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |   6 +
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 168 +++++++++---------------=
-
>>  drivers/gpu/drm/mgag200/mgag200_reg.h  |  11 ++
>>  3 files changed, 76 insertions(+), 109 deletions(-)
>>
>> --
>> 2.27.0
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WdSf5LKR01Tmin8jAAPP4dwVpG77q30J4--

--Ur49NPAuYwpUa7v9zAVsoxDaJg9cGQsCs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8NdMQUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOquAgAvFsRp3akq86ZO6kzOlc1VZ9qoVZw
xWc90edn49ibDtKg2tkEHFDJGG7yllvCtNqsQDElA3QbMb11TOB3zPmVthPWGbeC
reP3HMp0rXH0gfjnZH5eCrbDgJDbLQTJYN91P5DwnjmJ20lHAvAHnC6eMvpJaagu
ghAeZ0KqA/hqZQv2YRhHw6hBhlpyeR6WNVpX8NelcZrArH0BbA/azR9ZHtcuM6ZJ
Eh1tynjb6f6aAvbSwtWC3mMh/Ciy9qjPNuBvb7SK+EryPgBnfmVmQ1wUITuZen4b
JPL9/PsXAKv6CYzqTZgQPTTQT5uYfU5PiHya7UDE9PNS/kivyb3+ryqGmQ==
=6YqB
-----END PGP SIGNATURE-----

--Ur49NPAuYwpUa7v9zAVsoxDaJg9cGQsCs--

--===============0976278834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0976278834==--
