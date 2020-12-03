Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFD2CDE22
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 19:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5502F89CF5;
	Thu,  3 Dec 2020 18:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D289CF5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 18:59:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1275AC2E;
 Thu,  3 Dec 2020 18:59:05 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Message-ID: <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
Date: Thu, 3 Dec 2020 19:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201203152601.GB401619@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, airlied@redhat.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0768020939=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0768020939==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VssPZWBOORIM5b9f8itA7ItuC8H1jqYO6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VssPZWBOORIM5b9f8itA7ItuC8H1jqYO6
Content-Type: multipart/mixed; boundary="vmhedsiPmkJS4pKaUezB1f0518yO38X5q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Message-ID: <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
In-Reply-To: <20201203152601.GB401619@phenom.ffwll.local>

--vmhedsiPmkJS4pKaUezB1f0518yO38X5q
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.12.20 um 16:26 schrieb Daniel Vetter:
> On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
>> Dma-buf's vmap and vunmap callbacks are undocumented and various
>> exporters currently have slightly different semantics for them. Add
>> documentation on how to implement and use these interfaces correctly.
>>
>> v2:
>> 	* document vmap semantics in struct dma_buf_ops
>> 	* add TODO item for reviewing and maybe fixing dma-buf exporters
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I still don't think this works, we're breaking dma_buf_vmap for everyon=
e
> else here.

I removed the text on the importer. These notes for callers in the docs=20
are more or less a consequence of the exporter semantics.

I thought we at least agreed on the exporter semantics in the other=20
thread, didn't we?

What I'm trying to do is to write dome some rules for exporters, even if =

not all exporters follow them.

Given the circumstances, we should leave out this patch from the patchset=
=2E

Best regards
Thomas

>=20
>> ---
>>   Documentation/gpu/todo.rst | 15 +++++++++++++
>>   include/drm/drm_gem.h      |  4 ++++
>>   include/linux/dma-buf.h    | 45 ++++++++++++++++++++++++++++++++++++=
++
>>   3 files changed, 64 insertions(+)
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 009d8e6c7e3c..32bb797a84fc 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>,=
 Christian K=C3=B6nig, Daniel Vette
>>   Level: Intermediate
>>  =20
>>  =20
>> +Enforce rules for dma-buf vmap and pin ops
>> +------------------------------------------
>> +
>> +Exporter implementations of vmap and pin in struct dma_buf_ops (and c=
onsequently
>> +struct drm_gem_object_funcs) use a variety of locking semantics. Some=
 rely on
>> +the caller holding the dma-buf's reservation lock, some do their own =
locking,
>> +some don't require any locking. VRAM helpers even used to pin as part=
 of vmap.
>> +
>> +We need to review each exporter and enforce the documented rules.
>> +
>> +Contact: Christian K=C3=B6nig, Daniel Vetter, Thomas Zimmermann <tzim=
mermann@suse.de>
>> +
>> +Level: Advanced
>> +
>> +
>>   Core refactorings
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  =20
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 5e6daa1c982f..1864c6a721b1 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
>>   	 * drm_gem_dmabuf_vmap() helper.
>>   	 *
>>   	 * This callback is optional.
>> +	 *
>> +	 * See also struct dma_buf_ops.vmap
>>   	 */
>>   	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>>  =20
>> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
>>   	 * drm_gem_dmabuf_vunmap() helper.
>>   	 *
>>   	 * This callback is optional.
>> +	 *
>> +	 * See also struct dma_buf_ops.vunmap
>>   	 */
>>   	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map)=
;
>>  =20
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index cf72699cb2bc..dc81fdc01dda 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -267,7 +267,52 @@ struct dma_buf_ops {
>>   	 */
>>   	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>  =20
>> +	/**
>> +	 * @vmap:
>=20
> There's already a @vmap and @vunamp kerneldoc at the top comment, that
> needs to be removed.
> -Daniel
>=20
>> +	 *
>> +	 * Returns a virtual address for the buffer.
>> +	 *
>> +	 * Notes to callers:
>> +	 *
>> +	 * - Callers must hold the struct dma_buf.resv lock before calling
>> +	 *   this interface.
>> +	 *
>> +	 * - Callers must provide means to prevent the mappings from going
>> +	 *   stale, such as holding the reservation lock or providing a
>> +	 *   move-notify callback to the exporter.
>> +	 *
>> +	 * Notes to implementors:
>> +	 *
>> +	 * - Implementations must expect pairs of @vmap and @vunmap to be
>> +	 *   called frequently and should optimize for this case.
>> +	 *
>> +	 * - Implementations should avoid additional operations, such as
>> +	 *   pinning.
>> +	 *
>> +	 * - Implementations may expect the caller to hold the dma-buf's
>> +	 *   reservation lock to protect against concurrent calls and
>> +	 *   relocation.
>> +	 *
>> +	 * - Implementations may provide additional guarantees, such as work=
ing
>> +	 *   without holding the reservation lock.
>> +	 *
>> +	 * This callback is optional.
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * 0 on success or a negative error code on failure.
>> +	 */
>>   	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> +
>> +	/**
>> +	 * @vunmap:
>> +	 *
>> +	 * Releases the address previously returned by @vmap.
>> +	 *
>> +	 * This callback is optional.
>> +	 *
>> +	 * See also @vmap()
>> +	 */
>>   	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>   };
>>  =20
>> --=20
>> 2.29.2
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vmhedsiPmkJS4pKaUezB1f0518yO38X5q--

--VssPZWBOORIM5b9f8itA7ItuC8H1jqYO6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/JNXgFAwAAAAAACgkQlh/E3EQov+Cf
gg/8D7k2P90vQjC2lAAkzKYkD36iSszn6huMEMpsQ7D/GD+F4JleE/Y/qfaQZFb7l7HhogXc5eP2
d8LHmR+i990GAi4a+Go9HWTNofUlQrlKRy+CV65Nrd1dnyFCuctBAjyZx1lpQlcH22vA6hmpMWjf
vvySO/qfyMMYGxfgrD5X7zUYcNqF3ZgAGHcfCkELeGdynBEm+Y2dbOpH/JMMTU/pnJoJliBVD6p7
m4PboAQDhB2vJ45HoykT4k+yn7oQpzW8mapTr5Fbs9A4UyvzLNnjB9mJmQaY1WiOCglsiObSznWs
h27r8jOnl14OEux8MthEfzI8cSq/a+nsw3w+0DOuPxch11qv1q46mv+Bajy+fO0HUcQYZxPCYpb0
dCuXNDUzGE1I4D54rdpVswRsOpqUzhtA/3FypVNOWy2jTbsY2m13rkIunE+ye8cFbsndWY5BvHSo
lz3m4K39beVwS3PUgq3DuoDUHH4XDKym9Zqfe7rCoHVTZ/KE2WzZvrBojG+Pt4NFtIcwwrVKg6el
JcYhMFEhuLh122GKYP/1v3r2dgA0b5HVFpndmZbS0s/pzXgSKMM2TTlVAiNAxmXWe75QoesYqsNs
61X75D80IIYsuJhfgFkyVFlp+VztHlZK49YZPth71FEVytjLuNG3rhR80N/3J+Umcq7l7ZRtIqUW
6Es=
=aTrj
-----END PGP SIGNATURE-----

--VssPZWBOORIM5b9f8itA7ItuC8H1jqYO6--

--===============0768020939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0768020939==--
