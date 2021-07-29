Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E63DABDC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714506EE3A;
	Thu, 29 Jul 2021 19:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E665D6EE3A;
 Thu, 29 Jul 2021 19:32:42 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F708201FC;
 Thu, 29 Jul 2021 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627587161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMApIiGMG6Myml+CNb4bDMJE6fnvp6dlDpv32lulUXQ=;
 b=nHa23fgqPq+HOolbbYZzlAh6N0tsuZVV7ncddvwiC2xFKkHKV7MDeeliwst36Q6dGb443F
 Dykzo9rZkWFaIjz9zHb1Ndz0gJI6+0AeWoG7kYP5HoAg2eWWa5I//GB2hs/enjRDooN0/7
 Wf6g3pOawFIaUO9Ti0MZFSetmR+/TqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627587161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMApIiGMG6Myml+CNb4bDMJE6fnvp6dlDpv32lulUXQ=;
 b=PwwkJvh3ZgJmyJELNziBQW0sn1FdNCNmYNUCaYAZ+YqweJSJSYoNTndr05LrUwEXRy/W1f
 mUA5X7O5rPKNDpCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A469F13756;
 Thu, 29 Jul 2021 19:32:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ZGoeJlgCA2GqawAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jul 2021 19:32:40 +0000
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
To: Dan.Sneddon@microchip.com, sam@ravnborg.org
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
 <cf070795-a660-535a-0bb4-65c01710f280@microchip.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7b73d0c5-491b-56f7-7e05-17e3412571a2@suse.de>
Date: Thu, 29 Jul 2021 21:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <cf070795-a660-535a-0bb4-65c01710f280@microchip.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="akny04UaG7GJcDpPPeCijsU2V0ccRjN5Z"
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--akny04UaG7GJcDpPPeCijsU2V0ccRjN5Z
Content-Type: multipart/mixed; boundary="vgWnVgaac2W3OMacz8EgEOzBzhvHSkh3D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan.Sneddon@microchip.com, sam@ravnborg.org
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, Nicolas.Ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <7b73d0c5-491b-56f7-7e05-17e3412571a2@suse.de>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
 <cf070795-a660-535a-0bb4-65c01710f280@microchip.com>
In-Reply-To: <cf070795-a660-535a-0bb4-65c01710f280@microchip.com>

--vgWnVgaac2W3OMacz8EgEOzBzhvHSkh3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.07.21 um 21:24 schrieb Dan.Sneddon@microchip.com:
> Hi Thomas,
>=20
> On 7/29/21 12:18 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 28.07.21 um 22:11 schrieb Sam Ravnborg:
>>> Hi Dan,
>>>
>>>>>
>>>>> I think I got it - we need to set irq_enabled to true.
>>>>> The documentation says so:
>>>>> "
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @ir=
q_enabled:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ind=
icates that interrupt handling is enabled,
>>>>> specifically vblank
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * han=
dling. Drivers which don't use drm_irq_install()
>>>>> need to set this
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to =
true manually.
>>>>> "
>>>>>
>>>>> Can you try to add the following line:
>>>>>
>>>>>
>>>>> +static int atmel_hlcdc_dc_irq_install(struct drm_device *dev,
>>>>> unsigned int irq)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irq =3D=3D IRQ_NOTCONNECT=
ED)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -ENOTCONN;
>>>>> +
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->irq_en=
abled =3D true;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=3D THIS LINE
>>>>>
>>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atmel_hlcdc_dc_irq_disable(de=
v);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D request_irq(irq, atme=
l_hlcdc_dc_irq_handler, 0,
>>>>> dev->driver->name, dev);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return ret;
>>>>>
>>>>> I hope this fixes it.
>>>>
>>>> It does!=C2=A0 With the irq_enabled line added everything is looking=
 good.
>>
>> Are you sure, you're testing with the latest drm-misc-next or drm-tip?=

>> Because using irq_enabled is deprecated and the flag was recently
>> replaced by commit 1e4cd78ed493 ("drm: Don't test for IRQ support in
>> VBLANK ioctls").
>>
>> Best regards
>> Thomas
>>
>=20
> I was testing with 5.14-rc3.  I can test with drm-tip or drm-misc-next.=

> There a preferred branch to test from?

I use drm-tip for development, but all the relevant patches go through=20
drm-misc-next. So either is fine.

Best regards
Thomas

>=20
> Thanks and regards,
> Dan
>=20
>>>
>>> Great, thanks for testing.
>>>
>>> Thomas - I assume you will do a re-spin and there is likely some fixe=
s
>>> for the applied IRQ conversions too.
>>>
>>> Note - irq_enabled must be cleared if request_irq fails. I did not
>>> include this in the testing here.
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0Sam
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vgWnVgaac2W3OMacz8EgEOzBzhvHSkh3D--

--akny04UaG7GJcDpPPeCijsU2V0ccRjN5Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEDAlcFAwAAAAAACgkQlh/E3EQov+B4
Bg/7BLiemqO6VCR12JNz5SMtk+p4LmaM45E437XpQtStNuRcDZGiesbnQvULZ5MjHtfXImMaFCuN
98javZXJ0OmwUGjjU1M4voLcm3rlnhTiG5mWRCUy6qMjZzyPnDlP/QrUCSODkdY0RjIxlzlbeUFW
SUaUPIJeTPXELKs/ceXNvRrcqmRyq0pYquWHb8FfvVHxyq/D2BKVfdv0CWHgsjXwRpz2UFsecs2l
VygSxyZg0ytjUiGCwV8l47wnJ272j8PQr+5HxPpi4UtWRDorp0MbESJL0v1vQTJUOBHiBtQ1sKmZ
DZV0c+XZe0z21in2fhl7Jf7Sh/4viMt2bE8l32YTxssHzIimeS1HOtNFkY7kRSZiFa4TjYzT+bAo
C4N+27Y1jPlNjsAiNg17Thqa96T63oPIP+nQkCVJN+x75JQQ35uSQkzF1Yd0h66+kxgRzVkj0TW0
CpyGnj+DnYWQ64k/1zcdo6crEubxT1dqKKU+Nr9eiZxMLqsLLmn+HpmZ9SiYVKpoH7XE1t8/pKx/
bWcukyCfH9peFxzL5lltToHQYT/OAGb/BmBtXPaLHgALawi6Y3v67mOXBDjH3ymsXgqeFukHRQXJ
ncgUMFBkTDA1GZreSevQtl0QEWzWZFAQ7nZivHMaPONSbgyh0Lv1QEY3OgCmgRkSilNyD/wH8ePn
oOo=
=wJGN
-----END PGP SIGNATURE-----

--akny04UaG7GJcDpPPeCijsU2V0ccRjN5Z--
