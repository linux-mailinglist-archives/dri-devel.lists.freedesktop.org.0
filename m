Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414643E33D2
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 08:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A64897B5;
	Sat,  7 Aug 2021 06:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD296E02A;
 Sat,  7 Aug 2021 06:51:17 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC8511FF2F;
 Sat,  7 Aug 2021 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628319075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2iWQjCcku2emV9iVUDyYBfn4Rs7El/xBHQu+pZtKB+A=;
 b=FQ5+ZaZSKs57v/Z8xft0XI2c+jeXxpcwSXndeZ4HdB4MEWSobrbxnhztbSyUMKUV6seBiO
 vO2SL64fuHzl9X4H/NF6gnpJs28VWlgo+WU2ZfAfBaAnnIWjwNSeXdy3ZTCg4TaOCOlHd/
 ASa7QHYrejkEjyLDmIrtCK4cVAXfA/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628319075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2iWQjCcku2emV9iVUDyYBfn4Rs7El/xBHQu+pZtKB+A=;
 b=LiWRvOLyfrwTMRGiwX/AJEIuwT0pZGlUdVCewrP2tzxwKxzmWkJOvcQ4rJhn2wnN9BNKcs
 fmFc54Nxtcgz3fDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 33A5B13997;
 Sat,  7 Aug 2021 06:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id A46yCmMtDmEARAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Sat, 07 Aug 2021 06:51:15 +0000
Subject: Re: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "stefan@agner.ch"
 <stefan@agner.ch>, "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>, "sean@poorly.run"
 <sean@poorly.run>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>, "tomba@kernel.org"
 <tomba@kernel.org>, "Dan.Sneddon@microchip.com" <Dan.Sneddon@microchip.com>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <YQlbFjbrnyeWv7QP@ravnborg.org>
 <BY5PR11MB41822706053ADEE927E34E628CF09@BY5PR11MB4182.namprd11.prod.outlook.com>
 <4dbc29d7-5f88-e3ac-5dab-e2dc5c6a703e@suse.de>
 <BY5PR11MB4182FBA1D240321F7D9BEC7D8CF29@BY5PR11MB4182.namprd11.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8d10b841-8960-f782-4ed3-d15fa9761dce@suse.de>
Date: Sat, 7 Aug 2021 08:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB4182FBA1D240321F7D9BEC7D8CF29@BY5PR11MB4182.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BfWkLwAIF2tnbDGIJawI2jZ0MYa9F09kk"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BfWkLwAIF2tnbDGIJawI2jZ0MYa9F09kk
Content-Type: multipart/mixed; boundary="RN6maTAJdcwFszuGs8voIwcuLOKCG9DTE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "stefan@agner.ch"
 <stefan@agner.ch>, "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>, "sean@poorly.run"
 <sean@poorly.run>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>, "tomba@kernel.org"
 <tomba@kernel.org>, "Dan.Sneddon@microchip.com" <Dan.Sneddon@microchip.com>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Message-ID: <8d10b841-8960-f782-4ed3-d15fa9761dce@suse.de>
Subject: Re: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <YQlbFjbrnyeWv7QP@ravnborg.org>
 <BY5PR11MB41822706053ADEE927E34E628CF09@BY5PR11MB4182.namprd11.prod.outlook.com>
 <4dbc29d7-5f88-e3ac-5dab-e2dc5c6a703e@suse.de>
 <BY5PR11MB4182FBA1D240321F7D9BEC7D8CF29@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4182FBA1D240321F7D9BEC7D8CF29@BY5PR11MB4182.namprd11.prod.outlook.com>

