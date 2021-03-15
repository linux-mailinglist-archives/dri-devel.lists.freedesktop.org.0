Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69AC33AC7B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 08:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F6789D43;
	Mon, 15 Mar 2021 07:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04589D43
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 07:49:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC984AC1D;
 Mon, 15 Mar 2021 07:48:58 +0000 (UTC)
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7976df00-d82f-6634-326a-e2bec86f7a08@suse.de>
Date: Mon, 15 Mar 2021 08:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
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
Content-Type: multipart/mixed; boundary="===============0682223520=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0682223520==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nC3BOezxlcOU0Up7xIOGs0BgZ1bDGA2Rf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nC3BOezxlcOU0Up7xIOGs0BgZ1bDGA2Rf
Content-Type: multipart/mixed; boundary="Y3yjlOhnFI02WwTLSHt645BxJHVEtvBfI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <7976df00-d82f-6634-326a-e2bec86f7a08@suse.de>
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
In-Reply-To: <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>

--Y3yjlOhnFI02WwTLSHt645BxJHVEtvBfI
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.03.21 um 19:29 schrieb Thomas Hellstr=C3=B6m (Intel):
> Hi, Christian
>=20
> On 3/12/21 10:38 AM, Christian K=C3=B6nig wrote:
>> We seem to have some more driver bugs than thought.
>>
>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>> ---
>> =C2=A0 include/drm/ttm/ttm_bo_api.h | 6 ++++--
>> =C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api=
=2Eh
>> index 4fb523dfab32..df9fe596e7c5 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -603,9 +603,11 @@ static inline void ttm_bo_pin(struct=20
>> ttm_buffer_object *bo)
>> =C2=A0 static inline void ttm_bo_unpin(struct ttm_buffer_object *bo)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_assert_held(bo->base.resv);
>> -=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(!bo->pin_count);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(!kref_read(&bo->kref));
>> -=C2=A0=C2=A0=C2=A0 --bo->pin_count;
>> +=C2=A0=C2=A0=C2=A0 if (bo->pin_count)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --bo->pin_count;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(true);
>> =C2=A0 }
>> =C2=A0 int ttm_mem_evict_first(struct ttm_device *bdev,
>=20
> Since I now have been staring for half a year at the code of the driver=
=20
> that made pinning an art, I have a couple of suggestions here, Could we=
=20
> use an atomic for pin_count, allowing unlocked unpinning but require th=
e=20
> lock only for pin_count transition 0->1, (but unlocked for=20
> pin_if_already_pinned). In particular I think vmwgfx would benefit from=
=20
> unlocked unpins. Also if the atomic were a refcount_t, that would=20
> probably give you the above behaviour?

What's the benefit?

I'm asking because, there's been talk about streamlining all the GEM=20
locking and actually allowing dma-buf resv locking in pin and vmap=20
operations. Atomic ops might not contradict this, but also might not be=20
useful in the long term.

Best regards
Thomas

>=20
> /Thomas
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Y3yjlOhnFI02WwTLSHt645BxJHVEtvBfI--

--nC3BOezxlcOU0Up7xIOGs0BgZ1bDGA2Rf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBPEWkFAwAAAAAACgkQlh/E3EQov+AG
/w//Yj9VCWItrEW3I7mlxYLGE+/iJJEBU+N3PnUsg1Y8pObv0ox0sefbr4LH/+4rAGMTisueOeop
8D/BnUVX+y/EUqGa+pxVMJQrtZo3k6Exc1zo7keedCdIbIiZYdvPmvgeBa05cr3KO8QOoxBaZ4Ij
zYF4wK+jWj//5LF8xKiXPYPSHG4p73oh/QXQKZjAORtBoNpz5dinTgy14gSsHlXBurY7DogzXcy2
Vhq6f8yvtxi0UjXzFaNjcQ8lDiNkJJZDV4Emo1yv9LdB1Brl4qI+du0gTqBZyxIh0SAnQ+karYiD
xDAySgt4UCIb5QqkJ1XsU9DbPoHH1ygPxPLxjKt36hOrT3lG2tgox69mS7hJmOaDIWoCJLoASLoP
x1gaDSObCNa1w299kdu6ViuR60llIFS9vEvoP67pG5fpiIkv1iX2qFFLaCfajpPmKI6Yn4efVr2z
o66i4ebrBmpImnB4Sqzyfw6wILA7FYKpKDkzF+iVtSHKEarlVUSbvXMHgJuCGi4qm97Q7dFes4UQ
mHJlfwqfXX0TyKZmnj0qdJc0Ea24bMBTGywAaR1eqG3bHhLSOVKtJXwI+JucGaFzUnSENfX9RnsH
13oGA7lZxvRxn6nl/jKBcobX0NlAwKF6xopkj2WwDPyWb71+ytrxogm7dmGl855BS2lB7MyvAPz9
B30=
=2xcJ
-----END PGP SIGNATURE-----

--nC3BOezxlcOU0Up7xIOGs0BgZ1bDGA2Rf--

--===============0682223520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0682223520==--
