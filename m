Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75733314C5B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8409C89262;
	Tue,  9 Feb 2021 10:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BB989262
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:03:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DE32AD78;
 Tue,  9 Feb 2021 08:13:35 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] drm/vboxvideo: Use struct drm_shadow_plane_state
 for cursor plane
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20210208135044.27827-1-tzimmermann@suse.de>
 <441f2dbe-d7b1-5f2f-e6c3-2cc0fb45c296@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e0178098-ec48-0286-fc00-9f55b4d22da5@suse.de>
Date: Tue, 9 Feb 2021 09:13:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <441f2dbe-d7b1-5f2f-e6c3-2cc0fb45c296@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1198813530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1198813530==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xehkTpXx8Xg9y2CtEEbPOxVCwhRkTDFAX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xehkTpXx8Xg9y2CtEEbPOxVCwhRkTDFAX
Content-Type: multipart/mixed; boundary="rVnnHPsOFv7G6BE0GtRlXfHyJkPxULSgf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e0178098-ec48-0286-fc00-9f55b4d22da5@suse.de>
Subject: Re: [PATCH v2 0/2] drm/vboxvideo: Use struct drm_shadow_plane_state
 for cursor plane
References: <20210208135044.27827-1-tzimmermann@suse.de>
 <441f2dbe-d7b1-5f2f-e6c3-2cc0fb45c296@redhat.com>
In-Reply-To: <441f2dbe-d7b1-5f2f-e6c3-2cc0fb45c296@redhat.com>

--rVnnHPsOFv7G6BE0GtRlXfHyJkPxULSgf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.02.21 um 18:43 schrieb Hans de Goede:
> Hi,
>=20
> On 2/8/21 2:50 PM, Thomas Zimmermann wrote:
>> (was: drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and cleanup_f=
b)
>>
>> Functions in the atomic commit tail are not allowed to acquire the
>> dmabuf's reservation lock. So we cannot legally call the GEM object's
>> vmap functionality in atomic_update.
>>
>> But, much better, we can use drm_shadow_plane_state to do all the mapp=
ing
>> for us. Patch 1 exports the helpers for shadow-buffered planes from th=
e
>> DRM KMS helper library and adds documentation on how to use them. Patc=
h 2
>> replaces the vmap code in vbox' cursor update code with a the helpers =
for
>> shadow-buffered planes.
>>
>> Thomas Zimmermann (2):
>>    drm/gem: Export helpers for shadow-buffered planes
>>    drm/vboxvideo: Implement cursor plane with struct
>>      drm_shadow_plane_state
>=20
> I've given this a test spin in a virtualbox vm using VboxSVGA graphics
> and I've not found any problems:
>=20
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Thanks a lot. Can I add your Acked-by as well?

Best regards
Thomas

>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
>>
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 148 ++++++++++++++++++++++=
+-
>>   drivers/gpu/drm/vboxvideo/vbox_mode.c   |  28 ++---
>>   include/drm/drm_gem_atomic_helper.h     |  32 +++++
>>   3 files changed, 181 insertions(+), 27 deletions(-)
>>
>> --
>> 2.30.0
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


--rVnnHPsOFv7G6BE0GtRlXfHyJkPxULSgf--

--xehkTpXx8Xg9y2CtEEbPOxVCwhRkTDFAX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAiRC4FAwAAAAAACgkQlh/E3EQov+Ck
Vw//UVUPrfdf1orF3r71BmhrJ78C7USA7dRQYJfTaLGfwlFm3iEVviQnLgGuzXl1FUhox8wrdoPh
dS2uIX3Jf1TfxS1ZLdymXjEu+KhWGwKrRXnnPKOlDULh8Ht2qdFCX6xw6lpZ5DinEe12ux7+ns/x
HdEVR1ItEWGMXCJWOgo2VPrgJQP2B2Ngp1QMBYpnIDjhk1i5XcFNPz96q8CshnePOLK1PIXbDXdL
IuW3Q3kNoJtZWUhKvD88xBISAjZ8heNgilOws4x/90z0W4vljgMWCM+AnEicdbE9l7kZSmxZ2sZr
S/oRqrNVw/zEACWHvfNWaYy+9rwpE+m7D8LBR0hRgo9Aj9MqENVt8d4SAslrTbTbjKpSdOnaFpFd
GSy0Lr/bXL0CtI0a7L3J9fE5whLmokLrSWEi45rLm+QPEZkFCU9gu9tRde7fGaHKRyLegv0e6z3N
g88Yf7dj/Mo1iOpp6jMJAojlmFjIrTQqDoUip8dhB7sKWvy8xCcMhbFTl2ZSfikffgdUWBAcCY7/
e//B5S/ZSLLgm3BrK4a2MrgoqlA/DgkwO4KaxhQYSDR5XpfMzv5h96BmLIsKBuz7A+zbOcx/uLjT
cEKFfC23hX4JH3nYUxnWSiE4a+6TRGElodDyQ6pktxo4FwYL0pNwtTHj0A8mSNBow5eTd3/fSEGR
Vqs=
=viGO
-----END PGP SIGNATURE-----

--xehkTpXx8Xg9y2CtEEbPOxVCwhRkTDFAX--

--===============1198813530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1198813530==--