--RN6maTAJdcwFszuGs8voIwcuLOKCG9DTE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.08.21 um 01:59 schrieb Chrisanthus, Anitha:
> Hi Thomas,
>=20
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Wednesday, August 4, 2021 12:11 AM
>> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Sam Ravnborg
>> <sam@ravnborg.org>
>> Cc: daniel@ffwll.ch; airlied@linux.ie; alexander.deucher@amd.com;
>> christian.koenig@amd.com; liviu.dudau@arm.com; brian.starkey@arm.com;
>> bbrezillon@kernel.org; nicolas.ferre@microchip.com;
>> maarten.lankhorst@linux.intel.com; mripard@kernel.org; stefan@agner.ch=
;
>> alison.wang@nxp.com; patrik.r.jakobsson@gmail.com; robdclark@gmail.com=
;
>> Dea, Edmund J <edmund.j.dea@intel.com>; sean@poorly.run;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> jyri.sarha@iki.fi; tomba@kernel.org; Dan.Sneddon@microchip.com;
>> tomi.valkeinen@ideasonboard.com; amd-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; lin=
ux-arm-
>> msm@vger.kernel.org; freedreno@lists.freedesktop.org
>> Subject: Re: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
>>
>> Hi
>>
>> Am 03.08.21 um 20:36 schrieb Chrisanthus, Anitha:
>>> Hi Thomas,
>>> Can you please hold off on applying the kmb patch, I am seeing some i=
ssues
>> while testing. Modetest works, but video playback only plays once, and=
 it fails
>> the second time with this patch.
>>
>> Sounds a bit like the testing issue at [1]. For testing, you need the
>> latest drm-misc-next or drm-tip. Specifically, you need commit
>> 1e4cd78ed493 ("drm: Don't test for IRQ support in VBLANK ioctls").
>=20
>=20
> You are right, with the above patch video plays fine. It's all good now=
! Sorry about the confusion.

Thanks for trying. Can I add your Tested-by tag?

Best regards
Thomas

>>
>> Let me know whether this works for you.
>>
>> Best regards
>> Thomas
>>
>> [1] https://patchwork.freedesktop.org/patch/447057/?series=3D93078&rev=
=3D1
>>
>>>
>>> Thanks,
>>> Anitha
>>>
>>>
>>>> -----Original Message-----
>>>> From: Sam Ravnborg <sam@ravnborg.org>
>>>> Sent: Tuesday, August 3, 2021 8:05 AM
>>>> To: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: daniel@ffwll.ch; airlied@linux.ie; alexander.deucher@amd.com;
>>>> christian.koenig@amd.com; liviu.dudau@arm.com;
>> brian.starkey@arm.com;
>>>> bbrezillon@kernel.org; nicolas.ferre@microchip.com;
>>>> maarten.lankhorst@linux.intel.com; mripard@kernel.org;
>> stefan@agner.ch;
>>>> alison.wang@nxp.com; patrik.r.jakobsson@gmail.com; Chrisanthus, Anit=
ha
>>>> <anitha.chrisanthus@intel.com>; robdclark@gmail.com; Dea, Edmund J
>>>> <edmund.j.dea@intel.com>; sean@poorly.run; shawnguo@kernel.org;
>>>> s.hauer@pengutronix.de; kernel@pengutronix.de; jyri.sarha@iki.fi;
>>>> tomba@kernel.org; Dan.Sneddon@microchip.com;
>>>> tomi.valkeinen@ideasonboard.com; amd-gfx@lists.freedesktop.org; dri-=

>>>> devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; l=
inux-
>> arm-
>>>> msm@vger.kernel.org; freedreno@lists.freedesktop.org
>>>> Subject: Re: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
>>>>
>>>> Hi Thomas,
>>>>
>>>> On Tue, Aug 03, 2021 at 11:06:50AM +0200, Thomas Zimmermann wrote:
>>>>> DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
>>>>> the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
>>>>> IRQ interfaces.
>>>>>
>>>>> DRM provides IRQ helpers for setting up, receiving and removing IRQ=

