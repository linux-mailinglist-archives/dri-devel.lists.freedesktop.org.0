Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256D2CE9A1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28396E134;
	Fri,  4 Dec 2020 08:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B136E134
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 08:32:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19F56AE1C;
 Fri,  4 Dec 2020 08:32:28 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Message-ID: <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
Date: Fri, 4 Dec 2020 09:32:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201203204129.GC401619@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1073148498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1073148498==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M53C3Dmtngul4ZKGXrayNrfNz6nQ2W8hc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--M53C3Dmtngul4ZKGXrayNrfNz6nQ2W8hc
Content-Type: multipart/mixed; boundary="iZKv1aLtv95UIKrQ3Cibo7KdMYonCT839";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, airlied@redhat.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Message-ID: <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
In-Reply-To: <20201203204129.GC401619@phenom.ffwll.local>

--iZKv1aLtv95UIKrQ3Cibo7KdMYonCT839
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.12.20 um 21:41 schrieb Daniel Vetter:
> On Thu, Dec 03, 2020 at 07:59:04PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 03.12.20 um 16:26 schrieb Daniel Vetter:
>>> On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
>>>> Dma-buf's vmap and vunmap callbacks are undocumented and various
>>>> exporters currently have slightly different semantics for them. Add
>>>> documentation on how to implement and use these interfaces correctly=
=2E
>>>>
>>>> v2:
>>>> 	* document vmap semantics in struct dma_buf_ops
>>>> 	* add TODO item for reviewing and maybe fixing dma-buf exporters
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> I still don't think this works, we're breaking dma_buf_vmap for every=
one
>>> else here.
>>
>> I removed the text on the importer. These notes for callers in the doc=
s are
>> more or less a consequence of the exporter semantics.
>=20
> Callers are importers, so I'm not seeing how that fixes anything.
>=20
>> I thought we at least agreed on the exporter semantics in the other th=
read,
>> didn't we?
>>
>> What I'm trying to do is to write dome some rules for exporters, even =
if not
>> all exporters follow them.
>=20
> This is a standard interface, everyone needs to follow the same rules. =
And
> if they change, we need to make sure nothing breaks and we're not creat=
ing
> issues.
>=20
> In the past the rule was the dma_buf_vmap was allowed to take the
> dma_resv_lock, and that the buffer should be pinned. Now some ttm drive=
rs
> didn't ever bother with the pinning, and mostly got away with that beca=
use
> drm_prime helpers do the pinning by default at attach time, and most us=
ers
> do call dma_buf_attach.
>=20
> But if you look through dma-buf docs nothing ever said you have to do a=

> dummy attachment before you call dma_buf_vmap, that's just slightly cra=
ppy
> implementations that didn't blow up yet.

I had a patch for adding pin to radeon's implementation of vmap. [1]=20
Christian told me to not do this; instead just get the lock in the fbdev =

code. His advise almost seems the opposite of what you're telling me here=
=2E

For the GEM VRAM helpers, that implicit pin in vmap gave me headaches.=20
Because scanouts can only be done from VRAM, which is badly suited for=20
exporting. So I ended up with an implicit pin that pins the buffer to=20
whatever domain it currently is. I got away with it because GEM VRAM BOs =

are not sharable among devices; fbdev is the only user of that=20
functionality and only pins for short periods of time.

I suspect that fixing TTM-based drivers by adding an implicit pin would=20
result in a similar situation. Whatever domain it ends up pinning, some=20
functionality might not be compatible with that.

>=20
>> Given the circumstances, we should leave out this patch from the patch=
set.
>=20
> So the defacto rules are already a big mess, but that's not a good excu=
se
> to make it worse.
>=20
> What I had in mind is that we split dma_buf_vmap up into two variants:
>=20
> - The current one, which should guarantee that the buffer is pinned.
>    Because that's what all current callers wanted, before the fbdev cod=
e
>    started allowing non-pinned buffers.

Can we add an explicit pin operation to dma_buf_vmap() to enforce the=20
semantics?

Best regards
Thomas

[1] https://patchwork.freedesktop.org/patch/400054/?series=3D83765&rev=3D=
1

>=20
> - The new one, which allows vmapping with just dma_resv locked, and sho=
uld
>    have some caching in exporters.
>=20
> Breaking code and then adding todos about that is kinda not so cool
> approach here imo.
>=20
> Also I guess ttm_bo_vmap should have a check that either the buffer is
> pinned, or dma_resv_lock is held.
>=20
> Cheers, Daniel
>=20
>=20
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>>> ---
>>>>    Documentation/gpu/todo.rst | 15 +++++++++++++
>>>>    include/drm/drm_gem.h      |  4 ++++
>>>>    include/linux/dma-buf.h    | 45 +++++++++++++++++++++++++++++++++=
+++++
>>>>    3 files changed, 64 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst=