>>>>> handlers. It's an abstraction over plain Linux functions. The code
>>>>> is mid-layerish with several callbacks to hook into the rsp drivers=
=2E
>>>>> Old UMS driver have their interrupts enabled via ioctl, so these
>>>>> abstractions makes some sense. Modern KMS manage all their interrup=
ts
>>>>> internally. Using the DRM helpers adds indirection without benefits=
=2E
>>>>>
>>>>> Most KMS drivers already use Linux IRQ functions instead of DRM's
>>>>> abstraction layer. Patches 1 to 12 convert the remaining ones.
>>>>> The patches also resolve a bug for devices without assigned interru=
pt
>>>>> number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
>>>>> not detect if the device has no interrupt assigned.
>>>>>
>>>>> Patch 13 removes an unused function.
>>>>>
>>>>> Patch 14 moves the DRM IRQ helpers behind CONFIG_DRM_LEGACY. Only
>>>>> the old non-KMS drivers still use the functionality.
>>>>>
>>>>> v2:
>>>>> 	* drop IRQ_NOTCONNECTED test from atmel-hlcdc (Sam)
>>>>> 	* use devm_request_irq() in atmel-hlcdc (Sam)
>>>>> 	* unify variable names in arm/hlcdc (Sam)
>>>>>
>>>>> Thomas Zimmermann (14):
>>>>
>>>> The following patches are all:
>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>>
>>>>>     drm/fsl-dcu: Convert to Linux IRQ interfaces
>>>>>     drm/gma500: Convert to Linux IRQ interfaces
>>>>>     drm/kmb: Convert to Linux IRQ interfaces
>>>>>     drm/msm: Convert to Linux IRQ interfaces
>>>>>     drm/mxsfb: Convert to Linux IRQ interfaces
>>>>>     drm/tidss: Convert to Linux IRQ interfaces
>>>>>     drm/vc4: Convert to Linux IRQ interfaces
>>>>>     drm: Remove unused devm_drm_irq_install()
>>>>
>>>> The remaining patches I either skipped or already had a feedback fro=
m
>>>> me or I asked a question.
>>>>
>>>> 	Sam
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RN6maTAJdcwFszuGs8voIwcuLOKCG9DTE--

--BfWkLwAIF2tnbDGIJawI2jZ0MYa9F09kk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEOLWIFAwAAAAAACgkQlh/E3EQov+A2
VA//efpGWFRuKfguvkSaqFDi5usf++VXgIYP0Pr1yzNb0cGjTrkESh4PQzO8c+Nd1LcwlQiJTL3+
Y/yvAuUid35YNb/srf7Mij5TLkoD+EZAiPawNEwNrHTA5dI4sqNPF2lWjymWmFSWI6lciZowNSZq
Kh/fkkzMg3lzT5muI9lsFfRB5JPaiG5GZWeaVESyPpVKIJuoXt8+iX10MK4zh654J8OtP8HsJV8l
X44SAOeic+TBNwG8pAwSG3aFPvttx/QmcNt7KnqYfkCY2IwDT3XOx8YSisZ90jwNbHTX9bbGuUQV
DnLC48D9fWVAF5j6AYalRiCONULSRyBuf5TVr7FsQtsqACRy86z2G35/OrGNbt+1Y+iXa3oSKJF9
bDwTQUbTCyWXTOMcvqmkRgRHi97esHk9PHxorfuezkMvtaknav1tFVxgXns6b9vi87+MQLgz363i
NE4OJo0uJLdkLCizy3EvP39P+L5rhsOgXW6CnFtdSZWONwPJQGgU7QGAdV2FSvpbHbMVgI1Nfnxz
ixJSZNdsAGwGYExhQMS8dhtRBGneaDy9PDekfzhUBW//8jinnGZEBvtEHEvi5dmDhvIMKF/6vcIb
mbsJz52cm3qZ0P8q0iJ5tjW4PGiCuChGm2Z6KA/rgKaINvJ7ZF6QNyl/hWznKEFrrn6MQDkLUZcf
H3s=
=I+OL
-----END PGP SIGNATURE-----

--BfWkLwAIF2tnbDGIJawI2jZ0MYa9F09kk--