>>>> index 009d8e6c7e3c..32bb797a84fc 100644
>>>> --- a/Documentation/gpu/todo.rst
>>>> +++ b/Documentation/gpu/todo.rst
>>>> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de=
>, Christian K=C3=B6nig, Daniel Vette
>>>>    Level: Intermediate
>>>> +Enforce rules for dma-buf vmap and pin ops
>>>> +------------------------------------------
>>>> +
>>>> +Exporter implementations of vmap and pin in struct dma_buf_ops (and=
 consequently
>>>> +struct drm_gem_object_funcs) use a variety of locking semantics. So=
me rely on
>>>> +the caller holding the dma-buf's reservation lock, some do their ow=
n locking,
>>>> +some don't require any locking. VRAM helpers even used to pin as pa=
rt of vmap.
>>>> +
>>>> +We need to review each exporter and enforce the documented rules.
>>>> +
>>>> +Contact: Christian K=C3=B6nig, Daniel Vetter, Thomas Zimmermann <tz=
immermann@suse.de>
>>>> +
>>>> +Level: Advanced
>>>> +
>>>> +
>>>>    Core refactorings
>>>>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>> index 5e6daa1c982f..1864c6a721b1 100644
>>>> --- a/include/drm/drm_gem.h
>>>> +++ b/include/drm/drm_gem.h
>>>> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
>>>>    	 * drm_gem_dmabuf_vmap() helper.
>>>>    	 *
>>>>    	 * This callback is optional.
>>>> +	 *
>>>> +	 * See also struct dma_buf_ops.vmap
>>>>    	 */
>>>>    	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map)=
;
>>>> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
>>>>    	 * drm_gem_dmabuf_vunmap() helper.
>>>>    	 *
>>>>    	 * This callback is optional.
>>>> +	 *
>>>> +	 * See also struct dma_buf_ops.vunmap
>>>>    	 */
>>>>    	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *m=
ap);
>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>> index cf72699cb2bc..dc81fdc01dda 100644
>>>> --- a/include/linux/dma-buf.h
>>>> +++ b/include/linux/dma-buf.h
>>>> @@ -267,7 +267,52 @@ struct dma_buf_ops {
>>>>    	 */
>>>>    	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>>>> +	/**
>>>> +	 * @vmap:
>>>
>>> There's already a @vmap and @vunamp kerneldoc at the top comment, tha=
t
>>> needs to be removed.
>>> -Daniel
>>>
>>>> +	 *
>>>> +	 * Returns a virtual address for the buffer.
>>>> +	 *
>>>> +	 * Notes to callers:
>>>> +	 *
>>>> +	 * - Callers must hold the struct dma_buf.resv lock before calling=

>>>> +	 *   this interface.
>>>> +	 *
>>>> +	 * - Callers must provide means to prevent the mappings from going=

>>>> +	 *   stale, such as holding the reservation lock or providing a
>>>> +	 *   move-notify callback to the exporter.
>>>> +	 *
>>>> +	 * Notes to implementors:
>>>> +	 *
>>>> +	 * - Implementations must expect pairs of @vmap and @vunmap to be
>>>> +	 *   called frequently and should optimize for this case.
>>>> +	 *
>>>> +	 * - Implementations should avoid additional operations, such as
>>>> +	 *   pinning.
>>>> +	 *
>>>> +	 * - Implementations may expect the caller to hold the dma-buf's
>>>> +	 *   reservation lock to protect against concurrent calls and
>>>> +	 *   relocation.
>>>> +	 *
>>>> +	 * - Implementations may provide additional guarantees, such as wo=
rking
>>>> +	 *   without holding the reservation lock.
>>>> +	 *
>>>> +	 * This callback is optional.
>>>> +	 *
>>>> +	 * Returns:
>>>> +	 *
>>>> +	 * 0 on success or a negative error code on failure.
>>>> +	 */
>>>>    	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>> +
>>>> +	/**
>>>> +	 * @vunmap:
>>>> +	 *
>>>> +	 * Releases the address previously returned by @vmap.
>>>> +	 *
>>>> +	 * This callback is optional.
>>>> +	 *
>>>> +	 * See also @vmap()
>>>> +	 */
>>>>    	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);=

>>>>    };
>>>> --=20
>>>> 2.29.2
>>>>
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--iZKv1aLtv95UIKrQ3Cibo7KdMYonCT839--

--M53C3Dmtngul4ZKGXrayNrfNz6nQ2W8hc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/J9BsFAwAAAAAACgkQlh/E3EQov+BS
xQ//e96c2FsMVqvBMQSjd5E3jr4U+fUGTrAUU6H1QLGRcEKioRZ5fghZg0WDmmGOWNA4UWYsxqjz
AaDm+Ue9eK3Ixuu3PDe+7fvup0KKYuZeefLOXXcMIylCCr5mZcgGSreoazFvNiN62+6Ea1Tw2aLN
advzB4OLoQEGyK8plRrTvOrJURoMH+PYzhpp4Ql8PmeQgp7T66dVLCFWtNWmhyZZotv0Nr4JxYVz
kAgrpZ8VDFW9YrDtSrjOcC4uGlWsRSCKYQB0c6al828bIv5FyZobU0Kc4hWU6katxmIvAQLDTMEF
YQJh6t2ppbxixCiZcRhlxL/SM6MPXpRRwpzkB4gaDSyV25/v6dWAh3GMZDuaIzIJlWVDt+46HeRM
+1zhxEoLFSZnNOsDipIIrLLj+NnpSgv5/If9oPy84wo/uOWbGU8jn3M3i8Ku4ZdrpKS5l/ZySEU1
GwIWQwWtCA5tjSTi8TRizPttf7FR1Xe+G8l40Ua9zhg13RefIY5hGLFNVgelAP9PzX7vfu56OWeV
q0EF6gBcPZMjX4lCKq9altAs4lSUqFGizL6ZPP/YyWyqzSCOD828tqC37ptBS5aqxzVCY0GMs6DC
pH5Ufbm6kJUGxEsVRZRpShPfb7cV/AAe+aTsxJWwR/3LanGwJr41wkZ3ckZkgtxmc5JCRkRVTTzs
cI8=
=h/UK
-----END PGP SIGNATURE-----

--M53C3Dmtngul4ZKGXrayNrfNz6nQ2W8hc--

--===============1073148498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1073148498==--
